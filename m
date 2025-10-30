Return-Path: <linux-arm-msm+bounces-79568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F776C1E8FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFE414E6B40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2122F83BE;
	Thu, 30 Oct 2025 06:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8fcdWt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9239A2F744F;
	Thu, 30 Oct 2025 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761805810; cv=none; b=c3OGvwJzGNc1HXF/y1a6+l5YQdOgxJ9KorMpzY+LJ2EJ9lgU4pVEpDAOG6LKt+0kc+iacPcIW7+Ac9D1SsAYCYN3TvwSSRsC11+Gna3smkui+cm/gOR1/eoLguLa7O+719M++ojNeko0uidQRYi5JW7jp5XVNxAYyG/wCr8fGL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761805810; c=relaxed/simple;
	bh=qj2BZ/nv8I7YMpz8gUgYrt5ObvzXmgUVZDC2GuWXJjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f13QaZH5Ef0l08SvtED+prEyBs16QcUoxgm9EkAXeOKdMmtpR8HC5r28dhHyeks8+faezVgiZXcJBFj5zOGKJ144TngCS2qIIzpqiSYhhkLt1LzF8D/jWsdjF8HFxuN3nnomOd3lleoBf0KhRPw/js9y0KvDXaY12MWb+lQgUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8fcdWt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C71C4CEF1;
	Thu, 30 Oct 2025 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761805809;
	bh=qj2BZ/nv8I7YMpz8gUgYrt5ObvzXmgUVZDC2GuWXJjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8fcdWt31RUFiEJhdm8gcCMkZu4AfT57uA2txrYNY7upTZj2gt2PDEQeQY1pVw+tf
	 2Wa1WMl5SaPdJ7lNXSyR/+RjhNfOiBS5qUmfG6iuWQogNOXNF+RzCnN+uWYbTEuk0/
	 ZP/L8H/ufRRyhoMTCOM8yOWeArImBlmw+yfh4Bz5FRD2V4fusweJNAjT7hTmQzfkbj
	 oyUS4wcLi2NsPZGCuwmjGRsssLQTBkf2jV5VEOpqnM3oKVqXBN09LIDn8baz8BueaZ
	 AJMdH5wg/LsH0bTMb1hVoWgpDNAq6dL4G7iplRPyLZtNSSSXW89eSR3nmCFjYIAZte
	 VAc0xLoXiT2qQ==
Date: Thu, 30 Oct 2025 07:30:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	srini@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org
Subject: Re: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115
 LPASS VA
Message-ID: <20251030-flat-elated-pony-de74ab@kuoka>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251029160101.423209-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029160101.423209-5-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 04:01:01PM +0000, Srinivas Kandagatla wrote:
> Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
> VA macro codec, which looks like compatible with SM8450, however one of
> the clocks macro is available in this SoC. So updated the bindings to

is or is not? Which clock?

> allow min-clocks to be 3 to be able to use SM8450 compatible for
> SM6115.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index 5b450f227b70..1ac3392776ca 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -26,6 +26,10 @@ properties:
>                - qcom,sm8750-lpass-va-macro
>                - qcom,x1e80100-lpass-va-macro
>            - const: qcom,sm8550-lpass-va-macro
> +      - items:
> +          - enum:
> +              - qcom,sm6115-lpass-va-macro
> +          - const: qcom,sm8450-lpass-va-macro
>  
>    reg:
>      maxItems: 1
> @@ -44,9 +48,9 @@ properties:
>      minItems: 1
>      items:
>        - const: mclk
> -      - const: macro

No, that's ABI break and I know existing code works fine, so there
cannot be justification for exception here.


Best regards,
Krzysztof


