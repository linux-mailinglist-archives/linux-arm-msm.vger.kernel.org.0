Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B504FC92E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 02:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240338AbiDLAVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 20:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240046AbiDLAVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 20:21:11 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B7A1C10B
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 17:18:56 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-d6ca46da48so19135449fac.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 17:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yhIKihiP/WteSGS7dx1S+CyVO2CIgYlBYjwFcvjcXSI=;
        b=neTQStbU3fC19CKgmsXsHAXekBnVNjsqPCQZlcZLJ7Aml2G9ERtEWqDbuq+GRQ9jCn
         BAITUvNG0Fsx6N3lN64oyMmOVyEM8nCBHOGuUSspvlXwBjki26j2d7FNEXo1mVCOkDcZ
         ZFmK5imREpwXsPN7TIUrfKnfA96lam+kfZx0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yhIKihiP/WteSGS7dx1S+CyVO2CIgYlBYjwFcvjcXSI=;
        b=k1aoU2tTypTQqN/64n0uKJflt3Hn1/PjvZmeaeIlvRCogJkaG9SJ5IfovSl6GVQAv3
         FWZJMe4eIvVbvj31/nD6K5SmfFsZ9jVMskPfyn+LhkhlBpF3PfbgyWD0pZrR1oJPORJU
         SCyozzjn/cwOg2gK5TJbbDDMVOhbc07ABJveuLquPU5fU4p+qv4GdcNfQUKuiaQBnrcL
         Mtc3dBxhTkAfEquoZmLvOmBae50u+CR8h1Jat1pxBgC12qZ4OEWfWx/uAkVadLkxVTt7
         Nx0YBhhwQiALBcdK3dtWArQ4pKNQsuJvLiPEQVR3jQNCsSlUES4yILGSP99ye7WscWyD
         Gf6A==
X-Gm-Message-State: AOAM530jRsLkf7Qqr213Sn+fsZk+UX22M1a4O4LzgvCZX8zs0WmtsXxa
        t9Rb2as9WSTx+khdyKIrDkGQA0S75zxx5kp7ZlN130JJm9o=
X-Google-Smtp-Source: ABdhPJwmr3O9pqs7hm57p90ombSHJJEog7z2H+SyLsBG2KV0aeEb+JoRG10rf8SZz7CpPBlqWUqpEVysfmLZL7bxncA=
X-Received: by 2002:a05:6870:e893:b0:e2:ecbc:e581 with SMTP id
 q19-20020a056870e89300b000e2ecbce581mr905541oan.193.1649722735541; Mon, 11
 Apr 2022 17:18:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Apr 2022 20:18:55 -0400
MIME-Version: 1.0
In-Reply-To: <20220411234953.2425280-1-dmitry.baryshkov@linaro.org>
References: <20220411234953.2425280-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 11 Apr 2022 20:18:55 -0400
Message-ID: <CAE-0n52AnbZzoQF6GbkCQxMi3kk8nw+sVrY+1-+AEOiFF37Pqg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: properly add and remove internal bridges
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-11 16:49:53)
> Add calls to drm_bridge_add()/drm_bridge_remove() DRM bridges created by
> the driver. This fixes the following warning.
>
> WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
> Hardware name: Generic DT based system
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x58/0x70
>  dump_stack_lvl from __warn+0xc8/0x1e8
>  __warn from warn_slowpath_fmt+0x78/0xa8
>  warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
>  __mutex_lock from mutex_lock_nested+0x1c/0x24
>  mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
>  drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
>  msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
>  mdp4_kms_init from msm_drm_bind+0x514/0x698
>  msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc
>  try_to_bring_up_aggregate_device from component_master_add_with_match+0xc4/0xf8
>  component_master_add_with_match from msm_pdev_probe+0x274/0x350
>  msm_pdev_probe from platform_probe+0x5c/0xbc
>  platform_probe from really_probe.part.0+0x9c/0x290
>  really_probe.part.0 from __driver_probe_device+0xa8/0x13c
>  __driver_probe_device from driver_probe_device+0x34/0x10c
>  driver_probe_device from __driver_attach+0xbc/0x178
>  __driver_attach from bus_for_each_dev+0x74/0xc0
>  bus_for_each_dev from bus_add_driver+0x160/0x1e4
>  bus_add_driver from driver_register+0x88/0x118
>  driver_register from do_one_initcall+0x6c/0x334
>  do_one_initcall from kernel_init_freeable+0x1bc/0x220
>  kernel_init_freeable from kernel_init+0x18/0x12c
>  kernel_init from ret_from_fork+0x14/0x2c
>
> Fixes: 3d3f8b1f8b62 ("drm/bridge: make bridge registration independent of drm flow")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
