Return-Path: <linux-arm-msm+bounces-76671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A97BC9645
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B6C04E1175
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51D02E975A;
	Thu,  9 Oct 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyMWHI91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2782E9737
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018315; cv=none; b=RhgxKoY442Nf+RDLJ4hJitwM83437PdSUzuBeaRCxsX7SslQIyWmDfndNS0sO5fRpVelZ54OIADQzF5jFrQbSFHZEgKgUbl+6lapGh6YN0J6gs78fu9CrSe+qdn8OkSVpATCo3jYJ7nMQ/zxa/OJrXys/TeK4Edg6j8IJE/VQ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018315; c=relaxed/simple;
	bh=8JF62Q3C+EsRAxzwX7Jr8Qg61aBRsdXSa3AMc4TtLOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNAeelwUDHg/Wz4ZcdoimwBWMDXYSbT0m1CkCZ+4h+8PQ644kVUUrIQn51zjfZFF8ZkHEb7O4ymPk2hn5ubuFPTCznjzRc4aazZo1qHn26ZqAPqt5wr3+mUy6pM8CRD9QN4t9CuL2mMtx/Fnx+N52H4MJUfgxAUaUoi4CTrleDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyMWHI91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V0Np031641
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 13:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eU4S/oCfNeusIxb1UAWsZP5JLwrWFLZZqFtcDi2NAvY=; b=hyMWHI911Bg/deAq
	3gKBoudkK3m18jJ7bnZzBu+YyEx3m4fMlNEaJpGHe7EoJYFiFxQFeT4hFeKbn1aR
	LQZumZmA43rLt73EORs/HnjCbK9FVrKWnDTI7zRQZF0YRPi79FOFHMElUIwMMD76
	/sDzah68bVV7JVyOZ3CtivzJ5OrJt3lX0geAJc+drwoGwxe95dP6LSuNkCAyKi2Y
	plCb9ONBsS7oxLSFVnz8Vpaqn2W0xv3cVSGLRbwkpa7W5VIywyqtHXpMUcNPvV7z
	k1G3ARnl7JQRI4NkZnOOACgAkW3fkd7H+m52bwAryevCTcJjRzugj7JrmWobCAXd
	bmeVMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0s086-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 13:58:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e0f9bedf1aso3533671cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018312; x=1760623112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU4S/oCfNeusIxb1UAWsZP5JLwrWFLZZqFtcDi2NAvY=;
        b=GCgQGIlE+17JpnwfQ72779UVIRf98nvcp78R+DUoyVRWqPnSkTtdDMhwYT3l3fnkRt
         NAB9TZiMT6F7yP7FeoF+XAvyzXNilCLiqW6joDXhm12m7seNobEuGO8Ev1tjTasPAPcg
         LqyCJcTSoO8+b83i7VyRdLiFyCEe4A1CKLCUSLHrfqHZKLF3iWpu9pfl7YSkxCfbYzaW
         Eb/eD0u3RwKXk5YeE54BFkY+q+Vio6EbOyaHxwTjmc06o39jU3JOJ/PVRtorIEQukdkh
         6PAeUS6INWr9yetpBF2ctdDJt9RT0CJCfZYjfB8kkJZ8d74ynr4msZb7WTQSP0Cj39CS
         e6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAO+tYN02mTKiy03/jgTRuydCoqcQwWgvYGOAYk6mGXyt+PleF1wXQOjGyqBKaeI3qIbQ/OYM/0jqyL0OA@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbQqQzSfTnSIsbS6XwdLOgxBp1p5OJBPAWiZym30AtwwiWC44
	PB+vhlxQrwlzypws2oxE3/G3fDVKfOgOXmoBIgsz/sSwR57mFA6+Vpf9uJeABTyKV9w8s/fSRtx
	G9+/gpyPD971bHrIPpaw6CDguo3o5lYu4SDw3evPNHIjXy+AuGQKAfLsMGEnJ3fV2zCCZ
