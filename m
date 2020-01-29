Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 935AB14D1F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 21:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgA2UbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 15:31:19 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54847 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgA2UbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 15:31:19 -0500
Received: by mail-pj1-f68.google.com with SMTP id dw13so288275pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 12:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=twsM+yroWqwEy5YDl4BwCUXNaUNw/X2g2lDDxs0RGBo=;
        b=iRu2wYYSeljrB5HIM7LJymxUTy2vq4UG/nbxVTsG+319wy6rA8ZdqP/P6DfqqSIam5
         ihG/SfhKvPvETULCRbTKnRQkLMp3A496MzuE+uC+pgKyGDO7iiftEC4cfT2NpolyA6pK
         7TdFmuY6NNDzaTQlVDm8lOMCYu2AFw9Z3m5BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=twsM+yroWqwEy5YDl4BwCUXNaUNw/X2g2lDDxs0RGBo=;
        b=BnhyOIvW3PkDiVThpyVbdF7UEwQiYlC3iD5gxEEaaPQ5+dZJZDfhoJ+yr0eb6CIGD7
         eO+l8+2PXMNw+6B0pGRT6oDh6NOP/kE8XaTc0VAJAJCMD3usAuQwbUB/UpkQ4dHaP+MK
         GOohj6/y+QZIYAkwOGUcE70JS7czEaUqSCziKq20yxyffwT1/J2LnL40wAoP6pICF6BX
         gCr3A8vCwNMixzHbo3kfUVdLx2Sl6AUZ1d0msb9wjSYcdOLVWMFmafoZ9XWmyK1Iao9z
         JsKFee5Er4EoDlg0UGLFj1QyaAeAfnBF8ouo3sC+Xv87Qj5uQNJG//IKzn2f4LmPP3mN
         4NEw==
X-Gm-Message-State: APjAAAW2QRYdxNhOQz18VlMvdQ31qJbkJ7DAjNaw4APt6FNnC8VDMlQv
        JcsfJhZTV9J65yXdECWvJG7ogvjPYQk=
X-Google-Smtp-Source: APXvYqxLlF5bIBa3UsXRcl3rKxQPx7bBEA9J/JLzVNFNQnlAu8EbwrNwSb8G6pGmgYMcYMWWGz+aJQ==
X-Received: by 2002:a17:90a:2004:: with SMTP id n4mr1680868pjc.20.1580329878812;
        Wed, 29 Jan 2020 12:31:18 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 2sm3529519pgo.79.2020.01.29.12.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 12:31:18 -0800 (PST)
Date:   Wed, 29 Jan 2020 12:31:16 -0800
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/8] phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
Message-ID: <20200129203116.GD71044@google.com>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580305919-30946-4-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 07:21:54PM +0530, Sandeep Maheswaram wrote:
> Add generic QUSB2 V2 PHY table so the respective phys
> can use the same table.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index bf94a52..70c9da6 100644
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
> @@ -774,8 +774,8 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>  		.compatible	= "qcom,msm8998-qusb2-phy",
>  		.data		= &msm8998_phy_cfg,
>  	}, {
> -		.compatible	= "qcom,sdm845-qusb2-phy",
> -		.data		= &sdm845_phy_cfg,
> +		.compatible	= "qcom,qusb2-v2-phy",
> +		.data		= &qusb2_v2_phy_cfg,
>  	},
>  	{ },
>  };

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
