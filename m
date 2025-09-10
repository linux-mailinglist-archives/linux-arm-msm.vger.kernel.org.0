Return-Path: <linux-arm-msm+bounces-72998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84292B51986
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 16:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB9F618980A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CE632A801;
	Wed, 10 Sep 2025 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcziRYTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7302A32A3D7;
	Wed, 10 Sep 2025 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514979; cv=none; b=CYMHBXlJiwDkclCcpCuNLynvgz7mysVt3FS1yVMdexdBIsVVj3scXDHFlbWFKjFt1JRGb/HRn3b7ocvraa81/qBZTmVuPja87/iVoAm1FOpQfKsXRQxJp8HymP4S6WjiPgWxDYsFe50c9lyrjO4aJztY5sO3js6muNdGv0omYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514979; c=relaxed/simple;
	bh=YzN2vCtNXOfPmEUy/QtzOmDZxzWZ2vYAup9vdx715rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8RbOC+1yq+Dm1tC747pIYaZSrjq4CWBOlUxRsOpNHUari0XWdOSmKEZoU921vvMrajyA6PiSaPGVXwxRXWhg0sErL94HaG7psYe3P1WcBozA8FfeKtOGuL7o3/66LZ99Q1/pYN5gDQHkkuPDp6GGqiO3RGcZhs8b0ElnVcocv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcziRYTY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EC0C4CEEB;
	Wed, 10 Sep 2025 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757514978;
	bh=YzN2vCtNXOfPmEUy/QtzOmDZxzWZ2vYAup9vdx715rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcziRYTYjchVtxoB9c9jxPGdTtH8mRcmyM0KzU+MT9Wvq7cTN3ItuzY3bIARaBIQ0
	 maLWUpobcoR0VBLEhkZQtzjsRyGo5BQrMjAvQU1kuWrgkrnQ2JOXsP1Rqcl0FyYFRZ
	 MgY3Z1fV4VgFb8slQlwvM8aTQbqcrE4wiViC2hkhs3XXOcNBx/gH+aa24Byz2Bq9xH
	 YDcQN6Mg00HsekKooHydArdlKbBPtw3EatWrexA5irgomMXn/0wjp/3cJQ3lFqXJ2t
	 Er39O+Ouvu8cFbvN8cO71In7Sk+0MoLdX/YjJ/eB6on0oDpqYWfMIwBlI8co8JhIa3
	 auGJTVRYZcT7A==
Date: Wed, 10 Sep 2025 09:36:18 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Message-ID: <20250910143618.GA4072335-robh@kernel.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>

On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 10, 2025 at 3:38 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> >
> > On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> > > properties here differ a lot from the HLOS-managed variant, lets put it
> > > in a separate file.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
> > >  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
> > >  MAINTAINERS                                        |   1 +
> > >  3 files changed, 105 insertions(+), 1 deletion(-)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-depth', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
> >         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Unevaluated properties are not allowed ('mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
> >         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
> >
> 
> These seem to be a false-positives triggered by modifying the
> high-level snps.dwmac.yaml file?

No. You just made 3 power-domains required for everyone.

You have to test without DT_SCHEMA_FILES set so that every example is 
tested with every possible schema.

Rob

