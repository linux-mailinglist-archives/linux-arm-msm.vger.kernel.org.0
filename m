Return-Path: <linux-arm-msm+bounces-144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FBA7E5027
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44CB9281316
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 05:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEE0CA4C;
	Wed,  8 Nov 2023 05:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ul1KmJ3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DA0C8D2
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 05:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE29C433C7;
	Wed,  8 Nov 2023 05:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699422593;
	bh=fHKO9sEkg99Vd/BalQyPm6GJ2pRcwoiVjJTRjG7+h0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ul1KmJ3YkfkSKre+fQiHXUzMA3EDFM3nH+mvnInuqrhkvI7ofaPijW4VH+oO3YZc5
	 QPM2CwX2PL0Y7jZMubjo1caUdqaEZCxUmYXz2EFNlkKQvbnyLI7JkWHbeRBNX0v2X3
	 JqY9kgvEiPQERaxdm8xc6k/mVzh2O2SoXF8LodVs6aGB23xVdS9cZxTPuq01SVh9VO
	 zKb0afMgkC8nW2sCTy5y0a4zIRMZvszvecvvxJj3eyZgenaOk448NgrYVSg/eVfksL
	 YxQ9y69nh20k0wd682binOKOrHQcwt61hY7ZACkd3fV+Y7gUmRFEHE8RX4oSAt+qOV
	 AQC7/QWVuOS0A==
Date: Wed, 8 Nov 2023 11:19:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Can Guo <cang@qti.qualcomm.com>, quic_cang@quicinc.com,
	bvanassche@acm.org, stanley.chu@mediatek.com,
	adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed
 Gear 5 support for SM8550
Message-ID: <20231108054942.GF3296@thinkpad>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-7-git-send-email-cang@qti.qualcomm.com>
 <CAA8EJpqEkkEoQ9vncNJU1t=mKbvBXKk1FUxnmGTE0Q++sf=oXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpqEkkEoQ9vncNJU1t=mKbvBXKk1FUxnmGTE0Q++sf=oXA@mail.gmail.com>

On Tue, Nov 07, 2023 at 03:18:09PM +0200, Dmitry Baryshkov wrote:
> On Tue, 7 Nov 2023 at 06:47, Can Guo <cang@qti.qualcomm.com> wrote:
> >
> > From: Can Guo <quic_cang@quicinc.com>
> >
> > On SM8550, two sets of UFS PHY settings are provided, one set is to support
> > HS-G5, another set is to support HS-G4 and lower gears. The two sets of PHY
> > settings are programming different values to different registers, mixing
> > the two sets and/or overwriting one set with another set is definitely not
> > blessed by UFS PHY designers. In order to add HS-G5 support for SM8550, we
> > need to split the two sets into their dedicated tables, and leave only the
> > common settings in the .tlbs. To have the PHY programmed with the correct
> > set of PHY settings, the submode passed to PHY driver must be either HS-G4
> > or HS-G5.
> >

You should also mention that this issue is also present in G4 supported targets.
And a note that it will get fixed later.

> > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
> >  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
> >  .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |  12 +++
> >  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 112 ++++++++++++++++++---
> >  4 files changed, 115 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h
> > index c23d5e4..e563af5 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h
> > @@ -18,6 +18,7 @@
> >  #define QPHY_V6_PCS_UFS_BIST_FIXED_PAT_CTRL            0x060
> >  #define QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY           0x074
> >  #define QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY           0x0bc
> > +#define QPHY_V6_PCS_UFS_RX_HS_G5_SYNC_LENGTH_CAPABILITY        0x12c
> >  #define QPHY_V6_PCS_UFS_DEBUG_BUS_CLKSEL               0x158
> >  #define QPHY_V6_PCS_UFS_LINECFG_DISABLE                        0x17c
> >  #define QPHY_V6_PCS_UFS_RX_MIN_HIBERN8_TIME            0x184
> > @@ -27,5 +28,6 @@
> >  #define QPHY_V6_PCS_UFS_READY_STATUS                   0x1a8
> >  #define QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1              0x1f4
> >  #define QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1               0x1fc
> > +#define QPHY_V6_PCS_UFS_RX_HSG5_SYNC_WAIT_TIME         0x220
> >
> >  #endif
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
> > index f420f8f..ef392ce 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
> > @@ -56,6 +56,8 @@
> >  #define QSERDES_V6_COM_SYS_CLK_CTRL                            0xe4
> >  #define QSERDES_V6_COM_SYSCLK_BUF_ENABLE                       0xe8
> >  #define QSERDES_V6_COM_PLL_IVCO                                        0xf4
> > +#define QSERDES_V6_COM_CMN_IETRIM                              0xfc
> > +#define QSERDES_V6_COM_CMN_IPTRIM                              0x100
> >  #define QSERDES_V6_COM_SYSCLK_EN_SEL                           0x110
> >  #define QSERDES_V6_COM_RESETSM_CNTRL                           0x118
> >  #define QSERDES_V6_COM_LOCK_CMP_EN                             0x120
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
> > index 15bcb4b..48f31c8 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
> > @@ -10,10 +10,20 @@
> >  #define QSERDES_UFS_V6_TX_RES_CODE_LANE_RX                     0x2c
> >  #define QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_TX              0x30
> >  #define QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_RX              0x34
> > +#define QSERDES_UFS_V6_TX_LANE_MODE_1                          0x7c
> > +#define QSERDES_UFS_V6_TX_FR_DCC_CTRL                          0x108
> >
> >  #define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE2          0x08
> >  #define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE4          0x10
> > +#define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_SO_GAIN_RATE4          0x24
> > +#define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4       0x54
> > +#define QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE2                   0xd4
> > +#define QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE4                   0xdc
> > +#define QSERDES_UFS_V6_RX_UCDR_SO_GAIN_RATE4                   0xf0
> > +#define QSERDES_UFS_V6_RX_UCDR_PI_CONTROLS                     0xf4
> >  #define QSERDES_UFS_V6_RX_VGA_CAL_MAN_VAL                      0x178
> > +#define QSERDES_UFS_V6_RX_EQ_OFFSET_ADAPTOR_CNTRL1             0x1bc
> > +#define QSERDES_UFS_V6_RX_OFFSET_ADAPTOR_CNTRL3                        0x1c4
> >  #define QSERDES_UFS_V6_RX_MODE_RATE_0_1_B0                     0x208
> >  #define QSERDES_UFS_V6_RX_MODE_RATE_0_1_B1                     0x20c
> >  #define QSERDES_UFS_V6_RX_MODE_RATE_0_1_B3                     0x214
> > @@ -25,6 +35,8 @@
> >  #define QSERDES_UFS_V6_RX_MODE_RATE3_B5                                0x264
> >  #define QSERDES_UFS_V6_RX_MODE_RATE3_B8                                0x270
> >  #define QSERDES_UFS_V6_RX_MODE_RATE4_B3                                0x280
> > +#define QSERDES_UFS_V6_RX_MODE_RATE4_B4                                0x284
> >  #define QSERDES_UFS_V6_RX_MODE_RATE4_B6                                0x28c
> > +#define QSERDES_UFS_V6_RX_DLL0_FTUNE_CTRL                      0x2f8
> >
> >  #endif
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > index 3927eba..e0a01497 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > @@ -649,32 +649,51 @@ static const struct qmp_phy_init_tbl sm8550_ufsphy_serdes[] = {
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x01),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x0f),
> > +
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_INITVAL2, 0x00),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x0a),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x7f),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x06),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x4c),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_hs_b_serdes[] = {
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x44),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_g4_serdes[] = {
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x0f),
> >         QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x0a),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x99),
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x07),
> 
> Aside from moving these registers to the HS_G4 table, you are also
> changing these registers. It makes me think that there was an error in
> the original programming sequence.
> If that is correct, could you please split the patch into two pieces:
> - Fix programming sequence (add proper Fixes tags)
> - Split G4 and G5 tables.

Ack

> 
> > +
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x4c),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x0a),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x14),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x99),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x07),
> 
> I see all the MODE1 registers being only present in G4 and G5 tables.
> Should they be programmed for the modes lower than G4?
> 

We use G4 table for all the modes <= G4.

