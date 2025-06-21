Return-Path: <linux-arm-msm+bounces-61929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205AAE2891
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 12:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA3617D0FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 10:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF2B1FF7D7;
	Sat, 21 Jun 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1r+Crfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ADE194A44
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501219; cv=none; b=ceoIpSyGbbW2Z8g6Mxa4x6Uz/m4IqFCRWE97jB8J4ia35bvPNCYq5+zSF/gJCEKSa6wZ1QvjGst052USxkhEsv3REHrujPn9eOukukCm6Yk+73YTZ19W9T5PqFsxjUUdUTnOXtK5ezSC3Lp/fGog/H+GMTZtqCO+kx2fvz8igIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501219; c=relaxed/simple;
	bh=uYTOGq0jOvna7DKf7Dv4VMej982iuzaeDJSxWzLVVUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kbei3egvIRfqwgX4j933djtV9tXKgCwxRjzdserxBZwYyZxTNQkGJkhrxXEpwHPsjI5PN8LQIAO7Pt2xORPac7je4OXlvw2ku8aObSTNJZUQQSAe3lY/QXEpCvoPFDl6LC+LrmYbNO9/YuWzght6lZp8r7yuXzGP8IQWPo4juJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1r+Crfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L9Y70B007625
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rynw3AOu/IaDP3omqKgtPfVAeJGLq3yLWQV4mFHxifs=; b=i1r+CrfsWXFeiVfk
	A3SouKbh6YKBwE6ClE4oQm9DBT2Yxs4plbgbGFrFCE3Zifu8NZv+d8yopQ+l28Yx
	mog2Gh3zf4TW57SiYBBvps4+edRGva8OhsxGSoh1lpmUzwCgzHUYWUjhGU/rgwp9
	9sy2ftGg0rtUZGQVO3l+hnh1+4SqxnQUae8yCb55oszgBQbDEwh0xHjpu0J7syrm
	uCbWeyW/gBxc+zCuKeRMe55ivY4qGlbiXHy/FNEPrmhjyMiFFR1BqdkApmgwNLcu
	U6a4hdtBTcaz9OSQ9Dn0QLNBQPtNb58zI3QY9IS4PVz8caSMwQ7SIrWOzYlDChYH
	L+Y5PA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dp1crdhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:20:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac0b29789so3980216d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 03:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501215; x=1751106015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rynw3AOu/IaDP3omqKgtPfVAeJGLq3yLWQV4mFHxifs=;
        b=Ir0VdmC2ctuvVl1BM60+29Hjft7dGx84CRHQnfe1QnEEBE9teYnzIHe5HAG5OsyJ12
         j2em6kJ9HXy/zouk3E4iyDo2vxZZ94CaPNfjLC1Qw5IUQUe98lCRtqUwB80yD6KS/9fm
         3gCzOvc3shgeW3hkIrJQ8zhnRjgKte5Y0erykTfjAm54eJ60IiFDSQJdF2aUYncY1RIK
         oGgMdlS5+lQXoojL1sgIpXkw7LDmK94hob5d1P6owjXEScEv60A6lQkk6r1FGr4Ka0rf
         gJPtWaIVuixXPk9qN9ffyM9Ib4LXPoWNJgywvbhft8RpuMlBSSN+8gwMe+GNSEa4lh/8
         AerA==
X-Forwarded-Encrypted: i=1; AJvYcCVLaN1i1QYW6Fp30qd3CVYoxjYVh3qRMaN2QQMpvL3oPayiPWxXJ3Is2TgVOJZuAi/rOJvkye83EGDHIHMt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41dDJE0vMSsZtAXFecBxlP33EAM2N0w+YoKEimJY7kieQdSGN
	BVTQW93yZznwY6G4qmHWUAbcy32Dqp/dbZceP/WlZuIqZUKLB+vdNF18WnDN22KKmnKbVE4I0KX
	jhBhm0J44B5nO8KAvkePNgjce0zeYrrHXsDBRnccH8DmYLvfpUAeuXX1CKv+LVLUbfr5I
