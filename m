Return-Path: <linux-arm-msm+bounces-114004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kob4DR04OWohowcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:26:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BED6AFD89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:26:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E6+pwgYo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114004-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114004-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99474300B545
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA4D3ADBA1;
	Mon, 22 Jun 2026 13:20:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6AD381C4;
	Mon, 22 Jun 2026 13:20:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134449; cv=none; b=b+Sar+k2DzeTMRgZp0oYqwsn3wgl77rRZN7Z/VRoIex543ucBiCF8CdlUYHgkJSU4oqJH6P4AvIbPNrqhgA581WYOnRIPMKUycoc+yiW31M5BfMbba0IKv6T9/zobb5Id+QnTv0oM5Ae65fM8UIrb3lumtnk3SNZQlGlYUzDY5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134449; c=relaxed/simple;
	bh=BmkLShQQSsd9Zy14x8AvUUN//pkPGPIpVsulAvE7YiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tx/zQlfncthfvuPGU3wr74Jvg4tzp4FRi4GUV3NMhRkGhfkCnGfgDxBDR42vxGMjMb4/c8Re9GKwlvJyaRqCsTL4jRfZgFz9fDExye2v0E8CGysKtTb6sYOF0PeoiZKbW+KiQL8VXHYQEEWjWHkzgEFfCn6W80CxfhLHZa4z9p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6+pwgYo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0B91F000E9;
	Mon, 22 Jun 2026 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134448;
	bh=whsnKoILtujHUBAeROtFy9LnxopDzLo7OcbVTsH4JFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E6+pwgYo96OrCnarKwUsKgphMwAd//7Dg1nfS1cz6xyeGcrrGf0qNVkOfTYizzg+W
	 sS0A0OMRmOtFspS/FoKYrsIVU6s1HUgwlELD25zNeYNi7RYpCPYXJXHjG3D00q3jnt
	 6lSisL1vwhfuMVTXdqT8f1/9sJB2BUKqKYmtR1Y63MivJ0Zt2UfRwyqVuG0okFgNqH
	 Jx6EBwdbekeGH9ohYYqy4jBkbHHkV9s/rj4dN22Ja8UKlxH61nFG5Jq7ZU7+7yESzc
	 c66+4z/bQiVCW40rdsHIIzIHgdbkwGAgfGJPur9z1tnW1nwqztQAQRYzuPvR9fFIfL
	 AjAg85fn2QjvA==
Date: Mon, 22 Jun 2026 15:20:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK
 channel for shikra
Message-ID: <20260622-illegal-cuttlefish-of-chemistry-fdfbdf@quoll>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616201315.2565115-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114004-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91BED6AFD89

On Wed, Jun 17, 2026 at 01:43:08AM +0530, Mohammad Rafi Shaik wrote:
> Add support for the modem_apps GLINK channel on Shikra, as audio
> processing is handled through the modem DSP.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


