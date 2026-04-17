Return-Path: <linux-arm-msm+bounces-103499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLxeAtf64Wn50AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:18:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B980A41927A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90CFF302D09E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA8D3AF660;
	Fri, 17 Apr 2026 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJOf9cMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63E93AEF5F;
	Fri, 17 Apr 2026 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417491; cv=none; b=hEJV2u1hXZJI96PxNqrtrrDeWX6PIn61as70mjKU9jE9f2C04673vRAmhVPVqeqipwZNXL1I6Cb8tdsdqTc8AbW6MIFsYzCd6nA+XK9mMXKajC5bxJ6YbglziKEI9AFATA2TwKUlcfDwPTqsu3Mx/jRLhvpCyBn5GUc5L0G96Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417491; c=relaxed/simple;
	bh=GaZONsQl/bDnrAap+6+Gg7ZPxw6dUU3qnouvnvzseZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gayNlRXP0K+PaJEsCAmfDeQEZdgpRIxkGHDRJODWXy2tEkINXcypI+WyOvwidvJBgQ39AJuokXW4CEAM2k4HsP3eIvu8E88zpkKaNXJyqJipIcnf7m9Zbg6edNQ1rEFZFtd8KDDIimWMNVzIwsTPepLc6gEebswvW80LNsnuVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJOf9cMC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FE8C19425;
	Fri, 17 Apr 2026 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776417491;
	bh=GaZONsQl/bDnrAap+6+Gg7ZPxw6dUU3qnouvnvzseZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJOf9cMC9FcS4X/rJdMA7dbQ+BtGLhQD27FCjhRzddh5f6GaKC6mnG3JwK52t+QII
	 zFFIBK8Q8A/FisfMs4GlHuBOPLcjZ903SsJTz/buCUl7pgYLQVzHWkcftyJzMoKM0G
	 8kIqnpvUP2uM5rSKLKDVoHNLHYVs7WXcsvstgyoNFhGRL7CNZEeFvpUyaZy1NzVAyk
	 67/m4owxdlO6pl48ERRC0MlHqTFk+nwQsOCu7NyX7xKX8Nt8GG880+S/AapxxgXlQV
	 +JoJrSgnw6tDEXUf4EvgCM5WzFr6IPxTMjIILHOXRIkuMik6/lXgMToyXJc2Og1eJO
	 F0BuDfCVRrLwg==
Date: Fri, 17 Apr 2026 11:18:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <20260417-awesome-tacky-coot-e59a30@quoll>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103499-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B980A41927A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 07:58:13PM -0700, Qiang Yu wrote:
> On Wed, Apr 15, 2026 at 09:50:28AM +0200, Krzysztof Kozlowski wrote:
> > On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> > > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > > 
> > > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> > >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> > >    follower to form a single 8-lane PCIe Gen5 interface
> > > 
> > > In bifurcation mode, the hardware design requires controlling additional
> > > resources beyond the standard pcie3a PHY configuration:
> > > 
> > > - pcie3b's aux_clk (phy_b_aux)
> > > - pcie3b's phy_gdsc power domain
> > > - pcie3b's bcr/nocsr reset
> > > 
> > > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > > 8-lane bifurcation configuration.
> > 
> > Do you describe PCI3A or PCI3B or something combined PCI3?
> 
> I describe a single x8 PHY with resources from both the pcie3a and pcie3b
> PHY blocks for x8 operation.
> 
> > 
> > > 
> > > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > > requiring the clock-names enum to be extended to support both
> > > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > > pattern used for [rchng, refgen] clocks at index 3.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
> > >  1 file changed, 45 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >      enum:
> > >        - qcom,glymur-qmp-gen4x2-pcie-phy
> > >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > 
> > That's the same device as 5x4, no? One device, one compatible and this
> > suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?
> > 
> 
> It is not the same as the 5x4 PHY. In DT, we model three PHY nodes:
> phy_3a (1x4), phy_3b (1x4), and a separate phy_1x8 node for x8 mode.

OK, that's what I wanted to hear. And that's what should not be done,

You should not have a separate node for the same hardware. First, DTC
will give you a W=1 warning, although warning itself should be moved to
W=2.

Second, the warning tells important story - same hardware is described
twice.

You only need phy_3a and phy_3b, so only two in total.

phy_3a could have resources of phy_3b OR could have a phandle to
companion (follower) phy to fetch resources from it. I don't know yet
which choice is better, though.

Best regards,
Krzysztof


