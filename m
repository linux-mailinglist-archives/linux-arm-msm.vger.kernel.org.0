Return-Path: <linux-arm-msm+bounces-5902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68481CE95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 19:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26939B23D0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 18:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4F02C1AF;
	Fri, 22 Dec 2023 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2kcoZ6l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB02C1A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3369339f646so877123f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 10:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703271066; x=1703875866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zmNYptmiNFgpxBzvYnxrc0XU+bc0BJsRiSAZc0SdXgA=;
        b=P2kcoZ6lOBEHYlYaz1JpfMp81zlNzwaQ0ullYSfXzFdJCfJBkMUyzwqlbCiucg5IJ4
         xW3t6yWwqRNr+5G97mnCaEPEXRrPtfkr3nuSuEU8CdTIem3PviDqUQTFw4vluZSfFgyc
         Aj1Y+RAtjgCmnCGGoNd0lIc76EiRKLR7veAa2QO856VFtaSKrzs4PJOdArL/nmi5p9zS
         AWB51+/cVal2ea6ZvufE247dEV17NUxlGZyndYgeROTRDf28lKDezPkU8COSaPSjSb/c
         qrSkde/tWs32BfhrzxKBmGOEyQpZgkwvcmdQysCpZ5HnYKLguAqCqcvMrwNlq+VJFn7G
         n8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703271066; x=1703875866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmNYptmiNFgpxBzvYnxrc0XU+bc0BJsRiSAZc0SdXgA=;
        b=jS8lUycS2O+Gkm5YXlKSoK1Xfyz9eZaGSCh44r5F7bx0Ygv8WtDi7dRTfAZm/c94KK
         on+OYPJnDCbtDlR9kfQfIbN1YEMf8ENdF4ItnYWfOMmAVyLuWSrv1hjId30f4RyvmGf1
         shGcwSpONwSgmm36Hp84YAeu9t4JlaGXYnmzqvFvH2eC32ZaOLUmyYgZxa8jRWRwlNqd
         1IAf1IwOigeR4zUGqCYkfLDJVfSyNEhhHpRX1p+TcsdlByYblou3hTgnATQfEA+sXaGD
         XyTkO4i1ZIEq07CFhenTbD6wXu1FALXLRT1kvvm2B8Lr5RyM3K1q5n1Sr+f6xVrJ+imx
         YlEQ==
X-Gm-Message-State: AOJu0Yy+ujXzHng2rPtHPrcJoRFgNf5Oy19HsIfJE/SDDM98CV0WBHYX
	Uia4/y9Z7znEAUXA3iRPmJG/VMyRmJUptA==
X-Google-Smtp-Source: AGHT+IHkNIBMMIMzqvss7oqLTUXip7ODOxwR9MYmqioot+d0syCBrOa1uMGNGbBltB//9RjuwP7x8g==
X-Received: by 2002:a5d:654d:0:b0:336:5dfe:9f26 with SMTP id z13-20020a5d654d000000b003365dfe9f26mr1244060wrv.49.1703271066240;
        Fri, 22 Dec 2023 10:51:06 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id f18-20020a5d50d2000000b003366827c9c6sm4930611wrt.2.2023.12.22.10.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 10:51:05 -0800 (PST)
Date: Fri, 22 Dec 2023 20:51:04 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qcom: edp: Add set_mode op for configuring
 eDP/DP submode
Message-ID: <ZYXamK7y2qbM/GaJ@linaro.org>
References: <20231222-x1e80100-phy-edp-compatible-refactor-v2-0-ab5786c2359f@linaro.org>
 <20231222-x1e80100-phy-edp-compatible-refactor-v2-2-ab5786c2359f@linaro.org>
 <CAA8EJpqPNzvA0yTqqSuXGHKxXoofJUQpAiHazoULru8A85YXHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqPNzvA0yTqqSuXGHKxXoofJUQpAiHazoULru8A85YXHA@mail.gmail.com>

