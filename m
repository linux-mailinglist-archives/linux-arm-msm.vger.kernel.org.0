Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24CE2A752B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgKECEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:04:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:35736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKECD7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:03:59 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D99D920729;
        Thu,  5 Nov 2020 02:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604541839;
        bh=p0b7JP12+XnhdR5f+Vatb+6IkVGyqXW0dkr++bxfdnE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SvRXAYvDl8uof8aVyesC/MGjL41dfVmvvaHhfr+2VUaoz+SxylGEJsDTvfNWO7PVT
         WUYGmnwOG166WSpIumI6mQcMa+Iul3WEwiVBQlWnjJGapJ9yLfyaL/uLAo+HHPcjKY
         PP7oJ6L0qsD+SY2goMIWzNGqhY7wDd2LGYeWAGFA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201031032944.GA5635@Mani-XPS-13-9360>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org> <20201028074232.22922-2-manivannan.sadhasivam@linaro.org> <20201030192225.GA4174677@bogus> <20201031032944.GA5635@Mani-XPS-13-9360>
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add SDX55 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, bjorn.andersson@linaro.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Date:   Wed, 04 Nov 2020 18:03:57 -0800
Message-ID: <160454183744.3965362.9735818194173206801@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-10-30 20:29:44)
> Hi Rob,
>=20
> On Fri, Oct 30, 2020 at 02:22:25PM -0500, Rob Herring wrote:
> > On Wed, Oct 28, 2020 at 01:12:29PM +0530, Manivannan Sadhasivam wrote:
> > > From: Vinod Koul <vkoul@kernel.org>
> > >=20
> > > Add device tree bindings for global clock controller on SDX55 SoCs.
> > >=20
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >=20
> > This should carry your S-o-b too.
> >=20
>=20
> Ah yes!
>=20
> > > ---
> > >  .../bindings/clock/qcom,gcc-sdx55.yaml        |  71 +++++++++++
> > >  include/dt-bindings/clock/qcom,gcc-sdx55.h    | 112 ++++++++++++++++=
++
> > >  2 files changed, 183 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-=
sdx55.yaml
> > >  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h
> > >=20
>=20
> [...]
>=20
> > > diff --git a/include/dt-bindings/clock/qcom,gcc-sdx55.h b/include/dt-=
bindings/clock/qcom,gcc-sdx55.h
> > > new file mode 100644
> > > index 000000000000..09ca45c6de73
> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/qcom,gcc-sdx55.h
> > > @@ -0,0 +1,112 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> >=20
> > Dual license?=20
> >=20
>=20
> The downstream code just lists the GPL2.0 and I'm not sure if I can make
> it as dual license. Whereas the binding we made it dual license since we

Can you check? qcom has been doing it so I suspect you should just ask.
