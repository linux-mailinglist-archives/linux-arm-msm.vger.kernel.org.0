Return-Path: <linux-arm-msm+bounces-51189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32081A5E36F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 19:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C673B75B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C8B7083C;
	Wed, 12 Mar 2025 18:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+Z5JO/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CD82505A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802741; cv=none; b=W/ynjf/NPUqG4OB9rzmsbPhifh6SAzwOUECINk0O63tRhOnuI6/8au3TyoD++nVGoEw0NHQeT4db76+Bff0Dn8aXYAijXSXZgeSaqGHvPzZJVpZfDElr5CmpuepFmvVPRLrj+21wJjJOP/Gc/DBCTxuPQ+LdO2TEEZSMLeqXAw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802741; c=relaxed/simple;
	bh=ZnvtSvXYaZKgXRPi9veH142SzPQiahF6nTX9p/M+dJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyAU4LGE+sW3gxsuu1+3Ywev8xu5LCqlvkqXIHLsoLefU0vUBiQobNYYdiYWxk8KzR0Qb4VqOjMjT7c1DT/HjEU8S0nPv6aVZrzxW8Ui2GAFo6JxBe/QroMuXuf/TiImxot9ET0qWL19AsrgwNyqqm5m9HKtFhV/jhcWDej6pW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+Z5JO/t; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54953b2c112so14802e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741802737; x=1742407537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JP/zrVSexM0psJNK4a87mL+zi9yaJ2cIxPsPxHNny4=;
        b=P+Z5JO/tsgDgec+EVmgvNitfMfdnsvXASdqP5fIMs9lnDK7SrONlGShwoZdmv4HdbU
         riZq1xoZ7SC0r+qr2LHPJr/2oGC2dLPGC+5iBDUDlK3x14EGEqqE71PSlZA4BbCotYxV
         kMQWY8AvCfDbkaIdbs+di1yVpSasdnUsJMfz8y3U6PBSEWPjQ0NKMpFxiFBtFpJdMhLX
         XW/H5vjJzxf3xjl17HWtIQWvOLbSn33YD0Qa4ff+gHqRHmDi1fHDIPCtwHpdk4lkoQIw
         /a2V0P4XsdBx+bRfFhAcTmsuwlpSfco+YqxzSNVDup57egQtVqfUllKm7uDfPcMHKgfg
         jTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802737; x=1742407537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JP/zrVSexM0psJNK4a87mL+zi9yaJ2cIxPsPxHNny4=;
        b=m5UXaIfPqz+AxJItG0HozL8F7Fqr0xgP8sJHrMdyZir5HhBdIzlvR3UZopoefxa2pK
         95d0khMn/uxLdCNE8RLkeMTZn4Y4GaDh2A4QjgfQN2dBIybjCqaL8h2P5euWSn8TAwSx
         N5AFydOrRfHhMRFlJICnjIyEJtv8SiyrQtvzOBd5WDGJYkQhIq4NkBzpuTLaolPHYIew
         YccYVKwlCQs09js28iUuBta6FkjJqYs3RhsqWHQAhntJ8/LMr2bEwNQiAbzBVCR3Hq/3
         cQVJX9maB9GTxwIPHP9o7+IxAkcRtx79kLqU4tCml7Dqukmt252JJXtJ5+h9BGDNLfsU
         hqTg==
X-Forwarded-Encrypted: i=1; AJvYcCVqQ+hadmUq1FgfpQ/zCa7ABPN/bH6obr2pzFuT2sXHeslxU8jmHa41SpuNHsJiT0kU5YtI0D+Ue+govTy2@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbATNz230x5KE1JYxcwuDVEc2JCjpLc/TcMa8KN8JqTVYEN/f
	rkq1E/Tm+BWnA569GaZJahxG9v8OebmkeL3XqSu7bc5UU7+IIYiiF8sXxWh5ZTU=
X-Gm-Gg: ASbGncsvLRteTgIuOWL6bh+9QBq6hA6IA8C7xzJD6lDufZg2+W9AgFQ3cGWr3ph/K9M
	soYhxursDgT3/5YUF+dAy5/xZlIz/hh6GTeZ0xSwD+89L735F+WkcSsXpkwm5P+RFAV+gxT7MjR
	B8DIlg7gKd2QCAL9JJdG9O2SrUV8URpiRB/BJ87n+Pa0mm1rppEOXTgrXPeZaOZ6Vj8VIiF6uz/
	haIpWDY4WLgDiuG5nU9/qOD55Tarv1oezKX2y7KQ2CYsTW3a4bpQrz7/p+Ph2Wp3e/X5IzAUCni
	+YRffpeaYBTjkMiEtPnuG0qy5T840VWadL8LtNms/hippLsIUl9eZm02I50hovLMXMlX0ouRXhH
	kO36/pNskpuFXxsna
X-Google-Smtp-Source: AGHT+IF9q4rX/bNC2ZItHt0EL8U3J8nNwY8dNosMDubIuSu9sUrRcC/KaIRJyrmIsSDmKBjdsU5nBQ==
X-Received: by 2002:a05:6512:ba7:b0:549:8f26:ba08 with SMTP id 2adb3069b0e04-549ababf748mr1150913e87.5.1741802736571;
        Wed, 12 Mar 2025 11:05:36 -0700 (PDT)
Received: from [192.168.1.228] (74-111-126-194.sta.estpak.ee. [194.126.111.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae4b6f9sm2177533e87.50.2025.03.12.11.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 11:05:35 -0700 (PDT)
Message-ID: <ebe9d832-e414-4b67-b78e-f30a7c43a466@linaro.org>
Date: Wed, 12 Mar 2025 20:05:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
Content-Language: ru-RU
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
 <174177914766.189343.17822607487336311201.robh@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <174177914766.189343.17822607487336311201.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/25 13:33, Rob Herring (Arm) wrote:
> 
> On Wed, 12 Mar 2025 02:11:30 +0200, Vladimir Zapolskiy wrote:
>> Add device tree bindings for Qualcomm SM8650 camera subsystem.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
>>   1 file changed, 389 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml: properties:ports:properties: '^port@[0-5]$' does not match '^[#$a-zA-Z][a-zA-Z0-9#,+\\-._@]{0,63}$'
> 	hint: Expected a valid DT property name
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> 

I believe it's a false positive of a regexp unparsed by a regexp, and the warning can be ignored.

--
Best wishes,
Vladimir

