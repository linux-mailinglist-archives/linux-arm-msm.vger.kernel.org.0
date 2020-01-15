Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F7813C6F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 16:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgAOPIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 10:08:42 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55475 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgAOPIm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 10:08:42 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1irkHg-0002o3-J0; Wed, 15 Jan 2020 16:08:40 +0100
Message-ID: <09e1c98df542ea3abf636ba5c109391ff0025e2c.camel@pengutronix.de>
Subject: Re: [PATCH 05/19] phy: qualcomm: usb: Add SuperSpeed PHY driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sriharsha Allenki's <sallenki@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Date:   Wed, 15 Jan 2020 16:08:40 +0100
In-Reply-To: <20200115141333.1222676-6-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
         <20200115141333.1222676-6-bryan.odonoghue@linaro.org>
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

On Wed, 2020-01-15 at 14:13 +0000, Bryan O'Donoghue wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Controls Qualcomm's SS phy 1.0.0 implemented in the QCS404 and some
> other Qualcomm platforms.
> 
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original code.
> 
> [bod: Removed dependency on extcon.
>       Switched to gpio-usb-conn to handle VBUS On/Off
>       Switched to usb-role-switch to bind gpio-usb-conn to DWC3]
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: Sriharsha Allenki's <sallenki@codeaurora.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/qualcomm/Kconfig           |  11 ++
>  drivers/phy/qualcomm/Makefile          |   1 +
>  drivers/phy/qualcomm/phy-qcom-usb-ss.c | 246 +++++++++++++++++++++++++
>  3 files changed, 258 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c
> 
[...]
> diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
> new file mode 100644
> index 000000000000..109e455cb509
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
> @@ -0,0 +1,246 @@
[...]
> +static int qcom_ssphy_init_reset(struct ssphy_priv *priv)
> +{
> +	priv->reset_com = devm_reset_control_get_optional(priv->dev, "com");

Please use devm_reset_control_get_optional_exclusive() here ...

> +	if (IS_ERR(priv->reset_com)) {
> +		dev_err(priv->dev, "Failed to get reset control com\n");
> +		return PTR_ERR(priv->reset_com);
> +	}
> +
> +	if (priv->reset_com) {
> +		/* if reset_com is present, reset_phy is no longer optional */
> +		priv->reset_phy = devm_reset_control_get(priv->dev, "phy");

... and devm_reset_control_get_exclusive() here.

regards
Philipp

