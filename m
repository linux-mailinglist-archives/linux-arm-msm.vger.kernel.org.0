Return-Path: <linux-arm-msm+bounces-47642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6990A317ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 22:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56DD71889D4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 21:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118F3267AF0;
	Tue, 11 Feb 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP4BATfY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30CC2673B8;
	Tue, 11 Feb 2025 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739309967; cv=none; b=HAYVAWoQY/9IbyYxxQSPLWhrPVq7ccEGEjVK7hz4gYmiwvtTb0YiU4+L2oJ1w2nPiAw/EklYIVCgiyUh34oIZ5xG7ViURz2cNpmWLQSnIv5CpZ0Oh8fq6ybJN6tCGMwY0WNRN6SlwoHqk7DzYQmdr71sb7Gas5ccHniFkUWwjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739309967; c=relaxed/simple;
	bh=FJycInZp7xLnccM2iFP10pmSMU2kK51uCue1d6X+XO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvNH1P17+OAKTZkVTdFCfYPfvHMbEHQWbIQmxzWoYAop6XKWJvxu5s7ioU5m2Svcf/b4NKAnAIqfPrHnqGVnoBtUQEdKYT1PP5cWwj11C678dHKcDOP1qqn0JVehebcJuYQiUwlOxPC1P9ZmyeacVlk5pDoZI4VkhefEjMWCbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP4BATfY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED68FC4CEDD;
	Tue, 11 Feb 2025 21:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739309966;
	bh=FJycInZp7xLnccM2iFP10pmSMU2kK51uCue1d6X+XO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP4BATfYQC25wggrvRK+B62zM9TQ+bR0hCVhUWH4cji6/wep0juNbEW2L9FxK1Eat
	 sGvPeE8MrAnft7dpLlkUy5yUm8/hxi5ikl8+3Mc28c4tZEiRMJMy/fDd8D1xy0eQya
	 pnhNKAswSjU3cbZei39Nm2iAeOSM7Wrq6uNn51EPfCn3dPPkEfYE5W5n6uIupuoWnM
	 5FK5pxfOj5XCaSthnTiXPtAlyWeoDON2+i3O1N+vWtTrG03/cZZ6WqFWRbQ1aPPdoE
	 DsYpKoDfrL2iHJSKnGKvtmG1XYAY7ERQF+XfoQz/XnQE9ubmFZboS3LEAw6bIpqFDG
	 vZ0e7USejBvnQ==
Date: Tue, 11 Feb 2025 15:39:24 -0600
From: Rob Herring <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
Message-ID: <20250211213924.GA1215572-robh@kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
 <7c518972-75df-4c8a-8920-06d5aa2849ae@kernel.org>
 <b7f2c973-e161-4b83-9b3a-415e84510bd2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f2c973-e161-4b83-9b3a-415e84510bd2@quicinc.com>

On Mon, Feb 10, 2025 at 09:42:03PM +0530, Mukesh Kumar Savaliya wrote:
> Thanks Krzysztof !
> 
> On 2/9/2025 5:15 PM, Krzysztof Kozlowski wrote:
> > On 06/02/2025 14:43, Mukesh Kumar Savaliya wrote:
> > > Hi Krzysztof,  Thanks !
> > > 
> > > On 2/5/2025 8:12 PM, Krzysztof Kozlowski wrote:
> > > > On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
> > > > > Add device tree bindings for the Qualcomm I3C master controller. This
> > > > > includes the necessary documentation and properties required to describe
> > > > > the hardware in the device tree.
> > > > 
> > > > A nit, subject: drop second/last, redundant "bindings". The
> > > > "dt-bindings" prefix is already stating that these are bindings.
> > > Sure
> > > > See also:
> > > > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > > > 
> > > > Use modern terminology, which means:
> > > > s/master/whatever else or even nothing/
> > > > See other recent bindings and discussions.
> > > > 
> > > Sure
> > > > 
> > > > > 
> > > > > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > > > ---
> > > > >    .../bindings/i3c/qcom,i3c-master.yaml         | 57 +++++++++++++++++++
> > > > >    1 file changed, 57 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..ad63ea779fd6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> > > > 
> > > > Filename matching compatible.
> > > > 
> > > Changed compatible to "qcom,i3c-master"
> > > > > @@ -0,0 +1,57 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Qualcomm I3C master controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: i3c.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: qcom,geni-i3c
> > > > 
> > > > No SoC? So to be sure: you claim all future SoCs will be using exactly
> > > > the same interface. No new compatibles, no new properties will be added.
> > > > 
> > > I think i should remove const. kept it for now as no other compatible to
> > > be added as of now.
> > > 
> > > let me remove const.
> > 
> > No, it does not matter. Keep const.
> > 
> Sure. I reviewed other files and seems i should write as below. Please help
> confirm.
> 
>   compatible:
>     items:
>       - enum:
>           - qcom,sm8550-i3c-master
>       - const: qcom,i3c-master

No, that's even worse. I doubt there is some universal, never changing 
QCom I3C master.

> > > 
> > > SoC name is not required, as this compatible is generic to all the SOCs.
> > 
> > That's the statement you make. I accept it. I will bookmark this thread
> > and use it whenever you try to add any future property here (to be
> > clear: you agree you will not add new properties to fulfill *FUTURE* SoC
> > differences).
> > 
> Sorry, i am not saying there won't be any other compatible but i was saying
> base driver will use "qcom,i3c-master".
> After checking other files i realized there can be const compatible but
> other SOC specific can be added as enum.  Hope above given way is fine.

AIUI, "geni" is some firmware based multi-protocol serial i/o controller 
and we already have other "geni" bindings. So really, it's probably more 
coupled to firmware versions than SoC versions. If we haven't had 
problems with per SoC quirks with the other geni bindings, then I think 
using the same "geni" here is fine. But we won't be happy if we start 
seeing per SoC quirk properties.

Rob

