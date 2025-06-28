Return-Path: <linux-arm-msm+bounces-62888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C40BAEC37B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 02:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99A444A03DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 00:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5686136A;
	Sat, 28 Jun 2025 00:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmBSf7UV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE46112B94
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069576; cv=none; b=bW112yT+yrewxmnIt+8s1VPh3w/Thc/lJy+r6vsmsItauCm21Zh1Ccj/gTlpZBqn0GXnkIPn8UMn/B4kUjm84rqYWcHnpO74zW4kRSD8NpLHszV8GRBlKGFB5LXSUcfxm53cOrbZj58azH3QsumViq9EVq9Ih3vH7Ws/JLZCUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069576; c=relaxed/simple;
	bh=8bqQ8U84P+FRqDSq3F4KLrzDEvU6RkgbtnUYnQ+g5YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuPYqzooGvwNtW0TVmjgZA96it/txJ9Vsc4jtHc2u4AJ4BiDeOanrH4hvBKHdkNVAD3zvOeGlpYNyWxBlx+/ohIQoOmGgDjg75R6DRkTvLkywdib9LMieTti3jXs9hDIGguIREBMVY2TEyNT9JtN3v972YD849Wzc9gU9iETSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmBSf7UV; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso17489175e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751069573; x=1751674373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PImxYHr3OSmCI17ka97beiCSKkKnJt+nKdZqCSncN8Q=;
        b=FmBSf7UVQ9P21s2lz7I3g3XnqJ3dLqr2l7n2Ttnq/pzhi6kuTL17Yr5nGXHtE1jZHc
         QreHlooLT64wGA5U/2pTMeHt93sxFBInB79HvUnAOM9U7JXei+lenaPHyoNPxhai2h3J
         gRFG5MV/wTM2vUWCwDd9ZR4gXTtec0WhnUa2eypXpfgfc+J59xNQlWu82eZt6Su9Blzn
         cUtKbCabNALdOYb/xineEO1dt8aoQ6HCJmJeF1PvMC+EdG9Dfu7JpvWWqqJkrvd78JAD
         tAUneKqF74W5BNmWqXBgI7i1AilquYHj9zNwAnymAzcmN6p6sMx4sNYPOkDctvanLe+1
         xGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751069573; x=1751674373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PImxYHr3OSmCI17ka97beiCSKkKnJt+nKdZqCSncN8Q=;
        b=cp84F0zQs7+RC0w5YOmn2pFw3l7HKZWJiANRxpWZRvZefsxEFX8cu0TmAMt2idDCbz
         0LfsfP0PG/to4UMPBs9/GGiC0w5y3xPJP1Dzxr8GBD2FT4tmpUjyN5KIum/Rxe5kHVvJ
         ArRPcHPAQhwwpoHyVe2n6b/XFeey9ClnSyqVz2qhlYvRp6osaf+VholqYQV5aElDnSIz
         JSLrtCpzueRTb0Mfl7NRTV/wL3VhYmKdZkjtedUhkSLrSxNy/O66xv/5mrh4b+Met9Ns
         7zpJ6rAAbn80MHXNYixVK2jSUeUSuDsahDOGGOFGqpg+2ru52WBn3YkKitdvem9fp0yF
         rthQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPXUuisC5l851U0wUhdeJf4T8JNaMfJmexh3+W0p0hWxHSfgvhY+KtU6PWfwyaZ8rK99XotdTs7OWhVj7F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7JOdtW1Uso0pxjqDwtPG3ojfOEyM7tEVBzKXFRSc0wGJxnOdt
	mZym55tqnNHkoZPTEARAQS6JmWP+URBJ21Zc1Fn4J01XLW7PpZFFzHIxB6hkv0NNENU=
X-Gm-Gg: ASbGncsxhvmNuqH9H0wD1nHe2WM2FK1y/Xs0W3W5OlCsNR+mMPnKgA4N4JlAecdtk1h
	dF14rTYTRYHf0x+ym+TSHoS6X15NYKQBbvj0TOktqFuVZiSqmCvElWSu7W3Xy7nnynRMamDpz8Z
	dK5478Gdn3goeKkafPD50jt3xyTBvMGDF7cMDBXPewhyUexFPuUCmHFn/02pv/Gl7av6UrYrpA/
	nBsmUeqtM78B9IFxPhhpJElU4aXzhfeeoiCoQyCMplX4oou9Ka5W2sG4lCbJa+WPV4eHQpAGE8/
	tSXoAivONK79m1Y/cXXaBmxfgMAlpQVlaZ6gEiV7piWZi5c/YnlC9gOdt+V/MnJ4aPulBb8ylQg
	FJXtCrHdKMX8HJhIWSS6hKxGEmHA=
X-Google-Smtp-Source: AGHT+IFn4AjBCHVO2EoBSnUsrz0IN9ZIcbAmCvFdZWWKZ3G1cy7qj59CpKXVM6SINcc+hvDyAzb3xg==
X-Received: by 2002:a05:6000:2b0f:b0:3a5:25e2:6129 with SMTP id ffacd0b85a97d-3a6f3152f1emr5790070f8f.21.1751069573129;
        Fri, 27 Jun 2025 17:12:53 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe592sm62779925e9.21.2025.06.27.17.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 17:12:52 -0700 (PDT)
Message-ID: <eaca9ef7-8acb-425a-96e3-a795b4cf1e6d@linaro.org>
Date: Sat, 28 Jun 2025 01:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: media: qcom,x1e80100-camss: Fix isp unit
 address
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 09:33, Vladimir Zapolskiy wrote:
> According to the devicetree specification a unit address shall match
> the first address value of the reg property.
> 
> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> 
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 7d4e6ef57bf8..959cff1a31a8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -190,7 +190,7 @@ examples:
>           #address-cells = <2>;
>           #size-cells = <2>;
>   
> -        camss: isp@acb6000 {
> +        camss: isp@acb7000 {
>               compatible = "qcom,x1e80100-camss";
>   
>               reg = <0 0x0acb7000 0 0x2000>,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

