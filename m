Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E4F276475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 01:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIWX22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 19:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726466AbgIWX2Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 19:28:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8F2620BED;
        Wed, 23 Sep 2020 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600903703;
        bh=jD9FzPY9npLBXMykAm0YVS2Sn9WihPKnudR+sOe4IzY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F/ThN3TDt9u2tC6CIY6JBC9Ziz663ISP5KiCPLR6bwB5nHubXblTyllGdJFHsSahx
         /SzDx6/4Nr9hv14n8qhZQTDqha+RgmRzh+mjkiPyTR9udIJgyyxoqFEedgG4Z2AEDa
         5luFdzuKS6Or7kkTZfT3SpWu5aM08MMna/EiaJfc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a8713637-d240-d22d-02a7-f15080620467@linaro.org>
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org> <20200917132850.7730-4-srinivas.kandagatla@linaro.org> <160080010215.310579.4526434246523292987@swboyd.mtv.corp.google.com> <a8713637-d240-d22d-02a7-f15080620467@linaro.org>
Subject: Re: [PATCH 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Wed, 23 Sep 2020 16:28:22 -0700
Message-ID: <160090370240.310579.7670305169509496614@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2020-09-22 14:45:07)
> Thanks Stephen for review,
>=20
> On 22/09/2020 19:41, Stephen Boyd wrote:
> > Quoting Srinivas Kandagatla (2020-09-17 06:28:49)
> >> diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lp=
ass-gfm-sm8250.c
> >> new file mode 100644
> >> index 000000000000..2d5c41ae4969
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
> >> @@ -0,0 +1,235 @@
[...]
> >> +};
> >> +
> >> +static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
> >> +{
> >> +       const struct lpass_gfm_data *data;
> >> +       struct device *dev =3D &pdev->dev;
> >> +       struct resource *res;
> >> +       struct clk_gfm *gfm;
> >> +       struct lpass_gfm *cc;
> >> +       int err, i;
> >> +
> >> +       cc =3D devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> >> +       if (!cc)
> >> +               return -ENOMEM;
> >> +
> >> +       cc->core_vote =3D devm_clk_get(&pdev->dev, "core");
> >> +       if (IS_ERR(cc->core_vote)) {
> >> +               dev_dbg(dev, "Failed to get lpass core clk\n");
> >> +               return PTR_ERR(cc->core_vote);
> >> +       }
> >=20
> > Can this use the pm_clk stuff?
>=20
> you mean add runtime pm support or something else?
>=20
> I can give it a go and see!
>=20

Yes use the runtime PM support and pm_clk APIs. There are some examples
in this directory already.

>=20
> >=20
> >> +
> >> +       data =3D of_device_get_match_data(dev);
> >=20
> > What if data is NULL?
> It should not be here if there is no match of compatible string, so data =

> should not be NULL!

Ok sure but it always makes me feel better if we check for a valid
pointer with this API.
