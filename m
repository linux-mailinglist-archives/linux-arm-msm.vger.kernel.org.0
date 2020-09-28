Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB5A27B530
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 21:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgI1TVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 15:21:52 -0400
Received: from z5.mailgun.us ([104.130.96.5]:52536 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbgI1TVw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 15:21:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601320911; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=obVXhgTgepUWdTaJcXF5/0Z4MlxN7LlK1+bxFgWPPcM=;
 b=Rj44KFr0IWyB+cExn+fDp0JbAJfiCPVLKg2XyIA4lVdDwB76jbpfi/YUe/EYDIn3hAsSBPDu
 hEWivckXwXBAimDu289taYbCnPCFcGGt2F1DE1Z4nGVDp74icuSiQ67igR6mJSSgYg1ruLMh
 dHmtD9gxnkFdD6TWX0KqpOVOFnA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f7237c270602555f5a9970e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 19:21:38
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C356C433FF; Mon, 28 Sep 2020 19:21:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9B0CC433C8;
        Mon, 28 Sep 2020 19:21:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 12:21:36 -0700
From:   abhinavk@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add newline to printks
In-Reply-To: <20200928191657.1193583-1-swboyd@chromium.org>
References: <20200928191657.1193583-1-swboyd@chromium.org>
Message-ID: <ef9767b5088a9ce33aaceccae3f6d458@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-28 12:16, Stephen Boyd wrote:
> Printk messages need newlines. Add it here.
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f272a8d0f95b..cbe0461246f8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -906,7 +906,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
>  	}
> 
>  	mode = &state->adjusted_mode;
> -	DPU_DEBUG("%s: check", dpu_crtc->name);
> +	DPU_DEBUG("%s: check\n", dpu_crtc->name);
> 
>  	/* force a full mode set if active state changed */
>  	if (state->active_changed)
> @@ -1012,7 +1012,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
>  		}
> 
>  		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
> -		DPU_DEBUG("%s: zpos %d", dpu_crtc->name, z_pos);
> +		DPU_DEBUG("%s: zpos %d\n", dpu_crtc->name, z_pos);
>  	}
> 
>  	for (i = 0; i < multirect_count; i++) {
