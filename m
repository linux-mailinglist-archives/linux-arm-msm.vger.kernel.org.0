Return-Path: <linux-arm-msm+bounces-113972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p+tnFNkVOWpjmgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:00:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D16AEEA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:00:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="lbyXSF/I";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113972-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113972-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A3D1302D947
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00C6363082;
	Mon, 22 Jun 2026 11:00:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC81D19CCFA;
	Mon, 22 Jun 2026 11:00:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126036; cv=none; b=CC+zJAYDc7kzq3OlsHTrxP32mVfntrOyPOfDZq1tli/QhZxqAQ+nUUwRbsMMs6Jx8fihtNCQ53jGiB8nqWEcrJV/a3hY3690vo6IZa9bwewoevKp1VVQCTReHW9650HmhpPRLBts37kQUnb9hWgh14aqCQeuSz0/hJ4DvhcUfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126036; c=relaxed/simple;
	bh=Ky/TnAMLpqlSol2bBvZwuzp7GMA7SBqNT0uh50NvZkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAOz1xIns28XoXDtuPfSo7UqLQunyZSzNN/rpdB9ciZiepO0egFN4A64H/L6SS0r7G2pdjd3+gR8Mp1aoCgXgHTi2peY+Anylkvw8Xyu9FBtD9fjiaCklqpnBBk4Ijjv1MdqxF293W76SWCvV1HcISv4SCS/32vg2Hc5ym+9f9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbyXSF/I; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22451F000E9;
	Mon, 22 Jun 2026 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782126035;
	bh=FUT6ZwoPwzkyNOnrWPcaDduAmAPOWQYlWzWcdRpg+jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbyXSF/IHPczLXADHFJzmFVBwfcosBclokbNfFrmWGlEvLzWJGsqCLOz4AtsCO/uq
	 Pty8EglHWZCnLZqqblH68f3cHQ8D1f15gMDEa70Aa9tCHG55IEOWEAm8zRfFUEmFiC
	 w0hfFDtGz+zFx2tTxXB17rCPYe6kolENUv7p/0HCEzs7qxt42OSKzdCROjj0LU9Se6
	 T+fU08NMBsAidUrXS4wBeWZakXb2zn9Moyw9hz5sLJC52o1ITiL3/lzpNNyQq5m4rJ
	 /F+kPI4fkU3KV0LCfjBgcL3MWuy3GNwaod4r4kPoUa7YAwiLi5aHHiF4RtXXbfrNl0
	 auVW0MzAb7MLQ==
Date: Mon, 22 Jun 2026 13:00:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its
 reference boards
Message-ID: <20260622-brainy-rapid-tody-dd7c3a@quoll>
References: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113972-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 998D16AEEA8

On Wed, Jun 17, 2026 at 08:46:02PM +0530, Mukesh Ojha wrote:
> Add Hawi SoC and its reference boards to the Qualcomm binding.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com/
>  -  Fixed the position of the Documentation.
>  -  Corrected the commit text.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5e..e229c0097e6f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,11 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
>  
> +      - items:
> +          - enum:
> +              - qcom,hawi-mtp

Normally this should be rejected on the basis of lack of user, however
this is an exception, because the soc compatible is already in use.

As an exception:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

But if ever this commit is used in argument "oh, compatible without user
was accepted here by Krzysztof, so I can do the same", I will
simply NAK such future contribution without reading the rest.

Bjorn,
Please grab this for current RC fixes.

Best regards,
Krzysztof




