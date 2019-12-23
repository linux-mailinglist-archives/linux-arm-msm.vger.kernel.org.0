Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 220691296CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 15:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfLWOG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 09:06:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:37528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726676AbfLWOG4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 09:06:56 -0500
Received: from localhost (unknown [106.51.110.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E82620709;
        Mon, 23 Dec 2019 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577110015;
        bh=Cbual4ehB2Zz84mgi4lJ0W18gNgG1GLTDzrUJDxiHqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CY4gc8xS6rLzYfPE0ErrDYtGywpDKEXzrMIKKhPEBALM9uCQA675Dc0+YZ3N7EnbB
         ePf49u5rigB7mKL5ShjrkKQ2KrK9+IO+u2q0B7tGBGeZrI4KY6PwEm/+2RhID6H2C0
         geyRfdKEVouA0UtJak9q+ZeyglZgXrw6JZv8pROM=
Date:   Mon, 23 Dec 2019 19:36:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manu Gautam <mgautam@codeaurora.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] phy: qcom-qmp: Add optional SW reset
Message-ID: <20191223140650.GG2536@vkoul-mobl>
References: <20191220101719.3024693-1-vkoul@kernel.org>
 <20191220101719.3024693-4-vkoul@kernel.org>
 <5dc55690-61cc-de35-2e02-ec812f086bf5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dc55690-61cc-de35-2e02-ec812f086bf5@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manu,

On 23-12-19, 14:38, Manu Gautam wrote:
> 
> On 12/20/2019 3:47 PM, Vinod Koul wrote:
> > For V4 QMP UFS Phy, we need to assert reset bits, configure the phy and
> > then deassert it, so add optional has_sw_reset flag and use that to
> > configure the QPHY_SW_RESET register.
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index 1196c85aa023..47a66d55107d 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -168,6 +168,7 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
> >  static const unsigned int sm8150_ufsphy_regs_layout[] = {
> >  	[QPHY_START_CTRL]		= QPHY_V4_PHY_START,
> >  	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_READY_STATUS,
> > +	[QPHY_SW_RESET]			= QPHY_V4_SW_RESET,
> >  };
> >  
> >  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
> > @@ -1023,6 +1024,9 @@ struct qmp_phy_cfg {
> >  
> >  	/* true, if PCS block has no separate SW_RESET register */
> >  	bool no_pcs_sw_reset;
> > +
> > +	/* true if sw reset needs to be invoked */
> > +	bool has_sw_reset;
> 
> 
> There is no need to add new flag. Existing code will take care of it for UFS once you
> clear no_pcs_sw_reset flag.
> 
> >  };
> >  
> >  /**
> > @@ -1391,6 +1395,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
> >  
> >  	.is_dual_lane_phy	= true,
> >  	.no_pcs_sw_reset	= true,
> > +	.has_sw_reset		= true,
> >  };
> >  
> >  static void qcom_qmp_phy_configure(void __iomem *base,
> > @@ -1475,6 +1480,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
> >  			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> >  	}
> >  
> > +	if (cfg->has_sw_reset)
> > +		qphy_setbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> > +
> 
> Not needed. POR value of the bit is '1'.
> 
> 
> >  	if (cfg->has_phy_com_ctrl)
> >  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
> >  			     SW_PWRDN);
> > @@ -1651,6 +1659,9 @@ static int qcom_qmp_phy_enable(struct phy *phy)
> >  	if (cfg->has_phy_dp_com_ctrl)
> >  		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
> >  
> > +	if (cfg->has_sw_reset)
> > +		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> > +
> 
> There is no need to add UFS specific change here as existing PHY driver can
> handle PCS based PHY sw_reset and already does it for USB and PCIe.

Thanks for the explanation in this and previous version.

I confirm that adding sw_reset and clearing .no_pcs_sw_reset does make
it work for me on UFS on SM8150.

I will drop this patch and send the update in v3

-- 
~Vinod
