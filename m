Return-Path: <linux-arm-msm+bounces-103767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBqcMSE25mkGtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:20:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E4342CE8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD0432908E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5001A3D75B8;
	Mon, 20 Apr 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2IllhUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B54F3D6CB4;
	Mon, 20 Apr 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691426; cv=none; b=Y+QRsns/eN60qKS9RbQmyGvBy/pNtdFRRCjFPT2pzHEfx0N0byMckdHtTMM3EL55KhS8ZggW/xFx+StseecniptiBeT0IaKnJ3xIGaGdoycqNpt5dgeoAB9W6E8WntwSqC52tD8/9NmbihpE8XwmjeEcSjt0e7jhfGziTv8SDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691426; c=relaxed/simple;
	bh=ywo/K+m8g61aFuYUwjJngKFcWB+wO9RjNtkZ4THPkfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCU9w9VrjpktVfScbb9eDhdirHg4GqvzvpcInOsWbQlV6hbTXqW8GziOc0OmM8r1HzKbcwydVejfUoecf1HGDLciUbLT0BrYc5kpAHDWAijGcem+ovZW8T2cKu3UKdFh5agG6l0SB8rgZtXBWPfCz9Ew8Pla1hVFpH5+AlaZJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2IllhUI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBD4C4AF09;
	Mon, 20 Apr 2026 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691426;
	bh=ywo/K+m8g61aFuYUwjJngKFcWB+wO9RjNtkZ4THPkfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2IllhUII1LeigQu/LhVqMjlicGgoRx0s29c4Rh2H8muX/VKwlTyHTUYdI9YJax2n
	 F9Mt4ouIcD0BQdEevVWK41HZ+jCyMstdvCyvPqx3Qx3t34y8IsY3cHsrjF5p+PYVCP
	 fLrIuFZJKDoHavwu+b1wMcXkxvmvssbbruQoFRRU3lVr1n22SG561k1PfXckYWTPLZ
	 EzCry+M5RLD2ISQnscbPMNJZb2ZN57b8iGw0dxhjCnx4ZjCvyA6iySosXff3BKaolQ
	 foIw+bN4+DtnR+4A1Z+GrpMlTxq5GUEpvrDFYph6yuRUPNGpAQvJ+1/4DQj5ZsXzFK
	 K1MffoiFVDUMQ==
Date: Mon, 20 Apr 2026 15:23:43 +0200
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
Message-ID: <20260420-optimistic-unnatural-stingray-80da35@quoll>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
 <20260417-awesome-tacky-coot-e59a30@quoll>
 <aeXUZ1uSEJ9InUtw@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeXUZ1uSEJ9InUtw@hu-qianyu-lv.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103767-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: F3E4342CE8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 12:23:19AM -0700, Qiang Yu wrote:
> On Fri, Apr 17, 2026 at 11:18:08AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Apr 15, 2026 at 07:58:13PM -0700, Qiang Yu wrote:
> > > On Wed, Apr 15, 2026 at 09:50:28AM +0200, Krzysztof Kozlowski wrote:
> > > > On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> > > > > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > > > > 
> > > > > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> > > > >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > > > > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> > > > >    follower to form a single 8-lane PCIe Gen5 interface
> > > > > 
> > > > > In bifurcation mode, the hardware design requires controlling additional
> > > > > resources beyond the standard pcie3a PHY configuration:
> > > > > 
> > > > > - pcie3b's aux_clk (phy_b_aux)
> > > > > - pcie3b's phy_gdsc power domain
> > > > > - pcie3b's bcr/nocsr reset
> > > > > 
> > > > > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > > > > 8-lane bifurcation configuration.
> > > > 
> > > > Do you describe PCI3A or PCI3B or something combined PCI3?
> > > 
> > > I describe a single x8 PHY with resources from both the pcie3a and pcie3b
> > > PHY blocks for x8 operation.
> > > 
> > > > 
> > > > > 
> > > > > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > > > > requiring the clock-names enum to be extended to support both
> > > > > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > > > > pattern used for [rchng, refgen] clocks at index 3.
> > > > > 
> > > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > > ---
> > > > >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
> > > > >  1 file changed, 45 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> > > > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > @@ -18,6 +18,7 @@ properties:
> > > > >      enum:
> > > > >        - qcom,glymur-qmp-gen4x2-pcie-phy
> > > > >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > > > > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > > > 
> > > > That's the same device as 5x4, no? One device, one compatible and this
> > > > suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?
> > > > 
> > > 
> > > It is not the same as the 5x4 PHY. In DT, we model three PHY nodes:
> > > phy_3a (1x4), phy_3b (1x4), and a separate phy_1x8 node for x8 mode.
> > 
> > OK, that's what I wanted to hear. And that's what should not be done,
> > 
> > You should not have a separate node for the same hardware. First, DTC
> > will give you a W=1 warning, although warning itself should be moved to
> > W=2.
> > 
> > Second, the warning tells important story - same hardware is described
> > twice.
> > 
> > You only need phy_3a and phy_3b, so only two in total.
> 
> We can keep only phy_3a and phy_3b, but still add new compatible
> qcom,glymur-qmp-gen5x8-pcie-phy in binding, right?
> 
> For boards that support pcie3a(1x4) + pcie3b(1x4), DTS would be:
> 
> pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> 
> For boards that support 1x8, we would override pcie3a_phy with:
> 
> pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x8-pcie-phy"; /* additional resources */ };
> pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> 
> This still uses only two PHY nodes and DTC will not report warning.

IMO, you do not need another compatible. Device is exactly the same. If
wiring on the board differs, e.g. you have 8x instead of 4x, you:
1. disable unused 3B phy.
2. Add to 3A missing resources or the phandle to companion node.

At least that is what I tought till now, when I opened the HPG/manual
for Glymur phy.  Someone skipped important information when PCIe PHY was
upstreamed first and glymur.dtsi already got PHY 3B described.

Reminder: writing bindings asks you explicitly to post COMPLETE
bindings.

If you posted COMPLETE bindings we would question all this and you would
have to check in user manual that this is actually ONE device.

There is no 5x4 phy 3A and 3B, at least HPG is pretty clear here.

And you should start with that.

But you posted first incomplete binding, hiding the rest and now you
have 5x4 merged into DTSI.

So let's rephrase based on manual:
You have only one PCIE phy3. Not 3A + 3B. That one phy3 can be
configured by consumers (board) differently, e.g. by requesting 8-lane
or twice 4-lane phys.

Let me send correction note for glymur.dtsi.

Best regards,
Krzysztof


