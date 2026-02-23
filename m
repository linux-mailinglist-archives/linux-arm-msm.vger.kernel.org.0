Return-Path: <linux-arm-msm+bounces-93740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKL0GpqHnGm7IwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:00:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D904E17A410
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F4D23031F21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C683176E0;
	Mon, 23 Feb 2026 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K31uXhJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DB30EF7D;
	Mon, 23 Feb 2026 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865797; cv=none; b=Cv0nzanYaJBrD6xVGZb3+07ej4m5Li314tq/80sWb3LnXskBzbr51t5wSF9wUYg+QdrBpFgNlx4bva8iAGH4C1nt5YVQ/ExVAlhgxb9TG1tk0/EqmQxO/J/xhvqVcJ86kxucpI+H5KBkqbGdwjGVDg/xfTPg+OBUXcBRMhnuPow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865797; c=relaxed/simple;
	bh=Ga1zGIuMJiC9p747sifV/Hi0yYOYaGCt2sm3/JMYDbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZTrEMl26P8VN4IsWeE6/B4FW+3fN5Uwemv/uxch27oCy09FKq1W4VUGbT5WxRhqeaaCbz976WfGVZ3M2GsCv8lgXPQjhicbLHzrRHmUu/dWyNuzAMcIAjf3XI3LHEv1TFOphCyHFwtpC1QR57axfxDWFvG1RzclsgFPkj45ikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K31uXhJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55E5C116C6;
	Mon, 23 Feb 2026 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771865797;
	bh=Ga1zGIuMJiC9p747sifV/Hi0yYOYaGCt2sm3/JMYDbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K31uXhJa8u0PNnV433BQ3m5E2QEuQ9YHnuv2rVL3rjJe0cHWKVPInZEtn6DQlSa9I
	 /32pBCn5jbECOl5nynqlr7C2h17XKjf/oMdpSYr1rRaUhynOg9oa9kyw3n7JchQq6w
	 Y4nu4XOiJZpwRFkktx3IvpCYTQYD2O86WXZNSy+aJ0bUWGYt1UjW/KTX3e6m8m3I5w
	 lr25sHNFWJtYJqusiLsxX6B/jX3FjJgh+4Qjc7CUNDsMEpRxGz/RRX8Tj87mudHvG7
	 LiW6cBiW46pizRZxQoDaYYKZWqY+OsjptY4I13iMTPmt3w6HD6tPt6whgAMHIV4KsD
	 Q7WNrTmuh7Etg==
Date: Mon, 23 Feb 2026 10:56:36 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
	r.mereu@arduino.cc, srini@kenrel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4124-codec
Message-ID: <20260223165636.GA3988149-robh@kernel.org>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223133950.221234-3-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93740-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: D904E17A410
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:39:47PM +0000, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
> Audio codec has TX and RX soundwire slave devices to connect to on-chip
> soundwire master.
> 
> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> [Srini: reworked the patch]
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index e5931d18d998..f58a85562c26 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -145,7 +145,11 @@ patternProperties:
>  
>    "^audio-codec@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> +    oneOf:
> +      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> +      - properties:
> +          compatible:
> +            const: qcom,pm4125-codec

Don't mix 2 styles. Just do:

type: object
properties:
  compatible:
    contains:
      enum:
        - qcom,pm4125-codec
        - qcom,pm8916-wcd-analog-codec

required:
  - compatible

>  
>    "^battery@[0-9a-f]+$":
>      type: object
> -- 
> 2.47.3
> 

