Return-Path: <linux-arm-msm+bounces-50067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E7A4CDE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 751441896019
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 22:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC992288EE;
	Mon,  3 Mar 2025 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkFOrArw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2931EE00D;
	Mon,  3 Mar 2025 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741039876; cv=none; b=SVUfvMSqqurLLg95gU1WJQUeVpcpdYmvmxJm0J/wIi3sgsamABdvhHOGUIsyI0uUWSP3JdVr2EGKza8y6yVICpxD7woBGM4cVLfVtxVH9ykKCQvoFPbzlQIA/l3Vd8CoWEMO4nTjj267o0dw0KNzbhk3Gxh2EWU0Wdc/8vJXvTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741039876; c=relaxed/simple;
	bh=p25ZKJks8Fnkw7N2pzrCNOBpk6sdaPXtiCW09AWTfEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txrAlBoFpCWJifnE0tz3ZRtVwPxxaTt75ulDn6wzDzCa23BSSYTE5sQUyJX5wHU1RMTQVAST/g4noG9Y8UaqXWtMl1XGATIHpLKVlp1F9/cuuLWjwmjPv2vsUtxI1K9XOIABFPUZvSlO6xKnRLMzo/eaoARwf3ef7UJN42JAM+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkFOrArw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF682C4CEE5;
	Mon,  3 Mar 2025 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741039876;
	bh=p25ZKJks8Fnkw7N2pzrCNOBpk6sdaPXtiCW09AWTfEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkFOrArw7CLvIvU40NYEdk/doZlOawrrHkXz7z88BsXW4I8j5s3CarZCOEVSzWkQb
	 7C0snJEos7At7n2JG8DuXZQRBv1ZBt3rYMa14+F0Lsy6s6uVUTilVOF1cJ9MltF4f3
	 N7Lm8OJckqUn8U61m1j92XRP0hWcith5mJ7YNyPzpIrFoX01wCuKQqvva34ud8h0FV
	 JtF1KeERpdiDqcsU3Hmkcqb5R/AxDqXUI7EfM5tE8636aST04E/jGO2pfEaaZuXJB9
	 ts5q78kerMummBM7HW/wltQu+Od5LwAPTR1gl8/0CyJDWb25bOXd4hB/fm3JHO4L1Q
	 xUtdvfWwpSOog==
Date: Mon, 3 Mar 2025 16:11:12 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: usb: Introduce qcom,snps-dwc3
Message-ID: <zcii4au5qmpths5sg5vpqbgeaw6mxeao6ligdr6v4cgdypnzlx@oyrhcql2hh7x>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-1-4415e7111e49@oss.qualcomm.com>
 <20250228223614.GA3792644-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228223614.GA3792644-robh@kernel.org>