X-Gm-Gg: ASbGncso+X6jrUrEdM9AWq1M//JsDQITVBmnZaYIID+odTZPZwXvAvQ49DOqg9/AM1O
	pYTdw+jrJq/RYf2sx4ipcaL1be6nqlvnRNr+G9dcMeMMuwsieyKJklD4AoOixjSRUIHqpR8aNbF
	y4Gz8N2phIkUj049HWB8ssC7RlC240KsegSI7vbJ1Dp+xL3w2Wo9TeC6/NmcMG+4V/Uk5n9hbi+
	s1Zh4myQVrak9IoL1NehgRNYH1hzMOZXZj/0IsuqOrek92Bq/2u0a8tOV61BG07MUIsPNZx6oID
	UJudOf3MPcEB00EU6hnPo3L/xPbj8+V1XJlnM9y2Iz9JkoWRq5hf9R3aKYqfZJc7kB4BpzSo1qG
	+baXyDC4POuK6kEVfxgQ30QjiORk=
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr69214731cf.7.1760018312128;
        Thu, 09 Oct 2025 06:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDlmAQ1SSqslLTs4Timgj6hjNiMNGuRJ654mshuUwvTPhL0bouZZ4Wr6ouAI/YTdADv8YPbQ==
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr69214221cf.7.1760018311376;
        Thu, 09 Oct 2025 06:58:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a5dsm1916364966b.85.2025.10.09.06.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:58:30 -0700 (PDT)
Message-ID: <c6880fe5-029a-4f8d-a08e-81a066a79450@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:58:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251008130052.11427-1-newwheatzjz@zohomail.com>
 <20251008130052.11427-3-newwheatzjz@zohomail.com>
 <6ede6425-6b99-4505-a231-de819bab9ada@oss.qualcomm.com>
 <6199698.lOV4Wx5bFT@debian-vmware>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6199698.lOV4Wx5bFT@debian-vmware>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e7bf89 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=XCp-TdQE-aPcymyUR0sA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: InL0FaYalE33Eh2sSt3GMPi9LA10BK6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX3zSV3l8D02Q6
 y9hDZNo/vfSTCH7Ml7CC/g1bSdGj4B8AKm1GnU+HVIpTB4YzQ0xenntPgAqjnbubBj6L1FX6F0p
 jQwnUeg0m3//vQLU1FoP2e3r8mrSryKtiA1Ou+hd55MAF4+Cxt0F4pLsneixZQTuIWZHGu8hjFS
 tX/KkF26pEL6avOB57DkXYa6opYSECg0xkKETTD7YqAO+dYKuzrJV0m/eF+09lnbNvahFaQsc82
 RQHWVMwLLp/RgTaicpVursD0ZVnCsFVDNo4T0gs4YzX0ZIEhIl5j/mcc+dWYl2C/kBfIQEu91S8
 QGo6URqwOjIbRq48P/gU+hl3Fr3OHDxzJAU/kbjhiOj8ue4XCkVHuUdXobyfzg6JEAs45/sJF8B
 Xo/hw4FRYKwXWyfX4XhK4+LNxeHK6w==
X-Proofpoint-ORIG-GUID: InL0FaYalE33Eh2sSt3GMPi9LA10BK6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On 10/9/25 3:49 PM, Jingzhou Zhu wrote:
> On Thursday, 9 October 2025 20:41:19 CST, Konrad Dybcio wrote:
>> On 10/8/25 3:00 PM, Jingzhou Zhu wrote:
>>> Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
>>> on Qualcomm's sdm850 platform.
>>>
>>> Supported features:
>>>  - ADSP, CDSP and SLPI
>>>  - Volume Key
>>>  - Power Key
>>>  - Tablet Mode Switching
>>>  - Display
>>>  - Touchscreen
>>>  - Stylus
>>>  - WiFi [1]
>>>  - Bluetooth [2]
>>>  - GPU
>>>  - USB
>>>  - Keyboard
>>>  - Touchpad
>>>  - UFS
>>>  - SD Card
>>>  - Audio (right internal mic and headphone mic not working)
>>>  - Mobile Network
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
>>
> 
> Thanks! will add Reviewed-by tag in v7.

Please refrain from resending if it's just to apply tags, maintainer
tools do it for you

Konrad

