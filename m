Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5383252657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 06:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgHZEg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 00:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgHZEg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 00:36:26 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538CBC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 21:36:26 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id e6so431282oii.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 21:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kyOrvxFXtNgL4zAGtOMZFfz+8v3uTAeplQcWa0UdSXE=;
        b=eBxaHLfk5gupA6m97Igqg9fXphuauyec7V3i1sevHB0042s9k2MZgr6n6SsIeH8R3+
         eGBqCegNIkXii7iMYSFtWQZtZGhhxCFPx7w6Pw/xMboHJI0MqJl4Lem6Q0ntoPHUms4r
         Eyt82Jdl9JCqg2tmk19Zd6BM7tKxiHCeuYS2APTrBZGrGSXotvQiolJl7AnfQlhnKPdW
         vYyYooFhsCP/RVhT507xlosyC+6iel2pPFAcd4bxRemhRctQYREbUp0ldjWWNFLhmh2H
         wBIH9VAdMAwLpXUfyUbyAVCTNWDihVt9L9yQDqF+YvW0Oqh4vu8BzK88No3wqLpu7e3c
         0GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kyOrvxFXtNgL4zAGtOMZFfz+8v3uTAeplQcWa0UdSXE=;
        b=oXEYV5CmZyM6N5EChonEhbQ9bpE0mpNyFH6OItyA/UChPhqzqZfNzKCKAyBIor9nMv
         C+RUn3Ul0wy0npRrTVfGMYFmbwlHoIMqgwyFJ+S555OduLjP6nMYqbqYZcExTrlE2yS7
         wNgiA+EH27o5Qal5xZL83FB/t3bx8XIzD0Yz3kDpcMctQ11bwUVeRbjblSLJIYtKPo+n
         uVniR3y+oK7hw0Icqy9VW/Y6ATRdUsMhbF/ap7yejbh6rbtvGNcBxDQCp7erPcf0g5JK
         dGnPetBEQnoMhcSX42oOUVoDoO2ECiQ69zi1aOymtaC8YJRVMXlKap3j+/9fLGe8iP/C
         +jNg==
X-Gm-Message-State: AOAM532NUscQuI1amxSpiqHKeAFehKfvlkOEtA1jcrB0qwVQaVM/PPZT
        5M+cDKnKqOR8NL0V46e38tdYOw==
X-Google-Smtp-Source: ABdhPJwBkWrJyFQrh2DP9xWSIS/5wMqZGkYF8N/fkzeeP/jxn/K5njYM9Snl7RByH+kmUAMdeyKZaA==
X-Received: by 2002:a54:4791:: with SMTP id o17mr2763820oic.4.1598416585587;
        Tue, 25 Aug 2020 21:36:25 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id v200sm17257oie.20.2020.08.25.21.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 21:36:24 -0700 (PDT)
Date:   Tue, 25 Aug 2020 23:36:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v1 5/9] phy: qcom-qmp: Get dp_com I/O resource by index
Message-ID: <20200826043616.GF3715@yoga>
References: <20200826024711.220080-1-swboyd@chromium.org>
 <20200826024711.220080-6-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826024711.220080-6-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Aug 21:47 CDT 2020, Stephen Boyd wrote:

> The dp_com resource is always at index 1 according to the dts files in
> the kernel. Get this resource by index so that we don't need to make
> future additions to the DT binding use 'reg-names'.
> 

Afaict the DT binding for the USB/DP phy defines that there should be a
reg name of "dp_com" and the current dts files all specifies this. Am I
missing something?

PS. Why isn't this a devm_platform_ioremap_resource{,_byname}()?

Regards,
Bjorn

> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Vara Reddy <varar@codeaurora.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 40c051813c34..76d7a9e80f04 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3266,8 +3266,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>  
>  	/* per PHY dp_com; if PHY has dp_com control block */
>  	if (cfg->has_phy_dp_com_ctrl) {
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   "dp_com");
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  		base = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(base))
>  			return PTR_ERR(base);
> -- 
> Sent by a computer, using git, on the internet
> 
