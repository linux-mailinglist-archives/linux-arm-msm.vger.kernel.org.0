Return-Path: <linux-arm-msm+bounces-59824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD24AC8156
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 18:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A197316AED6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 16:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D179622F173;
	Thu, 29 May 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQn+W4+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1722DA11
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748537916; cv=none; b=UYeUxUDVl5zdNXf+HfiZpbRdStqAOVtlYAqPmN2WtTrp3rl8xjOtnge/GEO1FgGdmzjlE5aF0a97pw2wN+Ns/mlMNO7na/y/E7K+5TailmY2RfLUGixPa7PIsTBNFf2qOYuDO+YvhoJfI8qQBPuZuKuz23KOn2p9gBO5WBUiL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748537916; c=relaxed/simple;
	bh=Mn25szTLd+/7UcIsObRFVnR0C+rGXhS/mFuBtkp1HBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qI+TektmLRWLL2cqtQ3G72BDrvw2JE4IM2b9ntoNG+rl91FEtQ5AUoAm+VTdw6jtGstYNcL/nfmTh6lyw2GabTZKW+aYTgsO1ZMVU4XjkpdWwy5dUraD21cvW395ZS3caFjbrvevXnqHkrw66BKxfy2SmAngYqcbXiw60U38q3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQn+W4+P; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad89dc2d8b4so14989266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748537912; x=1749142712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pt49z1zm5clp6OpH3KRmjYQBNRZSX8mdh4YUkX5ELQo=;
        b=lQn+W4+P64Qsr3HHsueRl2uxrVJr+1yIP2j32v+o3/ffoBcwpJD31Oy1pUFxi873Hz
         ElpQaugpspk+RVBgvx44Upuj8DHDqVK0Uk7MirnURYND8ZUzmKL/VZYy6JMy1lJ+6r6z
         0JlenKIhupoTFjYCjZ/S23v96c6Fc4V8SXWgk2M0dKkJLgiw1+MiSdu6vp/QrLWTdwfm
         O+xtp4Fr8udJa7gKi99z4cSlPoenCLeN0mSVJbdRMxq4Z+bJMXVdz9OLmiiKBQ53qYsm
         C+z0X62WKJkUWtPZf/rnDdenCvCIk37ZMHDt+3fg9k7p5GXuj2TwznuFJaRI8XYVHtLa
         qWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537912; x=1749142712;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt49z1zm5clp6OpH3KRmjYQBNRZSX8mdh4YUkX5ELQo=;
        b=rwTPz6POSwmwX0b0NWGfRZPlvYoHpNy6GlFJFbz7f7XenG1mCJ7Ok4vef1N8Ny86AW
         zh8I3c32gLHs063RUyA0LIWdNsAhIC66vwojBiHIjEEYdrRDMCdogJ1h6IlByMwpj7QL
         KjeVw6a0cR8Af3XDlLg3gGyaWV2ViY/OK/cp6aMrCAJNZpVPzBXkKpNdi9PFQ6mymnoI
         tEy5qVdCruoO5nwRMSCFXVfvl39Sq6cx5nrtK3hrg3H88W0WQVzw9qlqQHzMMkSgSNVS
         vCmaN8f9XVi+kNhqojeIRuLOszXASha4/Di5WvKmofxZl7wTkIunkQuorRNOZrEW2asp
         H9wA==
X-Forwarded-Encrypted: i=1; AJvYcCUoRvkpo9PBPiCe0lTqfIwwzLzuXIoxIcARiX0IUkOpedt6huZFDyhFLAY+WyQuywZrS1d+FT8UWpqdFvco@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0J2xwfU5+R44gxGteZgUXacJq2n3KYux583QaDzuAHVd1PIjA
	jdBv8GGKAO/xwmQdXt1YSczQ58VMc/m5t5VE+CYYZe/VNB0ZetZ87S7gm1vxfSSGFLg=
X-Gm-Gg: ASbGncuBXPz77uY6hLLglHQ6MvFagvDIt9FB3vZJhGuCl+o/uVUx/s1NUABO80oPumZ
	bzfb53sQf6J0XVZSrB3+PNWfIrzEAwdQm0JS+HqxL3YI3bL6NTJei/yFz/wGWEuybvOU5FRAUyg
	247+U5nB4Ct21J/4P1EGz4EBeF+IrGUElkWMAjT2lSdFkQu/w92HcmOWx1LrqfCZYRzdhPBxi7s
	tOP1HCEavmUej94VZcLprmPuU+I+McieoC31ijUvP/e1ChACGcJsQHx/XIKzJ8JW57UEO2+QGAk
	WXR36SmO0nFS5P4dGYHtW71J6UpwFqQHtUiYrcd0vwwFP4r7WwynZiwmdhatdAZGoC3gDrd2wBa
	cB6or0A==
X-Google-Smtp-Source: AGHT+IHIk6xC/xP8CBZL2DsvKzsHlfRWJIaERxSwR/Iy1mqo3hR+EdBJCTlwv0dYBzOfKzEp91vyCQ==
X-Received: by 2002:a17:907:3d42:b0:ad8:a43f:2ff with SMTP id a640c23a62f3a-adb32263a71mr7460266b.6.1748537912471;
        Thu, 29 May 2025 09:58:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045c8sm171769366b.103.2025.05.29.09.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 09:58:31 -0700 (PDT)
Message-ID: <a0b381ac-3280-42df-bff1-1998e0b9c154@linaro.org>
Date: Thu, 29 May 2025 18:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
 <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
 <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
 <7938374e-85fb-42b9-893c-ec3f7274f9c0@oss.qualcomm.com>
 <9c8fe115-97e8-4966-b332-6de94015f832@kernel.org>
 <b4235317-97c0-4225-b6af-f79358cbf508@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <b4235317-97c0-4225-b6af-f79358cbf508@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2025 18:34, Konrad Dybcio wrote:
> On 5/29/25 8:58 AM, Krzysztof Kozlowski wrote:
>> On 28/05/2025 18:58, Konrad Dybcio wrote:
>>> On 5/28/25 4:37 PM, Alexey Klimov wrote:
>>>> On Fri May 23, 2025 at 9:12 AM BST, Krzysztof Kozlowski wrote:
>>>>> On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
>>>>>> The pattern matching incorrectly selects "wsa" because of "sa" substring
>>>>>> and evaluates it as a SoC component or block.
>>>>>>
>>>>>> Wsa88xx are family of amplifiers and should not be evaluated here.
>>>>>>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>> @@ -23,7 +23,7 @@ description: |
>>>>>>  select:
>>>>>>    properties:
>>>>>>      compatible:
>>>>>> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>>>>>> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
>>>>>
>>>>> Why dropping front .*? Are you sure this matches what we want - so
>>>>> incorrect compatibles? To me it breaks the entire point of this select,
>>>>> so I am sure you did not test whether it still works. To remind: this is
>>>>> to select incorrect compatibles.
>>>>
>>>> Thanks, great point. I tested it with regular dtbs checks with different
>>>> dtb files but I didn't check if it selects incorrect compatibles.
>>>
>>> Maybe we can introduce a '-' before or after the socname, to also officially
>>> disallow using other connecting characters
>>
>> It is already there.
> 
> Pardon, but I don't see it, only in the 0-9 group

Then maybe we talk about different things? Because the one to fulfill
your request - to officially disallow using other characters, which is
part of the goal of this binding - is here:

"^qcom,(apq| <snip>  |sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$
                                            -----------^

That's the hyphen after soc name.


Best regards,
Krzysztof

