Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00EB94C1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 19:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbfHSR43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 13:56:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727744AbfHSR43 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 13:56:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6914A22CEB;
        Mon, 19 Aug 2019 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566237388;
        bh=deVsaTjQnypxRs2qbJ2IINUn03R/PdcxaWt6Wb5Udf8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=afLO4CenJg4a50JRRNcFfRvghNpLxJeV8HpLhcOG+zVt15Tlw4w508zBZYVfIMlGr
         7YW1P5O9xpUdbkKep3iynAkGB4rayiGOGAyli0L2icwGeRa0tN8D0FsNUr75AwhmS6
         mH5mpmBZHULXIoJu4yZ11QR5NGAFvyHtVKqCWys4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190819174331.GN12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-11-vkoul@kernel.org> <20190814170803.DEFCC214DA@mail.kernel.org> <20190819174331.GN12733@vkoul-mobl.Dlink>
Subject: Re: [PATCH 10/22] arm64: dts: qcom: pm8150b: Add pon and adc nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 19 Aug 2019 10:56:27 -0700
Message-Id: <20190819175628.6914A22CEB@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-19 10:43:31)
> On 14-08-19, 10:08, Stephen Boyd wrote:
> >=20
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/=
dts/qcom/pm8150b.dtsi
> > > index c0a678b0f159..846197bd65cd 100644
> > > --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > > @@ -2,6 +2,7 @@
> > >  // Copyright (c) 2017-2019, The Linux Foundation. All rights reserve=
d.
> > >  // Copyright (c) 2019, Linaro Limited
> > > =20
> > > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> > >  #include <dt-bindings/interrupt-controller/irq.h>
> > >  #include <dt-bindings/spmi/spmi.h>
> > > =20
> > > @@ -11,6 +12,59 @@
> > >                 reg =3D <0x2 SPMI_USID>;
> > >                 #address-cells =3D <1>;
> > >                 #size-cells =3D <0>;
> > > +
> > > +               pon@800 {
> >=20
> > Maybe pon node name should be 'key' or 'power-on'?
>=20
> pon stands for power on device. See Documentation/devicetree/bindings/pow=
er/reset/qcom,pon.txt
>=20

Right. I was hoping for a more standard node name vs. an acronym that's
SoC specific.

