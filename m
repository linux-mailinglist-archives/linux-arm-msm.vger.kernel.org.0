Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FA421164A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 00:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgGAWvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 18:51:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52667 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726312AbgGAWvk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 18:51:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593643899; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Gzk6MArs2xkSxAn767zjaSgf4SaIL+y96yccCcZqcCg=;
 b=MNGOk6aS4GEmqeli6tR8+RFKJfn5ph/h/q4HbR20GGDchXCtCZzkufvTpRuznZUYiBgVKjnH
 /i0o1PPVJdfjOJALR7FsOLijMM968Eo6NPjCSOTAcf+l3i51Ijv7fY7yw1eurf81LpldU7gw
 WKyQ18X1LgQX60aCxTUpK55NCXY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5efd136c356bcc26abe21d9c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 22:51:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7E7BC433A0; Wed,  1 Jul 2020 22:51:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFE0FC433C6;
        Wed,  1 Jul 2020 22:51:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 01 Jul 2020 15:51:21 -0700
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hongbo Yao <yaohongbo@huawei.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] drm/msm: ratelimit crtc event overflow error
In-Reply-To: <20200701203602.1272157-1-robdclark@gmail.com>
References: <20200701203602.1272157-1-robdclark@gmail.com>
Message-ID: <d49731c0ecc5b2337f26597decbf82e4@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-01 13:36, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This can happen a lot when things go pear shaped.  Lets not flood dmesg
> when this happens.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e15b42a780e0..969d95aa873c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -389,7 +389,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 
> event)
>  	spin_unlock_irqrestore(&dpu_crtc->spin_lock, flags);
> 
>  	if (!fevent) {
> -		DRM_ERROR("crtc%d event %d overflow\n", crtc->base.id, event);
> +		DRM_ERROR_RATELIMITED("crtc%d event %d overflow\n", crtc->base.id, 
> event);
>  		return;
>  	}
