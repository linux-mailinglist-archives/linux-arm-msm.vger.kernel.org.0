Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2977D3B1244
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 05:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhFWDkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 23:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFWDkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 23:40:02 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9CEC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 20:37:45 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u11so1840019oiv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 20:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2FvWhtJmcV/16/EjsQ9dgtceUGbcijtN3zkjcRvsci0=;
        b=IJLo9nODJoEAENam9rz9IpUFB+H6qytEd0ng5OQnL9FzBqgRgt1yyCexd/Bqofg9Px
         q9LzIocK6+SI66KvIqd/c72TUYe6+b3H9+Sxfxc7tcgwN+QJtkBzLhkK/JfNMjHcOpU7
         CPldcdBwRLP82XQWxZxsVdZWqgrIvQy0l+o/XWygEXd6UPqNI8K/mhxFyyaXAp1eXChS
         XkB7ZgWsg3VLdEZVSfNy4geFw377UPs3VDQZmEKaENag6Ti9NFRqzo7WnZNM0DY5Y1rs
         9sdhGzVm2TXNQIU3zyp/jcgXSM7oV7YQXZ38CGOM1ElFWA7zGRGUlsXAu5VrQSRKtnMs
         iRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2FvWhtJmcV/16/EjsQ9dgtceUGbcijtN3zkjcRvsci0=;
        b=O4Eu5jHNrmuWY/MN03ymsJGuM8UBZMUBbRKiXivnTz+hZFzn18JRPCktKPkhQKbhDq
         rA88SCPgEVEqJ5bcNJyPbUOc3/aHq3mvFM1ucGV+kqzK83bgHYflOby2CjmwsC3TvcCF
         vIpjN4S1lt+YHjsv+d/nzwkiiiHAm3SIFr6Qf+utnzsWVb8eIQAGRoX/epsQZszQK9fx
         X3wFNXpHWLDpYVncapcIrkVvlUbknFmPASIt4pRQnT+nro5n9sRpzmUsTH1jbIvIhKxr
         RZC/14HWkDtaXxu86xNLq3mQQeOK640PGi9SANn2ZgUXuo9i9hyNVu5Psjw0qOk9JTwK
         jsNA==
X-Gm-Message-State: AOAM530+Gfrdb1l8JHmBB1MhlAodJfgRGhpxK1i+T0AoH71zD4DMEF+z
        FrRpyTzk88QMln4HEzOPxC6EfA==
X-Google-Smtp-Source: ABdhPJwD3YI+MKyLUE9P+xDxEzxwGjvVdcTAgdfEO+nNUwMFiAjqbOVH8MR0JEEMIb4LTI9YCGg48A==
X-Received: by 2002:a05:6808:903:: with SMTP id w3mr1619363oih.16.1624419464708;
        Tue, 22 Jun 2021 20:37:44 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c21sm939260ooj.33.2021.06.22.20.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 20:37:44 -0700 (PDT)
Date:   Tue, 22 Jun 2021 22:37:41 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 3/3] phy: qcom-qusb2: Add configuration for SM4250 and
 SM6115
Message-ID: <YNKshSbsf5d5Uyew@yoga>
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
 <20210622203240.559979-4-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622203240.559979-4-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Jun 15:32 CDT 2021, Iskren Chernev wrote:

> The SM4250 and SM6115 uses the same register layout as MSM8996, but the
> tune sequence is a bit different.
> 

Didn't review the initialization sequence, but it's different from the
existing ones so adding a new compatible and init_tbl seems to be the
right choice.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 34 +++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 8f1bf7e2186b..3c1d3b71c825 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -219,6 +219,22 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
>  };
>  
> +static const struct qusb2_phy_init_tbl sm6115_init_tbl[] = {
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xf8),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x81),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x17),
> +
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
> +
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
> +
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
> +};
> +
>  static const unsigned int qusb2_v2_regs_layout[] = {
>  	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
>  	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
> @@ -342,6 +358,18 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
>  	.autoresume_en	 = BIT(3),
>  };
>  
> +static const struct qusb2_phy_cfg sm6115_phy_cfg = {
> +	.tbl		= sm6115_init_tbl,
> +	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
> +	.regs		= msm8996_regs_layout,
> +
> +	.has_pll_test	= true,
> +	.se_clk_scheme_default = true,
> +	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
> +	.mask_core_ready = PLL_LOCKED,
> +	.autoresume_en	 = BIT(3),
> +};
> +
>  static const char * const qusb2_phy_vreg_names[] = {
>  	"vdda-pll", "vdda-phy-dpdm",
>  };
> @@ -888,6 +916,12 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>  	}, {
>  		.compatible	= "qcom,sdm660-qusb2-phy",
>  		.data		= &sdm660_phy_cfg,
> +	}, {
> +		.compatible	= "qcom,sm4250-qusb2-phy",
> +		.data		= &sm6115_phy_cfg,
> +	}, {
> +		.compatible	= "qcom,sm6115-qusb2-phy",
> +		.data		= &sm6115_phy_cfg,
>  	}, {
>  		/*
>  		 * Deprecated. Only here to support legacy device
> -- 
> 2.31.1
> 
