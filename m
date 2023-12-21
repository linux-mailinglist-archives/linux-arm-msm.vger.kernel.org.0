Return-Path: <linux-arm-msm+bounces-5827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D9781C092
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 22:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A55283F99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 21:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB47558224;
	Thu, 21 Dec 2023 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAnkpuZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF767762B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e239c49d0so1617734e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 13:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703195737; x=1703800537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNwys1gdRbu+kHjl3wAeCUgqwHfNmMvdPBvih70h1as=;
        b=wAnkpuZAX9VGH9T77ci7sH7ihWMCllsgOsA6SZq3E2li6+YZqRU9aP/POzHPpvyjqT
         OuDRDpUMmvnHuwrguEZ6J7SOtNCLhQ9ZlEk4gy0WY1R+/MxYoHCdE/Frq6COvyb82GRV
         QGQG1oHrHeiYJL6k+qPSHktI/40gdLvvIhc29FBlje2GcmHL8QeYEJ5h0MBuuAOKdkw2
         kqdadquYJXpxFHAVHZ02+2OsnIbw2AcQG6TKA2oESnAjPy9hSep4EjXsohHnY/vPScU/
         x9JcQyLfTURiFUcCHoULmWLAj2egI7blNMeKUKSWATLg8wwSzZsMvWFTZFSr3gf7RcKj
         NJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703195737; x=1703800537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNwys1gdRbu+kHjl3wAeCUgqwHfNmMvdPBvih70h1as=;
        b=bu3pnYmGkWFJLR4oUHAO682HI3cRjtCMse6WdbCcDrC8lwfKkxe3onRm/D+yvEQhVk
         w/M0hgd5tAG17PoWyQQuUsuNjY7xuWLkdk0Hc0QeKGOXBdwSm07Tj80YgUXpvBIeQDjd
         Q7Jw/020Nk9286JJTs3RVJCYXXyR2zMO5XVt+E8pU6tPPRx92XLXLB6qbrcvRqqxIr+A
         vosmzRZA48LAcB05o45LLB8J1Cb1OvChANgajwP3h5Ixl22icXTf4n+PQrNzhb9zZWi2
         rwTusYWhv1cLAzC2GZW2O2Hcx/krhJiKK+k/204rNzWRKM9GekTxa23rkIt77YIM+gQ7
         DB6g==
X-Gm-Message-State: AOJu0Yzea47HjUS12TUYrmfl01qOrcL2n2TURZAi3lHAEe4tSAzNaBsh
	ndhR3gRovia2aN6twqJYGHXKB6q7qttaZw==
X-Google-Smtp-Source: AGHT+IFQfWoVFZ4R+WJlhLwhZtMwB4JOXMba1zKs6hiEmRxV3DKxlpmIADnWHBlvWe7Dtqk59ZJi9A==
X-Received: by 2002:a19:6519:0:b0:50e:3a64:f8e2 with SMTP id z25-20020a196519000000b0050e3a64f8e2mr111133lfb.115.1703195736942;
        Thu, 21 Dec 2023 13:55:36 -0800 (PST)
Received: from [192.168.199.125] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id ex17-20020a170907955100b00a269fa0d305sm1346407ejc.8.2023.12.21.13.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 13:55:36 -0800 (PST)
Message-ID: <c5b28a49-cc0f-41b1-8dfb-76af93636fb0@linaro.org>
Date: Thu, 21 Dec 2023 22:55:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: revert back to PSCI PC mode
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231221214822.3063219-1-olvaffe@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231221214822.3063219-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.12.2023 22:48, Chia-I Wu wrote:
> This effectively reverts 7925ca85e9561 ("arm64: dts: qcom: sc7280: Add
> power-domains for cpuidle states") for sc7280-herobrine.
> 
> Fixes: 7925ca85e9561 ("arm64: dts: qcom: sc7280: Add power-domains for cpuidle states")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
0 explanations?

Konrad

