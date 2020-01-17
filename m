Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0480A141252
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 21:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgAQUaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 15:30:03 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46175 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgAQUaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 15:30:03 -0500
Received: by mail-pl1-f194.google.com with SMTP id y8so10292814pll.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2020 12:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GGAyM1twdUCFSIRwHNEdtuNNt80SvelsJ0RcGl3xtNU=;
        b=YcPaX20oCsGJgoOto+VUl/hdNBU4hapAOJeZycJ6ydDHTUO1UkASSTnQ7fPUP4h89B
         zYvZFzjJgjwPJCz5etFqEK6kRSTDTKQvK3axG4ZLJp9Il+6BCHnEkMI/XcZ8uSmU5Svn
         lgtUfRgkQKHf/9p6b79EOBLjR5Ox4Q19How+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GGAyM1twdUCFSIRwHNEdtuNNt80SvelsJ0RcGl3xtNU=;
        b=YVpelxHq90vG5NU/VAYCkMEcNyNwTG6Oh4LGgzEf9KlFN6VvWFeUs1SQAiaxLJyWMR
         P29Fqg1esf8vfMXEAAe7PlSom69BU2/I0TDFkppxdLOAi9bvkVJJRdNDfqt3kvEa/jMX
         XA4J4tJfAWa3e/RjoLikbex9NBWn5F8K502GDGfpjl90JU+dmOuLHf1oSwl8qFRR2Khj
         MITE+wi54wsWeTjvllJOnMFLj1mgBYEQ2mFAefWrBJTzijv/+MDncDogxGeLIngTRSIF
         kqRV1YxCq189qpBEc8scvpfTykIJGu52G7kLPQT0WiGHsSk13L0puo93ifX00SpN4Mcs
         cUuw==
X-Gm-Message-State: APjAAAVEdv1JJ/9r6s3fK+IYUbmf6CsmL0i0ugq61SxdaewRfR4EFc7y
        FSwYOEv6+/hbnAxAwJCsfrDYxA==
X-Google-Smtp-Source: APXvYqxXlL4ByVDDbe6icSZ04lBrpfeTNTLCcaRYfG9Wb9Ibb/7FqvMl0+TXUmAUfSpG4y0EhoDY6A==
X-Received: by 2002:a17:90a:a596:: with SMTP id b22mr8202926pjq.28.1579293002540;
        Fri, 17 Jan 2020 12:30:02 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id n188sm29430344pga.84.2020.01.17.12.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 12:30:01 -0800 (PST)
Date:   Fri, 17 Jan 2020 12:30:00 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/5] phy: qcom-qusb2: Add QUSB2 PHY support for SC7180
Message-ID: <20200117203000.GP89495@google.com>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578658699-30458-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 10, 2020 at 05:48:15PM +0530, Sandeep Maheswaram wrote:
> Using generic cfg table for QUSB2 V2 PHY.
> Add QUSB2 PHY config data and compatible for SC7180.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index bf94a52..db4ae26 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2017, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017, 2019, The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/clk.h>
> @@ -177,7 +177,7 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
>  };
>  
> -static const unsigned int sdm845_regs_layout[] = {
> +static const unsigned int qusb2_v2_regs_layout[] = {
>  	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
>  	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
>  	[QUSB2PHY_PORT_TUNE1]		= 0x240,
> @@ -191,7 +191,7 @@ static const unsigned int sdm845_regs_layout[] = {
>  	[QUSB2PHY_INTR_CTRL]		= 0x230,
>  };
>  
> -static const struct qusb2_phy_init_tbl sdm845_init_tbl[] = {
> +static const struct qusb2_phy_init_tbl qusb2_v2_init_tbl[] = {
>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_ANALOG_CONTROLS_TWO, 0x03),
>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CLOCK_INVERTERS, 0x7c),
>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CMODE, 0x80),
> @@ -258,10 +258,10 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
>  	.update_tune1_with_efuse = true,
>  };
>  
> -static const struct qusb2_phy_cfg sdm845_phy_cfg = {
> -	.tbl		= sdm845_init_tbl,
> -	.tbl_num	= ARRAY_SIZE(sdm845_init_tbl),
> -	.regs		= sdm845_regs_layout,
> +static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
> +	.tbl		= qusb2_v2_init_tbl,
> +	.tbl_num	= ARRAY_SIZE(qusb2_v2_init_tbl),
> +	.regs		= qusb2_v2_regs_layout,
>  
>  	.disable_ctrl	= (PWR_CTRL1_VREF_SUPPLY_TRIM | PWR_CTRL1_CLAMP_N_EN |
>  			   POWER_DOWN),
> @@ -774,8 +774,14 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>  		.compatible	= "qcom,msm8998-qusb2-phy",
>  		.data		= &msm8998_phy_cfg,
>  	}, {
> +		.compatible	= "qcom,sc7180-qusb2-phy",
> +		.data		= &qusb2_v2_phy_cfg,
> +	}, {

I don't think you need the new entry as of now, since sc7180 just uses the
standard v2 configuration. DT compatible entries should look like this:

	{
		compatible = "qcom,sc7180-qusb2-phy", "qcom,qusb2-v2-phy";
		...
	}

hence the correct configuration is selected, even without a specific entry
for 'qcom,sc7180-qusb2-phy'.


>  		.compatible	= "qcom,sdm845-qusb2-phy",
> -		.data		= &sdm845_phy_cfg,
> +		.data		= &qusb2_v2_phy_cfg,
> +	}, {

 think this can also be removed if you add 'qcom,qusb2-v2-phy' to the list
of compatible strings of nodes 'usb_1_hsphy' and 'usb_2_hsphy' in
arch/arm64/boot/dts/qcom/sdm845.dtsi.


> +		.compatible	= "qcom,qusb2-v2-phy",
> +		.data		= &qusb2_v2_phy_cfg,
>  	},
>  	{ },
>  };
