Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2B03D7DA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhG0S3V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:29:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229797AbhG0S3U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:29:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63B0D60F91;
        Tue, 27 Jul 2021 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627410560;
        bh=kW69qJOenC5rElQMHihrVrZqhCnU210GjxXokCkSdmk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LAqB/os8Exn9dUg667Va11Lty2MpoYvptvZP2OnuiaO2J+6s7J3CR6DN2LfN5Fhfq
         1iSVJqMOscMTxvNgXXNrsoorm7/EXE3ReLMbipdIlPXDNC5wqqJVM5NopTAprdLN5D
         dAZs26eBmZuzs4zMxsChLuOz7qG6/0NoCBKKyDg+SDB++NMxitcAJ4swGwYeXX1zUV
         2lvUUfpstPQLuHtimA/0hdCbcQDIOYumJtRsy0PT0z/P/dF0unCPoB1caQGfn2GRX4
         uFZ/xHnFkOKF6RetGkVMIO8N+4PXDeUfJXPWYAKJ62qzdt9DI1RQAbWv6V6RzGVLuy
         jiTld12BngAEw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YOZ4+ptO+eQbmxal@yoga>
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org> <20210708010839.692242-2-bryan.odonoghue@linaro.org> <YOZ4+ptO+eQbmxal@yoga>
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm8250: Fix absent mmcx regulator reference
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Tue, 27 Jul 2021 11:29:19 -0700
Message-ID: <162741055915.2368309.10049224467908332702@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-07 21:03:06)
> On Wed 07 Jul 20:08 CDT 2021, Bryan O'Donoghue wrote:
>=20
> > The current implementation omits the necessary mmcx supply, which means=
 if
> > you are running the code for this block and a prior clock driver, like =
say
> > the videocc hasn't run, then a reset will be generated the first time we
> > touch these registers.
> >=20
> > Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for=
 SM8250")
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>=20
> camcc isn't enabled in the upstream dts yet and I expect that we're
> going to conclude on defining these GDSCs as subdomains of the cc's
> power-domain in time for v5.15.
>=20
> I don't mind if Stephen picks this to make sure the driver is
> functional, but I will hold off on the dts change.
>=20

Seems like this is superseded by the GDSC patches that use subdomains
instead of a fake supply?
