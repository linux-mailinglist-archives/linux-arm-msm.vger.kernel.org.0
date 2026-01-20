Return-Path: <linux-arm-msm+bounces-89793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA04D3C514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B36458AADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF35D3ECBD0;
	Tue, 20 Jan 2026 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYHaQ6kz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5HWmg4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5863E9F9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904322; cv=none; b=Uk4wveuinKuLqPlSVC76hBl4UfgvIi0H+ingVzdIgaDsPBoiH8T47pLaXXEULbuV5qtLfyaztI+sPZKJGmZMVtRKXko2Eboqnn3qG2Qb5OG03Jc84GooMVCL2aFZiIhL4U3tPHvVDOqGRGekYRV4fUzTg7rpwlb9OOZqz5oDlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904322; c=relaxed/simple;
	bh=+ndw8o9MnQLFrcY15IN7f0sz8uaiDSSo7gv8c5lzkg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ghvti5ermejESA3BrABsoLVl8IbLYsNicYfJSk7xWsjofzQF0gKQoBZ29e6P1jB3E+VAZoOrQXHonJXJ8RrpAydxmmAamhdAdw/q8JYAYiiU4LQx95ciwwuNV5+nrg8yIM73NSFf7wLRMSDsJwt+sleWC+Sqo1B2s+zMVrWho20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYHaQ6kz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5HWmg4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61VMM3772351
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqVUtrCv86hFunh0dtnQ+VQv4bNBxhGa0iC2YY0bsgk=; b=YYHaQ6kzFpQaIlDP
	q6zuYlddDeS13LO1FK/zyWkjZvdysZkPVa3gE7zvhVk4yl1MHU3Tq0UJiZAHTGXA
	jLFB6tOWkuoXROFDHP0TgNdzUANdora7m76kW6BUH28LoT5FQ8B8X2Y7Z15yMMrS
	tYvxUghjddmxE1kbowS5KR+jDX5SkyEk47XaRxiNSNVnZKWFwY8N0iKKszjlF8+i
	vAjd6zjz1wWABWz4yaePFVNbRQOsuqtVqopz1dXSaP80RevMAVwgd5+BPcuYjiGW
	l+sC/SfSBimEDngaVBcIXKB4LaSUF48ePCQs42w06Q4Dzmt209aGYuehnh1Xa5HF
	N1pKaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wrt6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:18:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-501476535f8so17732291cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904319; x=1769509119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqVUtrCv86hFunh0dtnQ+VQv4bNBxhGa0iC2YY0bsgk=;
        b=R5HWmg4T0kW9M3U31701HrnovsSEAazJoO+sDrp1jRAOfYaN8u/hb+DqizJSgzdKHh
         bXQHfEzxmD6DweQPgJmNUIy+1+3+bMEx9DGrrpV7XYwo6LGOjnxmRZhN0AUAYgyynjYv
         0QURwBqtFggZ0NsFtvGjoyM86OeKFrXYtnM2HzDxAj7HP1gLoNsKMxHZ9ojwTn2khdrz
         YTRqLMn0ORmI6a/N94fSEOyOaAN2B/n6luB97CPtuC/akfiRfeSZeeI2ebQwkn5KcrBO
         /qZMxezaC3iP+GIspl2I/Rw0ZzkWnDYOewBgqy8+OTuSMP3QXJlz5r2Mge2w5PuF1ena
         FBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904319; x=1769509119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqVUtrCv86hFunh0dtnQ+VQv4bNBxhGa0iC2YY0bsgk=;
        b=VwickL7yZVfwZxs5o1KmCniHVoLEZ7Mm7SFTimZrmPZkSFjKov7Yt7jb4O7onZZR2T
         0uZILz0xP9/jJdeKXekUHAS9iZQ8t+PHzlITn7FkOhqWl4o1DV5PoGpJ6cikjoLl+A0O
         0AqGdeGs1FrjHrK5cPiz05mnLtbPAD1/UEyfDimFlN0sm2zGD6Cl5ZKad6Ng2aT7g6SB
         FIL88U7Todv+wQcJfFne9ekbK0xVab4z7x3cC7WrAJw5ZeyuHgEBs7OqxCcvut5X1wBX
         E84cuY9LlNQm0+P2ia9Xi3FRTIX8mHtkHVrqjORckvGf02vmID0wC5JpuSlCjqsr32Vh
         zKfA==
