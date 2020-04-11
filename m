Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB751A4D73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 04:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgDKCSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 22:18:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:46580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbgDKCSM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 22:18:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAF3420673;
        Sat, 11 Apr 2020 02:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586571492;
        bh=F4poob0WyBleUatMOfOp9hcblndSqlr86sesj82DdD4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oYRObu+1pwNiOa/f2i/3dAsW18Y24DF6MvRStKCVRUGG7ZbBUVIUz7DgfcJhksbvF
         4QCm+JQfSh7PN7mhJBcSvo+mSjxHtQ5i5g3LBN6gfGRKPIlPh33WvFFLHQvjsADCh4
         jPnE9Eo1bTjn2Q2Q/rW4k5KO9RM/oo+6R64HHen0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586298209-4589-3-git-send-email-wcheng@codeaurora.org>
References: <1586298209-4589-1-git-send-email-wcheng@codeaurora.org> <1586298209-4589-3-git-send-email-wcheng@codeaurora.org>
Subject: Re: [PATCH v3 2/4] phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org, Wesley Cheng <wcheng@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Fri, 10 Apr 2020 19:18:11 -0700
Message-ID: <158657149111.199533.2451403004745553390@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wesley Cheng (2020-04-07 15:23:27)
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index e46824d..3158c14 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -85,6 +85,16 @@ config PHY_QCOM_USB_HS
>           Support for the USB high-speed ULPI compliant phy on Qualcomm
>           chipsets.
> =20
> +config PHY_QCOM_USB_SNPS_HS_7NM
> +       tristate "Qualcomm 7nm USB HS PHY module"
> +       depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +       select GENERIC_PHY
> +       help
> +         Enable support for the USB high-speed SNPS phy on Qualcomm 7nm
> +         chipsets.  This PHY has differences in the register map compared
> +         to the 28nm variant.  The PHY is paired with a Synopsys DWC3 USB
> +         controller on MSM SOCs.

s/MSM/Qualcomm/?

> +
>  config PHY_QCOM_USB_HSIC
>         tristate "Qualcomm USB HSIC ULPI PHY module"
>         depends on USB_ULPI_BUS
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-7nm.c b/drivers/phy/qualc=
omm/phy-qcom-snps-7nm.c
> new file mode 100644
> index 0000000..00a46cd
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-7nm.c
> @@ -0,0 +1,294 @@
[...]
> +
> +/**
> + * struct qcom_snps_hsphy - structure holding snps hs phy attributes

snps hs phy attributes

structure and holding are redundant.

> + *
> + * @phy: generic phy
> + * @base: iomapped memory space for qubs2 phy
> + *
> + * @cfg_ahb_clk: AHB2PHY interface clock
> + * @ref_clk: phy reference clock
> + * @iface_clk: phy interface clock
> + * @phy_reset: phy reset control
> + * @vregs: regulator supplies bulk data
> +
> + * @phy_initialized: if PHY has been initialized correctly

Please drop space between members in the kernel-doc.

> + *
> + */
> +struct qcom_snps_hsphy {
> +       struct phy *phy;
> +       void __iomem *base;
> +
> +       struct clk *cfg_ahb_clk;
> +       struct clk *ref_clk;
> +       struct reset_control *phy_reset;
> +       struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
> +
> +       bool phy_initialized;
> +};
> +
> +static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 of=
fset,
> +                                   u32 mask, u32 val)
> +{
> +       u32 reg;
> +
> +       reg =3D readl(base + offset);
> +       reg &=3D ~mask;
> +       reg |=3D val & mask;
> +       writel(reg, base + offset);

Make these relaxed?

> +
> +       /* Ensure above write is completed */
> +       readl(base + offset);

And this one too?

> +}
> +
> +static int qcom_snps_hsphy_init(struct phy *phy)
> +{
> +       struct qcom_snps_hsphy *hsphy =3D phy_get_drvdata(phy);
> +       int ret;
> +
> +       dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
> +
> +       /* turn on regulator supplies */

These comments don't tell us anything besides what the code is doing so
they don't seem useful.

> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vr=
egs);
> +       if (ret)
> +               return ret;
> +
> +       /* enable ahb interface clock to program phy */
> +       ret =3D clk_prepare_enable(hsphy->cfg_ahb_clk);
> +       if (ret) {
> +               dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n"=
, ret);
> +               goto poweroff_phy;
> +       }
> +
> +       /* Perform phy reset */
> +       ret =3D reset_control_assert(hsphy->phy_reset);
> +       if (ret) {
> +               dev_err(&phy->dev, "failed to assert phy_reset, %d\n", re=
t);
> +               goto disable_ahb_clk;
> +       }
> +
> +       /* 100 us delay to keep PHY in reset mode */
> +       usleep_range(100, 150);
> +
> +       ret =3D reset_control_deassert(hsphy->phy_reset);
> +       if (ret) {
> +               dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n",=
 ret);
