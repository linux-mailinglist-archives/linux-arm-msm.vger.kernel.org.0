Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64ACC394D4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 19:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhE2RDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 May 2021 13:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhE2RDu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 May 2021 13:03:50 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76054C06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 10:02:12 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id t24so7651609oiw.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YX+tW+FTPI4PhCb0JGJmARolkT+r0BuTh5B1RHmLPCA=;
        b=gikF95tMjzLxko3YQAJD6xmwHHJ19UG2kSmPO38r9cF2UgRmenWffgKKaf+rdyTyZ+
         FBXb7aJ5Ww6AIdB63iwH2BZSl4mNb9DLMnE7CyAcxxUbI7TiNCqXOOis8MNRT11UVHTd
         adu1EhFml9dA5nJadlkehvfAC9TUF5hlMcIlHWocFKo8WjYMUYsEKBuIQoLbMR/kq8MT
         mDBpf//IEUmxwYYD922l2J0T2h1XT5rqIincrEZTFwg5ndvB4X+TcmCI/0JCQV4f/T2G
         +Li42KZgnskrmPEhA24J0A9kBOIeZ+/S3VhUxgfGmOF0l+G0Baxfo+kOhlpxaIxqUQFS
         Admw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YX+tW+FTPI4PhCb0JGJmARolkT+r0BuTh5B1RHmLPCA=;
        b=OL/l0Iq1hv5C6KWYBCSbVlHwDNTdD9PgNHuh5EUMZhvXC6okhuNmc84Iu2fYEk7nEP
         1JpYcTs1ssKx0faCdhLsAsbDlxlbBkzp99gxRL8JGrs2dew2vA9HJuD8Ey0/UVd3eJCA
         v+Mk7i1CAD4YrRiZZeJUDKef7cPNoG7NfWpdKsW0B5Y6Vfrwgw6h8rd6vNRis8xiC7b8
         QT3OLxSlBvnj/bYz3D/f08xevuCjeyI3WvUw+oDN0bLUgPGgiDLDQfswCs0nlhIPPnSx
         BZFX7zihV8+QFalLKnkXccpboGbGVdwLUtASM8AL4XgXIUxu7E5w12JpgTaNXy8SANtX
         KKSw==
X-Gm-Message-State: AOAM530rn0uxS0ULC021//K0tCkelyh5FZY+e2XIIjJoc0Ghh4bkUHWF
        FlbnbJl3qE8Zhl0nOxCe8v9miw==
X-Google-Smtp-Source: ABdhPJzjfndC1VKFZJvi1kPtoutJnVZIZ7kUpZVwvoD0J8/S4EiWGwJK7mV91U1hUcQBMFi7F5DqGQ==
X-Received: by 2002:aca:3c4:: with SMTP id 187mr1956041oid.116.1622307731852;
        Sat, 29 May 2021 10:02:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k7sm1832923ood.36.2021.05.29.10.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 10:02:11 -0700 (PDT)
Date:   Sat, 29 May 2021 12:02:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     vkoul@kernel.org, kishon@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: qcom-qmp: Use phy_status field for the status
 bit offset
Message-ID: <YLJzkUZ7t5rL0uJ8@builder.lan>
References: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
 <20210427065400.18958-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427065400.18958-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Apr 01:53 CDT 2021, Manivannan Sadhasivam wrote:

> In preparation of the support for v4.20 PCIe PHY in SDX55, use a
> separate "phy_status" field for the status bit offset. This is needed
> because, the v4.20 PHY uses a different offset for the PHY Status.

Nit. I think "...uses a different bit for..." would be better.

> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 9cdebe7f26cb..c9934b2407c4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2323,6 +2323,8 @@ struct qmp_phy_cfg {
>  	unsigned int start_ctrl;
>  	unsigned int pwrdn_ctrl;
>  	unsigned int mask_com_pcs_ready;
> +	/* bit offset of PHYSTATUS in QPHY_PCS_STATUS register */
> +	unsigned int phy_status;
>  
>  	/* true, if PHY has a separate PHY_COM control block */
>  	bool has_phy_com_ctrl;
> @@ -2526,6 +2528,7 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  };
>  
>  static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
> @@ -2551,6 +2554,7 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
>  	.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.mask_com_pcs_ready	= PCS_READY,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_phy_com_ctrl	= true,
>  	.has_lane_rst		= true,
> @@ -2580,6 +2584,7 @@ static const struct qmp_phy_cfg msm8996_ufs_cfg = {
>  
>  	.start_ctrl		= SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.no_pcs_sw_reset	= true,
>  };
> @@ -2606,6 +2611,7 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  };
>  
>  static const char * const ipq8074_pciephy_clk_l[] = {
> @@ -2638,6 +2644,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_phy_com_ctrl	= false,
>  	.has_lane_rst		= false,
> @@ -2670,6 +2677,7 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
>  
>  	.start_ctrl		= PCS_START | SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= 995,		/* us */
> @@ -2698,6 +2706,7 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
>  
>  	.start_ctrl		= PCS_START | SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= 995,		/* us */
> @@ -2736,6 +2745,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
>  
>  	.start_ctrl		= PCS_START | SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= 995,		/* us */
> @@ -2774,6 +2784,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
>  
>  	.start_ctrl		= PCS_START | SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
>  
>  	.is_dual_lane_phy	= true,
>  	.has_pwrdn_delay	= true,
> @@ -2803,6 +2814,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -2834,6 +2846,7 @@ static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -2900,6 +2913,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -2926,6 +2940,7 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.is_dual_lane_phy	= true,
>  	.no_pcs_sw_reset	= true,
> @@ -2953,6 +2968,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
>  
>  	.start_ctrl             = SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
>  };
>  
>  static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
> @@ -2977,6 +2993,7 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>  
>  	.start_ctrl             = SERDES_START | PCS_START,
>  	.pwrdn_ctrl             = SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.is_dual_lane_phy       = true,
>  };
> @@ -3001,6 +3018,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.is_dual_lane_phy	= true,
>  };
> @@ -3027,6 +3045,8 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
> +
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -3058,6 +3078,7 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -3086,6 +3107,7 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -3117,6 +3139,7 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -3145,6 +3168,7 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -3171,6 +3195,7 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.is_dual_lane_phy	= true,
>  };
> @@ -3197,6 +3222,7 @@ static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -3228,6 +3254,7 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.phy_status		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -3843,7 +3870,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
>  			ready = PCS_READY;
>  		} else {
>  			status = pcs + cfg->regs[QPHY_PCS_STATUS];
> -			mask = PHYSTATUS;
> +			mask = cfg->phy_status;
>  			ready = 0;
>  		}
>  
> -- 
> 2.25.1
> 
