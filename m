Return-Path: <linux-arm-msm+bounces-112640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H5SOFv5vKmpUpQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:21:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B93466FCDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Jw71aTjJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112640-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112640-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B162300CB3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19576377544;
	Thu, 11 Jun 2026 08:21:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051D36A379;
	Thu, 11 Jun 2026 08:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166074; cv=none; b=sZ1OIWD4TApyVO4sqrMPCgWYJOq6tJTUsk+A7YOMEE8pW1YOUqxvs/f4kHDYhkSqG3tT5bwQhvFZvTLHPgz9gVuQCWJONX1Kglyy+vzqjHSlGr5JpIXG4LXY+vScPSMkaGhC8/fH4mYKHxvtcpGIELisg0WY2w7t6CUM0ZCbvio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166074; c=relaxed/simple;
	bh=91gjGVVSU9JFe8AqrAREfPhygEBgdMFA5Qf8ZRola4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGpW2KcgKppLnUysYeqzfImuMGeIpMn69SGI42rv5H6L6JDEmH/XxOUXVkIAYgMKDLlJ9e1pKRlPXl8QusIw/eFZkeAjLD3bRg72xT5hsuRWQl3HD4E9iKMBgYaCF4nZM+fbRY3wJTevWQd3NbMKx1G5kSKSabm+mCki0infvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jw71aTjJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A451F00898;
	Thu, 11 Jun 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166072;
	bh=8DystJi/J+n75a0MQ4yqnrjh1EgH4OWWf/1bAsAyNH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jw71aTjJhDfC7QwqT0B5242fX8E51Ivy391ILfKkqASbppqVlWlaheOp/8lwa+q0b
	 LxvHDC4M1Q7gB9q4XldQbZeB5IvNBt1opBmw5tr+U8SD96e6t1aZ5WLQcL3KEkXDOI
	 Dn6GOmpyFkiQa9e9347fwzAmQlbuVdrLMaO4SxF2N0OpDpDC+BVOnI89z5ziK/X0fq
	 Vhcwkc0rDnCyDm053+pUajXK2Ee/jQDFH9KudoiCILD+J2LwDtQ/W/n6hDZYsovNXV
	 K79EP5g1eF/iut5+wkq2mq+wpnOlIm24RHrCTa487rs4hoE/kx14wSezO+Ft30SMca
	 eWfet29E9t8Xw==
Date: Thu, 11 Jun 2026 10:21:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260611-talkative-formidable-fennec-ad135d@quoll>
References: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
 <20260610-pcie-phy-v3-1-334011b378d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-pcie-phy-v3-1-334011b378d6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112640-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B93466FCDF

On Wed, Jun 10, 2026 at 04:46:08PM +0530, Varadarajan Narayanan wrote:
> Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
> ipq9574 as fallback. The single lane phy is documented separately.

Drop

> 
> The ipq5210 has one dual lane and one single lane PCIe phy.
> 
> The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
> qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
> as fallback compatible.

You are repeating the first paragraph.

> 
> The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
> specific compatible.

Because? I asked last time - do not repeat the diff. You explain here
why it is not using fallback.

Best regards,
Krzysztof


