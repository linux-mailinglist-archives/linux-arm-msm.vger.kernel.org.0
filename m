Return-Path: <linux-arm-msm+bounces-75705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4EBB140E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 18:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A569C189E0C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 16:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD8A2773D9;
	Wed,  1 Oct 2025 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ez6OFCTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790D239E8B;
	Wed,  1 Oct 2025 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759336305; cv=none; b=SKVDdFzwWiCEHfuQD95cTZ0bmaMXyhtHIYEVHtQelVgDEToAxDOVfnwDwHaJ8cYfKFjCTNGZyAaxWDWHCqjkl77o1G/iQYjnlP7/J4r7UcJhDlFVWfz2o6/Z85Tyygr1HeEfGhZOAiKAEjPPypo6wfzH7VUdYqfg4VibYRhbGQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759336305; c=relaxed/simple;
	bh=euC6S3LiJG7HoABb999DdDDuS1mO+zTyN+ac3MVNApE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBf3Jkple8Agvy50731WdNlfx4msYctbh5NpXCA2cudh2FzkUBJcAidiJEx3xxN9Gw1sL53r8movggdgQrvlyFXGXPvKXnOgFGEofISQyG/ZoJ7fYEi9cvsPTrr5JYtupRKUjQCiFagcIgbVKmeFulQdxjlaTITmv3vPKKlgkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ez6OFCTb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14ECC4CEF1;
	Wed,  1 Oct 2025 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759336305;
	bh=euC6S3LiJG7HoABb999DdDDuS1mO+zTyN+ac3MVNApE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ez6OFCTbMYLimCzxtqaRhwayDyeKNMZFV9p2OfwD0PeyjCazvNn/yEn8AeW0ocQIo
	 o7KDW0MUki5v9QClr61J3yaWYq0IsM0AnO3CJbVWWcRvxjwndNLjKHEnCV9UZ8w9jO
	 SjcBGOOU7yJLOm0hEzY+53QrOGGy6P+y3140tttzA9aj7jsWfLYhgAq3nJ8VAuk1Bi
	 0OzSaA0jojTNQflLq5OLzKL6ukzWa7/iDG8qFzoUMGWBNqN7b0hpAf/lbqUV6T1e6t
	 wBP2dTd10B4mkZyx5Brx0yPKQZFBEtW6h1SUcDmd2wzwEwBTz3jtaFjSQRGmk44QAd
	 9pTkSzOL8E+Vw==
Date: Wed, 1 Oct 2025 11:31:39 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: do not
 reference whole usb-switch.yaml
Message-ID: <20251001163139.GA1877961-robh@kernel.org>
References: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>
 <20250905175533.GA1000951-robh@kernel.org>
 <nwtt76n4t7tlf26ex47wrot7g7nldtmavbzgwmluls3egamjsi@mkomopb6fjh6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nwtt76n4t7tlf26ex47wrot7g7nldtmavbzgwmluls3egamjsi@mkomopb6fjh6>

On Tue, Sep 30, 2025 at 10:10:25PM +0300, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 12:55:33PM -0500, Rob Herring wrote:
> > On Tue, Sep 02, 2025 at 06:10:05PM +0200, Neil Armstrong wrote:
> > > Both bindings describe a different layout of the ports properties,
> > > leading to errors when validating DT using this PHY bindings as
> > > reported by Rob Herring.
> > > 
> > > Reported-by: Rob Herring <robh@kernel.org>
> > > Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> > > Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > index c8bc512df08b5694c8599f475de78679a4438449..5005514d7c3a1e4a8893883497fd204bc04e12be 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > @@ -73,8 +73,11 @@ properties:
> > >      description:
> > >        See include/dt-bindings/phy/phy-qcom-qmp.h
> > >  
> > > -  mode-switch: true
> > > -  orientation-switch: true
> > > +  mode-switch:
> > > +    $ref: /schemas/usb/usb-switch.yaml#properties/mode-switch
> > > +
> > > +  orientation-switch:
> > > +    $ref: /schemas/usb/usb-switch.yaml#properties/orientation-switch

Looking at this again, this isn't even correct and I don't think it 
works. It's missing a '/' and  should be ...#/properties/... to be a 
valid json pointer.

I thought we checked this...

> > 
> > This is a pattern we try to avoid with references at a property level. I 
> > prefer you make port and ports not required in usb-switch.yaml.
> 
> But this solution is also not perfect. E.g.
> Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml should
> only allow the orienttion-switch property, while using
> allOf:$ref:usb-switch.yaml allows all three (orientation-switch,
> mode-switch, retimer-switch).

That can be handled like this:

$ref: usb-switch.yaml
properties:
  orientation-switch: true
additionalProperties: false

Though if you need unevaluatedProperties for some other reason, then 
that won't enforce it and it's just documentation. In that case, then 
perhaps usb-switch.yaml is not the right granularity and should be split 
up.

I put this into the category of "this is the least of our problems". I'm 
not that interested in enforcing what common properties a device uses or 
not. It's undocumented properties I'm worried about or lack of 
constraints (on reg, clocks, interrupts, etc.).

Rob

