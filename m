Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB696A06C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 11:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjBWK5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 05:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjBWK5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 05:57:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D079CC11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 02:57:11 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f41so13258432lfv.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 02:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNsJnNi4tQAmsGwW+q1OqWLArqBuTP1cMNC+9b4NfnI=;
        b=nrDEDI9bjQmfAPx99TdL9/vjL9LkZT5FVI6ZuGRKXFkpYPE/BpLXaX9c6R5DNdNsAg
         5+z4kjxKurlJF14HdP19JZPMUOuaRb00pTeYWFUkydGIq2WruuuVaSGbdTtQiSeLpPgJ
         TVBhsADYoEs1Xd6ZzXAcZBn3bRnbxJvRfYNIhO9sN7dCXP59q1Bt7oQ5oz9bJCTVVPvu
         iMbMkAj6OCm6BYyDchB0wEiRSzfpYGdtaGGsmafP9lRW6a2ezfrh70+7lkydCdNijlW+
         KYeiI/YxvbtPH7wDK/mXQwowalmhrABMFbV0xzPsvfbsr0Vcz9/tFBT5EAnfc+etZdRX
         KLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNsJnNi4tQAmsGwW+q1OqWLArqBuTP1cMNC+9b4NfnI=;
        b=NsyrMe3jXGw2eElyGzTbTPfXHUoMZpxmZwOmOfSY9V/gCEZ3DZGpBzh9JjiNT/9U8o
         CpkiHb0nPmwxeIw2Xw1I9ThnREtUpO49CEQ6JD2rPwW7w00v/Oj0HfbUXMsDXOTr2QpE
         t2QdecxEwX5J3pnjJsPAudNTfFzF44ehNBROm7tKqv51x5M7lx7GG1BNfLBTzdbPcYU9
         BBHWvFxvYcy0SGx74cwJbT9VlQAhSfYv8JWIm1a7sz+LVW8yuyd5IWMMhnJDHqIMsO/n
         Lv3l43WazM5Yc5ZuUP3gLHZMbO612dsfmCy4QA6gheGShnKjHiTtRlsFPDtPf1Hiqdhh
         A0BA==
X-Gm-Message-State: AO0yUKVYebWVZ4jQOovBf1aZzxZT+kOS7gJINYRJ90/bmPPW5ql18o8s
        +tMZXmv9ddTG64KLL/yKhQ4BEw==
X-Google-Smtp-Source: AK7set+Lm2M9zeWUPnoxqLMsCQ2WdYnqmybzTdPWjKysTUTDm2RnToX7FlbyGiUd5U52kjMCCtWTlg==
X-Received: by 2002:ac2:5974:0:b0:4db:25f2:c116 with SMTP id h20-20020ac25974000000b004db25f2c116mr3794945lfp.18.1677149829689;
        Thu, 23 Feb 2023 02:57:09 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id 12-20020ac2482c000000b004cc548b35fbsm421967lft.71.2023.02.23.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:57:09 -0800 (PST)
Message-ID: <0efb141d-aab6-a13f-8cd7-0de0deae9af2@linaro.org>
Date:   Thu, 23 Feb 2023 11:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.02.2023 10:57, Dmitry Baryshkov wrote:
> The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
> when setting the SSPP_NONE pipe. However it was unnoticed until the
> kernel was tested under AOSP (with some kind of stack protection/check).
> 
> This fixes the following backtrace:
> 
> Unexpected kernel BRK exception at EL1
> Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
> Hardware name: Thundercomm Dragonboard 845c (DT)
> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> sp : ffffffc00bdcb720
> x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
> x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
> x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
> x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
> x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
> x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
> x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
> x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
> x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
> Call trace:
>  dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>  _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>  dpu_crtc_atomic_begin+0xd8/0x22c [msm]
>  drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
>  msm_atomic_commit_tail+0x134/0x6f0 [msm]
>  commit_tail+0xa4/0x1a4 [drm_kms_helper]
>  drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
>  drm_atomic_commit+0xac/0xe8
>  drm_mode_atomic_ioctl+0xbf0/0xdac
>  drm_ioctl_kernel+0xc4/0x178
>  drm_ioctl+0x2c8/0x608
>  __arm64_sys_ioctl+0xa8/0xec
>  invoke_syscall+0x44/0x104
>  el0_svc_common.constprop.0+0x44/0xec
>  do_el0_svc+0x38/0x98
>  el0_svc+0x2c/0xb4
>  el0t_64_sync_handler+0xb8/0xbc
>  el0t_64_sync+0x1a0/0x1a4
> Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
> 
> Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index b88a2f3724e6..6c53ea560ffa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  			 * CTL_LAYER has 3-bit field (and extra bits in EXT register),
>  			 * all EXT registers has 4-bit fields.
>  			 */
> -			if (cfg->idx == 0) {
> +			if (cfg->idx == -1) {
if (cfg->idx == ctl_blend_config[SSPP_NONE][0].idx)?

Konrad
> +				continue;
> +			} else if (cfg->idx == 0) {
>  				mixercfg[0] |= mix << cfg->shift;
>  				mixercfg[1] |= ext << cfg->ext_shift;
>  			} else {
> 
