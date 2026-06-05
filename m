Return-Path: <linux-arm-msm+bounces-111454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9S0oMQMgI2qhjAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 21:14:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982464ADEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 21:14:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="i/HIQKuU";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111454-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111454-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EE40301FF9B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 19:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607E93B0AD3;
	Fri,  5 Jun 2026 19:06:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C1377543;
	Fri,  5 Jun 2026 19:06:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686401; cv=none; b=qRGDGd8B02Emv4qD7o+VLZdx8E+TWh6l9OMNyPZMt2K9aZJ+53+C2FBCkszqCGD1bgFoE6mUu9MOlW68hQa9gQqU+SlkSKGa2xuQtrCp8JYgZ0pkVoWl1hglulXPrNk2mSaMwq5e0Qv0hRp+lDl9BFnXosCyl1OQQFoN90yfJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686401; c=relaxed/simple;
	bh=HBQj2WAAvsjLsPaPYx78bH6HEFEJLEckWJTIF2mvvnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qjd+hVNm10+cNZAruvCWBTsZRYCqG/sI3jAif9zM7020KkwAybZUk94nxFng/Y3Rlxy23pgFYsDNTzpNVqFmvRbTNjUtFGv+tcA2Ay2MwtCif2kuQz5BuAmmH/e5ORHysk2Jt1Bil76vRbxQbcjZVTKGjmtmoMqoixggOB9w9kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/HIQKuU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF6D1F00893;
	Fri,  5 Jun 2026 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686400;
	bh=bQdCIlR4TmbHaM9znLMb84vsVtHdadCejRiPSH1vb5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i/HIQKuUcaZgfPFAZ5IssdsE+mNsFymCVsX8tmr5CYCJNchoNgXkXVTndjq2eCzTd
	 C8THXRONz3LDXDQFPbA3MLa3lz56fkSSsqSuj/8evfhqCPz3EoiTPsjyAcnLzrVr5Z
	 /0XDZTvzO0O6VeyNJ/Lro+JcT5L7AXw/CofQzkcu/8A4ROdpgfNhOZ9LXvDpCxjkVl
	 yaei2UF3t5nipAgno5y6BKjpt2nz0WL56jZK2YW8KQ4rQZVI3Jlm/vzfWokTfedO37
	 Ojqy4CCWhy1QeSg27AR7n19a3FB/19q0k9ZY4QqGI9CEEq55SwIj30Dw/XSM52ttVy
	 QxBtTUDE9/0kg==
Date: Fri, 5 Jun 2026 14:06:38 -0500
From: Rob Herring <robh@kernel.org>
To: Oliver White <oliverjwhite07@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document
 snps,reinit-phy-on-resume
Message-ID: <20260605190638.GA4188454-robh@kernel.org>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601231236.20402-2-oliverjwhite07@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111454-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:oliverjwhite07@gmail.com,m:gregkh@linuxfoundation.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Thinh.Nguyen@synopsys.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:balbi@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1982464ADEA

On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
> Add the documentation for the 'snps,reinit-phy-on-resume' boolean
> property. When set, the DWC3 core will perform a full phy_exit() +
> phy_init() cycle on each USB2 PHY during the host-mode fast resume
> path. This is needed on platforms where the USB2 PHY power domain
> is gated during deep sleep even when device_may_wakeup is true.
> 
> Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b653824..d12f6ae81ab8 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -212,6 +212,16 @@ properties:
>        When set, run the SOF/ITP counter based on ref_clk.
>      type: boolean
>  
> +  snps,reinit-phy-on-resume:
> +    description:
> +      When set, the DWC3 will re-initialize the USB2 PHYs during the
> +      host-mode fast resume path (device_may_wakeup). Some platforms
> +      cut PHY power during deep sleep even when USB wake is enabled,
> +      and the standard PHY runtime PM resume is insufficient to restore
> +      the PHY register state. This quirk forces a full phy_exit() +
> +      phy_init() cycle on each USB2 PHY.
> +    type: boolean

This should be implied from a platform specific compatible string.

Rob

