Return-Path: <linux-arm-msm+bounces-44164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B4BA04532
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC6E63A3CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9926C1F2C41;
	Tue,  7 Jan 2025 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zX//R1xq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A541EB9FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265176; cv=none; b=RjYCSDR/VrVXDqElVdoMbVXqwR/Hul/QpiFAcqnDEYGfc9KyZ55fu6QOAid7SO1zx01+w7PVBogLokmUYBfY/byX2TaM6qtKTPMv5J7ssvdpSy0TzwzXbEP2Nw734lUClUomdZzuCQwG5edn1zLtpimEmcOY7dAV5pvAZVGVcZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265176; c=relaxed/simple;
	bh=3S0Xzp3DQeA1sSm2XqrfvBe6bQTzwDA9xBgSW3otpnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tXpKLdwWkKVbE0ElRIEcpx2cYpjh7iADwZ6V6h0TO22w4wLeR+hkazhma1emajMvEUnTIvafEm8qzEv8q0XMhZAySkKoCyFpXyZ+j1jwIBuK2Zmcv/OIR45Xtr7+8Dol40/dy6qqXjETsQq1UHzt5X90cZWixROCFSNiUmaoyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zX//R1xq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa680fafb3eso195976866b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 07:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736265170; x=1736869970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n7RFFy+ybeSXq3RYEx3bM1fqSuizHjaP7KIVMb4KvDA=;
        b=zX//R1xqHvTDvE106Zq8R9oN0oAZGI+gLQyPWI2kkL7+2ZsxjWEinCqsDjuvYcN/A2
         TEVm6h3HKRud0F/iDqw+c6fr0P1H/61rdlUTqHyVjyoRiucGV5TpbuHG8X+KogpcS7Je
         aj6e8VVxNqS9nn+/3b7OiwLUJM1P5mf/KmfafrXLcr8MjsEarXPMiCtSZ7xokC8V6/5f
         B5lI9RL6MKwRFx+A+L9AEVDZeLKUWdK+06+XM/fk1UblnyiBu6sEgT3m+1qUlhX6+LlL
         yQdjLtdYslm9atOnjhmEoOaMXZKVtKzWmQBMNHpBRcd17Frwgm1LfOOn4Udg7nGTHWFo
         bgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736265170; x=1736869970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7RFFy+ybeSXq3RYEx3bM1fqSuizHjaP7KIVMb4KvDA=;
        b=c7DoPX5FbYPe75ylQyAgImWVfqJ1ZKZM94U3xC1WO14Hw59wFVTMP/NoeVR1ZDWobo
         6BGLQFA44c8WwkDx5mMxNZULj8xQgadKI4hTmePQ313gz9/zvBn19lKFzGZbo6fmKtyL
         MG4z6yyaCe/tTGDJVFbh7V+DL6/37Cd6rxXSYebRkNh43Ax6s59haQSmCzSR3LM+gfd4
         I7oBE9tyiSO9gJhmDWWoiepb+Oa+2LbKUpgCerYi9jkLAmGdnLTszGPomRD0F9Eyl+tH
         aPNEMy/FImtQ2Z3ch05Qms/rS3fGzDjZXZYffMIUBQOuf/othnD2z2zmdfudTmKQYjs8
         LxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdkaUCzM1LPoXlldVdupb28Eqt37VT4Op/EmxMuvnQOTRZd+WfYBzGU4Hy3NY5NwBRMRONpkz8ppboSYUI@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBOGTqlf8RJZdyWybcbkmjc55XfRKPkxnYLyqczTM5e4qGsWL
	Rjph+b1ysz+9ZDctYHzQOanHvWlsEbhrLhGw095m1Wb/CGxf7g+M3PGCARU1JGWywlHl/eNXZL5
	H
X-Gm-Gg: ASbGncsBD5RoHcghYap91SjDAA3SCil1eZHyRpbZt1uINQpL3FQnJW3sj9RCm0xvLwI
	RGJzHc5xhes+rGJiLBC8dM/7MIq+PsvfpGWwiXjW3jte6omDJIDamifqIvIu+u30R2t72BOIonh
	IrThso/jBMpaqqvAqjokAyxsryDb7ISXmc6HsvKMGxeM2AGy4z3TIVBLkuRJDVQ2BPk2Afpb1uj
	AlSPWz0qDSELFxZ5zf+qj15EnK5vjanx6xph7Maa4xKzwUvRDtJkhJ2aPHMHQxOJqej39BOZiwy
X-Google-Smtp-Source: AGHT+IFb9gKNMgqSdoVrx0TzKo7JR3NdZFqUE0orMKYe/GJK9pi9/YgaoUS0aIRRI0RUvqH7TV2qww==
X-Received: by 2002:a17:907:9692:b0:aa6:91ca:3674 with SMTP id a640c23a62f3a-aac2adb92a6mr2066813766b.4.1736265170481;
        Tue, 07 Jan 2025 07:52:50 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm2416854566b.65.2025.01.07.07.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 07:52:49 -0800 (PST)
Message-ID: <74f58717-444b-4000-8f81-b8bb1b31821a@linaro.org>
Date: Tue, 7 Jan 2025 16:52:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable basic Qualcomm SM8750 SoC
 drivers
To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107152749.327407-1-krzysztof.kozlowski@linaro.org>
 <cfd4d531-9c39-46dc-8b08-86217c392374@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cfd4d531-9c39-46dc-8b08-86217c392374@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2025 16:31, neil.armstrong@linaro.org wrote:
> On 07/01/2025 16:27, Krzysztof Kozlowski wrote:
>> Enable necessary drivers for booting Qualcomm SM8750 based boards like
>> MTP8750 and QRD8750.  The clock controller (GCC), interconnect and
>> pinctrl drivers are considered necessary for early boot debugging, e.g.
>> via serial console, thus make them built-in.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm64/configs/defconfig | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 5e88321aa603..0812bd9df09b 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -636,6 +636,7 @@ CONFIG_PINCTRL_SM8350=y
>>   CONFIG_PINCTRL_SM8450=y
>>   CONFIG_PINCTRL_SM8550=y
>>   CONFIG_PINCTRL_SM8650=y
>> +CONFIG_PINCTRL_SM8750=y
>>   CONFIG_PINCTRL_X1E80100=y
>>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>>   CONFIG_PINCTRL_LPASS_LPI=m
>> @@ -1344,6 +1345,7 @@ CONFIG_SC_CAMCC_7280=m
>>   CONFIG_SA_CAMCC_8775P=m
>>   CONFIG_QDU_GCC_1000=y
>>   CONFIG_SC_CAMCC_8280XP=m
>> +CONFIG_SA_DISPCC_8775P=m
> 
> This looks a spurious change
Indeed, thanks.

Best regards,
Krzysztof

