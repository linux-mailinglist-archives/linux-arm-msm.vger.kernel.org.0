Return-Path: <linux-arm-msm+bounces-86851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C8CE6CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91DDB30019E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD2A314B71;
	Mon, 29 Dec 2025 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTd0PmDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvX5xO8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4B13148DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013198; cv=none; b=b38VaR1AniWvkZWeCFq6pHxCaGSKk9bdRw3eZqz//wMEJju1xfrs+DRLSsk4Unw0N8GM4TBC2O+QzbAAd4XawXl/ReVI6r9/3ICmn0IRvUE+6fhIHJ9rhc9N7o18UVB7NXrRmo0x8R4OcL4pgOYPkmLlgGWWCuNFMDNf6YhQtS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013198; c=relaxed/simple;
	bh=YrEYPEE2xkjlllYt2AQUqb1lEHwkSqeZ/XxhaXWYPMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTv4CT01QdQP2DzvZmIqDW5CnbB9It71FesfF3YafulotNR5B1zi1O0e8s8p4ZWXS1rHJECm3q2i9Zpev6SPPfyx2cHmUD8ja4nmB0KX47IETovSyqrmDHZo/mFckX3VqChJWVYBwb7re0eorWO291RDS+aNxDUf1KlZ9xheQac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTd0PmDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvX5xO8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA8hxO3661000
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lppzLRQziSn/ky3WLICm6U224lzuS0fkJxQVIlffnIw=; b=lTd0PmDknq/1RatH
	h5/cQH16XizotfIkDfvSdmBbZ+JHYLsk4FnlCD/k6jQA14oFwWTRWUhcGhi0KzQW
	GHiQnkqSKPS4QSv8BSLLsQY6HclL68UzQXQAq/aFMk0pboe9xRD9yldQ76UxVeik
	jpv+rFTL0z9jT69sUH/joQ7YagCAu3OUk5sDNsD18d4S1GfcvrzEgJKxJcteMH3O
	nlLvB5j4trPNhISwrCFcQOzG5kbZGx+t8lfGUs21y/bfAzBsXubxo/ZjXbxltbXV
	Nzr009lFIlaZRM+V4GqgO4FIMd1tSXn1zmc8v6jpgmtZYsGkPoOD7CTj0nzD9XdQ
	PgjuhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg4def-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:59:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so24724361cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013195; x=1767617995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lppzLRQziSn/ky3WLICm6U224lzuS0fkJxQVIlffnIw=;
        b=UvX5xO8ro9qiWJR5RuC/rdu1Q8XhB/Z7cyJZkPr7Vz5EJ8nvxDvcgkfOwxGzJu4Xq7
         5SArgUtd0kEeA0K0N/xXQnYBqpEfGkrD5yaBgrluYAowRJOOmpUrAofu9ur7O0maUMmy
         vxa5SDP1lT1OBR3kNXE4ehX/EbaYEHd1sTCNoBKZ5rdCUSrxWHCD/btl+p90j/jT4pyo
         aspZrlLxqPNPmWH14X+yqLVb9s4bCcN7HsPUPHh+YeJqk4m95tKVtTaJSJtOBiJDpg3E
         jGFMXCRD5SVQP/s+OnkY1Q4CboqKa1NWNs698SLn4sqQ4EFalAqCJBqLcXL0s2pPPXiG
         Z5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013195; x=1767617995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lppzLRQziSn/ky3WLICm6U224lzuS0fkJxQVIlffnIw=;
        b=AI6+XLG4+u/YzwjVzYSsfqFCT4HeoADjPrM581kDn1YJa6+ld0p+yyWXE5KM9tU00s
         CIpBdTCE1PgrD0PQs5n9hVb8Zxge9Hhrp9n115CfzhVJc5eOsG23zWzstLF6SQ5SVl2O
         4lQp7tpY5fSPzCNGxB7Y+83u103PJnpLq3cOzERmvR3F2jZzzElxkDV3d7vX/jWT5XRn
         /QM5wFwTmVjpa5RJQh+Ft7gdoF96wYbilj7DPXd2kqDzcGGR8mvnLWd7CXp/ljj57c4G
         xApjKXGW2mWuGl6W6Wk+M+zLRSVhBaJ/s1HPsyvb4Lhz5dYoHQ3zqylOK5XisTBUlBky
         WcFQ==
X-Gm-Message-State: AOJu0YzZo4c/ev+n3l18heI5GEKdaEIb34oZNVUl/zUayr30jOvzslv5
	5VkndwBTojJlfWZUSGPKV8aMIvRoaWpLp8gOtV6Nx73T9t6uxinS0z488V4J2TCjpLADvRIYnMW
	Hl4rsnx1wH1Rg4nfINJGlD8LCjnaGbiXXEKyGy7PV+ZjI1J0Sj3HwhNZnKa8s6Boj0cZ8
