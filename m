Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5274F125B64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 07:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbfLSGXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 01:23:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:59430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSGXk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 01:23:40 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC0DE21582;
        Thu, 19 Dec 2019 06:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576736620;
        bh=rKj8RMsJ8vQhtEuvJviwPymQ41yOc6F8ub3//9liH+4=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=BF5dWQqvOaPrEQDIdsBR21PtRzBFZjQy+KDChjkSbf1XVJ+nqKjRY1XLJRYODqt1m
         aHHxbYGhdC3+o5glOVfAsXMWMMytnOULk6J1hDtAIFneML4Abp9JBWUsVu81TlVK8C
         BK+EVSOJal/H8Vg/4vgWhnxu/cnDfbTAc7iIrw2E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191125135910.679310-8-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org> <20191125135910.679310-8-niklas.cassel@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent
From:   Stephen Boyd <sboyd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:23:39 -0800
Message-Id: <20191219062339.DC0DE21582@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Niklas Cassel (2019-11-25 05:59:09)
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8=
916.c
> index 46061b3d230e..bb91644edc00 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -51,6 +51,19 @@ static int qcom_apcs_msm8916_clk_probe(struct platform=
_device *pdev)
>         struct clk_init_data init =3D { };
>         int ret =3D -ENODEV;
> =20
> +       /*
> +        * This driver is defined by the devicetree binding
> +        * Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-globa=
l.txt,
> +        * however, this driver is registered as a platform device by
> +        * qcom-apcs-ipc-mailbox.c. Because of this, when this driver
> +        * uses dev_get_regmap() and devm_clk_get(), it has to send the p=
arent
> +        * device as argument.
> +        * When registering with the clock framework, we cannot use this =
trick,
> +        * since the clock framework always looks at dev->of_node when it=
 tries
> +        * to find parent clock names using clk_parent_data.
> +        */
> +       dev->of_node =3D parent->of_node;

This is odd. The clks could be registered with of_clk_hw_register() but
then we lose the device provider information. Maybe we should search up
one level to the parent node and if that has a DT node but the
clk controller device doesn't we should use that instead?

----8<-----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b68e200829f2..c8745c415c04 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3669,7 +3669,7 @@ __clk_register(struct device *dev, struct device_node=
 *np, struct clk_hw *hw)
 	if (dev && pm_runtime_enabled(dev))
 		core->rpm_enabled =3D true;
 	core->dev =3D dev;
-	core->of_node =3D np;
+	core->of_node =3D np ? : dev_of_node(dev->parent);
 	if (dev && dev->driver)
 		core->owner =3D dev->driver->owner;
 	core->hw =3D hw;
