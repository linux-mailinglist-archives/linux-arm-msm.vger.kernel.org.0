Return-Path: <linux-arm-msm+bounces-101488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFwJFU8rzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:39:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4DE3862CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57231301462F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B883C3C10;
	Thu,  2 Apr 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HW9C2hb2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AA3BB9FC;
	Thu,  2 Apr 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119163; cv=none; b=EV+/4x+2C/zwWg66hEW5JdWKCBCwLncF4UdTS8NNBE+1/idl3CWyi+cIOe68Bc80Jgjyz12xlXtfcU8Lsd0BJqpCc04CdPnJKhXhyLDne8NrwqsfKz91w1LGeMmIHqMOWoTeCgTIzbXmhiTmGas9QeauoTWU9DjHWVQe4mSrVWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119163; c=relaxed/simple;
	bh=CxpFDWJaAetREy4HY6zBi7yNZeIfJONcSQZedP4pSAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+7OVUHxT4/IT6THuACXdpaYoV+Tn7YFQ+nVAGoewwycSlfcrM75RV8DYhGVAiD5pvH+0iKXGaAaYnMbBUzMN5VeZ+UQTYzyg6m8MOw8oXoaoEa5AX+6snnOWwOtG5Vt9uh5ybmuVhgC9ip+6IFfSopmOS3jtfPxKCxxOevPb5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HW9C2hb2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B86C19423;
	Thu,  2 Apr 2026 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775119163;
	bh=CxpFDWJaAetREy4HY6zBi7yNZeIfJONcSQZedP4pSAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HW9C2hb2mB6Mdl5GJS2NurRG84KbcB3et7PnmsBFAwB3Nl7gvvGmiznfTE7t1BQVU
	 Qpufi0mBRsAxJhJHNK6905+ZSOmFH5r0d99zR84LVHSSd1PlNJrCjLv2PAn/gUMVs6
	 bi1i+6iO1e7ykyTB5MEuVb5pBvkpU8jZtLIjo09zNgupPBvlrGaoyRiMUwYBS7dbFw
	 3enG3F+K5p4IMljHeJ7dmsWAe338zSv7uXltHVHhb3Pc2raF1exubL3AIVgCnpWUps
	 SW/QaMxMupdjfxhzrtAlAwHfJoiGRYy0ac5XVlNPwvkAMcP/OlnyHS2ofc+fu1HpSy
	 RPiQVRhmXViUQ==
Date: Thu, 2 Apr 2026 10:39:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Hawi watchdog
 compatible
Message-ID: <20260402-little-dragon-of-bloom-8c4ae1@quoll>
References: <20260401124442.591803-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401124442.591803-1-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101488-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED4DE3862CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:14:42PM +0530, Mukesh Ojha wrote:
> Add devicetree binding for watchdog present on Qualcomm Hawi SoC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


