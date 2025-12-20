Return-Path: <linux-arm-msm+bounces-86009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D07ACD2B32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 09:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75EC1300974D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 08:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707492F6928;
	Sat, 20 Dec 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKgEWuq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF84A35;
	Sat, 20 Dec 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766221021; cv=none; b=hVZl+FLNr+hnzi0CQd7WWGwgd96Zqjpo7rJlXj2nmCRBXmyIV/JmM7+bPKobe8FOeGk0dyGw0OQOm2aUhz5YzMJ32s65i3d5y3OdIrmLdj4s+QajSwc2Da/Q4cMM11Qdp/UQEhAaEQyM+lVp0ZmYkUZVHQt1Sx6WYVoMeEP3k9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766221021; c=relaxed/simple;
	bh=WnsUmdn4a/nYxPM7z7GAsLIyt/ZsTh54ZgIdj6D2txg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIKXMuaArSCZT/kbVrJzjBwHtQLbMsl7mXdG8cDes34SCO9qgKvlh1UPThDNiWnE6Z4xASft+AxfTjfQ57CvtFOop9MjKhZf/0YKg3NtTya9nNImsFOzyiiJQnGLEDwguGf8X6dyKvTX/wTRwdWJJtZGlP+Yf86u4QqiLlIIk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKgEWuq0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E167CC4CEF5;
	Sat, 20 Dec 2025 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766221021;
	bh=WnsUmdn4a/nYxPM7z7GAsLIyt/ZsTh54ZgIdj6D2txg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKgEWuq0U6C7wqAlOf+5cATc36Vv9IkOmfv6EscUD/Joe3uciufw2Uy1s/o2WQ5RM
	 Dz2Kgp9BdIgOKrcCbVd2B4lJvG0ycblGHmsNfOZwZRj25GvJqVloEw7QniBke6pe5e
	 O2So3MC1l34rVa9ir1o/HZSIunmtrNKcZRZfOdwlnJglLFxPAfx+Ih5DzwTZLneqvD
	 T0GNrE76qRuG4brti6fir5LViNazkR9ZM9sSr9HdNvpjAo6GdxFCZ1BOmlkJBsf8bM
	 Xf7I037SYry2u5pAiuSeEEqxrt8Se5kxKPDaP4TMNeiw4geWJTw3qIYylpQsF6Uek/
	 HJ6vIITkKaqXw==
Date: Sat, 20 Dec 2025 09:56:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, krzk+dt@kernel.org, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image
 loader
Message-ID: <20251220-fantastic-koala-of-coffee-e8ba1f@quoll>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-2-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219043425.888585-2-mr.nuke.me@gmail.com>

On Thu, Dec 18, 2025 at 10:34:10PM -0600, Alexandru Gagniuc wrote:
> Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
> to IPQ8074 WCSS, but requires several new clocks. These clocks must be
> enabled by the host in non-PAS mode, and are not optional. Add an
> example that uses the "qcom,ipq9574-wcss-pil" binding.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 115 +++++++++++++++++-
>  1 file changed, 113 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
> index dea46cb9f93fe..a665b704a835f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,ipq8074-wcss-pil
> +      - qcom,ipq9574-wcss-pil
>        - qcom,qcs404-wcss-pil
>  
>    reg:
> @@ -49,10 +50,10 @@ properties:
>        - const: wcss_q6_reset
>  
>    clocks:
> -    maxItems: 10

Either you miss minItems or you are changing existing devices without
any explanation.

> +    maxItems: 13
>  
>    clock-names:
> -    maxItems: 10
> +    maxItems: 13
>  
>    cx-supply:
>      description:
> @@ -107,6 +108,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,ipq8074-wcss-pil
> +              - qcom,ipq9574-wcss-pil
>      then:
>        properties:
>          qcom,smem-states:
> @@ -117,9 +119,47 @@ allOf:
>            items:
>              - const: shutdown
>              - const: stop

So why all devices have now 13 clocks?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-wcss-pil

Just keep the if:then: per device, don't mix it up.

> +    then:
> +      properties:
>          clock-names: false
>          clocks: false

Best regards,
Krzysztof


