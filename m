Return-Path: <linux-arm-msm+bounces-81678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A234C592F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 18:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C8FC3BFD08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E27533FE23;
	Thu, 13 Nov 2025 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjmrlEV7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E25328B57;
	Thu, 13 Nov 2025 16:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052945; cv=none; b=kbxi8TqQL9vdQXufGBmQMwddFGntNe6bW04NHmluMNwU0RdNcpeAeW2BnJOOIVq/Tv9/AvQGys0phdnBrQUvaIRHBHeUtbY/7v/5hPA3JCWmgpRS47cVbj91nG4zNyPzonwBrk+Hp9lVSldSIheY3d6OFEHmuRp31ipH4Y1I3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052945; c=relaxed/simple;
	bh=cDuGUvpznpYi4xeC9A2xiX1DogtcEl4H0soP0vHU4YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHYWnC43NmwqLk+8roh/U9vYP5r+GAglAnwSfv0rHoxN4PJB7RlJ1Ux5zOgRGP6125Ixe7QxQvFpcNfqijCorG39q6dMnaZpxMuEHbxzPP6VGpJPTQntNUBgUY2ZhYaNssgBNYuL/TewQRgNvXIkWPRvwis3X/mwFZM63cleV6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjmrlEV7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90766C4CEF5;
	Thu, 13 Nov 2025 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763052944;
	bh=cDuGUvpznpYi4xeC9A2xiX1DogtcEl4H0soP0vHU4YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjmrlEV7ZsT6s6HFZiZy9Knh8SNJyAlxNuYI3LsZUtRpM69G5QUG4vFpfhOGF8GHd
	 xHyJID508VRbLcmnT2JdMJSH8okk7f2WLmbuSC31oIFyINVPGAFcghvirhf1zCU3cg
	 nc3JK690hHCisBhj8pDgKo+dhul4pPw0dpKyrGl0Ux6sRmIASVBn/7/JSvHGJ1Gz3B
	 2Oet4Wxa7ZLx7GgdE/KQVQpt49wnLZ8H/BGlQyUrwExbzeEPnS0k4h49l833fKhW4t
	 zJguUv/IfwsCIUFQegANAutlxbxwxWLesu6sKUDulT1t13RLxFqAKahO5nidsPbsqq
	 WNcb3vyJCD9ow==
Date: Thu, 13 Nov 2025 11:00:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com, 
	Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 rb3gen2 industrial mezzanine
Message-ID: <p6rsi7nmzlk2q2wtnccwx4r7p74zoyeqq7d7pemhiv6tao56o6@6fivz7qrhkgx>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
 <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
 <kosvayxmpbngn56v7t734f4qqrc2rptkjdd7q5q23brg22dvov@cxs7kzzuapim>
 <qps5fkbgdqqvoqa3m5l4naksyc4aoq4xqnciyrpkrbs5qcno7c@aa6ync6sk4ju>
 <vz7u2jsb677imufu6aillcqnnaybed3occniyx3fgniwtxzij5@uplpfhhyjk5k>
 <5lkcoekfn3d6gwk4ra6u65lu6mtgzn2iucyvswvn4lhwuw3pxv@jcrp22msbaip>
 <72ffjdik46dpespj2i2bakju6zcbu5eu7atuqrl4i4ri437nrj@aigb6akxb266>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ffjdik46dpespj2i2bakju6zcbu5eu7atuqrl4i4ri437nrj@aigb6akxb266>

On Thu, Nov 13, 2025 at 05:45:42AM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 12, 2025 at 04:07:27PM -0600, Bjorn Andersson wrote:
> > On Wed, Nov 12, 2025 at 10:16:27PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Nov 12, 2025 at 10:53:36AM -0600, Bjorn Andersson wrote:
> > > > On Wed, Nov 12, 2025 at 05:02:20PM +0200, Dmitry Baryshkov wrote:
> > > > > On Wed, Nov 12, 2025 at 08:18:11PM +0530, Gopi Botlagunta wrote:
> > > > > > Below is the routing diagram of dsi lanes from qcs6490 soc to
> > > > > > mezzanine.
> > > > > > 
> > > > > > DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
> > > > > >                  |
> > > > > >                   --> SW2700.1 --> dsi connector
> > > > > >                               |
> > > > > >                                --> LT9211c --> LVDS connector
> > > > > > 
> > > > > > Disable hdmi connector for industrial mezzanine and enable
> > > > > > LT9211c bridge and lvds panel node.
> > > > > > LT9211c is powered by default with reset gpio connected to 117.
> > > > > > 
> > > > > > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > > > > > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > > > > > ---
> > > > > >  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
> > > > > >  1 file changed, 106 insertions(+)
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > > > > index 619a42b5ef48..cc8ee1643167 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > > > > @@ -8,6 +8,112 @@
> > > > > >  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> > > > > >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > > > > >  
> > > > > > +/ {
> > > > > > +
> > > > > > +	hdmi-connector {
> > > > > > +		status = "disabled";
> > > > > > +	};
> > > > > > +
> > > > > > +	panel_lvds: panel-lvds@0 {
> > > > > > +		compatible = "panel-lvds";
> > > > > 
> > > > > Please describe the actual panel using compatible, etc. It's not that
> > > > > this is some generic uknown LVDS panel.
> > > > > 
> > > > 
> > > > I presume the mezzanine doesn't have a panel, so how do we provide the
> > > > description of the mezzanine such that a developer can quickly get up to
> > > > speed with their specific panel connected to it?
> > > > 
> > > > Do we leave this node disabled, just for reference, or do we specify a
> > > > specific panel and then have the developer copy and adopt this to their
> > > > panel?
> > > > 
> > > > The benefit of doing it like that is that we provide a complete example
> > > > and something we can test. But at the same time, If I presume we might
> > > > have users of the mezzanine without an attached LVDS panel?
> > > > 
> > > > > > +		data-mapping = "vesa-24";
> > > > > > +		width-mm = <476>;
> > > > > > +		height-mm = <268>;
> > > > 
> > > > The way this patch is written we certainly have some specific panel in
> > > > mind...
> > > 
> > > It's even mentioned in the subject: BOE DV215FHM-R01. Having a proper
> > > panel compatible is demanded by the panel-lvds bindings.
> > > 
> > 
> > I missed that mention. But that implies then that this isn't "the
> > industrial mezzanine", but "the industrial mezznine with a boe
> > DV215FHM-R01 connected".
> > 
> > Are you saying that this is the way you'd prefer that we handle the
> > mezzanines with capabilities for extension?
> 
> Some time ago, around APQ8064 boards there was a discussion of using
> EDID to identify LVDS panels (in a manner similar to panel-edp).
> 
> Does industrial mezzanine provide EDID support for the panel?
> 

Even if there is EDID in this particular case, the problem still
remains broadly. If we have a mezzanine with a standard connector, but
the non-probable device is connected by the developer at a later stage,
how do we facilitate their experience?

Concretely, the Particle Tachyon has two CSI/DSI connectors compatible
with Rasberry-Pi accessories, I believe RubikPi3 has the same. We have
no idea what DSI panel (or CSI camera) the user might connect, but
there's common board-specifics and boilerplate that a tinkerer need to
put in place.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

