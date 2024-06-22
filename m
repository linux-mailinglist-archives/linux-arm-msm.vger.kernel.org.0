Return-Path: <linux-arm-msm+bounces-23685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1910B91332A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 13:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B521F2308A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 11:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1026A14EC44;
	Sat, 22 Jun 2024 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LP/LBE3R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332C914D457
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719054570; cv=none; b=ff3u9Rj5zum5NJ5CSu4H3CdThfbnkSgdmCPTFGzJW/QsbGUd6hJs/XZ87svq+EaUT3xgDmr1b9P30iZejh880bOXGrDyr2jXOppAdeeWAj+EbjvvE9td9zdM9wSLiD5oOpdVd5VU6sF9Fct3LGRMUc98uivGy5S8gU0K8JfBMLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719054570; c=relaxed/simple;
	bh=lfF9InuMlIs46IAKThHeoaqSIjaqpjrF0mNn0upr/EI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYeMIHyjKXzANY8sidK9gFIIsSGVv2H3WNfNg+7bpceiuuJly3ulzN4PRWEXhLx1uyjmRhlaslBP9pIuZaCg82st31qdN35iee4cwmmEqtK0EJ6OCTH1ydR3hdXXNWOrZMpQfA+wSkYnmjOtTFAFok3MENPu6ay7qQJ2tUDATJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LP/LBE3R; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso471631866b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719054566; x=1719659366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UxTd0A5ih62U/2vVAXq1cOqm/KoxaID5Hveyi9+8Qjo=;
        b=LP/LBE3R5a6SHeuK4HNtjaXJtDjjShgoIbMLt4dxsZ1a7LMu00UbiTwxC4pDf3t2pD
         tIPckKF32Gs7eDaAkt7rvPKpe1A87G4P7BbTf2UM8smGPDkLSwrvUuza/NIaFj4MaoUE
         bo+5R+sTV6kN3Gk9g02RTAfZXD4HwSMREoWVBL/T7qW4Sbxk4QU4SxzQGc8XeuIue1aL
         0NTLVGjbpuJNOf6N3nQxx+IWVV3tVwh8rHjOZxNPSTnJUQp5e6GCmW+fdPfDrqu84+CX
         TU+HjuMeXGRta3IyppXQEbZ502EB1aFZ6aM6NXQj27Lm8ZdRIN86/LxuZs2nSIi98eCB
         CTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719054566; x=1719659366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxTd0A5ih62U/2vVAXq1cOqm/KoxaID5Hveyi9+8Qjo=;
        b=t16arKw2L7wZjiLobc9kTGOelKR/ZYUmyIvd+jVESNFlymE/D6/0KDWuRYRWi2mhGA
         e3/0i5XuapsrjxsGXVoPVCRqpDUJycF06VbhiX3jGpW24bzBexJXJTf+w/EIliBStmCe
         7pdS9aZEcmHKI/vz1Iyl6zJOtj4Fw91GsA5mWl4QedkOrTM/6EYEATBsSIDHp7S8Sa3G
         3pFa0PJUsCWVzMsWyXJGXi/c82htVsxIjHqgEmx97W2n9xc+Ghbc4IpTZ1WPRyOru7xl
         aE2ACY5rcGCceYHIGdZRcisCBCBLRqCGBXs4uMSI28STLAg1Dhs6VkemkP2EN0XfdKHR
         L0mg==
X-Gm-Message-State: AOJu0YxHjsxVQlEXYA08sCMAF/IANm2Ly6KfZleb8F2YxcM+wt4Tcqvv
	NO+hzCDacnjDd0UvyUUvRamS2fNnZObi1qWDRwkv84fAYY2Snr9R7TzSqgrBT58=
X-Google-Smtp-Source: AGHT+IHcwXTf6PVedll4+dpa6qYQ6zvsrzeqSxOX0XmLY3MOwZma/dXdW+fkzbZGeLqn+ghehhzmFw==
X-Received: by 2002:a17:907:d30a:b0:a6f:b6c3:fb2e with SMTP id a640c23a62f3a-a701b749c41mr89424066b.0.1719054566171;
        Sat, 22 Jun 2024 04:09:26 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a70eb8792b2sm42005166b.184.2024.06.22.04.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:09:25 -0700 (PDT)
Message-ID: <e344335f-be60-4568-97be-728257684310@linaro.org>
Date: Sat, 22 Jun 2024 13:09:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: add base AIM300 dtsi
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Fenglin Wu <quic_fenglinw@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
 <20240618072202.2516025-4-quic_tengfan@quicinc.com>
 <7eb1c459-90d2-4b49-a226-0ced8216cee6@linaro.org>
 <04517096-38a0-465f-86f7-7e8c7de702a2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <04517096-38a0-465f-86f7-7e8c7de702a2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2024 2:46 AM, Tengfei Fan wrote:
> 
> 
> On 6/19/2024 3:06 AM, Konrad Dybcio wrote:
>>
>>
>> On 6/18/24 09:22, Tengfei Fan wrote:
>>> AIM300 Series is a highly optimized family of modules designed to
>>> support AIoT applications. It integrates QCS8550 SoC, UFS and PMIC
>>> chip etc.
>>> Here is a diagram of AIM300 SoM:
>>>            +----------------------------------------+
>>>            |AIM300 SoM                              |
>>>            |                                        |
>>>            |                           +-----+      |
>>>            |                      |--->| UFS |      |
>>>            |                      |    +-----+      |
>>>            |                      |                 |
>>>            |                      |                 |
>>>       3.7v |  +-----------------+ |    +---------+  |
>>>    ---------->|       PMIC      |----->| QCS8550 |  |
>>>            |  +-----------------+      +---------+  |
>>>            |                      |                 |
>>>            |                      |                 |
>>>            |                      |    +-----+      |
>>>            |                      |--->| ... |      |
>>>            |                           +-----+      |
>>>            |                                        |
>>>            +----------------------------------------+
>>>
>>> Co-developed-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +&ufs_mem_hc {
>>> +    reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
>>> +    vcc-supply = <&vreg_l17b_2p5>;
>>> +    vcc-max-microamp = <1300000>;
>>> +    vccq-supply = <&vreg_l1g_1p2>;
>>> +    vccq-max-microamp = <1200000>;
>>> +    vdd-hba-supply = <&vreg_l3g_1p2>;
>>
>> These regulators should generally have:
>>
>> regulator-allow-set-load;
>> regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>>                             RPMH_REGULATOR_MODE_HPM>;
>>
>> although the current setup you have never lets them exit HPM
>>
>> Konrad
> 
> I understand your point is that these settings need to be added to allthe child regulator nodes of regulators-0, regulators-1, regulators-2, regulators-3, regulators-4 and regulators-5. Is that correct?

No, I only meant the three references in the UFS node (l17b, l1g, l3g),
although I suppose such properties should be there by default on all
regulators in order to save power.. but most boards don't do that (yet),
as nobody wants to waste their time with potentially one more thing to
debug

Konrad

