Return-Path: <linux-arm-msm+bounces-114617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9nGoGRZVPmq2DwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:31:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9146CC1BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:31:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=B4qATcVk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114617-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114617-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB7D23027339
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F5237D13D;
	Fri, 26 Jun 2026 10:31:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A3736CDFD;
	Fri, 26 Jun 2026 10:31:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469898; cv=none; b=IPxlAUQMVymB7e+hBfGpFm9bDUX3dBJVBTQX6Z1xdKn9Y05SL0wyOMKvrgPmwSzypwoPgBgnMYiAQgyt2VClWtVhA87+Vaj5nyWKYssHu8/MO8TQvLYOUA5YnzkXOIGE9fZh+RGWnwjI2wLSFWWqAgEe2/PY7b61ToOyQHaj7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469898; c=relaxed/simple;
	bh=LUARlZiZ0x4Wd5zKOSyr2PskgH/Q0CBjej8buUc5fLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZlFB7mIy9onc6JHbXUIiBQ+yY8XXx3xPm2GYmo79dCxnyfLEoHAxJ1x3kPIzWVWBr41uyCj6HtIdRFnJfqfIq3mlsK+l6+KLd1sCWMsTPTwaEnKGxFMG1cIminJQBDx0fT/2yiF33fbdVzvIB1BxNA3F7DX6hSQbkDchOiMDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4qATcVk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27E11F000E9;
	Fri, 26 Jun 2026 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782469892;
	bh=v3K3K//vvfEflsWY7tm0eval8/Ahb+426O2mAdC2cYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B4qATcVkLg9bMgbDEtao6y08hOZCLycTIm3Au2MFly4irjQfpWmglZLNiYJFnxX47
	 o2JamQB5odXKpYd6qzJaeSQdFpnUqIwzkxsjNDvOZFZq5vTRm8ioujvWUXHD1G95tl
	 8nqjFibsjtRiXFySn894Y4lIFW9cHbhPeMApmQAlrOm1Cz/zO9KZNE4RlUcxhrN0yW
	 5vLDxaR50iX+FTLXUzjRhRXtNfag/wMsfeJZY31cWUBGOWgrXCkL8COxXqHyUaSLBj
	 WQ4F+WXQOg70YP/vTOCPn5hqyYzW04dvKtuRrNpud8k3+CPZDPNTm8ndiKRdlo87QH
	 3P2EV6QOSQaPA==
Date: Fri, 26 Jun 2026 12:31:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom: sort compatibles alphabetically
 by base SoC
Message-ID: <20260626-watchful-tan-lobster-ea717f@quoll>
References: <20260625-reorg_qcom_binding-v1-1-f2c6501f7401@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625-reorg_qcom_binding-v1-1-f2c6501f7401@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114617-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quoll:mid,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE9146CC1BF

On Thu, Jun 25, 2026 at 04:02:02PM +0530, Kathiravan Thirumoorthy wrote:
> The compatible entries in qcom.yaml were not in alphabetical order by
> their base SoC compatible string (the last const: qcom,* in each block),
> making the file harder to audit and maintain. Sort the entries for
> better maintenance.
> 
> No functional change; reordering only.
> 
> Assisted-by: Claude:claude-sonnet-4-6
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 490 ++++++++++++------------
>  1 file changed, 245 insertions(+), 245 deletions(-)

Well, close to churn affecting possible backporting, but OTOH this won't
get backported ever, so fine:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


