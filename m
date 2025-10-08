Return-Path: <linux-arm-msm+bounces-76467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C64EFBC6357
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 19:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D155B188DFDF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 17:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2010D2BEFF3;
	Wed,  8 Oct 2025 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzqEJE4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936B2BE7DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946001; cv=none; b=Tm7MjtrwxiF1c90MT7BkEQ7fm63PWrOS7IKoDQWOyjw4SxWGKGEGVwJfv37AXx9TQGJmWz8KuJppCgAQ/TftGY+gVBdfwsE7MGNQrngQyYbbuB0yOD7DQs8cCDxLuX5pNlxgwpUu1NEiETAGKPPBS0kf6egZmpulK2yKZg7ll5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946001; c=relaxed/simple;
	bh=7uenfxZbhN2COy+Pu0VQPMBd+KOfPBPVzZt14HH5Onk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ty1rmRmBe4ieamUSSkKHVSkRfcoTJEW8MVtHFImm5DseKLAXH4JUVmSUC3LApFZ1eclvEnv9MlEvjtsr+82afy2YepKwYP6HSxENOTS/HaiovbmAzPBowJRLTJoA0lb/Kd99V6iE1OUrMOEUskMvd8DCfTW50Ycz1bPZbS0me10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PzqEJE4Z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso164993f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759945997; x=1760550797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=px+f0JQb/+e/m0dW9U+ZUXUOOFQQcWWAn8xrqf+sMwY=;
        b=PzqEJE4ZYLc++5lVPFnpvm2jliGjgA3SnTIn9Ih7NQsQUHb7klAmTCr768vAezJ8kR
         dd6gy4E5phJ0b1O9aCoo7gDFAkcGnqi/7A6aGiE3t4FSGjAA72WPuehqvItlH0Lgjs+A
         tTKb1fe0F456nRV+OT6yf+dATEhx1HtzU5FnR9c5Qx8Z2DtwYA3x179nPNqF7DNaryEM
         8D9JZC3r+PMKzC6PQ+QF87qfaYyejpVB+psILHgfXQgtfJDvuqr+st5Y5dmHlEWlwgG+
         0MmXOtrt+0P2fAItmrvsJUK3SnwWbkNmf7HaldFDpLNq/5Nv6jQt4DJRdagmOtdKYWKx
         RFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759945997; x=1760550797;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=px+f0JQb/+e/m0dW9U+ZUXUOOFQQcWWAn8xrqf+sMwY=;
        b=GxIsVmMdtDf9ClnaDpjm2W1DB2MyLJceMdgywsnuGN7F1IeCaWYCjlTnLtosV3XgSp
         cVRUgSAZXC4zayxI/Kiomz18kZXSxCV1qclAI+rhXeF9EGUKjqsdPULedq0Sw2l99jMI
         fSqYz96OcEzjVmC+9dxYPbIptm598FHqsCMoqVvv81kJlGqgZuXvbcsmAIXRazlkTKuH
         5kalmhU8nmGtuCu2tVQ7e6UWkHzbvWq5lwCJA9IpncKTlHolD0/UtAsvAx/yos93/F5+
         ZzEML6AGjXHCRbJn7FoeNrmJ8ouUWqg0VQCp/yk3apZ+xDmmrrfa7nb3DlU+VSeVUxJL
         BAEw==
X-Forwarded-Encrypted: i=1; AJvYcCXeXmkNx/JhPDDh29oSRN0K2/EpjbQDX3pQnjzqb0KOf4aWzsGYLUBNNVwr5wXb5Bk8ekemXteVuF2YsIjv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7engBV2FOpY8xXY1RAvHZQq5DJ8DECOeeFDfr5Lb3qXRaGJZ+
	gWI6rOMc3YUGHmOVOMwLtjtKR5DvUehRjl7hDL+P5tLXtXRNFmeTcdo0E4Qns6cpa2c=
