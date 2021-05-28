Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C0A39491D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 01:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhE1X3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 19:29:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27255 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhE1X3n (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 19:29:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622244487; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EsTaHJhSSWy71M7AdIDrfWf9Ste+WA5xvekX6kvMQAg=;
 b=P8MOV5BuUmLwPbQlRONe6Nx2WNLwaRLz51NIPn6T5zNUwBAYjMMVcwmZlCZLJZhnvkHL/FzR
 wvRgpsf+GpBLwE1Oi6vtfaymS19M1vhD3ppaEWZoGjRmLAyQxByJQKd8l5tKziTz25grGN2c
 fp5E/m2Bl7XGNGPUdPx3JNU3cs8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60b17c838491191eb310acfe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 23:28:03
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4828C433F1; Fri, 28 May 2021 23:28:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16F31C433D3;
        Fri, 28 May 2021 23:28:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 16:28:02 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm/dp: Initialize the INTF_CONFIG
 register
In-Reply-To: <20210511042043.592802-4-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-4-bjorn.andersson@linaro.org>
Message-ID: <9c5439d61734b81eef4b1874fc10c5c8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-10 21:20, Bjorn Andersson wrote:
> Some bootloaders set the widebus enable bit in the INTF_CONFIG 
> register,
> but configuration of widebus isn't yet supported ensure that the
> register has a known value, with widebus disabled.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index a0449a2867e4..e3996eef5518 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -707,6 +707,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog
> *dp_catalog)
>  	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
>  				dp_catalog->width_blanking);
>  	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
> +	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
>  	return 0;
>  }