On 23-12-22 16:45:47, Dmitry Baryshkov wrote:
> On Fri, 22 Dec 2023 at 15:01, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Future platforms should not use different compatibles to differentiate
> > between eDP and DP mode. Instead, they should use a single compatible as the
> > IP block is the same. It will be the job of the controller to set the submode
> > of the PHY accordingly. Rework the device match config data so that it only
> > keeps the different knobs rather than swing and pre-emphasis tables.
> >
> > The existing platforms will remain with separate compatibles for each mode.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++++++++---------
> >  1 file changed, 69 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index 8e5078304646..efd7015c73ec 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> > +#include <linux/phy/phy-dp.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset.h>
> > @@ -68,19 +69,21 @@
> >
> >  #define TXn_TRAN_DRVR_EMP_EN                    0x0078
> >
> > -struct qcom_edp_cfg {
> > -       bool is_dp;
> > -
> > -       /* DP PHY swing and pre_emphasis tables */
> > +struct qcom_edp_swing_pre_emph_cfg {
> >         const u8 (*swing_hbr_rbr)[4][4];
> >         const u8 (*swing_hbr3_hbr2)[4][4];
> >         const u8 (*pre_emphasis_hbr_rbr)[4][4];
> >         const u8 (*pre_emphasis_hbr3_hbr2)[4][4];
> >  };
> >
> > +struct qcom_edp_phy_cfg {
> > +       bool is_edp;
> > +       bool needs_swing_pre_emph_cfg;
> 
> I think something like needs_voltage_config sounds simpler and prettier.

Sure. Will do that in the next version.

> 
> > +};
> > +
> >  struct qcom_edp {
> >         struct device *dev;
> > -       const struct qcom_edp_cfg *cfg;
> > +       const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> >
> >         struct phy *phy;
> >
> > @@ -96,6 +99,8 @@ struct qcom_edp {
> >
> >         struct clk_bulk_data clks[2];
> >         struct regulator_bulk_data supplies[2];
> > +
> > +       bool is_edp;
> >  };
> >
> >  static const u8 dp_swing_hbr_rbr[4][4] = {
> > @@ -126,8 +131,7 @@ static const u8 dp_pre_emp_hbr2_hbr3[4][4] = {
> >         { 0x04, 0xff, 0xff, 0xff }
> >  };
> >
> > -static const struct qcom_edp_cfg dp_phy_cfg = {
> > -       .is_dp = true,
> > +static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
> >         .swing_hbr_rbr = &dp_swing_hbr_rbr,
> >         .swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
> >         .pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr,
> > @@ -162,18 +166,29 @@ static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {
> >         { 0x00, 0xff, 0xff, 0xff }
> >  };
> >
> > -static const struct qcom_edp_cfg edp_phy_cfg = {
> > -       .is_dp = false,
> > +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
> >         .swing_hbr_rbr = &edp_swing_hbr_rbr,
> >         .swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
> >         .pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
> >         .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
> >  };
> >
> > +static struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
> > +};
> > +
> > +static struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> > +       .needs_swing_pre_emph_cfg = true,
> > +};
> > +
> > +static struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
> > +       .is_edp = true,
> > +       .needs_swing_pre_emph_cfg = true,
> > +};
> > +
> >  static int qcom_edp_phy_init(struct phy *phy)
> >  {
> >         struct qcom_edp *edp = phy_get_drvdata(phy);
> > -       const struct qcom_edp_cfg *cfg = edp->cfg;
> > +       const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->swing_pre_emph_cfg;
> >         int ret;
> >         u8 cfg8;
> >
> > @@ -200,7 +215,7 @@ static int qcom_edp_phy_init(struct phy *phy)
> >                DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> >                edp->edp + DP_PHY_PD_CTL);
> >
> > -       if (cfg && cfg->is_dp)
> > +       if (cfg && !edp->is_edp)
> >                 cfg8 = 0xb7;
> >         else
> >                 cfg8 = 0x37;
> > @@ -234,7 +249,7 @@ static int qcom_edp_phy_init(struct phy *phy)
> >
> >  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
> >  {
> > -       const struct qcom_edp_cfg *cfg = edp->cfg;
> > +       const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->swing_pre_emph_cfg;
> >         unsigned int v_level = 0;
> >         unsigned int p_level = 0;
> >         u8 ldo_config;
> > @@ -261,7 +276,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
> >         if (swing == 0xff || emph == 0xff)
> >                 return -EINVAL;
> >
> > -       ldo_config = (cfg && cfg->is_dp) ? 0x1 : 0x0;
> > +       ldo_config = edp->is_edp ? 0x0 : 0x1;
> >
> >         writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
> >         writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
> > @@ -447,10 +462,10 @@ static int qcom_edp_set_vco_div(const struct qcom_edp *edp, unsigned long *pixel
> >  static int qcom_edp_phy_power_on(struct phy *phy)
> >  {
> >         const struct qcom_edp *edp = phy_get_drvdata(phy);
> > -       const struct qcom_edp_cfg *cfg = edp->cfg;
> > +       const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->swing_pre_emph_cfg;
> >         u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
> >         unsigned long pixel_freq;
> > -       u8 ldo_config;
> > +       u8 ldo_config = 0x0;
> >         int timeout;
> >         int ret;
> >         u32 val;
> > @@ -468,7 +483,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
> >                 return timeout;
> >
> >
> > -       ldo_config = (cfg && cfg->is_dp) ? 0x1 : 0x0;
> > +       if (cfg && !edp->is_edp)
> > +               ldo_config = 0x1;
> >
> >         writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
> >         writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
> > @@ -589,6 +605,31 @@ static int qcom_edp_phy_power_off(struct phy *phy)
> >         return 0;
> >  }
> >
> > +static int qcom_edp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> > +{
> > +       struct qcom_edp *edp = phy_get_drvdata(phy);
> > +
> > +       if (mode != PHY_MODE_DP)
> > +               return -EINVAL;
> > +
> > +       switch (submode) {
> > +       case PHY_SUBMODE_DP:
> > +               edp->swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg;
> > +               edp->is_edp = false;
> > +               break;
> > +
> > +       case PHY_SUBMODE_EDP:
> > +               edp->swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg;
> 
> Won't this override the sc7280 config which doesn't set the
> .needs_swing_pre_emph_cfg?
> So even

Yeah, the way I thought about this would be that the controller won't
call phy_set_mode_ext if the node doesn't have is-edp property.

But I can see now that is sloppy. Will change this so if the legacy
platforms have the is_edp set in their device match data, it will just
check that the requested mode matches it.

> 
> > +               edp->is_edp = true;
> > +               break;
> > +
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int qcom_edp_phy_exit(struct phy *phy)
> >  {
> >         struct qcom_edp *edp = phy_get_drvdata(phy);
> > @@ -604,6 +645,7 @@ static const struct phy_ops qcom_edp_ops = {
> >         .configure      = qcom_edp_phy_configure,
> >         .power_on       = qcom_edp_phy_power_on,
> >         .power_off      = qcom_edp_phy_power_off,
> > +       .set_mode       = qcom_edp_phy_set_mode,
> >         .exit           = qcom_edp_phy_exit,
> >         .owner          = THIS_MODULE,
> >  };
> > @@ -770,6 +812,7 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
> >
> >  static int qcom_edp_phy_probe(struct platform_device *pdev)
> >  {
> > +       const struct qcom_edp_phy_cfg *cfg = of_device_get_match_data(&pdev->dev);
> >         struct phy_provider *phy_provider;
> >         struct device *dev = &pdev->dev;
> >         struct qcom_edp *edp;
> > @@ -780,7 +823,12 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
> >                 return -ENOMEM;
> >
> >         edp->dev = dev;
> > -       edp->cfg = of_device_get_match_data(&pdev->dev);
> > +       edp->is_edp = cfg->is_edp;
> > +
> > +       if (cfg->needs_swing_pre_emph_cfg)
> > +               edp->swing_pre_emph_cfg = edp->is_edp ?
> > +                                               &edp_phy_swing_pre_emph_cfg :
> > +                                               &dp_phy_swing_pre_emph_cfg;
> >
> >         edp->edp = devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(edp->edp))
> > @@ -839,10 +887,10 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
> >  }
> >
> >  static const struct of_device_id qcom_edp_phy_match_table[] = {
> > -       { .compatible = "qcom,sc7280-edp-phy" },
> > -       { .compatible = "qcom,sc8180x-edp-phy" },
> > -       { .compatible = "qcom,sc8280xp-dp-phy", .data = &dp_phy_cfg },
> > -       { .compatible = "qcom,sc8280xp-edp-phy", .data = &edp_phy_cfg },
> > +       { .compatible = "qcom,sc7280-edp-phy" , .data = &sc7280_dp_phy_cfg, },
> > +       { .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
> > +       { .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
> > +       { .compatible = "qcom,sc8280xp-edp-phy", .data = &sc8280xp_edp_phy_cfg, },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
> >
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry

