Return-Path: <linux-arm-msm+bounces-111553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bMdEJ2MwJWpiEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 10:48:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E164F29B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 10:48:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U4UdCNYy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111553-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111553-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270B23010BA8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 08:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB24298CB2;
	Sun,  7 Jun 2026 08:48:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD17404E;
	Sun,  7 Jun 2026 08:48:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780822112; cv=none; b=W+A1UWg4TYuFmZKf0/CyJmgQWlwbqgCeHZXp3BWfqPS2KBeLb0jxAxOMI6VL6wrfZusacCCTk6l159DYLaw0UI2h4aO3fqe6Yq+qmzlIkjbZgjaqjrROqTgAuQtW5t2AB39rJCRqhuGs2LJVvIPgfE35HCKRwnX/8SIFPE1zUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780822112; c=relaxed/simple;
	bh=kZgPsZB4Y7dtuhyYaS+8LCL1SC9e7xH6JgOGoG8isGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmeGrnhF3/T0JTIFf+mhw7j/sRRGsphj/0qpI161d5LWEhPyzFI2MATmntsP8eqJyGF2Jcvwo6/mBYUeABn2mTPwrOL3PsrPIJXeoUEhTX0/lk437s8lSgA+BqzGRztEo5HNWQZq97WVaBwWy1wJD6MPYvcsoGtrn6ox4ijfn28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4UdCNYy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CC11F00893;
	Sun,  7 Jun 2026 08:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780822111;
	bh=kZgPsZB4Y7dtuhyYaS+8LCL1SC9e7xH6JgOGoG8isGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U4UdCNYyss7mbf96SJnjIE9hiG17oZb/DVjMdxkUROaHqSoziNNReXH5Ul4zQWcO8
	 9BfUadQ6M3sGXO+YuOZ4s3nenx74cFEzMLvetFg+xUBeb3US+imB0hZtuxW2YEZXsx
	 H+h49By0jqi+Of/8u1qtxQLHQL4oQLn4MrWxtZ3E+pydxNTWAr3B7AwbxDNEI1tdsb
	 sS2HlayNB6v16d0zL4GWDY5k3RAS4slYXNWLlMUlVTdleACJ8YusiFlE+BqOxz2pmT
	 2sbKK2XLmI6EC1r3WZFOKXRT9gMwaKu/x1alFGhlFp2uK6zn5IeY7YAQdyz4U4k6lB
	 OtnzQy2vUR21A==
Date: Sun, 7 Jun 2026 10:48:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
Message-ID: <20260607-devious-active-bobcat-1078ab@quoll>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-2-6b44c9c23d5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601-eliza-v2-2-6b44c9c23d5e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111553-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 319E164F29B

On Mon, Jun 01, 2026 at 10:59:45PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe controller present in Eliza SoC is backwards compatible with the
> controller present in Eliza SoC. Hence, add the compatible with SM8550

Eliza SoC is compatible with itself?

> fallback.

Why reg, clocks and interrupts are flexible? Are there different
variants within Eliza SoC, e.g. one without msi?

Best regards,
Krzysztof


