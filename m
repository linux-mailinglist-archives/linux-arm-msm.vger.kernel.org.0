Return-Path: <linux-arm-msm+bounces-118487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vQULFK15Umo9QQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:13:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C37425E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:13:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TXuxx41b;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118487-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118487-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BB1A3004627
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D283C872B;
	Sat, 11 Jul 2026 17:13:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C141C255E43;
	Sat, 11 Jul 2026 17:13:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789992; cv=none; b=JVrPGHzGhAdYWkASePBoeeO9DSM8ZMHULgM573q6Gfmzln1JaTRO60+JTJ4Xse+y4Uyui2/iNh3SiEBH5NM8DLekTnFyOAYY+G0B99diDSQPiaiQb8us4gig4hrtkbPa4s6fQcQ2or88Y8y24IgLv+eXXEMQeVqFqxRPEP+KST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789992; c=relaxed/simple;
	bh=dUGVzjsWPMYjciRFNvVCmxbi5ProNzFrf8m0/AealFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ij/OZN0Bln015jiAHphW1+NLrHUwlI7QUWbkpAYN3Ybir7gFmih/eoWXtqCTrsDbAWXj1KD/hgKB31P+hrGHISSbVKC7xfOqp1/qQQFfgFl3WUo0Hw0EEDXr52k9uZSkxyxdZ/UXjob8MpCBLKl/EdC6D4NmsMkM23CE8QA4ExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXuxx41b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48AB1F000E9;
	Sat, 11 Jul 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789991;
	bh=l1dWx3uS7E3Egkf9EcvQ1+n2SBdIse+VJNTtCKAeaDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TXuxx41bpY0aBm/FUCTAaiE45R+HUO3ocWn4AI0LYU0+IjiGSG4jZhvlSZ78tNqSx
	 T/qKRijmm5gaTH3ee/w7dUANG7wkO/LuaLhgG7GEU3S3iAT/w5/dj/WAuwtHlTp63L
	 Dtp4c98TeXf5ade6M08duX/EY4sB8hI69aad9CYkuVSvTHfWZf9FlEcGFeGs5Tb5Le
	 bn0rxkc+Dz3vVgiQlduQ9x8UsZLg/xyjUcLbwKdjQ6LmAum47wyIx0Lj//vdfeAOcY
	 IU6OHFxI8VPRQUSsqV+1dkN+bgcbxWrGdSoF6YLAJgdKKHRQiy3gSRRXG8CJ6aaIdF
	 pBE1a9DjLRjRg==
Date: Sat, 11 Jul 2026 19:13:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add
 SA8255P USB PHY
Message-ID: <20260711-infallible-mottled-waxbill-beae3c@quoll>
References: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
 <20260709-phy-qcom-qmp-usb-8255-v2-1-3b6c26a45788@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709-phy-qcom-qmp-usb-8255-v2-1-3b6c26a45788@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118487-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mkorpershoek@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C11C37425E5

On Thu, Jul 09, 2026 at 04:52:09PM +0200, Mattijs Korpershoek wrote:
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index 01342823e57f..80b04b7f7584 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -26,6 +26,7 @@ properties:
>                - qcom,msm8996-qmp-usb3-phy
>                - qcom,qcs8300-qmp-usb3-uni-phy
>                - qcom,qdu1000-qmp-usb3-uni-phy
> +              - qcom,sa8255p-qmp-usb3-uni-phy
>                - qcom,sa8775p-qmp-usb3-uni-phy
>                - qcom,sc8180x-qmp-usb3-uni-phy
>                - qcom,sc8280xp-qmp-usb3-uni-phy
> @@ -54,7 +55,13 @@ properties:
>      maxItems: 5
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: usb_transfer
> +      - const: usb_core

usb_ feels redundant, since this is USB phy.

>  
>    resets:
>      maxItems: 2
> @@ -82,14 +89,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - clock-names
> -  - resets
> -  - reset-names
> -  - vdda-phy-supply
> -  - vdda-pll-supply
> -  - "#clock-cells"
> -  - clock-output-names
>    - "#phy-cells"

Just like in all other saXXXX cases, same review: move to a separate
binding file.

Best regards,
Krzysztof


