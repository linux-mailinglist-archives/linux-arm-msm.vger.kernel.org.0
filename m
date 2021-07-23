Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CEC3D4152
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 22:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhGWTb1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 15:31:27 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:22624 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGWTb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 15:31:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627071120; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=z6QEHbzcWaJW5HVjSSDuWiycF/xowMUpC7M51JZaVKk=;
 b=t9A3+6FpDs6gutrbfSA8lf2RXjj5wEAMg85ZYdzObiNJx5YE3BM81icQrgwX0dxa7No5DXgd
 /K3Zyw3V0V7oKfB7jLeyx26I+oRy5vdDtuz5Vag58MCnzhnH5sIcb9ity+7CEEcMYiaZukJS
 apZH+H7dS6Ne44jQCAP3Q7Pax5Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60fb228ffcf9fe7b78dcc58a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 20:11:59
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ECB7DC4323A; Fri, 23 Jul 2021 20:11:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 020BFC433F1;
        Fri, 23 Jul 2021 20:11:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 23 Jul 2021 13:11:57 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 2/5] drm/msm/dp: Use devres for ioremap()
In-Reply-To: <20210722024227.3313096-3-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-3-bjorn.andersson@linaro.org>
Message-ID: <612495cded56d0ec6abe502a296ebd6b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-21 19:42, Bjorn Andersson wrote:
> The non-devres version of ioremap is used, which requires manual
> cleanup. But the code paths leading here is mixed with other devres
> users, so rely on this for ioremap as well to simplify the code.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 29 ++++-------------------------
>  1 file changed, 4 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 0519dd3ac3c3..c064ced78278 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -32,7 +32,7 @@ static int msm_dss_ioremap(struct platform_device 
> *pdev,
>  	}
> 
>  	io_data->len = (u32)resource_size(res);
> -	io_data->base = ioremap(res->start, io_data->len);
> +	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
>  	if (!io_data->base) {
>  		DRM_ERROR("%pS->%s: ioremap failed\n",
>  			__builtin_return_address(0), __func__);
> @@ -42,22 +42,6 @@ static int msm_dss_ioremap(struct platform_device 
> *pdev,
>  	return 0;
>  }
> 
> -static void msm_dss_iounmap(struct dss_io_data *io_data)
> -{
> -	if (io_data->base) {
> -		iounmap(io_data->base);
> -		io_data->base = NULL;
> -	}
> -	io_data->len = 0;
> -}
> -
> -static void dp_parser_unmap_io_resources(struct dp_parser *parser)
> -{
> -	struct dp_io *io = &parser->io;
> -
> -	msm_dss_iounmap(&io->dp_controller);
> -}
> -
>  static int dp_parser_ctrl_res(struct dp_parser *parser)
>  {
>  	int rc = 0;
> @@ -67,19 +51,14 @@ static int dp_parser_ctrl_res(struct dp_parser 
> *parser)
>  	rc = msm_dss_ioremap(pdev, &io->dp_controller);
>  	if (rc) {
>  		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
> -		goto err;
> +		return rc;
>  	}
> 
>  	io->phy = devm_phy_get(&pdev->dev, "dp");
> -	if (IS_ERR(io->phy)) {
> -		rc = PTR_ERR(io->phy);
> -		goto err;
> -	}
> +	if (IS_ERR(io->phy))
> +		return PTR_ERR(io->phy);
> 
>  	return 0;
> -err:
> -	dp_parser_unmap_io_resources(parser);
> -	return rc;
>  }
> 
>  static int dp_parser_misc(struct dp_parser *parser)
