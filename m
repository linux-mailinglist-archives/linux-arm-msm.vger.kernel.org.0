Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB3B42328C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 22:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhJEVB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 17:01:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16820 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231159AbhJEVB0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 17:01:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633467575; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fm5FQYtCALSKM1ZR93d4V0E1g2kpfnAO1WvTCSbTa4A=;
 b=c7uI/bUfAf/F667zRuyCSIXX+BdqbshbHbN1jxV+R8A4govi1AvLjiUVB/rmm1EeRCB5W45v
 3SM+FrkKh3LN1iX3U8B0VXPPsZz9Qz9JiGHYilrNIe1+caHzkLCT195dfk5W0n7A1Avy/lxY
 MnbIUDa+v7nxbolUY/IonldbA3c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 615cbca84ccdf4fe579580f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 20:59:20
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D9CEDC43635; Tue,  5 Oct 2021 20:59:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BB87C4338F;
        Tue,  5 Oct 2021 20:59:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 13:59:18 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 3/5] drm/msm/dp: Refactor ioremap wrapper
In-Reply-To: <20211001174400.981707-4-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-4-bjorn.andersson@linaro.org>
Message-ID: <e5556fc02b53cfd613287bea47e12023@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-01 10:43, Bjorn Andersson wrote:
> In order to deal with multiple memory ranges in the following commit
> change the ioremap wrapper to not poke directly into the dss_io_data
> struct.
> 
> While at it, devm_ioremap_resource() already prints useful error
> messages on failure, so omit the unnecessary prints from the caller.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v2:
> - Switched to devm_platform_get_and_ioremap_resource()
> 
>  drivers/gpu/drm/msm/dp/dp_parser.c | 35 ++++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_parser.h |  2 +-
>  2 files changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index c064ced78278..c05ba1990218 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -19,40 +19,27 @@ static const struct dp_regulator_cfg 
> sdm845_dp_reg_cfg = {
>  	},
>  };
> 
> -static int msm_dss_ioremap(struct platform_device *pdev,
> -				struct dss_io_data *io_data)
> +static void __iomem *dp_ioremap(struct platform_device *pdev, int
> idx, size_t *len)
>  {
> -	struct resource *res = NULL;
> +	struct resource *res;
> +	void __iomem *base;
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
> -			__builtin_return_address(0), __func__);
> -		return -ENODEV;
> -	}
> -
> -	io_data->len = (u32)resource_size(res);
> -	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
> -	if (!io_data->base) {
> -		DRM_ERROR("%pS->%s: ioremap failed\n",
> -			__builtin_return_address(0), __func__);
> -		return -EIO;
> -	}
> +	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
> +	if (!IS_ERR(base))
> +		*len = resource_size(res);
> 
> -	return 0;
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
> -	}
> +	dss->base = dp_ioremap(pdev, 0, &dss->len);
> +	if (IS_ERR(dss->base))
> +		return PTR_ERR(dss->base);
> 
>  	io->phy = devm_phy_get(&pdev->dev, "dp");
>  	if (IS_ERR(io->phy))
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