On Fri, Feb 28, 2025 at 04:36:14PM -0600, Rob Herring wrote:
> On Wed, Feb 26, 2025 at 04:17:48PM -0800, Bjorn Andersson wrote:
> > The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
> > several of the snps,dwc3 properties (such as clocks and reset) conflicts
> > in expectation with the Qualcomm integration.
> > 
> > Using the newly split out Synopsys DWC3 core properties, describe the
> > Qualcomm USB block in a single block. The new binding is a copy of
> > qcom,dwc3 with the needed modifications.
> > 
> > It would have been convenient to retain the two structures with the same
> > compatibles, but as there exist no way to select a binding based on the
> > absence of a subnode/patternProperty, a new generic compatible is
> > introduced to describe this binding.
> > 
> > To avoid redefining all the platform-specific compatibles, "select" is
> > used to tell the DeviceTree validator which binding to use solely on the
> > generic compatible. (Otherwise if the specific compatible matches during
> > validation, the generic one must match as well)
> > 
> > Mark qcom,dwc3 deprecated, to favor expressing future platforms using
> > the new combined binding.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
> >  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 619 +++++++++++++++++++++
> >  2 files changed, 631 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > index a2b3cf625e5b..6d818e6dddbc 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > @@ -4,11 +4,22 @@
> >  $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Qualcomm SuperSpeed DWC3 USB SoC controller
> > +title: Legacy Qualcomm SuperSpeed DWC3 USB SoC controller
> >  
> >  maintainers:
> >    - Wesley Cheng <quic_wcheng@quicinc.com>
> >  
> > +# Use the combined qcom,snps-dwc3 instead
> > +deprecated: true
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: qcom,dwc3
> > +  required:
> > +    - compatible
> > +
> >  properties:
> >    compatible:
> >      items:
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > new file mode 100644
> > index 000000000000..37af52e01803
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -0,0 +1,619 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SuperSpeed DWC3 USB SoC controller
> > +
> > +maintainers:
> > +  - Wesley Cheng <quic_wcheng@quicinc.com>
> > +
> > +description:
> > +  Describes the Qualcomm USB block, based on Synopsys DWC3.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: qcom,snps-dwc3
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - qcom,ipq4019-dwc3
> > +          - qcom,ipq5018-dwc3
> > +          - qcom,ipq5332-dwc3
> > +          - qcom,ipq5424-dwc3
> > +          - qcom,ipq6018-dwc3
> > +          - qcom,ipq8064-dwc3
> > +          - qcom,ipq8074-dwc3
> > +          - qcom,ipq9574-dwc3
> > +          - qcom,msm8953-dwc3
> > +          - qcom,msm8994-dwc3
> > +          - qcom,msm8996-dwc3
> > +          - qcom,msm8998-dwc3
> > +          - qcom,qcm2290-dwc3
> > +          - qcom,qcs404-dwc3
> > +          - qcom,qcs615-dwc3
> > +          - qcom,qcs8300-dwc3
> > +          - qcom,qdu1000-dwc3
> > +          - qcom,sa8775p-dwc3
> > +          - qcom,sar2130p-dwc3
> > +          - qcom,sc7180-dwc3
> > +          - qcom,sc7280-dwc3
> > +          - qcom,sc8180x-dwc3
> > +          - qcom,sc8180x-dwc3-mp
> > +          - qcom,sc8280xp-dwc3
> > +          - qcom,sc8280xp-dwc3-mp
> > +          - qcom,sdm660-dwc3
> > +          - qcom,sdm670-dwc3
> > +          - qcom,sdm845-dwc3
> > +          - qcom,sdx55-dwc3
> > +          - qcom,sdx65-dwc3
> > +          - qcom,sdx75-dwc3
> > +          - qcom,sm4250-dwc3
> > +          - qcom,sm6115-dwc3
> > +          - qcom,sm6125-dwc3
> > +          - qcom,sm6350-dwc3
> > +          - qcom,sm6375-dwc3
> > +          - qcom,sm8150-dwc3
> > +          - qcom,sm8250-dwc3
> > +          - qcom,sm8350-dwc3
> > +          - qcom,sm8450-dwc3
> > +          - qcom,sm8550-dwc3
> > +          - qcom,sm8650-dwc3
> > +          - qcom,x1e80100-dwc3
> > +      - const: qcom,snps-dwc3
> > +
> > +  reg:
> > +    description: Offset and length of register set for QSCRATCH wrapper
> 
> I think you want to drop this. Or do you need 2 regions? The wrapper 
> regs and the DWC3 regs? Probably worth describing separately even if 
> they are adjacent currently.
> 

There's now a single node, with a single "reg" indended to cover DWC3,
XHCI, and Qualcomm glue (qscratch).

I contemplated describing the separate parts in reg, but if so it would
make sense to also split the dwc3-region into it's dwc3 and xhci parts.
I think it makes sense to go the other direction and just describe all
three in one.

That said, I obviously failed to update the description to match my
intentions here. It seems reasonable to me to just drop it.

Regards,
Bjorn

> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    description: specifies a phandle to PM domain provider node
> 
> Drop the description.
> 
> Otherwise, looks good.
> 
> Rob

