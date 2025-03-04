Return-Path: <linux-arm-msm+bounces-50222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EFDA4E88D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C2368A2A1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E08296D71;
	Tue,  4 Mar 2025 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nuur6wkI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F799294ED5
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106973; cv=none; b=uZ1pl0PePm2qUiYsp2ymCzcTsus87N9m8PRUF9GP+gkWdonWjjphXcElGXTo9QlGmE8k/o07n/vvhxPi1ysJEmUeoMSiQLVVHoeik/p+oEjQIMNagdQdbcbuWBQyNAOuvwcPWwB5UwxwWbEwsVhaEC/tQ2oFe0fEVus1uLRjmLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106973; c=relaxed/simple;
	bh=9Z5yiF0KSO+NPcolTUzxks0Yc/uCbphDTbGq4JaB8Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oc21jGoQCzZ7IJa3viArHX8IV182ieGHz5oSie+Si2zIdhlMU6Cyjvtnk9h0UQ9Un+kiyrgRTHNIxt5eeQDoAkXv2lSgc6hbRpp614KUHvhasUAp0PdG7+0J5XrkB6UkrpLoLE31cDE0gGYbTdNft9dA2IBU4RldfINIPazG+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nuur6wkI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso6562165e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741106969; x=1741711769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zouj1Hp3SfYIrOLTqQLJUUDe/x9qYEs9R8lkvyWGV2M=;
        b=Nuur6wkIzXEfa4bQLuv4P1LuUykaEFULdZQ0hjYoK1XXBIxOjLbbNzh7jqlOlyObI9
         D7XFMipUXdbJ0tPH7Z8L1TgbSIwDimsGvZEaQT1px9KXuSp5Dj964IqB2+oIxuURTdNG
         jiAzaQY5eGkr4Og0Z3LmcmgQO+ZuE3wwvPS8bZrUg+sZ80BeB5KoionPzfeyyMUwpnRi
         EGwAvkqy39zmf/UNGyIJ/tBDCLfVhDsT9flZI8llVH7qBpCIWTqEeebzTdyReYvz2zNH
         cYFBqms1GoR1Wzx1q/pRCtRNGopLuK5JUa3gVklLO6TG9ZeJ4iXZCYchisIm2wEYf+b+
         Vqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106969; x=1741711769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zouj1Hp3SfYIrOLTqQLJUUDe/x9qYEs9R8lkvyWGV2M=;
        b=Qi94gfFHmxXnxZydzatA27I8P4sshjJRQuKvVqtSRiNfnjDtRzldYu6Ky5grBoSlr0
         TrMYO4cuz/kMTbHzdmWLptiu+idEu2TX1kkChQlJ3r8NvI/U/BPeWxodFrfW2J4aOqPA
         Ql0f3LT6oWg4+LOLM86yakhkEoDIhLO7GkSfF7aVrL5K3QY6eocncz6PZzoXD1o5pkXb
         MEVGuKCoahYbzrnoMfdp+025Yftefb9A7OES32JVZFI3R4rETkCjsLLy/zrhRiBwto5Y
         h3/y4eV9QIVNTrhVPmcl2nGsRyKUgCcr+4/IyXYxYnayyF34DAAQZ1oZDLlAsFNkYOTR
         wvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwznBydwRFXN7TpkMDwNpXIu8fBu2Sh9CC//HHvzwMuIiB3dQUJvqGybpkQHaMG6lktc3wiXVp2WVvjf9A@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9D4a8u36QmlW3uxt1KVYum1RrMQKBtiGvg0Yr2FiLLUlNTuqo
	Kj0Ts6XZUzPj1av8uSNNOOYsHa1bAy+mEcKJeUFo90+YdOYLcu0K8a+f7mHrvAA=
X-Gm-Gg: ASbGncuH3J0rXvdxATaE1taDTnxqub0U702+qXv/Az4j2sHyXo6ecZmZiOrGIDw1KM3
	bFYBe0AeEKw0NnpjUlLmMnI2+u6nwR27B4YI+gQc7KQJ+MqjEmVM6L0oFdmv1MOKxNyxJN3t07+
	TQvazpDNGJuTBODBaagjH4sU6FA0zyfZUhgebQhBPF4TAo2Xy1X1Lc6Gf18YM33zcoO1dkHNGbA
	rMguiQh1cI4TWD/KPUEJ77k5tm2TeOoxdLRTuhVqfxqg81usLpB3F2/G3MYsLbQjLswOYUyiRF5
	1UGWlAj28xbL47O7ZZkF1Z2zlOJAlTRhPYU67/d/mXiYnSna6Uiw4KRfSVQ2eCOPnMbVsx8xBTH
	RfiM1uFlJcQ==
X-Google-Smtp-Source: AGHT+IHnEjomaLJcNubPCqgScHWOFRvf7a69WTdmkPmuw90OYKp/8j177FQoZiJgfCYxKTwR20hDgA==
X-Received: by 2002:a05:600c:1d9e:b0:43b:c309:da40 with SMTP id 5b1f17b1804b1-43bc309dba5mr62613095e9.4.1741106968691;
        Tue, 04 Mar 2025 08:49:28 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28b285sm204943155e9.33.2025.03.04.08.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:49:28 -0800 (PST)
Message-ID: <10ab5c5a-68c5-4f5c-9484-a5a8fc420ad3@linaro.org>
Date: Tue, 4 Mar 2025 16:49:27 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
 <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
 <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2025 16:41, Konrad Dybcio wrote:
> On 4.03.2025 3:02 PM, Krzysztof Kozlowski wrote:
>> On 04/03/2025 14:07, Bryan O'Donoghue wrote:
>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>
>>> Add the required nodes to enable Venus on sc8280xp.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>>
>> SoB and From do not match.
> 
> .mailmap breaks this
> 
> I previously worked around this by kicking the relevant entries from the
> file, but that in turn broke base-commit in the cover letter
> 
> Konrad

OK with you if I switch your email to kernel.org here ?

---
bod

