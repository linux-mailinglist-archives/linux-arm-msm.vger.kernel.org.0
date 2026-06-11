Return-Path: <linux-arm-msm+bounces-112643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hja0ENZxKmrFpQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:29:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E870F66FDBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:29:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=APdw0CEx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112643-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112643-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B2A93034306
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EAA37883E;
	Thu, 11 Jun 2026 08:28:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4D377EBA;
	Thu, 11 Jun 2026 08:28:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166527; cv=none; b=YgWCGTEI/C3Y9op0w6+pX9V+xPKprund5HNEDDYyyy1TEXnLo6kPgqxiXvdfa5UP8jeNYTycgDBtjdL1jd0sOlJrdM2YbeYQ+KQq13HtMYug18kBps2xTIirvVqddXDuXZDFAGlVa+mV+k2+t5rEbkUmx91C/th+zlGemIEWdL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166527; c=relaxed/simple;
	bh=yJ+2Fb5Y3WUBwkJzBeUs5i5EGIeX+wRWckwiMgI9y/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egZbKIRgEg+6NsDb0hNwyrtEPFQw9oNhAxP6lWUWJYwJcLHztIkHtVhtKYuPE9V1kQgESR1URE/Fc91x5dYVkrgGl2flMwybcyVPRUsqkZfi9RpDX2fYXJCI587Wr/5eGjlvmh6VM5RmzKBW89yq6aVZDnLLPJvBi398OT/YNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APdw0CEx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190C01F00893;
	Thu, 11 Jun 2026 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166526;
	bh=mIItnzeRNiCGiAYpvLIcP7qPLzcBA8tl5IY3rl/XUYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=APdw0CExym2Okn3/vvV8GOrsZ6TB/tJLjk/5HF640ogXmtlxxgRUTzUGM03Maeu/2
	 YF+U8YQWKmqVuI9ShLXz7YXg3sP3/NWEyDNgArco9r2K6AzcUnoQo7l/mfSykCMosH
	 8N1I8/HwVvVAmmKjyQKAIifqir5/JQP3eU2JIX4g85utftKPZ3OExdZNkF9qidLMQQ
	 rs1B4y1wQDD7U0x+zSWJ6bqcVoPiisYAYhrZOiPO1CvSmjIBQF0zGw3Fgoce0bKhCg
	 MDQFPDeSTp+6C8hzZ9gkUBLfONEvy1MO8mymt8SJkrDsYS2oUwhc9X6u6g9Jqxrvoj
	 Xj1KqBUxn04bw==
Date: Thu, 11 Jun 2026 10:28:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: PCI: qcom,pcie-ipq9574: Document the
 ipq5210 pcie controller
Message-ID: <20260611-swinging-hyena-of-order-fbe932@quoll>
References: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
 <20260610-ipq9650_pcie_binding-v2-2-69e27a1fbf1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-ipq9650_pcie_binding-v2-2-69e27a1fbf1c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112643-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E870F66FDBC

On Wed, Jun 10, 2026 at 04:30:54PM +0530, Kathiravan Thirumoorthy wrote:
> From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> 
> Document the ipq5210 PCIe controller using ipq9574 as fallback compatible.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


