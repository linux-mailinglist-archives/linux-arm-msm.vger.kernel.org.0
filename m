Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C066F25CE52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 01:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgICX10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 19:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgICX10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 19:27:26 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C334DC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 16:27:24 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id db4so2195726qvb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lG+5k/ucCXHZk2lezM5uaUGaROvX5Yi5cBSwHgAwezI=;
        b=PQpRbvDvCw6/6duT1k5F2LBbPEblSaAM1LCTUSjl6fYNEkEEfm96DoJjo7MsP7t3wG
         3gkBIJ8UJdvVLF6atkgTzMh4D+phD7L/BbuvzEQNL2aWCfziXrIBRZjp9z9zhDkq5mlL
         T8sIlnaSMEplmvaznRvvdEyey4nAnD5xT7Iqm2Reh6nULNq5KuYrx4wB2or6Q6adk2no
         EuaAdoYHGulrSYWEnpfo32guu/uURVkJYTM4W9E8X5osHi+w7EWCgGTnZJRoRGhDpPn7
         rytYFjUt+dOX8W9qrwGxnnc4i1DOW1FbxQW7sggvBQ0AjCPo0dfAFyqd9B+D9LrFCio0
         2X9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lG+5k/ucCXHZk2lezM5uaUGaROvX5Yi5cBSwHgAwezI=;
        b=jxx76Yys3pf9uQOhs4TMtnAJuyUYMHHjJu0CIDoB20ApSSZQWtbuDa0pyhDm9DZQqj
         P4hw7GlXzmqV0vBhrX/UmuNAum568CHgThAvEjtcGl1K7/2jq45IpcAbb0ET4F8479/Y
         ASFyZnV7udoO5zrTgxP+CPLxcB6x+DISRpllFNrJ1BeGxqY1VjeG4gUc5oe2aA1WVj4S
         /LzF5bSabJfvj+F4vPRZCaoUmSx6f/n4n4+sMyQ7O2LtUQ8WkC7XFFE0A3BUSDc3AEgn
         Y+2l5YEc2SfWI37DzjLt+rg7nD+4Aa4121pqw57zv86YoFDTxRb3yU+tpIzXxUuJdOUy
         66Tw==
X-Gm-Message-State: AOAM533QNLHQW9MI0MJei2d2u7vjz2UB73CIjcUDjeLjkVCzlvsWghQq
        GdOqzYsIFNSseiwxgAlkwvjr3w==
X-Google-Smtp-Source: ABdhPJx4mieNykswI5USCngqgasqeKfEZg9G6q2zTdTNHe7oMVbLOb4iFQEmlbQq7ifV6ZNNjvAHDA==
X-Received: by 2002:a0c:eac5:: with SMTP id y5mr4335692qvp.2.1599175643564;
        Thu, 03 Sep 2020 16:27:23 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id j8sm3253090qth.90.2020.09.03.16.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 16:27:23 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] phy: qcom-qmp: Add support for DP in USB3+DP
 combo phy
To:     Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
 <20200902230215.3452712-8-swboyd@chromium.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <990b9edf-055d-6ecf-ee39-5a252b4c8859@marek.ca>
Date:   Thu, 3 Sep 2020 19:26:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200902230215.3452712-8-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/2/20 7:02 PM, Stephen Boyd wrote:

...

> +static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
> +{
> +	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
> +	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +	u32 val, phy_vco_div, status;
> +	unsigned long pixel_freq;
> +
> +	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
> +
> +	/*
> +	if (lane_cnt == 4 || orientation == ORIENTATION_CC2)
> +		val |= DP_PHY_PD_CTL_LANE_0_1_PWRDN;
> +	if (lane_cnt == 4 || orientation == ORIENTATION_CC1)
> +		val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
> +	*/
> +	/*
> +	 * TODO: Assume orientation is CC1 for now and two lanes, need to
> +	 * use type-c connector to understand orientation and lanes
> +	 */
> +	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
> +
> +	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +
> +	/*
> +	if (orientation == ORIENTATION_CC2)
> +		writel(0x4c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
> +	else
> +	*/
> +	/* does this do anything? link_clock_sel_mux isn't set (bit 5) */
> +	writel(0x5c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
> +
> +	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 1620000000UL / 2;
> +		break;
> +	case 2700:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 2700000000UL / 2;
> +		break;
> +	case 5400:
> +		phy_vco_div = 0x2;
> +		pixel_freq = 5400000000UL / 4;
> +		break;
> +	case 8100:
> +		phy_vco_div = 0x0;
> +		pixel_freq = 8100000000UL / 6;
> +		break;
> +	default:
> +		/* Other link rates aren't supported */
> +		return -EINVAL;
> +	}
> +	writel(phy_vco_div, qphy->pcs + QSERDES_V3_DP_PHY_VCO_DIV);
> +
> +	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
> +	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
> +
> +	writel(0x04, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
> +	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +
> +	writel(0x20, qphy->serdes + QSERDES_COM_RESETSM_CNTRL);

Should be QSERDES_V3_COM_RESETSM_CNTRL and not 
QSERDES_COM_RESETSM_CNTRL, which is for older PHY versions.

> +
> +	if (readl_poll_timeout(qphy->serdes + QSERDES_V3_COM_C_READY_STATUS,
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	writel(0x18, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	udelay(2000);
> +	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +
> +	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000);
> +}

...