> +               goto disable_ahb_clk;
> +       }
> +
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> +                                                       UTMI_PHY_CMN_CTRL=
_OVERRIDE_EN,
> +                                                       UTMI_PHY_CMN_CTRL=
_OVERRIDE_EN);
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTR=
L5,
> +                                                       POR, POR);
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_C=
TRL_COMMON0,
> +                                                       FSEL_MASK, 0);
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_C=
TRL_COMMON1,
> +                                       PLLBTUNE, PLLBTUNE);
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_C=
TRL,
> +                                       REFCLK_SEL_DEFAULT, REFCLK_SEL_MA=
SK);
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_C=
TRL_COMMON1,
> +                                       VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_C=
TRL1,
> +                                       VBUSVLDEXT0, VBUSVLDEXT0);
> +
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_C=
TRL_COMMON2,
> +                                       VREGBYPASS, VREGBYPASS);
> +
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_C=
TRL2,
> +                                       USB2_SUSPEND_N_SEL | USB2_SUSPEND=
_N,
> +                                       USB2_SUSPEND_N_SEL | USB2_SUSPEND=
_N);
> +
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTR=
L0,
> +                                       SLEEPM, SLEEPM);
> +
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTR=
L5,
> +                                       POR, 0);
> +
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_C=
TRL2,
> +                                       USB2_SUSPEND_N_SEL, 0);
> +
> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> +                                       UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
> +
> +       hsphy->phy_initialized =3D true;
> +
> +       return 0;
> +
> +disable_ahb_clk:
> +       clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +poweroff_phy:
> +       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +
> +       return ret;
> +}
> +
> +static int qcom_snps_hsphy_exit(struct phy *phy)
> +{
> +       struct qcom_snps_hsphy *hsphy =3D phy_get_drvdata(phy);
> +
> +       reset_control_assert(hsphy->phy_reset);
> +       clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +       hsphy->phy_initialized =3D false;
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops qcom_snps_hsphy_gen_ops =3D {
> +       .init           =3D qcom_snps_hsphy_init,
> +       .exit           =3D qcom_snps_hsphy_exit,
> +       .owner          =3D THIS_MODULE,
> +};
> +
> +static const struct of_device_id qcom_snps_hsphy_of_match_table[] =3D {
> +       {
> +               .compatible     =3D "qcom,sm8150-usb-hs-phy",
> +       },
> +       {
> +               .compatible     =3D "qcom,usb-snps-hs-7nm-phy",
> +       },
> +       { },

Can this be on one line?

          { .compatible     =3D "qcom,sm8150-usb-hs-phy", },
          { .compatible     =3D "qcom,usb-snps-hs-7nm-phy", },
          { }

Also drop comma on the last element so nothing can follow without
causing compile error.

> +};
> +MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
> +
> +static int qcom_snps_hsphy_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct qcom_snps_hsphy *hsphy;
> +       struct phy_provider *phy_provider;
> +       struct phy *generic_phy;
> +       struct resource *res;
> +       int ret, i;
> +       int num;
> +
> +       hsphy =3D devm_kzalloc(dev, sizeof(*hsphy), GFP_KERNEL);
> +       if (!hsphy)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       hsphy->base =3D devm_ioremap_resource(dev, res);

devm_platform_ioremap_resource()?

> +       if (IS_ERR(hsphy->base))
> +               return PTR_ERR(hsphy->base);
> +
> +       hsphy->ref_clk =3D devm_clk_get(dev, "ref");
> +       if (IS_ERR(hsphy->ref_clk)) {
> +               ret =3D PTR_ERR(hsphy->ref_clk);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "failed to get ref clk, %d\n", ret);
> +               return ret;
> +       }
> +
> +       hsphy->phy_reset =3D devm_reset_control_get_exclusive(&pdev->dev,=
 NULL);
> +       if (IS_ERR(hsphy->phy_reset)) {
> +               dev_err(dev, "failed to get phy core reset\n");
> +               return PTR_ERR(hsphy->phy_reset);
> +       }
> +
> +       num =3D ARRAY_SIZE(hsphy->vregs);
> +       for (i =3D 0; i < num; i++)
> +               hsphy->vregs[i].supply =3D qcom_snps_hsphy_vreg_names[i];
> +
> +       ret =3D devm_regulator_bulk_get(dev, num, hsphy->vregs);
> +       if (ret) {
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "failed to get regulator supplies: %=
d\n",
> +                               ret);
> +               return ret;
> +       }
> +
> +       generic_phy =3D devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_o=
ps);
> +       if (IS_ERR(generic_phy)) {
> +               ret =3D PTR_ERR(generic_phy);
> +               dev_err(dev, "failed to create phy, %d\n", ret);
> +               return ret;
> +       }
> +       hsphy->phy =3D generic_phy;
> +
> +       dev_set_drvdata(dev, hsphy);
> +       phy_set_drvdata(generic_phy, hsphy);
> +
> +       phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple=
_xlate);
> +       if (!IS_ERR(phy_provider))
> +               dev_info(dev, "Registered Qcom-SNPS HS phy\n");

dev_dbg()? Or just remove it?

> +
> +       return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static struct platform_driver qcom_snps_hsphy_driver =3D {
> +       .probe          =3D qcom_snps_hsphy_probe,
> +       .driver =3D {
> +               .name   =3D "qcom-snps-hs-7nm-phy",
> +               .of_match_table =3D qcom_snps_hsphy_of_match_table,
> +       },
> +};
> +
> +module_platform_driver(qcom_snps_hsphy_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm 7nm USB HS PHY driver");
