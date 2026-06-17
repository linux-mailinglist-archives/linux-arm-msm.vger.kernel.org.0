Return-Path: <linux-arm-msm+bounces-113503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qKtbL0FGMmpkxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:01:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B21F697041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:01:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YFt2Onba;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113503-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113503-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32275300FB58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 07:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFF43B42D2;
	Wed, 17 Jun 2026 07:01:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8304F38331E;
	Wed, 17 Jun 2026 07:01:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679678; cv=none; b=rW/fqpzqiZ6XMSRc0BvjlXkf3S8TMs4fu5ezy8HAWHaTlX5OXDNsURaCuxbnY1C4pNG+qzZticexu8VPCzbCAFJ0Cr5jweF/TWkNbM0qoSJ7Yg0CUYpaR7kTtbgoPtDdb7tKRYzjIfv9HmUKapjAiAzxldvcVqsgFCOnBbIYZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679678; c=relaxed/simple;
	bh=MOsWgoE/r24tOgeMG5RWIafjJ8WGwXz4VBP1cvLOT58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hK84IblRCGkYSA20EeV1LCcfFW69MX82LaR7hjrgI2y9W8/iQiR4auPwJ/vnn/1B+1LYYRFInmRdmxhzxFBrWNIHvhf5E/N8OxQzyisPPoz5QcX+bCGtavKc0mmetqHsmSVyE9RsJBMMjiUa9ulpGCkTV0xdyCoU/sFlhAqzjF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFt2Onba; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6D71F000E9;
	Wed, 17 Jun 2026 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781679677;
	bh=5cP3ZjuvlgY3MK0mjyMxLKDOV5/e/Yce0WqJYxlF6L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YFt2Onbae9dFb0xLVhdVNSyCawe/a+3kWd1G2fyWPTVi60Os9MIei9k6zQWONwCx8
	 UOm4FuTTSSoal7O45nKRnYyAlqnC9u4zFUfU3nFH0Hx+54e8XMiHWFpnDnmNdFtBa5
	 l9hI/XdkdX50Z/D0m7B/jdbccP5mSPrw4dvHgFwJPNnAru4jAGjxpOcjE11nARuufJ
	 LPRTr2ouwZL2THdEVAeC4wtvMZ/cqE3bhE7RamDdh5w20ywuq4yJHG7IPYbfaZdGWg
	 vx4/rKEExwjOBCGtFvNbyqhtwwWZ7VLm7QoPF5wCpj/KGRUmkAnvjwJRe3YsrQxqkY
	 OSH45Axt8toYw==
Date: Wed, 17 Jun 2026 09:01:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260617-musical-trogon-of-conversion-cabea0@quoll>
References: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
 <20260616-pcie-phy-v4-1-504677c3d727@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616-pcie-phy-v4-1-504677c3d727@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113503-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,quoll:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B21F697041

On Tue, Jun 16, 2026 at 10:34:41AM +0530, Varadarajan Narayanan wrote:
> The ipq5210 has one dual lane and one single lane PCIe phy.
> 
> The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
> qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
> as fallback compatible.
> 
> The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
> specific compatible as it uses a combination of its own initialization
> tables and some of the existing tables.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