> > +};
> > +
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_g5_serdes[] = {
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x1f),
> > +
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IETRIM, 0x1b),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x1c),
> > +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x06),
> >  };
> >
> >  static const struct qmp_phy_init_tbl sm8550_ufsphy_tx[] = {
> > -       QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0x05),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_LANE_MODE_1, 0x05),
> >         QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
> >  };
> >
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_g4_tx[] = {
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_FR_DCC_CTRL, 0x4c),
> > +};
> > +
> >  static const struct qmp_phy_init_tbl sm8550_ufsphy_rx[] = {
> > -       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE2, 0x0c),
> > -       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x0f),
> > -       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_VGA_CAL_MAN_VAL, 0x0e),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE2, 0x0c),
> >
> >         QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B0, 0xc2),
> >         QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B1, 0xc2),
> > @@ -690,14 +709,46 @@ static const struct qmp_phy_init_tbl sm8550_ufsphy_rx[] = {
> >         QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE3_B8, 0x02),
> >  };
> >
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_g4_rx[] = {
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_VGA_CAL_MAN_VAL, 0x0e),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_g5_rx[] = {
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE4, 0x0c),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_SO_GAIN_RATE4, 0x04),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_PI_CONTROLS, 0x07),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_VGA_CAL_MAN_VAL, 0x08),
> > +
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE4_B3, 0xb9),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE4_B4, 0x4f),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE4_B6, 0xff),
> > +       QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_DLL0_FTUNE_CTRL, 0x30),
> > +};
> > +
> >  static const struct qmp_phy_init_tbl sm8550_ufsphy_pcs[] = {
> >         QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_SIGDET_CTRL2, 0x69),
> >         QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
> >         QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
> > -       QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x2b),
> >         QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
> >  };
> >
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_g4_pcs[] = {
> > +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x2b),
> > +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
> > +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl sm8550_ufsphy_g5_pcs[] = {
> > +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x33),
> > +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HS_G5_SYNC_LENGTH_CAPABILITY, 0x4f),
> > +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSG5_SYNC_WAIT_TIME, 0x9e),
> > +};
> > +
> >  struct qmp_ufs_offsets {
> >         u16 serdes;
> >         u16 pcs;
> > @@ -731,6 +782,8 @@ struct qmp_phy_cfg {
> >         const struct qmp_phy_cfg_tbls tbls_hs_b;
> >         /* Additional sequence for HS G4 */
> >         const struct qmp_phy_cfg_tbls tbls_hs_g4;
> > +       /* Additional sequence for HS G4 */

HS G5

> > +       const struct qmp_phy_cfg_tbls tbls_hs_g5;
> >
> >         /* clock ids to be requested */
> >         const char * const *clk_list;
> > @@ -1157,6 +1210,28 @@ static const struct qmp_phy_cfg sm8550_ufsphy_cfg = {
> >                 .pcs            = sm8550_ufsphy_pcs,
> >                 .pcs_num        = ARRAY_SIZE(sm8550_ufsphy_pcs),
> >         },
> > +       .tbls_hs_b = {
> > +               .serdes         = sm8550_ufsphy_hs_b_serdes,
> > +               .serdes_num     = ARRAY_SIZE(sm8550_ufsphy_hs_b_serdes),
> > +       },
> > +       .tbls_hs_g4 = {
> > +               .serdes         = sm8550_ufsphy_g4_serdes,
> > +               .serdes_num     = ARRAY_SIZE(sm8550_ufsphy_g4_serdes),
> > +               .tx             = sm8550_ufsphy_g4_tx,
> > +               .tx_num         = ARRAY_SIZE(sm8550_ufsphy_g4_tx),
> > +               .rx             = sm8550_ufsphy_g4_rx,
> > +               .rx_num         = ARRAY_SIZE(sm8550_ufsphy_g4_rx),
> > +               .pcs            = sm8550_ufsphy_g4_pcs,
> > +               .pcs_num        = ARRAY_SIZE(sm8550_ufsphy_g4_pcs),
> > +       },
> > +       .tbls_hs_g5 = {
> > +               .serdes         = sm8550_ufsphy_g5_serdes,
> > +               .serdes_num     = ARRAY_SIZE(sm8550_ufsphy_g5_serdes),
> > +               .rx             = sm8550_ufsphy_g5_rx,
> > +               .rx_num         = ARRAY_SIZE(sm8550_ufsphy_g5_rx),
> > +               .pcs            = sm8550_ufsphy_g5_pcs,
> > +               .pcs_num        = ARRAY_SIZE(sm8550_ufsphy_g5_pcs),
> > +       },
> >         .clk_list               = sdm845_ufs_phy_clk_l,
> >         .num_clks               = ARRAY_SIZE(sdm845_ufs_phy_clk_l),
> >         .vreg_list              = qmp_phy_vreg_l,
> > @@ -1222,14 +1297,25 @@ static void qmp_ufs_pcs_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls
> >  static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
> >  {
> >         qmp_ufs_serdes_init(qmp, &cfg->tbls);
> > +       if (qmp->submode == UFS_HS_G4)
> > +               qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_g4);
> > +       else if (qmp->submode == UFS_HS_G5)
> > +               qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_g5);
> > +

Should we program submode sequence after HS_B?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

