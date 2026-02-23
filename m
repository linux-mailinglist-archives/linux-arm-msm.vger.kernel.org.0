Return-Path: <linux-arm-msm+bounces-93733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHjGISB7nGmmIQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:06:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7251795BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 910F7307E8FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82BD30AAA6;
	Mon, 23 Feb 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQn5cUD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842EC303A26;
	Mon, 23 Feb 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862525; cv=none; b=i6FpqJ9/vEDk1bHAmBZcJBjR9HPv21KTLqGlcGWe6Hit5Xutnq8sZ8tfWdVb8V8le/Eutt2jVPCpRgbBzsuTceZlcT613e1Nq+PmUm7aAhf2kNbSB30PVxe5gnzT5bDDx1ZzKHBKPnON2uoG59BEug+twd110DtmsyHfmRuriCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862525; c=relaxed/simple;
	bh=+Pr0GifpXOYCuWRHnzUO3l8XX5QxVwywd1ltopvWPlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXJDUntoEVEeSOKMuHeFfO9B34NM96Q1sGHV4/hVxeCEaGyZaH+Yg6EEeXwCgVVUzdOVS0RQZwCOJ8KU4X7NDj8D9CIhW5dPsQXe/J+r6WW0/QS+fP1MopysTXIr9zufLRJo2+5WrHn1+qJgC2j+RoIk4/g9ue8oqvNfiVJGdm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQn5cUD8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318DAC116C6;
	Mon, 23 Feb 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862525;
	bh=+Pr0GifpXOYCuWRHnzUO3l8XX5QxVwywd1ltopvWPlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQn5cUD8HnDOBis6LCd+D9OfOuHR3pO71XU1DfV1IG3UxccfGu8BvEi8vuLlBKUnF
	 doU9EN3Bumw7R8zCF8yHXw09wSvZNkIhwxj4A9NMu6OBCbJQK7biFw5JV6gkoDTNCa
	 UiUxmclcvpW45lgvj4fxtAsOx3cgeLKWDX0v9cQUx9ZcEuEWz009B4pFs+GmfQL4mJ
	 wOwu2mYr+rZ5c2BWdtzHgXXw8NBn4mQF8CP6UtyEIX08YI2XOnTsMppfj/3DoD6TXG
	 xwltV1eoaIvopi2RYpUYp3AhHQhz1//loT+IW862G90VZd37lVWQLN2ozDG2VAKfok
	 hmwAu2CDt1lJA==
Date: Mon, 23 Feb 2026 10:02:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>, 
	Daniel J Blueman <daniel@quora.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa/x1: Fix TODO in system power
 domain node
Message-ID: <xvftv3tcvm5osajvtvwlqqipyap4n2zlupra3xlcfuvjpzgs7b@ugg5sw3bnb2u>
References: <20260221105245.19328-1-daniel@quora.org>
 <9defac59-ae8a-4658-ab38-dcb0559d9708@oss.qualcomm.com>
 <0397c453-e1ec-44a2-bf8f-a64347882226@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0397c453-e1ec-44a2-bf8f-a64347882226@packett.cool>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93733-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2B7251795BA
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 02:51:44AM -0300, Val Packett wrote:
> On 2/23/26 1:11 AM, Maulik Shah (mkshah) wrote:
> > On 2/21/2026 4:21 PM, Daniel J Blueman wrote:
[..]
> That issue with runtime-suspending all four USB controllers shutting the
> system down, does that mean there's some rail where USB ends up being the
> last load-bearing thing holding it up and we'd like to let it go down
> properly?
> 

The three USB nodes have power-domains = <&gcc GCC_USB30_*_GDSC> and
required-opps = <&opp_nom>. &gcc has power-domains = < &rpmhpd CX>.
This means that as long as the USB controllers are active, CX is kept at
at least nominal corner.

The reason why the USB node has &opp_nom is because it's required by the
200MHz MASTER_CLK, which iirc relates to the possibility that you might
have something SuperSpeed connected. (But as we flatten dwc3, we should
be able to scale this based on what is actually connected)

I don't know why there's multiple pm_runtime_forbid() in the USB stack,
this needs to be revisited.


Then to your actual question, yes, if you suspend the USB controllers
and the result is that the system dies, then we have other resources
piggybacking on the USB controllers' votes for CX.

I did some experiments on SC8280XP earlier and was able to drop the
pm_runtime_forbid() - and see CX drop below NOM. Iirc more work was
needed to get reasonable behavior in terms of plug-detect, so the
patches got stuck in their topic branch...

Regards,
Bjorn

> 
> Thanks
> ~val
> 

