Return-Path: <linux-arm-msm+bounces-63715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92212AF965E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9361CA4360
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F20B3093D5;
	Fri,  4 Jul 2025 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wT2OD5+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A23093DB
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641668; cv=none; b=t3aTWef/eqSLCr6wiZbtK9WDv30EAOlVKdV53nPnHUknNVctUvFABnHC6ewu0vqL+08kDnpc5FBfAFRWQvptgCwcMENJVvdWm/vVE5v0ocUFeLPVLwdaNzZhKPBDSad5Rxh6dKb1XketubxTzKxQRuBi60xwDYf1+fDautUeAd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641668; c=relaxed/simple;
	bh=q2PI2I6DpmIBa/PZTooLY5T7w0VsVRO6mzyBLjxOd2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MX7jY/TpW8Zf4Xqu3sTFeYgrHymAUM5PKL2LZ6hIJnUSAh9bqWNVuDPMlCGOjoXToGEnG51x2tQHCPug8U2vFM9xwiRU40t/7dSRbHcRdUu5FCRSOuqXQNLJwfJst2KsUKmRLMDWrMPb6OpZ1te2X0kc5Z2gSHUHYHDoVRUpmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wT2OD5+I; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso583102f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641664; x=1752246464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYKMtLCQMU9Jbn/Hf3wX+1NuY//33AgfBI91LQJ8MGY=;
        b=wT2OD5+ItIoGdf28wgmaYorskH/4msq9z6DCuxt5QCfhhTARvnlPnXncZlGOa16p5I
         vJRnqgSdPZXNH8jeXQC/qH2A52A+czVrFr8x4Pv1586GivLRaISaWyLmY/0dTYUzF2/5
         H9mvVHbjhxEFtkn9oeOcHUHhSP8tmTNiJDJJGKIRsVZf6DeNAFrOC2Y6TbeK1Boj2gGx
         JkuRqXqNXQf3xwp3mmWdsryxc7y1+XAvKhPxwdXaCNfpOrcp/3M++TisJeOVsN0STLEP
         PsaHdsaF2aw316Es3AGs1dj9trrFf4kKNUPoJEJugIdOh9HeBsFZ+jvO05LLLKakPnwb
         /M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641664; x=1752246464;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKMtLCQMU9Jbn/Hf3wX+1NuY//33AgfBI91LQJ8MGY=;
        b=HNwfB7UP0u84ahH9trZmjAuZWig7tHSNvXiQqyhTWWQphsKBMrPdnIMQel5NiZpGC0
         lypiGvH4qEZZsD3IOAug6tpJblcvfXCiAV4YB8dJQyYs6a37CaMBeVjPDWLYkGCZn37Z
         wKKVOJvTfkq1tWHhfyK/so20kj5gIUm9eiXBSLktRewR8Xws1/1aDstFvB8AU1eXabW9
         gh1o6tJCfnnMiM9Bn/gJ4SUSJPfieNun4a/xoQB0EupKvAUea7VVisXug5ICsNOgwrHT
         xMU1IgBul8P9V/Mk7FufAi4AJgoLikBFqw3X5el07FMOgkNk0fZFE+VbeN1KSnysP6gb
         T3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXrc2wUle2GTOlRkRgQFsmAmSRVswB+OyzxyQnQJw4VjbIjDWtm+K+G70qpGMdDgCpNYHrptY4Hvz9dd8uh@vger.kernel.org
X-Gm-Message-State: AOJu0YzXifsVcS5bHZBeDO80exwmUFed4gplVHuEV2gieVlAibSuCG5H
	6HYRfi74/hhSc4KYLxYZzThltvRlV6ap5ci6OLtJAAIhEu1H46h0CHVyMHbu1Yy6Pgc=
X-Gm-Gg: ASbGnctTVgHRXSZS/D4E2X7+ipD2XNK3PtkPizIEnc5RwH/oIBT8SjBBbyqicCuMJQS
	U//Nugoz7sfaf8RET+/wg2WxeQTEXttAUKnwOFlfdekP9OaYTM6CDj+EwOUpHwSA9CSSFP48RiW
	Hrx+nX5glcfFT/sxW74rK+004J/yTsJhKhqSyS4o3yib5Po2Rjp6sKw05BgQ0uUGsuhPQKK9z9U
	pOaJ2ubw/f2CAyixUO7te8je8LXtLPHxAbM84yBU1TxqEC/IEZrIytVvcgpg+9vDg2T66FPosAd
	oair6beIh6HXfQiFEjd3MfBTKo6NWVUDPqCpoM+P48xrnMAAUFv3QGa634xIS2ItNliF+m1sVmb
	/fGg29zx9jlVNdGgaIzBVLv3a8Zs=
X-Google-Smtp-Source: AGHT+IGCWK6GEjyuYgdWySF7UumkNIAA260ijlRTJDfE/t1th536V8nTvCURxmWZM6UF6IOMpNbQjQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3b4966046e2mr2935145f8f.51.1751641664468;
        Fri, 04 Jul 2025 08:07:44 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a2e8sm2696936f8f.75.2025.07.04.08.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:07:43 -0700 (PDT)
Message-ID: <96f2c5af-9d42-4fb9-a468-ec4d22a76198@linaro.org>
Date: Fri, 4 Jul 2025 16:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: qcom,sm8550-iris: Add X1E80100
 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2025 14:38, Stephan Gerhold wrote:
> Iris in X1E80100 is pretty much identical to SM8550. We can use the same
> firmware image and the same definitions in the driver, so just add
> qcom,x1e80100-iris to the existing list with qcom,sm8550-iris as fallback
> compatible.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..9504d7ea23f4a30fd2d03e8683721641f8b1a115 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -20,6 +20,7 @@ properties:
>         - items:
>             - enum:
>                 - qcom,sa8775p-iris
> +              - qcom,x1e80100-iris
>             - const: qcom,sm8550-iris
>         - enum:
>             - qcom,qcs8300-iris
> 
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20250704-x1e-iris-4a5d033f4a2d
> 
> Best regards,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

