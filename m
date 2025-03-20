Return-Path: <linux-arm-msm+bounces-52119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B3A6AFDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 22:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28DD1896732
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 21:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29AD1F8739;
	Thu, 20 Mar 2025 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGT31qBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1085E1EB9E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742506461; cv=none; b=omEgT5M7HezPXpM2NswdTw+SAWFvX/urYO15NDpKboSmlqpWKcWhlLLl8S+Gp9d4XAVJ6+c5wX9qrURQkTBDwY2mgjIjC7NWNBOCFiRD2HGkeoZ8ijh4NUyXgMCWVsxlcPjaYeS6TEwAvTkPO9VyGd3/xKXtElTkCWhY9ItgtP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742506461; c=relaxed/simple;
	bh=mOnDqgj0BSZmK+Rt4jod6O1D9Yk05JHk1R77dSq+p8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KX3z0rq7RKRqkP4XYqp+6u8E6W3lnhU0hl8GS2PeKTCYLFQmHT1CH8m7jCD54fqxujfwTdGSrrX1smOkJ30nHGtun3n2r1Uqm0yqif69o6Pqfopt4wy8bueE2toUFwA3x0kQvOBh7HLqgPiwLFRRQpoN1tfIvJ89zyi/HH6GpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGT31qBd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso8411515e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742506458; x=1743111258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=cGT31qBdK2VlXckzYhgSbUwqq6j4Q4utLzzwfhz+8PtriJH2ViChHswg+UFsVF5Yjr
         SHLrFkjei4URpXCT9LcD9zXov2fLgLONAHLBioclh0axjjSz8F03V6Ju/uKCShFO4qjC
         E0/euujhohMkqsFbK5kREZMTc1WYIrIO7HfueeNTguSceBAIYTbp8MYKp9N72HeUFC/h
         TAUr2huD1MTE/ylGFPlvhoYgCRTmEys9xOaz+2t3hf44mhzpL2zPKhFM0NteW1l1edGI
         14rNwfX5b0T4rCEx7jyI9noi1nm7nkdEclZQWakxsdl2y9cGWjAKvqUMZPSECg5dT+/K
         hQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742506458; x=1743111258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=NHPk0v1XrmWzTZW1AKL5YYklUb/7X376UbFETK9a4jMRIpdEa7D2OQYAc+4YdO5+cW
         7Cn81qTUsDTEpBUL7NTJBd5PjoOGhNq7KGauFbStSRJ8JBt0i707GFDLmun8IJCFF4fm
         IaMApNi3bi3cbaLjRuAQcOWywPOBY3lpRNbcpDdk+93soTbpvdr+Lrg3R99/TvBAl3Rm
         vlEhmOtfanH5GeRFNiEl9Pjz5Ds/N2pTxF5ZA5XR8kPCI4YVLS3ZlQv2QT4YHWot7BTA
         g4iKIiZ0GQor4bvjKCr1qop/v+zETRDBA40e62n0W6dM+CMeXU68j3bXJDiZl7F6TyLu
         xhsg==
X-Gm-Message-State: AOJu0YzjP4K88+CVavF8XclNbUGHkk5Jr4/zvxETblhTy5grORxa1yVv
	1j9a6oGD+SErPZ/lSYBPBGBgFYObuOsu6lcmr57kyr1/GZScmgXTldR9xvfMxNc=
X-Gm-Gg: ASbGnctVcVfQ1qb7tRse1hSbayESF3d0Alok24FFkQ7qG9jvQnxH2L45tDyaGT4HdZ6
	Mqn0o/6zA4mNKyTdtenq9cFHF1aEK7nAjeT5md1099sqUEVuKA+w62IUfVIrIzCW2sH4oc2mqlV
	d7VOxK345CXmsp01jBpxfuv9zzuFQg/p+AKZP4S3xKODZBLR+T1A+QUjbwW5uS/RRWFIC6l3c/K
	+Ku4RsmpnbKWF5ZgWIKWc0hWrt5Yu5JYVwKVtnsoVP9EbyuEqpaK5IxuxJIKuJ44eTf19EE/SY6
	wjAUVWCTIbfZ4Bdl39viI+D+gM66fmoACin9L1QqzkdBTsgJvfLCnJq2+FcXoOdKH9GqBXIn6cO
	Kzkkeej/GRA==
X-Google-Smtp-Source: AGHT+IHQR7pkacXemvapFQy9AD+rGlE3cMkaNllM4VM3ccQmOQ8FA68ceqVMTtWLDwQnmI2/UxzSmg==
X-Received: by 2002:a05:600c:3c9b:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43d50a31ffamr5334675e9.20.1742506458138;
        Thu, 20 Mar 2025 14:34:18 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995766sm625994f8f.1.2025.03.20.14.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 14:34:17 -0700 (PDT)
Message-ID: <49512bee-906c-4587-853a-b36da7a4407d@linaro.org>
Date: Thu, 20 Mar 2025 21:34:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 sumit.garg@oss.qualcomm.com
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
 <uD9su4uJAo1PBanhrBSliY8k1KZvid_UHJJu8OYLgugkOMHBgQaYSpv93UpTrJoAzgsUMH-HomFg78fes-aqQA==@protonmail.internalid>
 <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2025 02:54, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SA8775p platform. SA8775p and SM8550 are irisv3 with same core and
> bindings, hence SA8775p is made fallback to SM8550.
> QCS8300 is a downscaled version of irisv3 and have different hardware
> capabilities. SM8650 is an irisv3 with different (higher) number of
> reset lines compared to SM8550. QCS8300 is yet to come in future
> posting, while SM8650 is posted as
> https://lore.kernel.org/all/20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org/
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index e424ea84c211f473a799481fd5463a16580187ed..6a89e9e3808758cfdbf6a51dfb9fc6559864253a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -19,7 +19,12 @@ allOf:
> 
>   properties:
>     compatible:
> -    const: qcom,sm8550-iris
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,sa8775p-iris
> +          - const: qcom,sm8550-iris
> +      - const: qcom,sm8550-iris
> 
>     power-domains:
>       maxItems: 4
> 
> --
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

