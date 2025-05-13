Return-Path: <linux-arm-msm+bounces-57666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536CAB4E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18CDF46785A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 08:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36A5204F9B;
	Tue, 13 May 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UR5ALdJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6722204583
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124824; cv=none; b=b7LSnwWlDfgFD2uqGBEgubv67mvgzSMQpp3sJDpn9Nfc4DOB4M1HYDJqYVXMF67PvMdW3JX/slI52Z/HPOD+O9+W5SHet1xNKn/LdgQek3sUpaq2VwxUmII7OAsSyji7R3DYwjb8dhcIqUxkIvxKDP4kntoXdH+cgWq/gIKjxuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124824; c=relaxed/simple;
	bh=hDrNoWg7CCh+sR0t0fQYCj4B4U2zTq67sVCEwpS0Gqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKg4D1B6wuEvF0pmrXXEeHMYQGAi2mJ7lpr9jDIjso4bWj6GBoNzIkyiDFkbAwirlsFRuLRG/4xECtVmh8lx6cFinhG9TH+NE+Zn64KjCy6GAf7/NTrNGL9cpvaAfFqB8JHLX+MKUHF/bh1I7KfNEh7l7KbcEcH3Zc3Knf5v5FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UR5ALdJm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cee550af2so2035715e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747124821; x=1747729621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MbTnUPeR7Iz+CpAFr62CWUvcUVj9FN7w4eong+YEA3A=;
        b=UR5ALdJmtp5wShfXNS8SY+O6qDmufXIIo6nDWyxsyyKcFOf7VkCC/INrT/LL+pjpud
         p1o7fFvpwa0PWCYH00zYkmktCQUW79t00M+VVpgDCgKMCZ21A3vmEqHYqXz9JYZcrOwz
         iqTWJitcnX46KYeHuZqoxmMmanRp8mcQI3EM9aF5btqeRNgF3oye5V7PJCqwaduUQO/t
         Dwv66hAKP8/wodiBMb38vBSt5RD+XdqjTPCejFjcjn147Ma4K4CVBd21hY1N/KYsxj0p
         nxVktlhrA1WHIBJ4Qk+ifdwIcN0+/oJrgfVIX76XMprnwCJnTjY/DMPXecyrkpo8t28q
         VRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747124821; x=1747729621;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbTnUPeR7Iz+CpAFr62CWUvcUVj9FN7w4eong+YEA3A=;
        b=d9IDhzXCFD+WePIMHLndS/KwVYzs9JoaUaIL+aGOZiefxbi+yu54zLelDZYG5USiaY
         daaL7uQ4405OAGHjh8V+heTgyMbPG+7kN7UDp+sXDkxBQstQ84Fo8OLKl6FIIa+hndF1
         FtAJUKk6tDaPGITZhIVrK5FEGz5eIrw/gzK7cCFWHyIg7uYOf9TzqW3NNU6NM1TZ32AR
         KQtV0O7ntXBqOn51I2GEgrgGzr9dsdqBUjY8Sitkf2yQEuugM13glF5P8vPMnIOajoWq
         1ndmzYhg27n1h6ZTJ49e6ZYff9fUD1g8saMxaoYt7zxl3+75iWiZqaKKhfxYwVWOvN8B
         8AAQ==
X-Gm-Message-State: AOJu0YxhCLAS01DOmJeUyI7a7W+CKkWulawxGi2VhppIPxIItWWZw0Fh
	NzcjWl4LAslBawhdEep0JNNJ2+zcCaQws+kmmCj/mXCx5IZaYL6/q5xbSUfxU7hAti5Bj6GXl7y
	VBSd7BA==
X-Gm-Gg: ASbGncvmrgxQ/olYL0RUMyWn7C9VQTKPqc3fcqD0UR1ItdeLOYDZ3rR0G5kfPhvaNT4
	X2CeM1oErSfs/YVyciUqp82bUqK2jXsaZRf2BvxtCHK2B8TbC0fDWdtpu8c7zQU1agbCe59sNLs
	xvDsqYA1KBN1yG5j3CRtAll/JX1QjXOxL2j7qN41eCVSh9793DF9zZwU/ILIjQhaHgqvEqr/UgE
	1LVgEhzX6gs5QEz2yNCamLQPfHP5G3Xvr5JF1FyjjhRicRp5hEANT6x2TYUDTWhuVAFR1w7Yooz
	JLpGAw5anStpmov5Q7aefDX7T9jdLfwBGILMgytIdirk34+3OeRpfXIOwA/rswO0DNjoda3fK0A
	viCdA1FXv9AKM6yI/QA==
X-Google-Smtp-Source: AGHT+IGUKMvBJKd7PANc60nJlG4rsBMpTKFeF8I2cB/B+QgVvTq/m0yEDY4TpV2AzYax1U6zEhzySg==
X-Received: by 2002:a05:600c:3513:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-442d9c8e883mr48072765e9.2.1747124821247;
        Tue, 13 May 2025 01:27:01 -0700 (PDT)
Received: from [10.61.0.48] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3285e0sm198858195e9.5.2025.05.13.01.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:27:00 -0700 (PDT)
Message-ID: <17b9649d-b788-4a13-b7eb-bf54b7a83b0f@linaro.org>
Date: Tue, 13 May 2025 10:26:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
 <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
 <afda790f-0b5e-4569-a92b-904df936df85@linaro.org>
 <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2025 21:38, Konrad Dybcio wrote:
>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 122 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
>>>>  			#sound-dai-cells = <1>;
>>>>  		};
>>>>  
>>>> +		swr3: soundwire@6ab0000 {
>>>> +			compatible = "qcom,soundwire-v2.0.0";
>>>
>>> They're v2.1.0, same on 8650, there's a number of new registers
>>
>> Sorry, but no. This the "generic" compatible and it is correct. Devices
>> expose versions, which is perfectly usable, thus changing compatible to
>> different one is not useful. We could go with soc specific compatibles
>> and new generic one, but what would that solve? This one is generic
>> enough - the device is compatible with v2.0.
> 
> Well, I'd expect a "2.1.0", "2.0.0" fallback there..

OK, let's see if any DT maintainer will ack such thing. :)

Best regards,
Krzysztof

