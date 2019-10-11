Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB86D3909
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 08:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfJKGBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 02:01:31 -0400
Received: from onstation.org ([52.200.56.107]:34028 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbfJKGBb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 02:01:31 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 839DE3E99D;
        Fri, 11 Oct 2019 06:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570773690;
        bh=Pdr19pxEE4qP5RMto+KKW0ehdo3HshXBVfUnDOrByr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qz/cN3qGjZokf36pEqy2tnjjr9eHqIrBUB3y0f24CZAQnmeAbJLzxl0vFeA6wQND+
         gdwlMjQvVFXIOAj/uhyJruKaPPCMwwM312OYjILH490YWo4PTaRda9gM0ydlZPZ/Q6
         d2qun2ouxcJliW2uUklfMYbzG26PcQKSFRRXDbZE=
Date:   Fri, 11 Oct 2019 02:01:30 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Paolo Pisati <p.pisati@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: msm8996: sdhci-msm: apq8096-db820c sdhci fails to init -
 "Timeout waiting for hardware interrupt."
Message-ID: <20191011060130.GA12357@onstation.org>
References: <20191010143232.GA13560@harukaze>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010143232.GA13560@harukaze>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Paolo,

On Thu, Oct 10, 2019 at 04:32:32PM +0200, Paolo Pisati wrote:
> Sdhci consistenlty fails to initialize (and thus work) on my apq8096-db820c.
> 
> The issue is present since v5.0[*] mainline up to latest v5.4-rc2, using defconfig and:
> 
> CONFIG_SCSI_UFS_QCOM=y
> CONFIG_PHY_QCOM_QMP=y
> CONFIG_PHY_QCOM_UFS=y
> CONFIG_ATL1C=y
> 
> but can be 100% reproduced with a clean defconfig too.
> 
> During boot, when it's time to mount the sdcard, mmc0 spits out a lot of:
> 
> ...
> [   13.683059] mmc0: Timeout waiting for hardware interrupt.
> [   13.683095] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> [   13.687441] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00004902
> [   13.693861] mmc0: sdhci: Blk size:  0x00004200 | Blk cnt:  0x00000000
> [   13.700285] mmc0: sdhci: Argument:  0x00012444 | Trn mode: 0x00000033
> [   13.706707] mmc0: sdhci: Present:   0x01680206 | Host ctl: 0x0000001f
> [   13.713131] mmc0: sdhci: Power:     0x00000001 | Blk gap:  0x00000000
> [   13.719555] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
> [   13.725979] mmc0: sdhci: Timeout:   0x0000000a | Int stat: 0x00000000
> [   13.732403] mmc0: sdhci: Int enab:  0x03ff900b | Sig enab: 0x03ff100b
> [   13.738824] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [   13.745249] mmc0: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x00008007
> [   13.751673] mmc0: sdhci: Cmd:       0x0000123a | Max curr: 0x00000000
> [   13.758097] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x5b590000
> [   13.764519] mmc0: sdhci: Resp[2]:   0x76b27f80 | Resp[3]:  0x0a404012
> [   13.770944] mmc0: sdhci: Host ctl2: 0x00000000
> [   13.777365] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x00000001588be200
> [   13.781708] mmc0: sdhci: ============================================
> [   13.888927] mmc0: Reset 0x4 never completed.
> ...
> [   14.004327] mmc0: Controller never released inhibit bit(s).
> 
> in between several sdhci register dumps.
> 
> Has anyone seen that before? Is sdhci-msm support broken upstream or am i missing
> something config-wise? 

I encountered that same error working on the Nexus 5 support upstream.
Here's the fix:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=03864e57770a9541e7ff3990bacf2d9a2fffcd5d

Brian
