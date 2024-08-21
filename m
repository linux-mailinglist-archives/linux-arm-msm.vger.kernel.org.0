Return-Path: <linux-arm-msm+bounces-29226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5395A3DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 19:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC891C2229A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 17:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEEC1B2537;
	Wed, 21 Aug 2024 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMbW9WWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FE41494D1;
	Wed, 21 Aug 2024 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724261261; cv=none; b=i9MW3LS/ojwaseGVtakGf041VJXPw2xzASfN1hjSwP5cMxP49Knruv9/gGMU8U361AA/0VSgWOMG0xFnZc0e1Gxclj1nFIj38RLOiPOlejxtldI40ElNOVXZn5sbPzc0R1MlUU7yGMlCepE4ZOSvX3O4Ygrph8WyrHFe2zfdchU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724261261; c=relaxed/simple;
	bh=mNHz43GzhbUV7+nP8MRrUdaSSv7kYhYoglvOFPs/adY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOY9UOE3BtsqhjQLz6QCgOjhyRCai1XFvHw3hr7Xy15tbx8o4jf65zbPERN+e5BlG7RgGtNUGcTiCQXMxI7ZCNKQMY2CT7W85VBNt9KkP0ZUAGj6BCS2+FULsRM5e4kjESjHI3//ZiRIBemdvKcCO0xT6igT94JDaI2NZAYxOVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMbW9WWI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5befd2f35bfso4158620a12.2;
        Wed, 21 Aug 2024 10:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724261258; x=1724866058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dPSQ1Ctn0ONc5mVCuDSOyxGFQiaGt2sW1S9dwj7ApU=;
        b=eMbW9WWIXcj7kJVJKxEKsaHNsQ+zuPr+cXBte8lS2/OjQzP1hYrFIOPjieXf717okV
         9zVYFcIHLYTRJznS5YSGJ31e7TlwZoeYuKQKC+ngnGiCnYAE1qOLtyHMbzh8UG+kCI+I
         aCh/yFp6gw66uXBu4nz9LKS478PP/5EHFsXZ9FrPT+tVZCF9HJhV920Et+Fq+Fcv+AvR
         zCwviYZnfbcMUPvS0+Oj5wOWlDEVhaVuEMdCC5Hxq6+eFK6FYajgcrUdK1nuXuzXVA8j
         UtUI1R/T6dwLJ2abaeGqYvy+tBDcoc/BigcMGzb6Ahkc29J6FL9AHpTPZam2Pr6ucFxC
         SRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724261258; x=1724866058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dPSQ1Ctn0ONc5mVCuDSOyxGFQiaGt2sW1S9dwj7ApU=;
        b=MIVmr/+2WN3iKjph/HhOpe0rOSIstRcbNEjHVIpyoGE1Ecvfuf3AIW4cXVp3luaXzp
         4jy+p5pSjbQC8dBvbmaw3I6rvKIZ0VVUt7FHNdZb3r9kMsHFTNfb31wqkn7eGBiPCzZ4
         45gjZIddvwqMg4D4jWeI5epKd2IIbh+18PCCd85IZ/XV5Cw2BZ4NbMxHYqcS57Gh0cmv
         IG8SYqDBAXBylIbDPi3aoao9XvibG5drMUz8qtxqffSla+UN366qKPos+yzscoYnpng+
         maepSYIzGmEV6ar58FBicbFPBSST2zgoZrQ/sKroZxTnJOsPfzwZK5B7wRrNC0BQiIF7
         eEYA==
