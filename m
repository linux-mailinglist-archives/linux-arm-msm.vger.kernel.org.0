Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39BC67BB39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 10:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbfGaIK6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 04:10:58 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:35754 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfGaIK6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 04:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564560653;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Ldg0vkUExaoCJzEDplQufh0vP3aB8jIVw5TBoixU8Ng=;
        b=f3zX6x0vVcIcbKumeVDqpAmXxb9BgyXvo/wzd5NOjA0wrhzDwgfY+56zibH64DKt1b
        6eqqZRWgs4IcJ4CUIZi+5vgqaWE2+vQ95Lc+Xv5JdFiy8d+e864uieSqHpamGonSNYk5
        tZGoXWkrc0W5KgyHuv+8rp5Wc98s2bRGbvlLRDj2PU8vOy+9CxBYYfHk4E2WOrvuqum2
        6jRldWVNBPZf1ZiUJBgy7UcaDI5xzOB979fwN1ZpU++Z86I2i0MqPibVdeV6kmc3g7yL
        2FFCFSUeSBxXqmjAeCotjiZeIuYYczT7sHtMiCwUPu6vUdjqa43ffG/TOjiOFD7MKU1n
        /XJg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266HpF+ORJDYrzyYxhqeg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id m0a13fv6V8Ap2Ai
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 31 Jul 2019 10:10:51 +0200 (CEST)
Date:   Wed, 31 Jul 2019 10:10:43 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: shake fist angrily at dma-mapping
Message-ID: <20190731081043.GA55937@gerhold.net>
References: <20190730214633.17820-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730214633.17820-1-robdclark@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 30, 2019 at 02:46:28PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> So, using dma_sync_* for our cache needs works out w/ dma iommu ops, but
> it falls appart with dma direct ops.  The problem is that, depending on
> display generation, we can have either set of dma ops (mdp4 and dpu have
> iommu wired to mdss node, which maps to toplevel drm device, but mdp5
> has iommu wired up to the mdp sub-node within mdss).
> 
> Fixes this splat on mdp5 devices:
> 
>    Unable to handle kernel paging request at virtual address ffffffff80000000
>    Mem abort info:
>      ESR = 0x96000144
>      Exception class = DABT (current EL), IL = 32 bits
>      SET = 0, FnV = 0
>      EA = 0, S1PTW = 0
>    Data abort info:
>      ISV = 0, ISS = 0x00000144
>      CM = 1, WnR = 1
>    swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000810e4000
>    [ffffffff80000000] pgd=0000000000000000
>    Internal error: Oops: 96000144 [#1] SMP
>    Modules linked in: btqcomsmd btqca bluetooth cfg80211 ecdh_generic ecc rfkill libarc4 panel_simple msm wcnss_ctrl qrtr_smd drm_kms_helper venus_enc venus_dec videobuf2_dma_sg videobuf2_memops drm venus_core ipv6 qrtr qcom_wcnss_pil v4l2_mem2mem qcom_sysmon videobuf2_v4l2 qmi_helpers videobuf2_common crct10dif_ce mdt_loader qcom_common videodev qcom_glink_smem remoteproc bmc150_accel_i2c bmc150_magn_i2c bmc150_accel_core bmc150_magn snd_soc_lpass_apq8016 snd_soc_msm8916_analog mms114 mc nf_defrag_ipv6 snd_soc_lpass_cpu snd_soc_apq8016_sbc industrialio_triggered_buffer kfifo_buf snd_soc_lpass_platform snd_soc_msm8916_digital drm_panel_orientation_quirks
>    CPU: 2 PID: 33 Comm: kworker/2:1 Not tainted 5.3.0-rc2 #1
>    Hardware name: Samsung Galaxy A5U (EUR) (DT)
>    Workqueue: events deferred_probe_work_func
>    pstate: 80000005 (Nzcv daif -PAN -UAO)
>    pc : __clean_dcache_area_poc+0x20/0x38
>    lr : arch_sync_dma_for_device+0x28/0x30
>    sp : ffff0000115736a0
>    x29: ffff0000115736a0 x28: 0000000000000001
>    x27: ffff800074830800 x26: ffff000011478000
>    x25: 0000000000000000 x24: 0000000000000001
>    x23: ffff000011478a98 x22: ffff800009fd1c10
>    x21: 0000000000000001 x20: ffff800075ad0a00
>    x19: 0000000000000000 x18: ffff0000112b2000
>    x17: 0000000000000000 x16: 0000000000000000
>    x15: 00000000fffffff0 x14: ffff000011455d70
>    x13: 0000000000000000 x12: 0000000000000028
>    x11: 0000000000000001 x10: ffff00001106c000
>    x9 : ffff7e0001d6b380 x8 : 0000000000001000
>    x7 : ffff7e0001d6b380 x6 : ffff7e0001d6b382
>    x5 : 0000000000000000 x4 : 0000000000001000
>    x3 : 000000000000003f x2 : 0000000000000040
>    x1 : ffffffff80001000 x0 : ffffffff80000000
>    Call trace:
>     __clean_dcache_area_poc+0x20/0x38
>     dma_direct_sync_sg_for_device+0xb8/0xe8
>     get_pages+0x22c/0x250 [msm]
>     msm_gem_get_and_pin_iova+0xdc/0x168 [msm]
>     ...
> 
> Fixes the combination of two patches:
> 
> Fixes: 0036bc73ccbe ("drm/msm: stop abusing dma_map/unmap for cache")
> Fixes: 449fa54d6815 ("dma-direct: correct the physical addr in dma_direct_sync_sg_for_cpu/device")

Thanks for the patch! It fixes the issue on MSM8916/A5U:

Tested-by: Stephan Gerhold <stephan@gerhold.net>
