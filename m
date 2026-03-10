Return-Path: <linux-arm-msm+bounces-96572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GpWIw3rr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:57:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18228248F3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 816AA303136D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40CA35F173;
	Tue, 10 Mar 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q70qclMo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078B2D0635;
	Tue, 10 Mar 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136561; cv=none; b=o5YScuyYTWk5eJE20VeCwSOAy41J7ojPinCwFnI/BqF53Qy5uyXZ5KxTLfs45J4ReKqCH0OF9Eu10xbBwRFUKRmmqJkQJrsndiW5WkXJhHDgeBGWw8D15XzM9l+qU5MhfH7nCo1vvJZg4XYtCKxWrIXR8SrBec+DBhBsKdo0+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136561; c=relaxed/simple;
	bh=+r3tE95HrRQqcdSdgD0hfWaR76TCI4iD6VxCNk0yqlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcZVobJDIc9WLfro9tscmP7cw8lHQnT4Ep9Vrs8aRQxeLo3bQCwSb/xWekBDPrj+i/jeSPnSVahJ4XMsIKceCLd9/9z5nHF/1OuoowftVU32c6JQiLTcvdpZ4tLtkdM5EiMqXzZ2SgQONgqS1SFQNKALX3v1jVCQSRciqNPpcJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q70qclMo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA0DC19423;
	Tue, 10 Mar 2026 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773136561;
	bh=+r3tE95HrRQqcdSdgD0hfWaR76TCI4iD6VxCNk0yqlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q70qclMogNYUV+95K3evAVuHNX8opxG7tz4kF/m5eq4tYrCXz06FJP3s8hWHs2q9p
	 GqXVV1HB1JjlpmDVN0ux5CgoHTJu/c5Bc9/S+1JFza60N/1AZ6VL681c4ThAyHe8Do
	 IwUwrzu4wKmXMtlVcodvTOb3IABQRhXND1ZWaGe/KwqJlwR4wTMbNPmo+D8UvQFfsy
	 D8X6ZoOxX1LZPZAW3qP/jqm3D7Kx0aMIglIfFNFIQb14N31+wmSfMZ4oJA/58QiZSP
	 WutP0v8KyATrwWkLsai7GN99I5e8p2VRS0HbnE6sNLXZo85E6ygV2G9nuJR/NlgUBf
	 WjvlAK5I+Vavw==
Date: Tue, 10 Mar 2026 10:55:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260310-crazy-screeching-angelfish-297bab@quoll>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Rspamd-Queue-Id: 18228248F3B
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96572-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.16:email,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.
> 
> Qualcomm platforms like talos integrate third-party audio codecs or use
> different external audio paths. These designs often require additional
> configuration such as explicit MI2S MCLK settings for audio to work.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544d..1d770cbcb 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> @@ -21,6 +21,34 @@ properties:
>    '#sound-dai-cells':
>      const: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        maxItems: 3
> +
> +      clock-names:
> +        minItems: 1
> +        maxItems: 3

No, this is just way too generic. There is no such syntax in the kernel
and this should stop you right there. You are not allowed to add your
own style.

I don't think DAI is here a separate device needing its own resources
expressed in DT. This is still part of ADSP so you just described in DT
internal routing between two services on ADSP.

> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - '#sound-dai-cells'
> @@ -29,7 +57,18 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> -    dais {

Why?

> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
> +    bedais {
>          compatible = "qcom,q6apm-lpass-dais";
>          #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai@16 {
> +           reg = <PRIMARY_MI2S_RX>;
> +           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
> +                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;

So one entry, not three.

> +           clock-names = "mclk";
> +        };
>      };
> -- 
> 2.34.1
> 

