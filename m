Return-Path: <linux-arm-msm+bounces-40998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 649C19E90F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F154F280C1F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C528521771E;
	Mon,  9 Dec 2024 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anKXBPIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07EE216E39
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741500; cv=none; b=kSX6oJvTCJ36rMi7AHTXTYabESCCCJHsAXPm9SuhAgKBbVMrf6nfjymcQQEzO6HrB9jBkt7PjYXtJpiNHiJqC+8hMYye8Q8JJhMov4OzIbsGPEjfBav+AMrhKGvojNFm+mmWE7/n4tQ6C7fSuhOkpnB93v1hGLZVaMdx5PEw5g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741500; c=relaxed/simple;
	bh=Ej4c/sUXULCJXuEUxEWVOdFY9om52VxFdHBb/B1TUGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tbfsw+sYTobYwrr09E+aNPOPyhs1D0J/CoYl1qFT94Mhr7IYAKOeL3kRGYtjy0r1wZ/WIxKBO7foYX2gfIBfReUyNGVxwbZQqCQsKwAj/DaAEL93JA6Jn7lT1aqxkZAg7QaUf+cLcQNJpbcYUTvAN29Nb0Xyusb4fk7sdp57kjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anKXBPIJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434faac720bso423035e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 02:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741497; x=1734346297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mgL4fhqTxa41pcrfE9LJCcy7mu1/uvJtqmjOItdJAP4=;
        b=anKXBPIJcQxaefG6Mzp20uSt9UiMzedqWtREh/koyReEZVJqQu3oqY7T/6kn+ZRJls
         nY+xlwAr7A0lx0PKKrs/tqOCVdY+gHFZ7cRdEgbiiaIqjHcWPYI2KXb+rZ9Kioe3xW8/
         NgrEFE+dWOLNRoUgl25sBolfM6ka1jqD9euyC/0jfDxK7MXgYKDtgzxJlZNqfe9pIz4A
         /td0vzkh/6/QXBby+EyGc2W70VDjnvxdlq9xJM2yBn9xp2vUHBWCJY8G2HRMd4JZG5GN
         8eln2hXf2bJ3me1EPzgRglXwF6dtUwbBvn+OuknsWszX86xGzQqVflDJ4Cpde1UBxg9c
         0cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741497; x=1734346297;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgL4fhqTxa41pcrfE9LJCcy7mu1/uvJtqmjOItdJAP4=;
        b=Cgfwoeq5jjyoA8u/mVXGMH0idrPLGyDQYTtxfRpyYu9MJJ2a2ho8IupBU9NCf1fNMX
         +e78Xc2saI2JLtrfIvsf9kytxlPPvTj6Sg7dVM6jcwkWi2ueNfz2Fk5p82Heiqdx9mrb
         gjDap4TF0FwvjeLXJWjabsoSoSvADvf1+pAgveRlFBEX45mM9GN7b+howTtYaxYWpvkJ
         TM9nBPExuHFnBoMn2/sLjNv9ivZ6kGiFQd6cpW/cQnoTBNAuZsJ+WHcEz4PFfoWu5v+n
         bNl0oXeV+B68XMKaG39vKvG9mYwVDMuTfkQks5Ti83zQangBzdFPeobRV9xYb9gSxXOY
         l5Dg==
X-Gm-Message-State: AOJu0YyCpqxj13WoSeoJRRAzkt9veFTMpzf1+CiLJyw24iWr4V/y7nG+
	lcfahDcKfcT8JDoHkXPTmXNSIzU2ReVe+N/9i384MghyH/onDxJ8gYIyw2h3KNw=
X-Gm-Gg: ASbGncsTAfZ4MtdF1FaK3OacK4OOWIi+y9KmK8SGW6g1jaB3lgTKwrOLg2FSTZtzQnq
	+WhX5W7yJYX/qtOk5ZugraJq12L07DmTay0ouFMBFzdfEZ90n6SFEzK8eR48DBX+YrGI/dAgUWP
	7lyygv0XMLOfmxemUDZ6pRzha4EHTRLE7mGpK4yzrHs7WedoK1BrJ0Y8FN+QHD3RYXZQIqcjXFx
	TL3JRAwkDqc4CZgzYqixwB7RGmri3HIwL1qdT86cpVov+QeQkiMT858bQxbboWQC4S2rg==
X-Google-Smtp-Source: AGHT+IG3kFbmtzjRS5yj7i8UZZCBsXP09+cU9z4XG4DqiGRqrXbwAId60CYAnSczvDc/ado6pTom8A==
X-Received: by 2002:a05:600c:1c0f:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-434fecfced3mr2056845e9.5.1733741497052;
        Mon, 09 Dec 2024 02:51:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f9da4cd0sm28180385e9.26.2024.12.09.02.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:51:36 -0800 (PST)
Message-ID: <7e2013c8-e11f-47b1-a28f-960b2aed72e5@linaro.org>
Date: Mon, 9 Dec 2024 11:51:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PATCH RFT 11/19] arm64: dts: qcom: sm8650: Fix CDSP memory
 length
To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
 <20241206-dts-qcom-cdsp-mpss-base-address-v1-11-2f349e4d5a63@linaro.org>
 <82927e0b-d048-4be6-9206-38d4222ea6fd@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <82927e0b-d048-4be6-9206-38d4222ea6fd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2024 16:42, Neil Armstrong wrote:
> On 06/12/2024 16:32, Krzysztof Kozlowski wrote:
>> The address space in CDSP PAS (Peripheral Authentication Service)
>> remoteproc node should point to the QDSP PUB address space
>> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
>> copied from older DTS, but it does not look accurate at all.
>>
>> This should have no functional impact on Linux users, because PAS loader
>> does not use this address space at all.
>>
>> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 95ec82bce3162bce4a3da6122a41fee37118740e..1d935bcdcb2eee7b56e0a1f71c303a54d870e672 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5481,7 +5481,7 @@ nsp_noc: interconnect@320c0000 {
>>   
>>   		remoteproc_cdsp: remoteproc@32300000 {
>>   			compatible = "qcom,sm8650-cdsp-pas";
>> -			reg = <0 0x32300000 0 0x1400000>;
>> +			reg = <0x0 0x32300000 0x0 0x10000>;
> 
> I tried to have an unified style in sm8650.dtsi by using 0 instead of 0x0,
> maybe you should keep the current style, as you prefer.

I got comment for sm8750 that preferred is 0x0, so above while touching
this. Also file already has inconsistencies - 0x0 mixed with 0.



Best regards,
Krzysztof

