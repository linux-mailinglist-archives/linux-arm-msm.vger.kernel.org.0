Return-Path: <linux-arm-msm+bounces-2281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E653F7FBC11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 15:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83142B20D8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 14:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E95859B65;
	Tue, 28 Nov 2023 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fg8m6pLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9DED53
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 06:01:16 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a00cbb83c80so754229466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 06:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180075; x=1701784875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8O6nPdgp77Ha5oQtP71MkxQpqaYfWS5iS2ThHn17jE=;
        b=Fg8m6pLiqkOypLqvATzWhw7B+6LCxam1CgURqBzrjLsH+b+ioPzp4UdWfNIu/YNDc0
         akNCkOthDp//lRLSWoNM11F7bP8l0u8msppQ6rS8ArQ/DWOlbD2wshDHWASwiTwqR4bS
         O/RyH+sdVjXBNQ50zh7fCgQe/xoJSC6JlIQPDsenHen2GMSDFQHzWm59KQz4tdo/Elqs
         DXVLyD2pmTvXyk7r6D566JS4/WZHpUikRh7DL3gELrdeay5GLXmZ+q6YEPmgH6yn4/+B
         Qb0lcn1i1q8HuqwJCIWz3RnMv5EBMBgcopNKm4ZRVjsub5UETML9d5BeJRDU1iYWvMAB
         prgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180075; x=1701784875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8O6nPdgp77Ha5oQtP71MkxQpqaYfWS5iS2ThHn17jE=;
        b=mQkANTtKg02BcN8OOM7NlI+PAijzNoYh2TVHUp7EebQLlYS1XHco0iUPNT2VvrZNmv
         UOmE3K0g0iR8Ss27c2Lz78tjhQaODQ7FQ2sVtflCdyNdAvkDUDl3lj2/jyzK8TzAea+e
         KTzdxchmSTe8crkl8ekfFuuc1u6hiSg/U9JcT3HCD+KkqWKArRFECUs5EY2Ql8Pb69Uc
         Q2PZQR3NbPPzaEAKf3g/YXf1xIl/cq/3pzJ3U+RZlpw/V2evmejL0Cq5JOAbdgdFN/+7
         v9qbELOk4WOVXyYtWFINoHk0+ED9uZfv0RW4/VEZStwAjF66dnTGpIN7Xs/U++3DcDnb
         AsIA==
X-Gm-Message-State: AOJu0YyLv/x+OhMNfE/QLiSNaKeq5YDR2YsezlCdggprcpW7nklkWsVl
	UIVZkk1/3ZLZCb/GJpA3KFOU4A==
X-Google-Smtp-Source: AGHT+IHQEHZ1np1OwZ6LDhGAPAswOtYaDcxZs2yD0Jb/iMLMD3RXrIOZNuFkKUONlSNzb5jWLFpNUw==
X-Received: by 2002:a17:906:2dd2:b0:9ce:24d0:8a01 with SMTP id h18-20020a1709062dd200b009ce24d08a01mr10691625eji.60.1701180075039;
        Tue, 28 Nov 2023 06:01:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id pw11-20020a17090720ab00b00a0f1025b17asm2545133ejb.130.2023.11.28.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:01:14 -0800 (PST)
Message-ID: <0acdc122-b7fa-4bb4-b838-6420cd43d0e0@linaro.org>
Date: Tue, 28 Nov 2023 15:01:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: ipq9574: Fix USB
 'vdda-pll-supply'
Content-Language: en-US
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, dmitry.baryshkov@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1701160842.git.varada@hu-varada-blr.qualcomm.com>
 <f98bbf0a515236709d999010f08c8f2470a31209.1701160842.git.varada@hu-varada-blr.qualcomm.com>
 <832a6d4f-f561-4cf5-b1cb-7e4b2d4d50b4@linaro.org>
 <ZWW9oF24YUGfev+2@hu-varada-blr.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZWW9oF24YUGfev+2@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2023 11:14, Varadarajan Narayanan wrote:
> On Tue, Nov 28, 2023 at 09:51:50AM +0100, Krzysztof Kozlowski wrote:
>> On 28/11/2023 09:46, Varadarajan Narayanan wrote:
>>> From: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>
>>> The earlier patch ec4f047679d5, incorrectly used 'l2'
>>> as the vdda-pll-supply. However, 'l5' is the correct
>>> ldo that supplies power to the USB PHY.
>>>
>>> Fixes: ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
>>
>> Doesn't this depend on the driver change?
> 
> Yes, will mention in the cover letter.

This commit should have it in its changelog ---

> 
>> It affects both existing
>> kernel and backports which you claim here should happen.
> 
> Ok. Will include stable@vger.kernel.org in the next revision.

I wasn't speaking about Cc. You indicated this should be backported.
Then please backport it, without previous commit, and check the result.
Is stable tree working correctly or not?

Best regards,
Krzysztof


