Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD9413C6F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 16:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgAOPIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 10:08:36 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51413 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgAOPIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 10:08:36 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1irkHb-0002nq-Ei; Wed, 15 Jan 2020 16:08:35 +0100
Message-ID: <840f61fac35f28bbbbeed96502c5e351f1c9fefe.camel@pengutronix.de>
Subject: Re: [PATCH 03/19] phy: qualcomm: Add Synopsys Hi-Speed USB PHY
 driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Date:   Wed, 15 Jan 2020 16:08:34 +0100
In-Reply-To: <20200115141333.1222676-4-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
         <20200115141333.1222676-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Wed, 2020-01-15 at 14:13 +0000, Bryan O'Donoghue wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> Adds Qualcomm QCS404 Hi-Speed USB PHY driver support. This PHY is usually
> is usually paired with Synopsys DWC3 USB controllers on Qualcomm SoCs.
> 
> [bod: Updated qcom_snps_hsphy_set_mode to match new method signature
>       Added disjunct on mode > 0
>       Removed regulator_set_voltage() in favour of setting floor in dts
>       Removed 'snps' and '28nm' from driver name]
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/qualcomm/Kconfig                  |  10 +
>  drivers/phy/qualcomm/Makefile                 |   1 +
>  drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c | 415 ++++++++++++++++++
>  3 files changed, 426 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c
> 
[...]
> diff --git a/drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c
> new file mode 100644
> index 000000000000..c09b786592b1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c
> @@ -0,0 +1,415 @@
[...]
> +static int qcom_snps_hsphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +	struct hsphy_priv *priv;
> +	struct phy *phy;
> +	int ret;
> +	int i;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->num_clks = ARRAY_SIZE(qcom_snps_hsphy_clks);
> +	priv->clks = devm_kcalloc(dev, priv->num_clks, sizeof(*priv->clks),
> +				  GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->num_clks; i++)
> +		priv->clks[i].id = qcom_snps_hsphy_clks[i];
> +
> +	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
> +	if (ret)
> +		return ret;
> +
> +	priv->phy_reset = devm_reset_control_get(dev, "phy");

Please use devm_reset_control_get_exclusive(). I'd like drivers to
explicitly state whether they request exclusive or shared control.

> +	if (IS_ERR(priv->phy_reset))
> +		return PTR_ERR(priv->phy_reset);
> +
> +	priv->por_reset = devm_reset_control_get(dev, "por");

Same here.

regards
Philipp

