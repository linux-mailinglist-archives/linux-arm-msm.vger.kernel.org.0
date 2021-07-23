Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635EA3D4169
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 22:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhGWTge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 15:36:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33256 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhGWTge (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 15:36:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627071427; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HRN/UDX2HXLKNeRvuGxP4vsevVc7LCnZM359D66adWU=;
 b=TNn8IU8EkTVGRJ4IFuTU68C45EJejrOCwcbVyz+D6fagCfVLeEyu3FxpKWchz7DhfEeJ5FYP
 weTLBNMWWjQVwHwZFLCpa8a49fp3wcBxhfwDTeOYEVEpm3A/ylKF0clwEmB+/pGnQQe2q6L8
 okZ6123Ziii/rP0FLir+uJ6+9JM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60fb23b34815712f3ade4dad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 20:16:51
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BC2DC43460; Fri, 23 Jul 2021 20:16:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 63712C433D3;
        Fri, 23 Jul 2021 20:16:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 23 Jul 2021 13:16:49 -0700
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
Subject: Re: [Freedreno] [PATCH 3/5] drm/msm/dp: Refactor ioremap wrapper
In-Reply-To: <20210722024227.3313096-4-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-4-bjorn.andersson@linaro.org>
Message-ID: <a9136a5ecdda1a60e9b6ea03fece6150@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-21 19:42, Bjorn Andersson wrote:
> In order to deal with multiple memory ranges in the following commit
> change the ioremap wrapper to not poke directly into the dss_io_data
> struct.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
I think we can squash this one and the next patch into one.
Because the APIs and structs you are modifying here are again getting 
touched in the next one too.
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 28 ++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_parser.h |  2 +-
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index c064ced78278..e68dacef547c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -19,39 +19,39 @@ static const struct dp_regulator_cfg 
> sdm845_dp_reg_cfg = {
>  	},
>  };
> 
> -static int msm_dss_ioremap(struct platform_device *pdev,
> -				struct dss_io_data *io_data)
> +static void __iomem *dp_ioremap(struct platform_device *pdev, int
> idx, size_t *len)
>  {
>  	struct resource *res = NULL;
> +	void __iomem *base;
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
>  	if (!res) {
>  		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
>  			__builtin_return_address(0), __func__);
> -		return -ENODEV;
> +		return ERR_PTR(-ENODEV);
>  	}
> 
> -	io_data->len = (u32)resource_size(res);
> -	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
> -	if (!io_data->base) {
> +	base = devm_ioremap_resource(&pdev->dev, res);
> +	if (!base) {
>  		DRM_ERROR("%pS->%s: ioremap failed\n",
>  			__builtin_return_address(0), __func__);
> -		return -EIO;
> +		return ERR_PTR(-EIO);
>  	}
> 
> -	return 0;
> +	*len = resource_size(res);
> +	return base;
>  }
> 
>  static int dp_parser_ctrl_res(struct dp_parser *parser)
>  {
> -	int rc = 0;
>  	struct platform_device *pdev = parser->pdev;
>  	struct dp_io *io = &parser->io;
> +	struct dss_io_data *dss = &io->dp_controller;
> 
> -	rc = msm_dss_ioremap(pdev, &io->dp_controller);
> -	if (rc) {
> -		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
> -		return rc;
> +	dss->base = dp_ioremap(pdev, 0, &dss->len);
> +	if (IS_ERR(dss->base)) {
> +		DRM_ERROR("unable to remap dp io region: %pe\n", dss->base);
> +		return PTR_ERR(dss->base);
>  	}
> 
>  	io->phy = devm_phy_get(&pdev->dev, "dp");
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h
> b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 34b49628bbaf..dc62e70b1640 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -26,7 +26,7 @@ enum dp_pm_type {
>  };
> 
>  struct dss_io_data {
> -	u32 len;
> +	size_t len;
>  	void __iomem *base;
>  };