X-Gm-Gg: ASbGncsqLbeNontTwEsAfdHyuCNN+FckCIrpbq+EVzWWqYRy70/KED/4QUzf8w8SGPo
	bBYiXOiIgLvgaXfvMcwb3wy6H2yVUhElsNdWSTEurv8WeQ64MZ6ZHQJFcSx2+Up9cfAziXbm/wE
	Y6QeGXgyGt7KhWlrmSKTHM8KbsxxBbKhBMtjGdhkSd+NCzaeAjEwXJPuDFwbYXCBoQQUqDwy9PN
	qm92E2PvpmAXTDtBZ4kLZ2F4NCM6qP10dMM5CyN6Sp2NqoDDZBXzq8/mWZaBWsJvlYW9sMgpU5s
	ZmcfMAOWzF7c9w8kBX1JkqEoHmoBIHc/MgYbldW16JbNivjWLaSuSTRlk28a2KQI+zqwfpRJBDp
	5VSn+G5vuDaDFT2OzjtBVzC5C2X7Ft1fgbXEj/wShg/8BEvm+IUec+CQDARnr2+0Vej+GrzTrqJ
	f1YsowauypkCeOmE8g0RU=
X-Google-Smtp-Source: AGHT+IHJw/r+nePLX03c3KX2qjVH82litB6OC27IzmUfEItja6F4LxTNp01tzn33pfo26Wfsoc01KQ==
X-Received: by 2002:a05:6000:2905:b0:3d1:8d1e:8e9 with SMTP id ffacd0b85a97d-4266e8d8ce2mr2825869f8f.32.1759945997240;
        Wed, 08 Oct 2025 10:53:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b264:afbc:dee:3d? ([2a01:e0a:3d9:2080:b264:afbc:dee:3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46faf1118aasm9465955e9.5.2025.10.08.10.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 10:53:16 -0700 (PDT)
Message-ID: <ac2188dc-d524-41ae-b9d2-f0f5ff9861f0@linaro.org>
Date: Wed, 8 Oct 2025 19:53:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-2-184b15a87e0a@linaro.org>
 <6d9af57f-9174-405b-9131-145fd6d63a5f@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <6d9af57f-9174-405b-9131-145fd6d63a5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/25 12:21, Konrad Dybcio wrote:
> On 10/6/25 8:37 PM, Neil Armstrong wrote:
>> In order to describe the block and master clock of each I2S bus, add
>> the first 5 I2S busses clock entries.
>>
>> The names (primary, secondary, tertiarty, quaternary, quinary) uses
>> the LPASS clock naming which were used for a long time on Qualcomm
>> LPASS firmware interfaces.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> There's also a senary (6th) I2S bus instance, which there is no reason
> not to describe

Will add

Neil

> 
>>   .../devicetree/bindings/sound/qcom,sm8250.yaml         | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..fd0d7a7ddc7b363a66e1e7bd72c7290666efb511 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -64,6 +64,24 @@ properties:
>>       $ref: /schemas/types.yaml#/definitions/string
>>       description: User visible long sound card name
>>   
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 10
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    items:
>> +      - const: primary-mi2s    # Primary I2S Bit Clock
>> +      - const: primary-mclk    # Primary I2S Master Clock
>> +      - const: secondary-mi2s  # Secondary I2S Bit Clock
>> +      - const: secondary-mclk  # Secondary I2S Master Clock
>> +      - const: tertiary-mi2s   # Tertiary I2S Bit Clock
>> +      - const: tertiary-mclk   # Tertiary I2S Master Clock
>> +      - const: quaternary-mi2s # Quaternary I2S Bit Clock
>> +      - const: quaternary-mclk # Quaternary I2S Master Clock
>> +      - const: quinary-mi2s    # Quinary I2S Bit Clock
>> +      - const: quinary-mclk    # Quinary I2S Master Clock
> 
> I think a single top-level comment saying "mclk" is the master
> clock and the other one is a bit clock would suffice
> 
> Konrad


