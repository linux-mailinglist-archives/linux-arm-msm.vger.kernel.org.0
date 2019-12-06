Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8D8114C86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 08:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfLFHHK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 02:07:10 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35913 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfLFHHJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 02:07:09 -0500
Received: by mail-pf1-f194.google.com with SMTP id x184so1428573pfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 23:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MEZcZTLgYA/fPlWDUTP8KdCopxQzSJD3S36wVkZB+UM=;
        b=IYIgZMSitum1ekaT5L3lfbW9BL4LXIkLuToW304b6NEDhZho+2AvyZL5CV2DlZkKbj
         I3kXPKdLT7Hset5FnPCz3rMd1b50E+Av2jQwtakTd02qFNHX/knxjcLA5jl739jLn5vc
         zXObvHW4eeDFnsIQefZO6PlizWHLClRbZbC4xqO0NGsGfUZm577qthpNYvsDELaGaokE
         NIjemMXbvML/PelIVcEu7ja178RJ5Hq9pucB5dPuMkTMmdDVkYNxhXxzZ1pUTAgj8iRH
         /JrwR0pnBJakOJ5HdirvfLHA07Q3dMCA9uNO2DVkUlXMgDbp1zNMNC7Zwf84SeBNj2l5
         30Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MEZcZTLgYA/fPlWDUTP8KdCopxQzSJD3S36wVkZB+UM=;
        b=eeCdcc/BMF5ZrYtknLSJOnASMmml7BYY8/03Qz/FD7iKN/k/67TNTFPi0ygEppQUdy
         6KgrXoE21xze+luUZmtLW1hX241yPIh47S+kLm+N0q2+RK00w14l7o8aCQSD3T+Yre01
         RG/hjtdbep3IxeztbctO/+jNIMjwf57M+k2W6ir5T0NAjyliAm1ZFxg+YTj7PR9zKh7+
         xQzdd3l5PS99r2uXm2ts3WvlU21vwpkD3Jg8yRTNLtEkw9zCIK40xORcOLAGmd8Nw/B+
         XoOR2e5b10Py3MEEkwzumQ7pBgVURi4o5w8akWJYj0e+njS9UHlmFKRSFYwLwCe23a4U
         +Pjw==
X-Gm-Message-State: APjAAAWbQ+HplYHxSkftYbjc/0EcdZs5i0H7y8WS5SBcSQpKsb/AgnsP
        W1B6cXW+qqITjsN0mxPvZSmoXlhjRE8=
X-Google-Smtp-Source: APXvYqy9GGwfHKhkmX3Z4iJ85y+siN8UYv8iH4HVFod6HB5y8OzTb3w8mWlAKJCNazKP+kA58tdlfA==
X-Received: by 2002:a62:788a:: with SMTP id t132mr4758066pfc.134.1575616028903;
        Thu, 05 Dec 2019 23:07:08 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e1sm15430234pfl.98.2019.12.05.23.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 23:07:08 -0800 (PST)
Date:   Thu, 5 Dec 2019 23:07:05 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paolo Pisati <p.pisati@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] Revert "phy: qcom-qmp: Correct ready status, again"
Message-ID: <20191206070705.GD289401@yoga>
References: <20191205161505.15295-1-p.pisati@gmail.com>
 <20191205161505.15295-7-p.pisati@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205161505.15295-7-p.pisati@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Dec 08:15 PST 2019, Paolo Pisati wrote:

> This reverts commit 14ced7e3a1ae9bed7051df3718c8c7b583854a5c.
> 
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Thanks for the patch Paolo, but reverting this commit means we're
checking for the wrong status bit and thereby relies on timing of that
bit having an appropriate value again.

The problem at hand seems to be that some resources are missing while
trying to initialize the PHY, which causes it to not become ready. I saw
the same problem when bringing up PCIe on SDM845, but failed to validate
MSM8996, as this was not booting since mid-summer.

