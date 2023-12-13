Return-Path: <linux-arm-msm+bounces-4573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA8811D3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80A21C211E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592C658105;
	Wed, 13 Dec 2023 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vebi432v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCCFE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:47:03 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so8443411e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702493222; x=1703098022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D9pRN652Qjyr+bUpPGngJiTKRnZ3pLNOirbLUeYcKaE=;
        b=Vebi432vX0Le/x7Us8oanXhjU9Ua4FaNL0hDw0WBJ/PHuVqOr05mCJRNjQAstuN9k3
         4JuHcHTYkK55eDFYxo4DP2XGohm7BgoS2OJW2Sf5ad/Y+F5f6vFghid7dAzcw3DJDC01
         ww3VI8XIPuR/VEFkeRqh6Pa16dOmmDM/2dMM1+nglvk/13yq/5SLBcftCJlEbjWOnxBe
         3BgWK8XM/EZY9cWCeajfRdFlJruaC1qX+dIpdkTiu9quIdQe22dJ2DEq6qTaXEj3zvBE
         6M1m0eWhh1Pfdyhwqaf0lVQ1LAIFJvnEHLlgZ2j0tJ65kcyAoyHl1jn2Ht06nhixBAWJ
         XTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493222; x=1703098022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9pRN652Qjyr+bUpPGngJiTKRnZ3pLNOirbLUeYcKaE=;
        b=eeJ7ySktOw2OhWvgIMxhv30+aDMPR2RjocqsQxXCvfsQnVIsSIiV4u1L61YyizoB7v
         7hIpCr592/DC39WQtp5HM6M001xrXix0CT0ORg+clT+ePWhkSirmBb4CwUvWa27bLtm4
         48BpHEfyJB3gy4d5gCqnvX71573+QKN0MOa7fG13saGNsioCWJWX5dWfqkM/CRLOlAD8
         pei2weuzbbVEEGBFU46q2d59/Fb0VgYEBilwdnB4k8OMOsYY1c6nMgZBcwFqOZQ7RtSZ
         p1BFqaEau2AvGIrnXFmqLkP/F5qmpe7XIoJRvcWPMglBwfBkTqb+OP5Gv79PLxxhY1Bk
         0oaQ==
X-Gm-Message-State: AOJu0YwaGLA4vjIGr0BbFq6stQAKFoXHv0uuJMXMsljR8QPmBCLYnUMt
	1SFeO0f5gkL/zSKV1eQs3IXBDQ==
X-Google-Smtp-Source: AGHT+IGdLUVASkIbLTRMFB5Hpp0dA3qXNw+0b/Naa+lZJ8p5ZeeCweWZkm2OE49WwXdI3JyMdWp0rQ==
X-Received: by 2002:ac2:4a6e:0:b0:50b:f06b:7aff with SMTP id q14-20020ac24a6e000000b0050bf06b7affmr1685913lfp.233.1702493222048;
        Wed, 13 Dec 2023 10:47:02 -0800 (PST)
Received: from [172.30.204.126] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f12-20020a19ae0c000000b0050bdf00f688sm1653687lfc.299.2023.12.13.10.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 10:47:01 -0800 (PST)
Message-ID: <b319bae5-1253-471f-a022-4d1d2425e213@linaro.org>
Date: Wed, 13 Dec 2023 19:47:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: qcom: sdx55: fix USB SS wakeup
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20231213173131.29436-1-johan+linaro@kernel.org>
 <20231213173131.29436-4-johan+linaro@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231213173131.29436-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/23 18:31, Johan Hovold wrote:
> The USB SS PHY interrupt needs to be provided by the PDC interrupt
> controller in order to be able to wake the system up from low-power
> states.
> 
> Fixes: fea4b41022f3 ("ARM: dts: qcom: sdx55: Add USB3 and PHY support")
> Cc: stable@vger.kernel.org	# 5.12
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Matches the downstream kernel too (as it should!)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

