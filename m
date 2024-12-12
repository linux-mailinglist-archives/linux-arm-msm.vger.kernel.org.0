Return-Path: <linux-arm-msm+bounces-41667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401A9EE057
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC5021885E76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D7D1E2308;
	Thu, 12 Dec 2024 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQqVSVJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D711A25949C;
	Thu, 12 Dec 2024 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989173; cv=none; b=jaW1WpREw8/7/tPKb5jOvu8ZRga1Xd1hyafQiIzNU0E8tVsvXbcjo5/QiZSN+xcnYTIibVTWN7TW+hyfoxOVFWoHSiHI8BM7jkBtL/11xTsLIlzJzyX1ZBEjgNbw18aSmPjhXHnm1muTe0lyc0ADeCEKcHWW5BEvpRMto1MJl90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989173; c=relaxed/simple;
	bh=Y9W66pQyOLfd9W0X9+s1tyXKIbih5w9zzQDcmIddlc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBQV4++v5/6IZ+z5PBO+DFYsAGj5NOD6JsgSxjONZeiRfVHgOo30wn1FoQU0C2SSK3cGlvN7YlDztacarJk0N8V5Mjqj7a5k9MUkZLYxtBdc/WLOwPQcNBLbHjenvRdZmFq+89fDJyswztGZ/eHoEJ+I9NnSSHfUrh2c8991s0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQqVSVJP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B205BC4CECE;
	Thu, 12 Dec 2024 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989172;
	bh=Y9W66pQyOLfd9W0X9+s1tyXKIbih5w9zzQDcmIddlc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQqVSVJPp88KbjVU0nB4195RTmdxfNqEegrNWbivjr5FmQiVlRLgtgW4FyxuVvjyo
	 KB6LZXyjQWwT16kCrQcFas2u3wzTkRlrtu2GhaPdjfYwY3XEV7Z40YJYHQwNhZmej2
	 2t37K3mjy3OAK1xXnueoVlkM1fSS2WoFI55p4++DKoadZ7VOo3dUybz5MXv6JzICbR
	 Al8uHnIzejMIkZD4VudjJf5LdnvsbcEsnaSXXz2SKLOCRyzaEbtul/Iux92MVWrNdf
	 IkuZocu6MDhbxRphFlZWq1Ot41LIMc8J/7RskvxJqAd5OPJ6fwOnYnphQpr3p8dO0D
	 FG0bmXE+oLa+g==
Date: Thu, 12 Dec 2024 08:39:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/14] ASoC: dt-bindings: qcom: Add SM6115 LPASS
 rxmacro and vamacro codecs
Message-ID: <hxrk6kegixpe5fd2xby5hnutcurogzzj5ngm62x42b3i26qitg@4f4yggyxz43j>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-2-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212004727.2903846-2-alexey.klimov@linaro.org>

On Thu, Dec 12, 2024 at 12:47:14AM +0000, Alexey Klimov wrote:
> Document compatibles for Qualcomm SM6115 SoC macro digital codecs
> (RX and VA).
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Changelog does not mention anything about this file (or I missed it), b4
diff fails, so what happened here?

>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 19 +++++++++++++++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 17 +++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index 92f95eb74b19..697c5591ae7c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sc7280-lpass-rx-macro
> +          - qcom,sm6115-lpass-rx-macro
>            - qcom,sm8250-lpass-rx-macro
>            - qcom,sm8450-lpass-rx-macro
>            - qcom,sm8550-lpass-rx-macro
> @@ -80,6 +81,24 @@ allOf:
>                  - const: npl
>                  - const: fsgen
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6115-lpass-rx-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: npl
> +            - const: dcodec
> +            - const: fsgen
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index f41deaa6f4df..30a44b444f39 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sc7280-lpass-va-macro
> +          - qcom,sm6115-lpass-va-macro
>            - qcom,sm8250-lpass-va-macro
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
> @@ -83,6 +84,22 @@ allOf:
>            items:
>              - const: mclk
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-lpass-va-macro

Wrong comaptible.

Best regards,
Krzysztof