I verified that this is the case by applying:
https://lore.kernel.org/linux-arm-msm/20191107000917.1092409-4-bjorn.andersson@linaro.org/

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 39e8deb..e7b8283 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -35,7 +35,7 @@
>  #define PLL_READY_GATE_EN			BIT(3)
>  /* QPHY_PCS_STATUS bit */
>  #define PHYSTATUS				BIT(6)
> -/* QPHY_PCS_READY_STATUS & QPHY_COM_PCS_READY_STATUS bit */
> +/* QPHY_COM_PCS_READY_STATUS bit */
>  #define PCS_READY				BIT(0)
>  
>  /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
> @@ -115,7 +115,6 @@ enum qphy_reg_layout {
>  	QPHY_SW_RESET,
>  	QPHY_START_CTRL,
>  	QPHY_PCS_READY_STATUS,
> -	QPHY_PCS_STATUS,
>  	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
>  	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
>  	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
> @@ -134,7 +133,7 @@ static const unsigned int pciephy_regs_layout[] = {
>  	[QPHY_FLL_MAN_CODE]		= 0xd4,
>  	[QPHY_SW_RESET]			= 0x00,
>  	[QPHY_START_CTRL]		= 0x08,
> -	[QPHY_PCS_STATUS]		= 0x174,
> +	[QPHY_PCS_READY_STATUS]		= 0x174,
>  };
>  
>  static const unsigned int usb3phy_regs_layout[] = {
> @@ -145,7 +144,7 @@ static const unsigned int usb3phy_regs_layout[] = {
>  	[QPHY_FLL_MAN_CODE]		= 0xd0,
>  	[QPHY_SW_RESET]			= 0x00,
>  	[QPHY_START_CTRL]		= 0x08,
> -	[QPHY_PCS_STATUS]		= 0x17c,
> +	[QPHY_PCS_READY_STATUS]		= 0x17c,
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d4,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0d8,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x178,
> @@ -154,7 +153,7 @@ static const unsigned int usb3phy_regs_layout[] = {
>  static const unsigned int qmp_v3_usb3phy_regs_layout[] = {
>  	[QPHY_SW_RESET]			= 0x00,
>  	[QPHY_START_CTRL]		= 0x08,
> -	[QPHY_PCS_STATUS]		= 0x174,
> +	[QPHY_PCS_READY_STATUS]		= 0x174,
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
> @@ -912,6 +911,7 @@ struct qmp_phy_cfg {
>  
>  	unsigned int start_ctrl;
>  	unsigned int pwrdn_ctrl;
> +	unsigned int mask_pcs_ready;
>  	unsigned int mask_com_pcs_ready;
>  
>  	/* true, if PHY has a separate PHY_COM control block */
> @@ -1074,6 +1074,7 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
>  
>  	.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.mask_pcs_ready		= PHYSTATUS,
>  	.mask_com_pcs_ready	= PCS_READY,
>  
>  	.has_phy_com_ctrl	= true,
> @@ -1105,6 +1106,7 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.mask_pcs_ready		= PHYSTATUS,
>  };
>  
>  /* list of resets */
> @@ -1134,6 +1136,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.mask_pcs_ready		= PHYSTATUS,
>  
>  	.has_phy_com_ctrl	= false,
>  	.has_lane_rst		= false,
> @@ -1164,6 +1167,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.mask_pcs_ready		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -1195,6 +1199,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.mask_pcs_ready		= PHYSTATUS,
>  
>  	.has_pwrdn_delay	= true,
>  	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> @@ -1221,6 +1226,7 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
>  
>  	.start_ctrl		= SERDES_START,
>  	.pwrdn_ctrl		= SW_PWRDN,
> +	.mask_pcs_ready		= PCS_READY,
>  
>  	.is_dual_lane_phy	= true,
>  	.no_pcs_sw_reset	= true,
> @@ -1248,6 +1254,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
>  
>  	.start_ctrl             = SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.mask_pcs_ready		= PHYSTATUS,
>  };
>  
>  static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
> @@ -1272,6 +1279,7 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>  
>  	.start_ctrl             = SERDES_START | PCS_START,
>  	.pwrdn_ctrl             = SW_PWRDN,
> +	.mask_pcs_ready         = PHYSTATUS,
>  
>  	.is_dual_lane_phy       = true,
>  };
> @@ -1449,7 +1457,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>  	void __iomem *pcs = qphy->pcs;
>  	void __iomem *dp_com = qmp->dp_com;
>  	void __iomem *status;
> -	unsigned int mask, val, ready;
> +	unsigned int mask, val;
>  	int ret;
>  
>  	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> @@ -1537,17 +1545,10 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>  	/* start SerDes and Phy-Coding-Sublayer */
>  	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
>  
> -	if (cfg->type == PHY_TYPE_UFS) {
> -		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
> -		mask = PCS_READY;
> -		ready = PCS_READY;
> -	} else {
> -		status = pcs + cfg->regs[QPHY_PCS_STATUS];
> -		mask = PHYSTATUS;
> -		ready = 0;
> -	}
> +	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
> +	mask = cfg->mask_pcs_ready;
>  
> -	ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
> +	ret = readl_poll_timeout(status, val, val & mask, 10,
>  				 PHY_INIT_COMPLETE_TIMEOUT);
>  	if (ret) {
>  		dev_err(qmp->dev, "phy initialization timed-out\n");
> -- 
> 2.7.4
> 
