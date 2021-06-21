Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EB43AF850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhFUWNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:13:52 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34133 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhFUWNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:13:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624313496; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HKNsi+w7AxIkww4j4w/Umdlr46gLw0rw5Mk8zTV9k9c=;
 b=qG0LwKWBsxkwbfOvRDJ1Q5Ov+9cG3FaznhL3OXcg2gj3noSTjDCDhwXWgb95UCYkmqlLuCbf
 pBMXkGmLlK4y9gBFhU9Z9Ba3qtmRI01ZK4MJIuijEDgBk6OB4BwHaGq8cEikpAT5XEnDbTxD
 clgehv+knNtusdcL3IVFOKsgpLw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60d10e98e570c05619a30131 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:11:36
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D56DC43217; Mon, 21 Jun 2021 22:11:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F163C433F1;
        Mon, 21 Jun 2021 22:11:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Jun 2021 15:11:35 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 6/8] drm/msm/dsi: phy: use
 of_device_get_match_data
In-Reply-To: <20210515131217.1540412-7-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
 <20210515131217.1540412-7-dmitry.baryshkov@linaro.org>
Message-ID: <1ca5e55d218780867de91e36531fc748@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> Use of_device_get_match-data() instead of of_match_node().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f2b5e0f63a16..feaeb34b7071 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -625,17 +625,12 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  {
>  	struct msm_dsi_phy *phy;
>  	struct device *dev = &pdev->dev;
> -	const struct of_device_id *match;
>  	int ret;
> 
>  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
>  		return -ENOMEM;
> 
> -	match = of_match_node(dsi_phy_dt_match, dev->of_node);
> -	if (!match)
> -		return -ENODEV;
> -
>  	phy->provided_clocks = devm_kzalloc(dev,
>  			struct_size(phy->provided_clocks, hws, NUM_PROVIDED_CLKS),
>  			GFP_KERNEL);
> @@ -644,7 +639,10 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
> 
>  	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
> 
> -	phy->cfg = match->data;
> +	phy->cfg = of_device_get_match_data(&pdev->dev);
> +	if (!phy->cfg)
> +		return -ENODEV;
> +
>  	phy->pdev = pdev;
> 
>  	phy->id = dsi_phy_get_id(phy);