X-Forwarded-Encrypted: i=1; AJvYcCVdirUxQWIj2uvsf2TAZa93t7LaBgl6P3n88EIRcz/dBvUtmAnYQBAbpkB7tNNiOHRwGa2zyFe5NiVRQJp9Rw==@vger.kernel.org, AJvYcCWeJvRy2zMMhMkz6vu1OnbGXJDyXjgmngN749pA06zGYtQnWGbbnYMkeUZUqRkgnjXHzKaVMSEeySdA+fbM@vger.kernel.org, AJvYcCWiIBE45j99MyD+XGyTOIZLhOnp9DBfKOYpXzK/4tf2U3v1DHhEJUwqKiWZSB+EUV7p9Wx/I+cW4YKg@vger.kernel.org, AJvYcCXeTfl483hEf9RVBUp/wImEPh1+3POMFtX65UP6IS3ycqsY8vJPUMSqrJpq39VdmLT95xtZLNez/BUR@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/8qtlLo3GMBR52PR3i2RASlr/EboB+Ka8SkO8MjGU7XdyPM2
	8Rn+x8qpjzHHTi3ty63r3+9IQvN1Qqp+XV/ltUVFbmKkee0jOtnD
X-Google-Smtp-Source: AGHT+IH1MyQnN6IARu/32WOCDaqpIPYnpciX4OVIvGwDWyAzT4SMXIaa+LeEoNRSz7jqkX7pyElO2A==
X-Received: by 2002:a17:907:6094:b0:a7a:bcbc:f7e1 with SMTP id a640c23a62f3a-a866f27a24amr235125566b.15.1724261257465;
        Wed, 21 Aug 2024 10:27:37 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383964976sm924952966b.188.2024.08.21.10.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 10:27:36 -0700 (PDT)
Message-ID: <1300f2ff-7aa3-4003-8be7-c87f671d22aa@gmail.com>
Date: Wed, 21 Aug 2024 19:27:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Elson Serrao <quic_eserrao@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-2-quic_molvera@quicinc.com>
 <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
 <46d0627d-877b-41f3-83f6-4c33b562f460@quicinc.com>
 <0ebb1ca3-722d-422f-9f71-fcc61c3470b0@kernel.org>
 <2b118a49-2229-4346-ab21-0aa5377d7a4e@kernel.org>
 <8bb412f8-4fe1-40ca-8414-bb77c66899ae@quicinc.com>
 <0eca6755-a2ec-404f-b98c-ee6c9f6fb55f@gmail.com>
 <f8caa9aa-7fc4-4d42-9011-21ca40eb106d@quicinc.com>
 <81ec34a6-8627-4a59-8fc7-87eee4625b2d@quicinc.com>
 <e663d19a-0ad1-4dfc-903b-ff2012796d84@kernel.org>
 <11ca366c-7788-41d0-bf47-4f31c1ee2626@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <11ca366c-7788-41d0-bf47-4f31c1ee2626@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 8:48 AM, Krzysztof Kozlowski wrote:
> On 20/08/2024 21:19, Konrad Dybcio wrote:
>> On 20.08.2024 8:21 PM, Melody Olvera wrote:
>>>
>>>
>>> On 8/14/2024 3:09 PM, Trilok Soni wrote:
>>>> On 8/14/2024 1:25 PM, Konrad Dybcio wrote:
>>>>>> Unfortunately, no. We considered several options, but none guarantee that we will avoid
>>>>>> a crash if we try non-securely. The secure call also won't give a specific error if it fails either
>>>>>> (for security reasons) so we can't know if a secure access failed because it's supposed to be
>>>>>> accessed non-securely or for another reason; hence this approach. If there's
>>>>>> another way to achieve this functionality that might be better, I'm all ears.
>>>>> Can we read some fuse values and decide based on that?
>>>> In most of the cases, these fuse values are not allowed to be read
>>>> from the Linux, so that will be another problem. Melody can check
>>>> if there is any fuse values around here and possible to read them
>>>> through Linux.
>>>>
>>>
>>> I double-checked, but there really isn't any kind of fuse or anything we can read to determine
>>> how we need to access these registers. I remembered checking before authoring these patches,
>>> but I wanted to just make sure before responding here.
>>
>> Well in that case I suppose a new compatible / property (please voice
>> your opinion Krzysztof) is necessary after all.. Thanks for making sure
> 
> You mean the "secure" part? Sure, I don't object that, although
> (repeating as usual) I am not in favor of it in the first place, be
> cause you should use only SoC compatibles.
> 
> The objection here was for dropping specific front compatible, without
> any relevant explanation.

Is EUD-non-secure in use on both Chrome and LA firmwares on 7280?

Konrad

