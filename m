Return-Path: <linux-arm-msm+bounces-118561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iWmjN++GU2p5bgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:22:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35A7449ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:22:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UoyrEJoX;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118561-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118561-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5A0D300A104
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBF73A4F4A;
	Sun, 12 Jul 2026 12:22:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D1358D00;
	Sun, 12 Jul 2026 12:22:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858924; cv=none; b=VdFv3VkRF2tzyDnUsvpws95slo9sgMjGTBzKhyXVZvQabifb8QP+dPJDzscl09lhqPy8AcEbQ9nsUUH2WH41pFzAZB6gVvWphWwcpim+ameHbqiyarnbozAfAFl3bpaxVmHeCL/05K2bOp1mfoSt4+NNJNkLpGsczrkCg77JPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858924; c=relaxed/simple;
	bh=LFtV5Fq93vPYbTIEaNtzzufn8HDF/AtYb2qWJdYRIw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9QYqqn3rDcC9HQlj7JRtL67HR3fehGLtwpG9gYH5wjwaIdCBOOXiCZ2issXRGdHtYJNJGwrbOfnYa9cmo0bSmisblIZclF0HhgWQ7so0Ei64kAmsEhxXrDkPd4aodgK0PsQdC3shdmRpj0W4witk2P914J/24lGmBjFXj6k+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoyrEJoX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE6F1F000E9;
	Sun, 12 Jul 2026 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783858923;
	bh=36mROewa5tuVs+2z+rkX6C62iFNne6zrec9pxHF3F84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UoyrEJoXKUcKLw5tOKP9NDsCbsOyA7AUYYk3G8tDjpfkaCujWL2XFLyx+VhwdRbGK
	 O6SHiKFG3Le2orG46xMdTi+o0DQR/NNDHmU+UbMjtrsbxKlmd8o9xMTxGkkReA/Uu3
	 pIct9A9XoP9raFpVzMNFMs01Ws5tbxFGzCxpg7/lpv+npn3EV6k1R/efKZk3tg8DCw
	 PpVPq4XcjxzwrHb6zufk5XtZvWx8rWC666eHRypqc4ODtnKJjUyPS2NE1pYaN2WcP1
	 0OGc02I5Kk7g76ZCjW4OE2iGddBGGdwVPOqdBL6yaJovdwU74Hbq7z/2ncajuq/bVL
	 Vo2ZtMD5M1Epg==
Date: Sun, 12 Jul 2026 14:21:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Message-ID: <20260712-curly-parrot-of-acumen-eb8ef7@quoll>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
 <20260711-shikra-usbphy-v5-v5-2-229ba3602737@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711-shikra-usbphy-v5-v5-2-229ba3602737@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118561-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quoll:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F35A7449ED

On Sat, Jul 11, 2026 at 10:39:51PM +0530, Krishna Kurapati wrote:
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,shikra-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          minItems: 3
> +        reset-names:

Same feedback. minItems

> +          items:
> +            - const: phy_phy
> +            - const: dp_phy
> +            - const: phy

Drop

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs615-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 2
> +        reset-names:

same feedback, maxItems.

> +          items:
> +            - const: phy_phy
> +            - const: dp_phy

Drop

Best regards,
Krzysztof


