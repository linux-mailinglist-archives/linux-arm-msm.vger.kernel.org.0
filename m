Return-Path: <linux-arm-msm+bounces-117554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a7Z0E24PTmqjCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:50:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B1D723574
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:50:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PiYGXqF6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117554-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117554-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C55630DFD84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273A4402B99;
	Wed,  8 Jul 2026 08:41:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF83F88A2;
	Wed,  8 Jul 2026 08:41:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500068; cv=none; b=oiKF3b4aVAEEnSUcc/zNCQgEIzkge2bgINm3IaGsYyBl8C0zNLDI8HK7Jv4uyY8TK9qfyAv8tyioVEUmAKbkVcVgiLisE3QzQt4MHnZK3LnwSWUmKe4DjZLGXpuoRNvYoTFVX55XUAqOaPAnNMlezaGz9jUA0SO0XKc5yLtFlDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500068; c=relaxed/simple;
	bh=tgdwSCNLn2wQ6Ikb8ghWJ2z14hWLrZR94l2YIZFgbzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb1lcDl8qgj3ZT77VrTcpLpsK9X1gfe+jWdtO02dM/GMFr/doSdtKBDrRVhbpqWQ/KpSNUs1B/ambD9OIQuzhrpvxcw1fJuuXlRKiVVympIeZGFf4e7bXO5Dz/zOt/hHPj4bmApOupj5Nzi9+vg+r0qA+C3QygOoAEpQLqfgcQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiYGXqF6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D8C1F000E9;
	Wed,  8 Jul 2026 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783500064;
	bh=SEJpeMvB0wWVlb8tJ7FlpyUKoTyFiUvESFenDMrW9Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PiYGXqF6OzzCLEUHWxpS0Gj7sNsuF344kudUl+2D06OgXf99DbR8xRfPBjr9w7iVV
	 yeyNme4a2tSLajFYejIY3l0vCBsFIUKCQDfCKccM+tDmhui47v4J2vDAbCzdYD+K+T
	 6eZI+4zCaQ4mNgBKUfCs5Klp93kRO15ty3H71q2c7JKgj3e+Ce2p5ormB2s9taAhz+
	 CjFGuDsgT5zY/G+xWeyHT6MjQX0ZPJEZsQba9YHsAFFa1gv8h13Dooo+q23rHimeMQ
	 A99lqQrDl/VCeNEua3uAT3jD9Y/5LeqCi2OxujPe60K329TfjxNjtJ7+WOaKX1JqaO
	 6CZNR5v6jDLXA==
Date: Wed, 8 Jul 2026 10:41:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add support for Camera
 Clock Controller for Nord
Message-ID: <20260708-mindful-alchemical-loris-5b6b3e@quoll>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-2-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-2-bae3be9e9770@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117554-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93B1D723574

On Mon, Jul 06, 2026 at 02:27:14PM +0530, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Nord
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
>  include/dt-bindings/clock/qcom,nord-camcc.h        | 167 +++++++++++++++++++++
>  2 files changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 8492a7ef73245e4440d6e30c2fd942319126458e..8e460df9f7444e80be537f7b9544db519c775ae8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -18,6 +18,7 @@ description: |
>    See also:
>      include/dt-bindings/clock/qcom,kaanapali-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> +    include/dt-bindings/clock/qcom,nord-camcc.h
>      include/dt-bindings/clock/qcom,sm8450-camcc.h
>      include/dt-bindings/clock/qcom,sm8550-camcc.h
>      include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -29,6 +30,7 @@ properties:
>      enum:
>        - qcom,kaanapali-cambistmclkcc
>        - qcom,kaanapali-camcc
> +      - qcom,nord-camcc
>        - qcom,sm8450-camcc
>        - qcom,sm8475-camcc
>        - qcom,sm8550-camcc

Why aren't required-opps not required?

Best regards,
Krzysztof


