Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6493B5746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 04:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhF1CmI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 22:42:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1CmI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 22:42:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EFB4619C4;
        Mon, 28 Jun 2021 02:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624847983;
        bh=SoCGeNG9HsDyxEtp2GU2WZmjAAPuhOGmCHPhhj60muU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JKIEBR2oQ9Uw+5+bfI1dRTWaB6ZUaiPcjiM+R1JnW5iWgLzXii3r0qdYEMoGCKVbQ
         Z6zHPO1HRGvE9t8h6WAiAxvfs1llnO5STQhj5wxIZ3gsE/FuRE3yhl7aPg9cJ0zaWA
         K4lm5rKgALzdaW0zO0iy/7swammUSOK5H5dhEJ/plzMkxVUVyrA55j5sNgdhzE5bnu
         Vf9N+zBOhkTEd3ilJyQYF5iYuR2zWtTmUFwnnF+brjWadYyLQ90lj5mj6d4bsX6CDJ
         buDcY2PbucRx0Y09LG1Donz/cBC1tozXuN4se0s8lTRHsQFhwpwiTvgLyee248n5qU
         DAd0bUCLz+yWw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <56f3b0bd-5dd7-80d4-041a-0fd2daf4b1f2@marek.ca>
References: <20210519001802.1863-1-jonathan@marek.ca> <20210519001802.1863-2-jonathan@marek.ca> <162266925581.4130789.10178141366818328902@swboyd.mtv.corp.google.com> <56f3b0bd-5dd7-80d4-041a-0fd2daf4b1f2@marek.ca>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: add QCOM SM8350 display clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Sun, 27 Jun 2021 19:39:41 -0700
Message-ID: <162484798199.3259633.9009940760433821881@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2021-06-04 10:25:41)
> On 6/2/21 5:27 PM, Stephen Boyd wrote:
> > Quoting Jonathan Marek (2021-05-18 17:18:02)
> >> Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
> >> bindings. Update the documentation with the new compatible.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> ---
> >>   .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++=
--
> >>   include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
> >=20
> >>   2 files changed, 5 insertions(+), 2 deletions(-)
> >>   create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
> >=20
> > Why the symlink? Can we have the dt authors use the existing header file
> > instead?
> >=20
>=20
> It would be strange to include bindings with the name of a different=20
> SoC. I guess it is a matter a preference, is there any good reason to=20
> *not* do it like this?

 $ find include/dt-bindings -type l
 include/dt-bindings/input/linux-event-codes.h
 include/dt-bindings/clock/qcom,dispcc-sm8150.h

It seems to not be common at all.

>=20
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x5=
0.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> >> index 0cdf53f41f84..8f414642445e 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> >> @@ -4,24 +4,26 @@
> >>   $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
> >>   $schema: http://devicetree.org/meta-schemas/core.yaml#
> >>  =20
> >> -title: Qualcomm Display Clock & Reset Controller Binding for SM8150/S=
M8250
> >> +title: Qualcomm Display Clock & Reset Controller Binding for SM8150/S=
M8250/SM8350
> >=20
> > Maybe just "Binding for SM8x50 SoCs"
> >=20
>=20
> Its likely these bindings won't be compatible with future "SM8x50" SoCs, =

> listing supported SoCs explicitly will avoid confusion in the future.

The yaml file has sm8x50 in the name. What's the plan there?
