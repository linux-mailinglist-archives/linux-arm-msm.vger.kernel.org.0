Return-Path: <linux-arm-msm+bounces-7179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 286BF82CBE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 11:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76BA1F22D08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 10:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA4C20DC3;
	Sat, 13 Jan 2024 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWmLeKt1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5020B31
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e72e3d435so7069943e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 02:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705142039; x=1705746839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+x8bBUhmaZ5bctGOTnaKMvIif9jd5WuTDY2PH/sR2U=;
        b=vWmLeKt1cvIugfeKkEh6WkHDVvvRr87Wh7JgsceTOwxLJS7wugMaPiXniZQ8f4R1ov
         02ibep8vpZL6jpQL8n9Lcc2Ke0DGrHIITl8IbISf6kWEkOfTWEeN0NlWF6Em3YNAJhja
         KY5MpBusSe3p3ZQScpTpbb6G1Ej2KNODeq/z1AsPKC3Sp7qEQTgDtSHvz8Ty2XRNpgIj
         RdePnaAVqDV3xRj+D04RpSjlGagzmKn4U2VHAcBCXOJQ6cjdx6rsMWJZJb8uSWmNipWW
         SnUzkVgczB9P+7ZaeYJBmsGhR8onBvWD0yhF+yS9Vsb18bBgLbTkhi9Z6wmxL+8uh7XB
         HsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705142039; x=1705746839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+x8bBUhmaZ5bctGOTnaKMvIif9jd5WuTDY2PH/sR2U=;
        b=uY8NIYcyY7SO9DDiSXs1vADRQVU/Gg3wR7Ftrlyxsct8kpmAVSq5aHCW6cJY14F8Yo
         9DjoA3jv2ofRwB1HKY01DhWQhehVQs+thNBPUfouQBv8RwltYSjcK1xrEFW2a4WwKvTX
         d/jZu7Fs7bfZ/9BrAwangggeWTcplsMDjwfEk+cAfSY25QpuvdkynUdwGWziecnftwt+
         5N2KgpGSqbA+yTgXWKLzpSiKy64jbRPzcLhGVY+dOOC7NSAdoCJeLK+MK3UWpNVgDYYx
         9d06DkXUJIJMjBn0ZLg2iFl9fhQrWT76OohUDwbQ5VCpwvWVsdwXLLl8eJoqr4oA7Wam
         B88Q==
X-Gm-Message-State: AOJu0YyLzrDPKbe1YHQeSc7yH0vyPTjsuLjpHhkYbbpuMMRQdIua6E/4
	gAZevkPT8yaAulqiP1kZil4G+rQ6U7WxOsLUhu9gQRI8eLE=
X-Google-Smtp-Source: AGHT+IENpYfdaChdnutOsF0MpaQwHUt3wT9gMBJC/eiMG9zYCne1iuFI71w8sKjNAIuFwsXGphjhhg==
X-Received: by 2002:a05:6512:15a3:b0:50e:9a16:fb with SMTP id bp35-20020a05651215a300b0050e9a1600fbmr927066lfb.6.1705142039394;
        Sat, 13 Jan 2024 02:33:59 -0800 (PST)
Received: from [192.168.174.25] (178235179017.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.17])
        by smtp.gmail.com with ESMTPSA id q8-20020a170906360800b00a2bd52d2a84sm2719827ejb.200.2024.01.13.02.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 02:33:59 -0800 (PST)
Message-ID: <7e36b380-8ab5-4555-8919-1c2c6ff7aa68@linaro.org>
Date: Sat, 13 Jan 2024 11:33:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] usb: typec: qcom-pmic-typec: add support for PMI632
 PMIC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-6-de7dfd459353@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240113-pmi632-typec-v1-6-de7dfd459353@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2024 06:42, Dmitry Baryshkov wrote:
> The PMI632 PMIC support Type-C port handling, but lacks USB
> PowerDelivery support. The TCPM requires all callbacks to be provided
> by the implementation. Implement a special, 'stub' Qcom PD PHY
> implementation to enable the PMI632 support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

>  #endif /* __QCOM_PMIC_TYPEC_PDPHY_H__ */
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
> new file mode 100644
> index 000000000000..5d3b0e78d4d8
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c

Not a fan.

Maybe add some TCPM_FLAG_NO_PD and solve it in a generic manner?

Konrad

