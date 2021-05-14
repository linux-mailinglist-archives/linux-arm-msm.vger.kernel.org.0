Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25462380786
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 12:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhENKli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 06:41:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:46688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229964AbhENKlg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 06:41:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB8B561457;
        Fri, 14 May 2021 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620988825;
        bh=g0jXJvsgVOWS5QTDTdhTru5zSKl3V7XCKEVjfVb4Sfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TcUnTh2iM7D/niM8ustdCUOjGkzByM5CYBxaDdQn6zdE53yvG0lpso5oawwjpZmIO
         gLFK4U2Tyloc2kOkMmIvXsLAIPy7J4ApDhNjxHLaKligEYP8o7hgouIAG13Ov9T1+a
         S1wyzpr9+Nek19O0i+RuNI0wEffvBKKbjX87ifq1KCFq7v/TLV2NVbdkY/kNY2OzM0
         KrnSAaetrgdE3qiqJ6savhV26qasUa4akhF3PE0liE0CL7RDyaZWK/3wc5h7mShDLd
         f2WKTftF7xP25tz9wwG73A7LBciVuN1NX0P+fu9nTbymMR9XxpNUEGSveS+7rv8MAF
         EadB1XliUvk3g==
Date:   Fri, 14 May 2021 16:10:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>, sbillaka@codeaurora.org,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: Introduce new eDP PHY driver
Message-ID: <YJ5TlcwcxV4E+jyh@vkoul-mobl.Dlink>
References: <20210511041930.592483-1-bjorn.andersson@linaro.org>
 <20210511041930.592483-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511041930.592483-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-05-21, 23:19, Bjorn Andersson wrote:

> +static int qcom_edp_phy_power_on(struct phy *phy)
> +{
> +	struct qcom_edp *edp = phy_get_drvdata(phy);
> +	int timeout;
> +	int ret;
> +	u32 val;
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +	       edp->edp + DP_PHY_PD_CTL);
> +	writel(0xfc, edp->edp + DP_PHY_MODE);
> +
> +	timeout = readl_poll_timeout(edp->pll + QSERDES_COM_CMN_STATUS,
> +				     val, val & BIT(7), 5, 200);
> +	if (timeout)
> +		return timeout;
> +
> +	writel(0x01, edp->tx0 + TXn_LDO_CONFIG);
> +	writel(0x01, edp->tx1 + TXn_LDO_CONFIG);
> +	writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
> +	writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
> +
> +	ret = qcom_edp_configure_ssc(edp);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_edp_configure_pll(edp);
> +	if (ret)
> +		return ret;
> +
> +	/* TX Lane configuration */
> +	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	/* TX-0 register configuration */
> +	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> +	writel(0x0f, edp->tx0 + TXn_CLKBUF_ENABLE);
> +	writel(0x03, edp->tx0 + TXn_RESET_TSYNC_EN);
> +	writel(0x01, edp->tx0 + TXn_TRAN_DRVR_EMP_EN);
> +	writel(0x04, edp->tx0 + TXn_TX_BAND);
> +
> +	/* TX-1 register configuration */
> +	writel(0x03, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
> +	writel(0x0f, edp->tx1 + TXn_CLKBUF_ENABLE);
> +	writel(0x03, edp->tx1 + TXn_RESET_TSYNC_EN);
> +	writel(0x01, edp->tx1 + TXn_TRAN_DRVR_EMP_EN);
> +	writel(0x04, edp->tx1 + TXn_TX_BAND);
> +
> +	ret = qcom_edp_set_vco_div(edp);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, edp->edp + DP_PHY_CFG);
> +        writel(0x05, edp->edp + DP_PHY_CFG);
> +        writel(0x01, edp->edp + DP_PHY_CFG);
> +        writel(0x09, edp->edp + DP_PHY_CFG);
> +
> +        writel(0x20, edp->pll + QSERDES_COM_RESETSM_CNTRL);	
> +
> +	timeout = readl_poll_timeout(edp->pll + QSERDES_COM_C_READY_STATUS,
> +				     val, val & BIT(0), 500, 10000);
> +	if (timeout)
> +		return timeout;
> +
> +	writel(0x19, edp->edp + DP_PHY_CFG);
> +	writel(0x1f, edp->tx0 + TXn_HIGHZ_DRVR_EN);
> +	writel(0x04, edp->tx0 + TXn_HIGHZ_DRVR_EN);
> +	writel(0x00, edp->tx0 + TXn_TX_POL_INV);
> +	writel(0x1f, edp->tx1 + TXn_HIGHZ_DRVR_EN);
> +	writel(0x04, edp->tx1 + TXn_HIGHZ_DRVR_EN);
> +	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
> +	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
> +	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
> +	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +
> +	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> +	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
> +	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
> +
> +	writel(0x4, edp->tx0 + TXn_HIGHZ_DRVR_EN);
> +	writel(0x3, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> +	writel(0x4, edp->tx1 + TXn_HIGHZ_DRVR_EN);
> +	writel(0x0, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
> +	writel(0x3, edp->edp + DP_PHY_CFG_1);
> +
> +	writel(0x18, edp->edp + DP_PHY_CFG);

Can't help but think that this should be made modular. We would come up
with next set which would have different set of sequence/values so
having a qmp style table here would be better..

-- 
~Vinod
