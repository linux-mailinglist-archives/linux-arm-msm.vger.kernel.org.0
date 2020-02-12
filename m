Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96BFC15B235
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 21:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbgBLUwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 15:52:49 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50607 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728767AbgBLUwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 15:52:49 -0500
Received: by mail-pj1-f68.google.com with SMTP id r67so1387526pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 12:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5Riei2te89GePxp1E22YfDRMlt9VDR+rVb3GVGaMfJg=;
        b=JQ53Dbr4gFf+t/4h045U2ePzleTePdzzGco4e5vpYZF/tx6k2lSHmzgFYS9PkNOsPi
         4hemxsqyRGxAFi+Nj337+XhsLlyLTZatkzxDPNBMmBpCs6FhqOCYc/siI4z1kyxSLWCv
         33oHiTuAWyyX6COIAf19wNKzJAD9jEX6+GNOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Riei2te89GePxp1E22YfDRMlt9VDR+rVb3GVGaMfJg=;
        b=O1k0mApXK++L/32NSjC6LP7QjCJe6xHbIzUdo4nMe3mQ0xFYIqQ/jqbjcrNi3pzT+c
         Bhl3AKu+RG6QFL5ml6QGNDGdOmz3VwfP9ftKQS8TtM7s09iwJjWp8W1ovjOak7PJTVnd
         48vst/f29M0zZ7h7fC+FowIEwUnZLFFTe5oVg3luhhEM1FfronAeMnLIOs3wParDhftd
         eYyZBiE2icx3v8N+mijcMt0KC2uPL87LDjb9nBjKVFrYhXXX3Ey5sy0ips2+AxKjC8qJ
         VzhTphZ5XtsgZNugz288J1BpgSB+faBmhZ7j4ou36IOGZzCnl2GHlR3w5y08kvTB/fOw
         jbnw==
X-Gm-Message-State: APjAAAW3h/R10caxu+l1nue6WMMIJt47MSbwuKkcTy2kkRsBHglnYpM/
        bCavROX2Qoxi/5CWLcdSq9DrAw==
X-Google-Smtp-Source: APXvYqwRJ/D+5PHCCQimDIaqNZzboSVXpwGADlZL0PQ/ajJ/Nr9Q/V/DtBm9p164OpIJB4ae5vZpMA==
X-Received: by 2002:a17:90a:20aa:: with SMTP id f39mr1042834pjg.35.1581540768513;
        Wed, 12 Feb 2020 12:52:48 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b21sm152679pfp.0.2020.02.12.12.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 12:52:48 -0800 (PST)
Date:   Wed, 12 Feb 2020 12:52:47 -0800
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
Subject: Re: [PATCH v3 3/4] phy: qcom-qmp: Add QMP V3 USB3 PHY support for
 SC7180
Message-ID: <20200212205247.GD50449@google.com>
References: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
 <1581506488-26881-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581506488-26881-4-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 12, 2020 at 04:51:27PM +0530, Sandeep Maheswaram wrote:
> Adding QMP v3 USB3 phy support for SC7180.
> Adding only usb phy reset in the list to avoid
> reset of DP block.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 7db2a94..dc300a9 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1139,6 +1139,10 @@ static const char * const msm8996_usb3phy_reset_l[] = {
>  	"phy", "common",
>  };
>  
> +static const char * const sc7180_usb3phy_reset_l[] = {
> +	"phy",
> +};
> +
>  /* list of regulators */
>  static const char * const qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll",
> @@ -1265,6 +1269,37 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
>  	.is_dual_lane_phy	= true,
>  };
>  
> +static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
> +	.tx_tbl			= qmp_v3_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_tx_tbl),
> +	.rx_tbl			= qmp_v3_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_rx_tbl),
> +	.pcs_tbl		= qmp_v3_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_pcs_tbl),
> +	.clk_list		= qmp_v3_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
> +	.reset_list		= sc7180_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v3_usb3phy_regs_layout,
> +
> +	.start_ctrl		= SERDES_START | PCS_START,
> +	.pwrdn_ctrl		= SW_PWRDN,
> +
> +	.has_pwrdn_delay	= true,
> +	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> +	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
> +
> +	.has_phy_dp_com_ctrl	= true,
> +	.is_dual_lane_phy	= true,
> +};
> +
>  static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
>  	.type			= PHY_TYPE_USB3,
>  	.nlanes			= 1,
> @@ -2103,6 +2138,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  		.compatible = "qcom,ipq8074-qmp-pcie-phy",
>  		.data = &ipq8074_pciephy_cfg,
>  	}, {
> +		.compatible = "qcom,sc7180-qmp-usb3-phy",
> +		.data = &sc7180_usb3phy_cfg,
> +	}, {
>  		.compatible = "qcom,sdm845-qmp-usb3-phy",
>  		.data = &qmp_v3_usb3phy_cfg,
>  	}, {

I don't claim to be really knowledgable about this driver, but I confirmed
that this matches qmp_v3_usb3phy_cfg, except for the resets, since we don't
want to reset DP from the USB driver.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
