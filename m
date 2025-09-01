Return-Path: <linux-arm-msm+bounces-71375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C08B3DCE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 10:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 58F204E2000
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD23A2FDC52;
	Mon,  1 Sep 2025 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4D6D3UK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBA42FE57B
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716388; cv=none; b=Ou7Ze08znukPY9axB0cKCblzJLdVHJmOtQdHgykwBQ2DWCfTx/4qvvTQcNQ6v3Jj+N5NbcKVi+fX0WPqCdBWGLlHhTmC5TNjHCuUskikTDoMw3A/HK0OhCWVZK8WyAPxIJ3AjJqtwNioUagSMWsYVtuFsVk5QuClzX3Y8JMXBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716388; c=relaxed/simple;
	bh=iflz5Nt461X1bRlMAcJS6icPWKPS3TA+XUoGxapPj3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u58g67RgRZ1RdFpDRMJ5ztEMPJuExDUZo+NytX8e3yx0miEhnS+ieN2y48c3ddeZuIqz4XtycMOpnP7NcAXz75lqyOMM/FKiRlj+v3ZRUp0OZD6XNi+EpJsO2Pdb7vkggWs65bF9FUNIPJu87TCwJ0P37CZD/laEUsREgwr0xOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4D6D3UK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b042eb09948so107469666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756716385; x=1757321185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2sT5xK9I1G5rI22V3pZH7RFm4MZzhppyHAkAzi7QT0=;
        b=H4D6D3UK+OsbzeSzDoqaN1ek5jX4lekmMLB7kB9FDHuy2fOoem6um4XjArE7TjGgft
         bk6Ox1SDRKXx20Bi8sjgPeX4Jt3JMRRBI3PVRMEmZjHCh2EpIh0O9cxUxBmFJrU85q79
         v85nN5XlWGeDqrLjMgaNiUunW4qOV24PO1RIBrEevV0Kitp4sjYpKIVqEK8pP2noBY5D
         UjIHg4FhHiu4n5dZ7k96Am55kytA9qGraU5/dHmPVrRq2bDPyIGsQOlW0uNpJ/q/n+Ps
         i4Ag0pd7rNvS+ZniE2YnE+Ac1IOFQxwIcHNiC1bYu5ESxl+ymQzNyEqQfMKVi6GaRnna
         Eo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716385; x=1757321185;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2sT5xK9I1G5rI22V3pZH7RFm4MZzhppyHAkAzi7QT0=;
        b=eRU3ZEuBWqig1KYV2waNc08A8kFqzIBW+17OdxU9rEhz2JtM4xOmYAtFxGZFkxAFyl
         3659d4SmVXzb1FJhRapfMEYUHC1T0ajet+Xvnrx5huTWIUX1tqdAXERWGqerUtrFzMEs
         JwF91pYsP3FYD1rIV5KMZzl6DFXVEatb9/IuJ7AJyz+9V4t+L5VLKwdOJZJUk9xSjoeB
         08O12MnAvcrYGCXCNv+vtDmzEkcxnhDAT/K5QliQ4WXtFMZtmdbAmJv/VYTSMFEl0Sx0
         CKG50pjC7hL3fqFEvCSOAoeipBTsZRoiHHXA0jGP1Ojx/SdK4k6xpCIkPBlTT9gaZ/DC
         5/5A==
X-Forwarded-Encrypted: i=1; AJvYcCWGfo+6+wf9G8SN4vwrYvkmRGiEXRYf3cBOgnOAYQ2S1fVqWYj/Cxm7Njm1DiZz2T/fAwKxz9YcWVmMF2Im@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8btEwzNxsW5u9XbOLsrHLRnI0LuBQnU5LLmlgSH4MP1hCmea8
	5DHHZNkQ/nXW1XlnR1cTujPMoTCoYIQSuADmMWBrkYxgT0uU4aPb2P/9RdIQQwOW+FKbf29Yj19
	p1/71uHQ=
X-Gm-Gg: ASbGnctLr2ZyQaa6XdT1VkKIohJl3RL2SbLsaqAcKhdwHIKVGccM3CurzeKxjrdsXEW
	AZHgMJccT8Jv2onZARPLDT5hdjDmANIhAuRT7MVIGlYidxDxFUfU27YIO0YRqbo0CU0SzcZ0DV1
	yK/cqHU3bZ1aYrZedcyHFNGoOsHJKeXsPVHjx4F5hfzN637ZOug5fvByNn/UHktqYk+Fi/Ur3vN
	ugzR6VNG3XfhnOS8Mb3FvkXi7POtk9C8rSdcmRMTo8wIFFla7zd846ICJcs03ENFl4MLb8bB3iW
	54FAzby8JA2I2NhqOqBDLRa5/SNSSIrW1oTbA7Vw59UnEuJrkJbExZ/WhFEPKBp1PrBu8Kch5jm
	0bb7P81sLEEdwVbP91MBLc7cupZf9cM1LTQpOX6fuUV9E0JDw5LGtqOAX/3FtB+LPEe4odFj1xD
	fHj35MVT52wN0A28KDsEFeO88iB8uvZQ==
X-Google-Smtp-Source: AGHT+IEjci4SG+urOJ3OKy5HCPXFmJGLZVHBKnf2mE109Xz+m/ZM7BpLkpOAiXXp+R++EbZpUDHjyw==
X-Received: by 2002:a17:907:a07:b0:afe:dd76:7cd7 with SMTP id a640c23a62f3a-b01d8a266c2mr751367566b.4.1756716385331;
        Mon, 01 Sep 2025 01:46:25 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04279a59ffsm219333966b.60.2025.09.01.01.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:46:24 -0700 (PDT)
Message-ID: <d32a9e2c-5dc9-461a-b22e-65fddfbf600a@linaro.org>
Date: Mon, 1 Sep 2025 09:46:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: media: update Dikshita Agarwal's email
 address
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
 <20250901-update-email-v1-2-8fd49d58c0e5@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250901-update-email-v1-2-8fd49d58c0e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2025 08:33, Dikshita Agarwal wrote:
> Replace quic_dikshita@quicinc.com by dikshita.agarwal@oss.qualcomm.com.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..0d630e620b097d01001fa866b6a4a3c6328e89ca 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -8,7 +8,7 @@ title: Qualcomm iris video encode and decode accelerators
>   
>   maintainers:
>     - Vikash Garodia <quic_vgarodia@quicinc.com>
> -  - Dikshita Agarwal <quic_dikshita@quicinc.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>   
>   description:
>     The iris video processing unit is a video encode and decode accelerator
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

