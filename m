Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BF432C906
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 02:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348754AbhCDBBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 20:01:17 -0500
Received: from z11.mailgun.us ([104.130.96.11]:13647 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239337AbhCDAXF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 19:23:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614817364; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2aRVPyBEMl+RGf7YTiFr6GVO3CZ1fdkjT1ey8/UYb4U=;
 b=uER8sxrmkzjagyGundUVWY2mC3VNvI6dImpnfEQolzmUVVlYsyppGcnEiq7vH5VtdKZVlYul
 7tlviNby83pmuB3FYhBopdpqfQchbRbebdFJw42CcjArgg2utN4ceeCbH8OGn6QTAypjuKfJ
 7bzPU7kk7Pq5DFm9dMrwWESdU9U=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60402838c862e1b9fd45e8ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Mar 2021 00:22:16
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 381B9C4A5EB; Thu,  4 Mar 2021 00:22:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F75EC2E895;
        Thu,  4 Mar 2021 00:22:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Mar 2021 16:22:12 -0800
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
In-Reply-To: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
Message-ID: <d4ded333eb80ac51d416bd48cd5483c3@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-01 13:41, Dmitry Baryshkov wrote:
> if GPU components have failed to bind, shutdown callback would fail 
> with
> the following backtrace. Add safeguard check to stop that oops from
> happening and allow the board to reboot.
> 
> [   66.617046] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [   66.626066] Mem abort info:
> [   66.628939]   ESR = 0x96000006
> [   66.632088]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   66.637542]   SET = 0, FnV = 0
> [   66.640688]   EA = 0, S1PTW = 0
> [   66.643924] Data abort info:
> [   66.646889]   ISV = 0, ISS = 0x00000006
> [   66.650832]   CM = 0, WnR = 0
> [   66.653890] user pgtable: 4k pages, 48-bit VAs, 
> pgdp=0000000107f81000
> [   66.660505] [0000000000000000] pgd=0000000100bb2003,
> p4d=0000000100bb2003, pud=0000000100897003, pmd=0000000000000000
> [   66.671398] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   66.677115] Modules linked in:
> [   66.680261] CPU: 6 PID: 352 Comm: reboot Not tainted
> 5.11.0-rc2-00309-g79e3faa756b2 #38
> [   66.688473] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 
> (DT)
> [   66.695347] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> [   66.701507] pc : msm_atomic_commit_tail+0x78/0x4e0
> [   66.706437] lr : commit_tail+0xa4/0x184
> [   66.710381] sp : ffff8000108f3af0
> [   66.713791] x29: ffff8000108f3af0 x28: ffff418c44337000
> [   66.719242] x27: 0000000000000000 x26: ffff418c40a24490
> [   66.724693] x25: ffffd3a842a4f1a0 x24: 0000000000000008
> [   66.730146] x23: ffffd3a84313f030 x22: ffff418c444ce000
> [   66.735598] x21: ffff418c408a4980 x20: 0000000000000000
> [   66.741049] x19: 0000000000000000 x18: ffff800010710fbc
> [   66.746500] x17: 000000000000000c x16: 0000000000000001
> [   66.751954] x15: 0000000000010008 x14: 0000000000000068
> [   66.757405] x13: 0000000000000001 x12: 0000000000000000
> [   66.762855] x11: 0000000000000001 x10: 00000000000009b0
> [   66.768306] x9 : ffffd3a843192000 x8 : ffff418c44337000
> [   66.773757] x7 : 0000000000000000 x6 : 00000000a401b34e
> [   66.779210] x5 : 00ffffffffffffff x4 : 0000000000000000
> [   66.784660] x3 : 0000000000000000 x2 : ffff418c444ce000
> [   66.790111] x1 : ffffd3a841dce530 x0 : ffff418c444cf000
> [   66.795563] Call trace:
> [   66.798075]  msm_atomic_commit_tail+0x78/0x4e0
> [   66.802633]  commit_tail+0xa4/0x184
> [   66.806217]  drm_atomic_helper_commit+0x160/0x390
> [   66.811051]  drm_atomic_commit+0x4c/0x60
> [   66.815082]  drm_atomic_helper_disable_all+0x1f4/0x210
> [   66.820355]  drm_atomic_helper_shutdown+0x80/0x130
> [   66.825276]  msm_pdev_shutdown+0x14/0x20
> [   66.829303]  platform_shutdown+0x28/0x40
> [   66.833330]  device_shutdown+0x158/0x330
> [   66.837357]  kernel_restart+0x40/0xa0
> [   66.841122]  __do_sys_reboot+0x228/0x250
> [   66.845148]  __arm64_sys_reboot+0x28/0x34
> [   66.849264]  el0_svc_common.constprop.0+0x74/0x190
> [   66.854187]  do_el0_svc+0x24/0x90
> [   66.857595]  el0_svc+0x14/0x20
> [   66.860739]  el0_sync_handler+0x1a4/0x1b0
> [   66.864858]  el0_sync+0x174/0x180
> [   66.868269] Code: 1ac020a0 2a000273 eb02007f 54ffff01 (f9400285)
> [   66.874525] ---[ end trace 20dedb2a3229fec8 ]---
> 
> Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display
> platform_driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c 
> b/drivers/gpu/drm/msm/msm_atomic.c
> index 6a326761dc4a..2fd0cf6421ad 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct 
> drm_atomic_state *state)
>  	struct msm_kms *kms = priv->kms;
>  	struct drm_crtc *async_crtc = NULL;
>  	unsigned crtc_mask = get_crtc_mask(state);
> -	bool async = kms->funcs->vsync_time &&
> +	bool async;
> +
> +	if (!kms)
> +		return;
> +
> +	async = kms->funcs->vsync_time &&
>  			can_do_async(state, &async_crtc);
> 
>  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
