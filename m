Return-Path: <linux-arm-msm+bounces-114455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SdtZHr3XPGq6tAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:24:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B516C354E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:24:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C4E3+3x0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114455-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114455-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C64E3011048
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF51A3BED0F;
	Thu, 25 Jun 2026 07:24:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8411D47AC;
	Thu, 25 Jun 2026 07:24:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372281; cv=none; b=Q7bLf0XuY7xjjcRKl/3nR7mHsMmL6aSaKwdi7UHD/ZZFHm3SU1fNhkHVibw4/hQZxDlF8SxQkVwe0EgYl41AsLGUDe9Qr73eH9GL6WtaOzNTwF51ax7561Rmgdc7q84XhSblDIvIN3dZhmVMzTdQaBr1afUnBwzBOD6NEmkxKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372281; c=relaxed/simple;
	bh=tgADfh0EdrTzy7lzOlJwRcq+VaeN/ikekakGmu4wCkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/2y8luSLzRzaCTKhUedWGT+bSsZObiTA1g55DjcuN9h0wWkzKpU/D6G/JvCXP7S01IpjFs+E7TIcxItm+mZ7UEbgtKtlg3eS25NWLZzt+BFyb9qk0YhIHNFZfTFXjESI3YwPYyCBjfXTcysUahWb4YgzbmMihLgQDpMWh0MC9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4E3+3x0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500E91F000E9;
	Thu, 25 Jun 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782372280;
	bh=szlf9WMEbP6Ff6qejR6ZQRZMLqe4N8GVxyJBVP9cdAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C4E3+3x0VOSFH0dFkeBFT8LkX/oEbOZWh8QB6g2J+48cJA86FJuWUw/PeyuQdKB6l
	 5U3PhXyhJvCXBjIDYLF2FFD2C+RwMKtWXlRlqc5HhNFqDC9XugMnRhytbEfpAVxMp8
	 xTb0sAnGKkZM0TTrY2qRaK1Ug1stzt5Tn1+/o8j0v/afKTx7jQX9ZEG4xIHEnvk2FS
	 jemzgjl/9q5d7vNnpS+7VZRkwlxVwLJWpFjPhbNJHj6L+r9oDyfWaupf6n34P2rXsG
	 GJIZJqyhyBH/kOvsn7uXSsaExB/M/ejYuhEp09nLOVgZY3/vD46S2zB58Pjc2tPUDp
	 YOfJdJjtfIruA==
Date: Thu, 25 Jun 2026 09:24:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
Message-ID: <20260625-strong-daft-pudu-21471f@quoll>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114455-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10B516C354E

On Wed, Jun 24, 2026 at 05:49:25PM +0800, Jie Gan wrote:
> The TNOC device is an AMBA primecell and may carry the standard
> arm,primecell-periphid property, which is used to supply the
> peripheral ID when it cannot be read from the device registers.
> 
> Reference primecell.yaml and set additionalProperties to true so the
> binding accepts arm,primecell-periphid along with the other common
> primecell properties.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> index ef648a15b806..9624fc0adfdc 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -32,6 +32,9 @@ select:
>    required:
>      - compatible
>  
> +allOf:
> +  - $ref: /schemas/arm/primecell.yaml#
> +
>  properties:
>    $nodename:
>      pattern: "^tn(@[0-9a-f]+)$"
> @@ -78,7 +81,7 @@ required:
>    - in-ports
>    - out-ports
>  
> -additionalProperties: false
> +additionalProperties: true

Nope, it is not allowed. Explicitly mentioned in writing bindings and
all DT introductory talks by me.

Best regards,
Krzysztof


