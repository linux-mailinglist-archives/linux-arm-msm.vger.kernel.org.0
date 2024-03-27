Return-Path: <linux-arm-msm+bounces-15355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D388D96A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 09:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 646531C27516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 08:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DB02D059;
	Wed, 27 Mar 2024 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hu2GuEWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D428DBC
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711529142; cv=none; b=BcCfWwxX+bkffJ5xzjbqK+NXhZrSGF2NSl1v8x/+kkNFxlm4rOTg3xilzRtcovtOuDPcvmLIljXXnDdEjPohdwg62F12Bn54ikCtKvksSHy3j8rr9CDDLLbbUf1+3hyhxMwF0HO51MhtR9m8sN0S1xOBmh7uMAoXm1hrhVH5iBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711529142; c=relaxed/simple;
	bh=8LxV2oYMEteNdNKhcqeVoxM51xIz0LDGBRYZ3IkCmTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKdQO7c/1S/GXU8R/UNIorh0U20cx0IQxyKuvyMzrHmiX+t+W5Zgo53/C8VnZWjh2HFzcQSJWxhAnJsSVrFjCeO9RDyAk2aPdT8aQvFKkhnpjWuS7mccO6xFUVZfFONuVpekmUMH5XGTp9XKqAJR83jVFBzEiOPxPZQ3iALco5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hu2GuEWU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so6956251a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711529138; x=1712133938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r8BP+MCy3AdS9LyyLDmQs73spIFElgeUFz99v6HNODo=;
        b=hu2GuEWUfJyJgH8yX4OKmTDbTMtS1voaRha6YU1w9h7raKevMnswpv3WvyNUSVJYFH
         82gVi9P1DQeqmRfC8i/M5ulxfBspXGW4Im8BYVBHo3fb4LhLF3OzlFYMX06uxPrPD4bn
         qTd3zFLKmBbSIV0rIEWYUAmOrZd4IrNER04zyy6ETAtfUVUP+6Q7Hoq74gE2K+USC8/T
         bwrw++uNNvcXTyIW6jh5AQ7alFbTHN4olMGYTE34cRvAtDlT1RXOK+ENsJR7hxIH5/eV
         fs3IJOwfkwF+6MH4ey0pZWQVfi0ixji9vLKfFothbu1D5vGjgTAzJ7saysUpg7NjFwa1
         WJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529138; x=1712133938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8BP+MCy3AdS9LyyLDmQs73spIFElgeUFz99v6HNODo=;
        b=Tl6fzMEGUZ3OHYW19f564pLA0oExLUl6ZS60es/U2LRoj7Hw3ujcL/9ptl9vXy9PM8
         K8ZHAWx5WVQ41Q/kBJ94tdFYHSLpbz+5NPNukAcZLRuzONmVsgYxV79Q1heqAqrVoLUR
         tuuR+QMVP46lg9nT2+VyXUnvqOOyeJPQCq8B5c76SaH7w63ui7k0loCfOw0TNTpbKxyO
         HoyQctZ5+lIsKTpaKf7u74OS+yhNMadT1h+iWlj7P1fp9Dj9xI1X2UDKIldYk6SGvGjQ
         xWkFc9oyFsmsY0FDYFCNwQbNeDbK+EM5KEXxp9k9MA3+NxGBYR0pgJUn8w6tLOZMWV7Y
         GUSw==
X-Gm-Message-State: AOJu0YwVAYtr++WFNBjO3vQZcFUnknG2paw+9NsUzZFhMynAiGoIY72X
	Hz7e9KWiNd+mBAUGeFZplcAFxNQEFx2Mkn+xd1EclysW/ViN6q1N5JgFVBg6c7M=
X-Google-Smtp-Source: AGHT+IHjIAlddboa9XykGoNLXc01Mdt4XEaFaJGmrWPdKgUJf366vO0vDkSTbaFFy1k09NBYQvpiww==
X-Received: by 2002:a17:906:718f:b0:a4d:f2a3:9c3e with SMTP id h15-20020a170906718f00b00a4df2a39c3emr492847ejk.4.1711529137940;
        Wed, 27 Mar 2024 01:45:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id t5-20020a170906a10500b00a46aafc6948sm5104887ejy.74.2024.03.27.01.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:45:37 -0700 (PDT)
Message-ID: <e9ce004a-952a-4a94-abe9-2a8dd96b37fb@linaro.org>
Date: Wed, 27 Mar 2024 09:45:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: sm8150-mdss: add DP node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
 <20240326-fd-fix-schema-v1-1-4475d6d6d633@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240326-fd-fix-schema-v1-1-4475d6d6d633@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2024 21:02, Dmitry Baryshkov wrote:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> index c0d6a4fdff97..40b077fb20aa 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> @@ -53,6 +53,16 @@ patternProperties:
>        compatible:
>          const: qcom,sm8150-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm8150-dp
> +          - const: qcom,sm8350-dp

This does not look right. sm8350 has its own mdss binding file.

Best regards,
Krzysztof


