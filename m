Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3760325A128
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 00:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729656AbgIAWGW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 18:06:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19736 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727946AbgIAWGW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 18:06:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598997981; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=37vuzzoeSb7NLlot1nvDeIDm5w8vt0B+4whlw60ZvDI=;
 b=u0FnhmtErOtrFLLkddevxmupolzpSYACjhBxPEiEtltt0x9tWjLYPF2V7Hp75+cKLlYL3aSw
 DIpM43SKYWvziLkqpOHq4jt5TPXCMX6KFWgy73bsEfhSoEvwKQiI7D5u/nfmxGagmCnOjTtk
 zQ5VGGXatFRLT16Fod4SkyxuvYY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f4ec5d34f13e63f046f77f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 22:06:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABC3FC433CB; Tue,  1 Sep 2020 22:06:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6865EC433C6;
        Tue,  1 Sep 2020 22:06:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Sep 2020 15:06:09 -0700
From:   abhinavk@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm: Drop debug print in
 _dpu_crtc_setup_lm_bounds()
In-Reply-To: <20200901215942.2559119-3-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
 <20200901215942.2559119-3-swboyd@chromium.org>
Message-ID: <b68d6e231b174fb5e2c4adc22bb804d8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-01 14:59, Stephen Boyd wrote:
> This function is called quite often if you have a blinking cursor on 
> the
> screen, hello page flip. Let's drop this debug print here because it
> means enabling the print via the module parameter starts to spam the
> debug console.
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 74294b5ed93f..2966e488bfd0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -421,8 +421,6 @@ static void _dpu_crtc_setup_lm_bounds(struct 
> drm_crtc *crtc,
> 
>  		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
>  	}
> -
> -	drm_mode_debug_printmodeline(adj_mode);
>  }
> 
>  static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
