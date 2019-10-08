Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FE7CF428
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 09:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbfJHHq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 03:46:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38926 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730317AbfJHHq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 03:46:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 27B0F60DB4; Tue,  8 Oct 2019 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570520786;
        bh=A9BCbGOjmqwtj2L/5i06hDZ7sKrRR5cdNSR1GYqDj+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bfF5cj/844sFOGVt8M1OvDqMwJ6mH5Br0BmI/rCqcKx27811YscFHMP1tIkSQjZV+
         U9CQV4r2GuQRxsNtcQGg9Vvr3LPprrQhysD5nPE0khDwf7g5Gy8Eijr0ad8mECGVyQ
         tnJeLm5kO6VGXE/FGzST/lm92y8r1oMdz/SGOxYk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8119A60ACA;
        Tue,  8 Oct 2019 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570520784;
        bh=A9BCbGOjmqwtj2L/5i06hDZ7sKrRR5cdNSR1GYqDj+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jaRU91A6W5PBtoTpOxLpLhSr/jD2aG1HwXJeG6yawVLR7KbU8CpKE3nw8ml8aXbvy
         ObU/LNST9pgiymszgaUUuuNXS8iPTkJukM9WuNzfsTvI7LkZLfoOxfe0olwYHC/1Hf
         5dklUZwKpimwZNzl6/xsFfm8HfyNTmi0e8PgdUs0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8119A60ACA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 8 Oct 2019 00:46:20 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
Message-ID: <20191008074619.GA20801@jackp-linux.qualcomm.com>
References: <20190906051017.26846-1-vkoul@kernel.org>
 <20190906051017.26846-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906051017.26846-4-vkoul@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On Fri, Sep 06, 2019 at 10:40:17AM +0530, Vinod Koul wrote:
> SM8150 UFS PHY is v4 of QMP phy. Add support for V4 QMP phy register
> defines and support for SM8150 QMP UFS PHY.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 125 ++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h |  96 +++++++++++++++++++++
>  2 files changed, 221 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 34ff6434da8f..92d3048f2b36 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -164,6 +164,11 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
>  	[QPHY_PCS_READY_STATUS]		= 0x160,
>  };
>  
> +static const unsigned int sm8150_ufsphy_regs_layout[] = {
> +	[QPHY_START_CTRL]		= 0x00,
> +	[QPHY_PCS_READY_STATUS]		= 0x180,
> +};
> +
>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
>  	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
> @@ -878,6 +883,93 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_SYSCLK_EN_SEL, 0xd9),

QSERDES_V4_COM? See below.

<snip>

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index 335ea5d7ef40..0eefd8621669 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -313,4 +313,100 @@
>  #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
>  #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
>  
> +/* Only for QMP V4 PHY - QSERDES COM registers */
> +#define QSERDES_COM_V4_SYSCLK_EN_SEL			0x094

Should these rather be prefixed as QSERDES_V4_COM? There are already
QSERDES_V3_COM_* in this header so the convention appears to be
Q{SERDES,PHY}_VX_{COM,TX,RX,PCS}.

> +#define QSERDES_COM_V4_HSCLK_SEL			0x158
> +#define QSERDES_COM_V4_HSCLK_HS_SWITCH_SEL		0x15C
> +#define QSERDES_COM_V4_LOCK_CMP_EN			0x0A4
> +#define QSERDES_COM_V4_VCO_TUNE_MAP			0x10C

Nit: sort in ascending offset order, and make the hex values lowercase?

<snip>

> +/* Only for QMP V4 PHY - PCS registers */
> +#define QPHY_V4_PHY_START				0x000
> +#define QPHY_V4_POWER_DOWN_CONTROL			0x004
> +#define QPHY_V4_SW_RESET				0x008
> +#define QPHY_V4_PCS_READY_STATUS			0x180
> +#define QPHY_V4_LINECFG_DISABLE				0x148
> +#define QPHY_V4_MULTI_LANE_CTRL1			0x1E0
> +#define QPHY_V4_RX_SIGDET_CTRL2				0x158
> +#define QPHY_V4_TX_LARGE_AMP_DRV_LVL			0x030
> +#define QPHY_V4_TX_SMALL_AMP_DRV_LVL			0x038
> +#define QPHY_V4_TX_MID_TERM_CTRL1			0x1D8
> +#define QPHY_V4_DEBUG_BUS_CLKSEL			0x124
> +#define QPHY_V4_PLL_CNTL				0x02C
> +#define QPHY_V4_TIMER_20US_CORECLK_STEPS_MSB		0x00C
> +#define QPHY_V4_TIMER_20US_CORECLK_STEPS_LSB		0x010
> +#define QPHY_V4_TX_PWM_GEAR_BAND			0x160
> +#define QPHY_V4_TX_HS_GEAR_BAND				0x168
> +#define QPHY_V4_TX_HSGEAR_CAPABILITY			0x074
> +#define QPHY_V4_RX_HSGEAR_CAPABILITY			0x0B4
> +#define QPHY_V4_RX_MIN_HIBERN8_TIME			0x150
> +#define QPHY_V4_BIST_FIXED_PAT_CTRL			0x060

Interesting. These offsets appear to be valid only for the UFS instance
of the QMP PHY. For PCIe and USB the PCS layout is completely different.
Wonder if we need to add _UFS_ to  the prefix to differentiate them? Or
can this be deferred to when PCIe/USB PHY driver support for SM8150 gets
added?

I was thinking of taking a stab at USB if I get time, not sure if that's
already on your or somebody's (Bjorn?) radar.

Thanks
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