X-Forwarded-Encrypted: i=1; AJvYcCVD6Ih9VnWDlRs+GPIi+35v4HIBU9G3K1IPUoNTHmjUXC/FhmDh4M+ZKgEAbqIe/lprxRMa3mye69XHTchY@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOof6Fi6MOLgKw4YU09uIHdjSJg9xZXhF2wJ5PnH79rW4Pk77
	S9cMdO2ZFUJ6Fc/6PbmRxWVc2j4/yOsv8bAUTtkIPqHIQWnc+kDd62PvEMItzSn9AF0QaB5Wu2f
	RoWwe2T6GdzbM2ugIeYstdjhY613xzFxmT78hMdm+NdDRGYDky/YeI0JvmfhRovNqGYq4
X-Gm-Gg: AY/fxX6O5vf8ecVdD/lfeV0yks4RNG35qABMc4BTw+NjC+zlJHnMEXwZPkL2G4UwsZ8
	MOk+CEmf5xhQKe1gGTup4CIwyaxsp/JGWcvCCyfRjEQpcilkrYm6+j9M1imFuEax9fCwLveLlVm
	Ftc7+D+/07ghLkb7JawSPlj3DjfF/5TYxLma3HASJ2Bi+ve6K+niNdiyoZ/M+DPuX/bjeInN8wJ
	CHdtAxPK1DWdlSxPHR00y9GbRT3sgQ2yGMV+47MrU1Tq/I06PaFHpmwvg7wEsXMfoM82oEk8STD
	8qx10/gdMGXq0xZUmRgyvJXae9a6uwWMB2lzOPDc2w+0Zl131RtZOFWttJ+s1GH+Cm57JDrAsMy
	fYlZmLXgIbij6R09QcR/bHsGU/3G7wS9sPwT4NteLngYCkp02n6ElTx5lntKK844gxkg=
X-Received: by 2002:ac8:5d8e:0:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-502a16520bfmr151401091cf.1.1768904318729;
        Tue, 20 Jan 2026 02:18:38 -0800 (PST)
X-Received: by 2002:ac8:5d8e:0:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-502a16520bfmr151400901cf.1.1768904318193;
        Tue, 20 Jan 2026 02:18:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce213sm13058795a12.2.2026.01.20.02.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:18:37 -0800 (PST)
Message-ID: <66a2cba1-551f-4f6e-b8f2-66524664c495@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:18:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
 <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
 <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rCXmXKNnva8wJ-DRjD2UCAW6C2ReGj4a
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f567f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=khr0x14q-FhmMLVjjbIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rCXmXKNnva8wJ-DRjD2UCAW6C2ReGj4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NSBTYWx0ZWRfX4Un+nT7i1xzl
 wJg1xZ908w3ZZh4WKtZg4ZUtlPeRvXMWEtF85iyRWPjiySLFI8ckXac4uSAdT0aeWNNLRCRSm0f
 PTehW5gOJWv/nu7y6+MdG9WhpO+W8zRF0jSqxHMDxF7gfMWQyK1uFQ+jVARZyHVJXjPVg9chHxr
 EBWjBeQAn47K7XypMmzTbo2UrpwqQJevneL/+xRZlkJ1Roqt/IHzeSqrs2JF7Dpiu5Ucc+w4AZb
 ak5LDyfu3i0zZzsNJLTgnTv7fOvgf3a4dwYPCdfhN0uxHCHL/czocPGB59eRRacWM3ER/lj39zI
 WtOePrLa71hEb4FQAY1ViBakPOof2VMpUljFl1QjaJE9mNU8mbOFgg0txji47e9v9kFpxgpr6WR
 uGBaJqTYEUbkvc8eSlUf+Ukb6L8Y8JijeaiyO7esyZ0G+4FzC6SQh69OgzrcTQ/oiclF4tYZHX2
 GMPeiaAPXiIbE0xGkxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200085

On 1/19/26 4:52 PM, Luca Weiss wrote:
> On Mon Jan 19, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:22 PM, Luca Weiss wrote:
>>> Add a node for the Hall Effect sensor, used to detect whether the Flip
>>> Cover is closed or not.
>>>
>>> The sensor is powered through vreg_l10b, so let's put a
>>> regulator-always-on on that to make sure the sensor gets power.
>>
>> Is there anything else on L10B? Can we turn it off if the hall sensor
>> is e.g. user-disabled?
> 
> It's the voltage source for pull-up of sensor I2C bus (so
> ADSP-managed?), DVDD for amplifiers and VDD for a most sensors like
> the gyro.
> 
> So realistically, it'll probably be (nearly) always on anyways. And I
> don't want to shave another yak by adding vdd support to gpio-keys...

That's okay

Let's configure the gpio70 in v2 like Dmitry pointed out

Konrad