X-Gm-Gg: ASbGnctfzRkE8v8UNtzQg1aUokYF6ypnLg/I7RuZ9gqyGKhq+T/7P/IyvY6L/bl06fg
	ZvmK5PmRj3ENQPjKOrqe2sYKCxG7cc7LPH/7fIiKcR5lzFmr1zeGaHRnTRz5ZK7XSjdBCvnhT7z
	g1jb9WJI35VFFwAft0XLsEsF0bDNe+lLZ6S+WfGVjCgocuuxM6P/2Dg5VQ2jCWLJ+GTx7E6ItzU
	P7ZNkEIBg04wOcz7ye6edVuR+a8U8pXu7vgA3FlCddN5+xFR+0ToNqhwFD8P81Z8BTrdULPxQrG
	ucbtJHwA/+nNPZV+WslgYQYss1Mugsq5hInnW1+C47AVLsiM+ggpo1ySdyS0N+cnwI38klG26HK
	df5g=
X-Received: by 2002:a05:6214:80d7:b0:6fd:b24:4e14 with SMTP id 6a1803df08f44-6fd0b244f40mr24550556d6.8.1750501215017;
        Sat, 21 Jun 2025 03:20:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENGnJKDkVr9os6hHS84wNudz3PjxojZ9bH/SywhPnRHict04HderlvMlUs0FRZqVtVgTL8Cw==
X-Received: by 2002:a05:6214:80d7:b0:6fd:b24:4e14 with SMTP id 6a1803df08f44-6fd0b244f40mr24550356d6.8.1750501214618;
        Sat, 21 Jun 2025 03:20:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e36sm333295866b.120.2025.06.21.03.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:20:14 -0700 (PDT)
Message-ID: <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rRRGS25EzAFB_KRDa2dmtEuqWzvp5gFq
X-Proofpoint-ORIG-GUID: rRRGS25EzAFB_KRDa2dmtEuqWzvp5gFq
X-Authority-Analysis: v=2.4 cv=NKDV+16g c=1 sm=1 tr=0 ts=68568760 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=pUFaWy8oF3eVePBgSHwA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2MCBTYWx0ZWRfX/Xvc7B/fZrjd
 W8r2X9KlYLdgCd8TBPGGTvfGDe5HQ4J6aY4a50RNpBaVPiWJabqjUubbAnFeihV/Tbvrx7aE9Py
 /w+YRlqHGY5MCT/oouwUFsg52nV4twf7z/aG30RW2vvjh8sHSclqI+hB4QyqVzXwGeB2K+osmOB
 NCQoeRqec+dl9WT1c6LwOlNzWqxihlZkMrhlWgtiIeP3Y48HDdRPEVsiAR7vuZmHUd64izl0xER
 A70ANkklVb/59sMGGW8E34dN4GrMszAgU3uFhWTTxpeh44NhvE3YKw72Pr5y3RBpc7//oRi/3SQ
 400lD7to2EETpx6wJhZwT2pPEIpgEnZdLUiF+pvVCKawOdUul2cqVXPB0RukE9sux/RaGEwqPje
 Onls1T6KtgXDVyrEznSB6N9ctyKxBJ0le9ZQ70g3GCalKaAPrFHv87xUYzNeyf0P9BdkLo4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210060

On 6/18/25 9:43 AM, Krzysztof Kozlowski wrote:
> On 18/06/2025 09:28, Sarthak Garg wrote:
>> Introduce a new optional device tree property `max-sd-hs-frequency` to
>> limit the maximum frequency (in Hz) used for SD cards operating in
>> High-Speed (HS) mode.
>>
>> This property is useful for platforms with vendor-specific hardware
>> constraints, such as the presence of a level shifter that cannot
>> reliably support the default 50 MHz HS frequency. It allows the host
>> driver to cap the HS mode frequency accordingly.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> index 9a7235439759..1976f5f8c401 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -93,6 +93,16 @@ properties:
>>      minimum: 400000
>>      maximum: 384000000
>>  
>> +  max-sd-hs-frequency:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>> +      High-Speed (HS) mode. This is useful for platforms with vendor-specific
>> +      limitations, such as the presence of a level shifter that cannot support
>> +      the default 50 MHz HS frequency or other.
>> +    minimum: 400000
>> +    maximum: 50000000
> 
> This might be fine, but your DTS suggests clearly this is SoC compatible
> deducible, which I already said at v1.

I don't understand why you're rejecting a common solution to a problem
that surely exists outside this one specific chip from one specific
vendor, which may be caused by a multitude of design choices, including
erratic board (not SoC) electrical design

Konrad

