Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 388A6B69B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfIRRiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:38:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbfIRRiu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:38:50 -0400
Received: from localhost (unknown [122.178.229.153])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75DB421848;
        Wed, 18 Sep 2019 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568828329;
        bh=oDaAt4kb6dNCXmBDXCWSMj7k/3bfxowZZKYYhcDrpno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q0K6ybPSmvbeIODZ4Ex+QAN52nVP68aXJhMuepJqC3Ful3NqGZf6aFopaaNRGDVWi
         wVXOyGHynjvhEmMG1vU2eEa1+7tNKgNp/gZ/F0QqYjbAHuh0V7AoBlPtuoPDS2Xbd1
         2af7JTD5fh7SF8J73dFBxeumH+sFkxyk+yxVRdZ8=
Date:   Wed, 18 Sep 2019 23:07:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
Message-ID: <20190918173740.GQ4392@vkoul-mobl>
References: <20190906051017.26846-1-vkoul@kernel.org>
 <20190906051017.26846-4-vkoul@kernel.org>
 <ab149ba9-ab2e-5013-34ab-b01af51abc0a@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab149ba9-ab2e-5013-34ab-b01af51abc0a@free.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-09-19, 17:08, Marc Gonzalez wrote:
> On 06/09/2019 07:10, Vinod Koul wrote:

> > +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP2_MODE1, 0x0f),
> > +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
> > +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
> > +
> > +	/* Rate B */
> > +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_MAP, 0x06),
> 
> IMO, the name of the symbolic constants should be QSERDES_V4_COM*
> (like below for QSERDES_V4_TX* and QSERDES_V4_RX*)

Agreed this should have been QSERDES_V4_COM_*
 
> > +static const char * const sm8150_ufs_phy_clk_l[] = {
> > +	"ref", "ref_aux",
> > +};
> > +
> 
> Why not just reuse sdm845_ufs_phy_clk_l?

I think that is a good idea, will do

> > +static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
> > +	.type			= PHY_TYPE_UFS,
> > +	.nlanes			= 2,
> > +
> > +	.serdes_tbl		= sm8150_ufsphy_serdes_tbl,
> > +	.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes_tbl),
> > +	.tx_tbl			= sm8150_ufsphy_tx_tbl,
> > +	.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx_tbl),
> > +	.rx_tbl			= sm8150_ufsphy_rx_tbl,
> > +	.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx_tbl),
> > +	.pcs_tbl		= sm8150_ufsphy_pcs_tbl,
> > +	.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs_tbl),
> > +	.clk_list		= sm8150_ufs_phy_clk_l,
> > +	.num_clks		= ARRAY_SIZE(sm8150_ufs_phy_clk_l),
> > +	.vreg_list		= qmp_phy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +	.regs			= sm8150_ufsphy_regs_layout,
> > +
> > +	.start_ctrl		= SERDES_START,
> > +	.pwrdn_ctrl		= SW_PWRDN,
> > +	.mask_pcs_ready		= PCS_READY,
> 
> I think you need to rework your patch on top of
> "phy: qcom-qmp: Correct ready status, again"
> (it removed this field)

Yes will rebase on rc1 (when out) and resend, thanks for pointing

-- 
~Vinod