X-Gm-Gg: AY/fxX4kcdMoNyAc+xGAw4cHg6icszHl9vWm9aFS2VGSvUEErFFKmOjyTCKkle74aBX
	x/mQK9zGkoLNk/vL7tUXZFH1RipgUZQbb9SAswSQ4d4Vk0HXP1D4MvFkf6CjasZqlqOfQNK/BOq
	QctZivKRFE1u8d68Zp7QB3dYiG2ywJD2nLWdJxzCKZhCsSvkr9q5md7duu2doX8i+1Mhp8vW8ES
	/OrRRzj4BCxMSDA16LOxnZpZX6lJuw3EJ4reVnt77qi4ALZmR59U7H7mGYTCbCzNAVWRNw04OJH
	fAuPn7tsWEtuVnStG9w1QSMoDEjmV2RV2yvxajgYYhvLxrRPBMh08z9/pqLt01fco3V8HyUPXc8
	q/HZJwMXXJkJmcNBzJ3bmGENoStrzy/CpgTFHIn8xVNfX62PuuErtnS2O2X6fwxuFpQ==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr344999931cf.7.1767013194702;
        Mon, 29 Dec 2025 04:59:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGAFvw7pYcAmMdWf+AlSbzerMstrVknJrcdfgc1r62VyRUTXBOQAQ3md6CkH8xxI7RMqFzxw==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr344999771cf.7.1767013194287;
        Mon, 29 Dec 2025 04:59:54 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3ffbasm3359067666b.61.2025.12.29.04.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:59:53 -0800 (PST)
Message-ID: <6ea96ce8-680c-45ed-a48c-5a38394ae7fd@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:59:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-db845c: Use pad fn
 instead of defining own
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <rfoss@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
 <20251217-sdm845-mclk-v2-2-7028c2d09145@ixit.cz>
 <f86b483d-c674-4901-b2c8-19a535df4234@oss.qualcomm.com>
 <eabea4d4-366c-491a-bdcf-cbbfede66bd1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <eabea4d4-366c-491a-bdcf-cbbfede66bd1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DTCnUJQRj1rA_VPuGmxblT5bS55y-Cw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMCBTYWx0ZWRfX9KSXAHpGdTwp
 Raw1M3oeek8g17NiV8PKV3u2l0EvF2xDxImwt6JLRhQQs6pw6w+FNdtcvICGzMd8VMm3LLQHdNK
 SMW52Fz9mNUus0A5UClCw9wMvN8ppNqJq7VAL5a+VJrnYKr24yB4FNfaHvvw2o7W7MKXNmS0ynV
 CQVQytqvwxnIWgB3JnQj/FwLd69b/HwCERDVxnWjWG1ErHMwyyFh0+jqXsGX5SAgNrPFYFcC6Rt
 LgeMIuOZ6JHa8Q3i7KYAhAm9pmqRdjcP6k3wflofXzW4LCkGhoFKkRBhlkyzTN99Lcc43KfTiWv
 Z3v++hiTjP2O5ZSAj+IiotJRIk6h2OkCWCvNOzxvBmeGRnNXyUi4twCHHFQhHxFpsEccgNuGYVO
 fBPN88vOEsj1uVxWYbH1d+d0QftPYgQOPKDz3opiXOBt//X9ChdWBaaiNjaqvkEAGr1wAs/Lebx
 sFfXIoeb+JmCgK8zDcA==
X-Proofpoint-ORIG-GUID: DTCnUJQRj1rA_VPuGmxblT5bS55y-Cw6
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=69527b4b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=K3Vwq5XXvu027sOeNUMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290120

On 12/22/25 3:01 PM, David Heidelberg wrote:
> On 18/12/2025 13:25, Konrad Dybcio wrote:
>> On 12/17/25 12:39 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Instead of defining own pad function for master clock, pick one offered
>>> by sdm845 device-tree include.
>>
>> I'm a little bitter about the wording - the pad function here is "cam_mclk",
>> whereas what you're doing is inheriting a common pinmux/pincfg node that
>> refers to that function
>>
>> [...]
>>
>>> -        mclk0-pins {
>>> -            pins = "gpio13";
>>> -            function = "cam_mclk";
>>> -
>>> -            drive-strength = <16>;
>>
>> This patch changes the drive-strength (16 -> 2 mA)
>>
>> FWIW it's 2 on reference designs and Sony boards, check your
>> downstream kernel
> 
> I don't have any. I'm fine with this patch not getting applied, but I'll CC Robert who added the support, maybe he can verify.

FWIW this can be verified at runtime as well (running downstream) with

cat /sys/kernel/debug/gpio

Konrad

