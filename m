Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547C0437E68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 21:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhJVTQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 15:16:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29155 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232258AbhJVTQO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 15:16:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634930036; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=pRZPuY6pGgdzsFCqO2tK/CmQ5Q/2tEuIRVqkEKc1Q5s=; b=NcF5mN/jRhSktgPUI+swFlOXUO01x2eoerzUORNOBFwyHHa5fwYYJxpU6rXObmu2uok9biNQ
 ZFkiE583xUfOHpmSyD4yII8NfaYry4/CwK0istq4CXhvpggaEm7RNyRv5L7lYTB/9mZDw1Fr
 AOcJXjrBcDDV5pOu8QxBKmxcd/c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61730d63b03398c06cca2de6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 19:13:39
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF8ABC4361B; Fri, 22 Oct 2021 19:13:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.71.111.83] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F37AC4338F;
        Fri, 22 Oct 2021 19:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2F37AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <e070bb16-7c7a-3b1a-0e0c-1330b1d0b8d3@codeaurora.org>
Date:   Fri, 22 Oct 2021 12:13:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] drm/msm/dpu: Remove impossible NULL check
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Jessica Zhang <jesszhan@codeaurora.org>,
        Mark Yacoub <markyacoub@google.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20211022172053.3219597-1-robdclark@gmail.com>
From:   Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211022172053.3219597-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/22/2021 10:20 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jessica Zhang <jesszhan@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e91568d4f09a..0ae397044310 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -187,11 +187,6 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   	int i = 0;
>   	int rc = 0;
>   
> -	if (!crtc) {
> -		DPU_ERROR("Invalid crtc\n");
> -		return -EINVAL;
> -	}
> -
>   	crtc_state = to_dpu_crtc_state(crtc->state);
>   	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
>   
