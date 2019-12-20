Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1650C12764E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 08:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfLTHKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 02:10:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:59536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbfLTHKV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 02:10:21 -0500
Received: from localhost (unknown [106.201.107.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5188424679;
        Fri, 20 Dec 2019 07:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576825820;
        bh=lu+82vmeF72yERVCgMIPNu3jeKVIiSz/mUtEo62bEpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SN4sxlPGhVGoieGEioVmdAftiYAwG9w1gyhLVKdfVQnbH7wN2NyFeapLzpOulyxoG
         NrH7BRFSWJq5vTcrUDWz6XIkHac1L6Ed3p1wdKg20Q7N5CahBP27oDWmAfuIX6D+a2
         V2Qrj7We1fwh5pGrUpoudDTrT6WsNH1w3McVaX2k=
Date:   Fri, 20 Dec 2019 12:40:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Can Guo <cang@codeaurora.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add optional SW reset
Message-ID: <20191220071015.GF2536@vkoul-mobl>
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-4-vkoul@kernel.org>
 <ff83ac1f0ec6bca1379e8b873fd30aa2@codeaurora.org>
 <9ef99dcac59dbdc59c7e5eb1a8724ea2@codeaurora.org>
 <20191220042427.GE2536@vkoul-mobl>
 <e55185eda9d7dcbce80a671e630449ea@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e55185eda9d7dcbce80a671e630449ea@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-12-19, 14:00, Can Guo wrote:
> On 2019-12-20 12:24, Vinod Koul wrote:
> > On 20-12-19, 08:49, cang@codeaurora.org wrote:
> > > On 2019-12-20 08:22, cang@codeaurora.org wrote:
> > > > On 2019-12-19 23:04, Vinod Koul wrote:
> > > >
> > > > >  	/* start SerDes and Phy-Coding-Sublayer */
> > > > >  	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
> > > 
> > > I thought your change would be like this
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > > b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > > index 8e642a6..a4ab4b7 100755
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > > @@ -166,6 +166,7 @@ static const unsigned int
> > > sdm845_ufsphy_regs_layout[] =
> > > {
> > >  };
> > > 
> > >  static const unsigned int sm8150_ufsphy_regs_layout[] = {
> > > +       [QPHY_SW_RESET]                 = 0x08,
> > >         [QPHY_START_CTRL]               = 0x00,
> > >         [QPHY_PCS_READY_STATUS]         = 0x180,
> > >  };
> > > @@ -1390,7 +1391,6 @@ static const struct qmp_phy_cfg
> > > sm8150_ufsphy_cfg = {
> > >         .pwrdn_ctrl             = SW_PWRDN,
> > > 
> > >         .is_dual_lane_phy       = true,
> > > -       .no_pcs_sw_reset        = true,
> > >  };
> > > 
> > >  static void qcom_qmp_phy_configure(void __iomem *base,
> > > @@ -1475,6 +1475,9 @@ static int qcom_qmp_phy_com_init(struct
> > > qmp_phy *qphy)
> > >                              SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> > >         }
> > > 
> > > +       if ((cfg->type == PHY_TYPE_UFS) && (!cfg->no_pcs_sw_reset))
> > > +               qphy_setbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> > 
> > Well am not sure if no_pcs_sw_reset would do this and side effect on
> > other phys (somehow older ones dont seem to need this). That was the
> > reason for a new flag and to be used for specific instances
> > 
> > Thanks
> 
> Hi Vinod,
> 
> That is why I added the check as cfg->type == PHY_TYPE_UFS, meaning this
> change will only apply to UFS.
> FYI, start from 8150(include 8150), QPHY_SW_RESET is present in PHY's
> PCS register. no_pcs_sw_reset = TRUE should only be given to 845 and older
> targets, like 8998, because they don't have this QPHY_SW_RESET in PHY's
> register per their design, that's why they leverage the reset control
> provided by UFS controller.

I have removed no_pcs_sw_reset and tested.

Well as you said even with UFS we have variations between various chips,
so I thought leaving it separate might be better than creating a chance
of regression on older platforms!

Moreover, are we sure that the reset wont be there for other qmp phy's
in future other than UFS...

Thanks
-- 
~Vinod
