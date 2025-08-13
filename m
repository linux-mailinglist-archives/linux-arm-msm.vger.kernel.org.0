Return-Path: <linux-arm-msm+bounces-68919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2CB24488
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B20ED1B62C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADB82EFD98;
	Wed, 13 Aug 2025 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9gi59EG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E632ECE82
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074527; cv=none; b=nVzfVsfElcTnlW1ruOAhmC9JSNqCTfVPrKae782+m7VgfHT0YlLQtz0BbHOULve8qIxQyz2vKvc+NhosrFww2apt+4cLDkal4FIqebGI9DcBl5/2hFGiK2EdppjNxGARumOhKc6p9XSmTBRXsY8BP82BsQxzO7K0ASMwV2FPcww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074527; c=relaxed/simple;
	bh=WNNH0ET37ePoWKGj+PIeK6vmooE+vGlIujVn+r10wJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkddpDL01FGDo43nLdMvIr2ve4Tm29IAjYgCNzi9iGvPcsDMwY2af/RP+a8XvBG8+JwXmCkt0zl05JIQwKjWZDvweYFXRcj8Ez59/Hlpw19O7vHgEFBB9pIt6yqA82iTOwyUOEOfg6rbxNwB0DR8ZiCK/Tfh4uOlKsH8wX5vvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9gi59EG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mL84019437
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAbBLVeRLE4MnH9XmfajRWZXa7M9EckNL81JeGoopF4=; b=P9gi59EGmq01oSc2
	xE7lTt3uDuL5duZrwvfHkWzjApSmX3zvezdjcXFwVjJcUhFF1JXwgTz5RFTjIIgF
	c/NyR9tEn9OkrrCE1Ra4RFL0PkU2yxgAHx+dS1VLdkaP9YQD8Y5mH4CnUiFmIyg3
	PvKLu1GDutU/j4NSH1yfHeE+v1TtCovGm1T48MA7lgRs4IX/GU860r9oFjtCu+5J
	3Okwtufa9XIj0HZPEulwfxt9xIIDBhqIr216OVYWzdIKkWLy3mb9fXQchq7r1wUR
	9spj41CMsXm0/s0rcNKYzOHWAm+Y1akS5cVwhuXMJaH1SO42lBuo6ttPWgPb00Io
	/cV4nQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6q06p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:42:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31366819969so7873311a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 01:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074523; x=1755679323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAbBLVeRLE4MnH9XmfajRWZXa7M9EckNL81JeGoopF4=;
        b=gvoLnVd6Ne2/NWgL2wFS2UHVquBxdRuv+O9KubGIl93VO+Opf6LyRldBkE54Oao+GY
         YHD+6EXtv+e+emFbojKG7lNHiJIPNlrJsVM3zwlXgJwQw8DLqCVxfMN1csVjfPK+mh16
         ptr2Nq+VY2C8a4K6k13q1TjlFUIf3E14ioZBE/QmulSQBHoSB7QTtmEc9tsQ198m/K8w
         o0O1FbVX/hJsWbUK2dLZAysg0isM3ZENar9myO8OLE3CMLoGZh2kDcjxqf0y/sbeUgRs
         1UF4ysJ3VdX3OB9aRzw3t7nMNgIzcz2CugdqGENBrMz0Ev1BWMQQoPWA5yNmB5w27aM8
         wYOg==
X-Forwarded-Encrypted: i=1; AJvYcCWXyJXNBnsuqXC+98EYK88hCVBSE6/4aDaEtTVckFdAP7WZXFEufNLa8RGg6YhKp52OPtaJAVSIZ1eYxBC7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqv5gAfJiqVwqexcwDTeVudUv1JGdnBbxAJtx46SB83tAoOp55
	KhdplG+gKO333pzzmTmUifPSTqdaBGnJgsXBTNBVp3KM+ZBmWqGXpOgzVkGVKnkBWc2VgLCbi/H
	CqM4fDhgxbWuu3jZrlSB/yOfcWyC5tYcnqPIcfPIrwELh+6CR4rD5bNcG6+0rHe02S2/k
X-Gm-Gg: ASbGncsWm884py4AxMxs2Vq1tAgc7EY4ADGh8SYfjLDPzQc+iXrC3/Fy6vfr+ViKAmY
	V240QsxL8g06MOVwm3v+nl593q7E2+rMSDnRgU6pGdtV8gd17Qo0pKV7FtpdhCJ9pkuChqEu1jD
	R3itgZfbEKYeGrD2Lz94/D+UdbFlhqufMLENUHpXzF8FnHfnwcskouASAzGc+wW1NHXcF7jI9e1
	PaYJ2milTUuwn/Du0mIVRoLeMS3SNDP4SbIFLu8RV/8ItPkR84k1H0mO6FgCm+s1crRUejvI/yj
	9SoagHaV21e9UmfhaWAggLXeKwMwQ4CK/ecJDWhn4tlWEsg+nbB/Rs/3FlGNgpxnvNYjgDUnbnn
	fjA==
X-Received: by 2002:a17:90a:e18d:b0:321:380b:9e85 with SMTP id 98e67ed59e1d1-321d0d65539mr2869306a91.8.1755074523543;
        Wed, 13 Aug 2025 01:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE78DKpGzv0dikvRvGBGlmfDBiN2T03wU71V1qUXMFRMqi3RCjr6n/8XTvRYRr2gYlKm8HcZw==
X-Received: by 2002:a17:90a:e18d:b0:321:380b:9e85 with SMTP id 98e67ed59e1d1-321d0d65539mr2869266a91.8.1755074522860;
        Wed, 13 Aug 2025 01:42:02 -0700 (PDT)
Received: from [10.92.163.82] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7bb0c0sm26483924a12.20.2025.08.13.01.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:42:02 -0700 (PDT)
Message-ID: <46dff289-9215-4dd5-b522-c1690abfd9ca@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 14:11:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Enable audio on qcs9075-evk board
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <l7kwna7lebazoaqxz3zdkv325kw4ohsuidfzltdy3msfiburb6@iz4atympejdx>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <l7kwna7lebazoaqxz3zdkv325kw4ohsuidfzltdy3msfiburb6@iz4atympejdx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX1LQDwhQGapVZ
 lffZfF3BJtImyPTsezxmuY4Hco8iAI6bTsxxhhHOqDTcQsn51KWNos9UkTM4g5q9pjvwdlWPfat
 ScWleP0JmDLS6PuT9W3vZbTPD1uCh0QL71OOr62XQSUQAyXWuYUfkOoo6oE1IS+0VcE8v1RgYDV
 sf1apOiU3dJ0GzVWqtDx05HOgYna7PV8mQeSMfQC++pNj8i8BkSuqih2acSZoVTgWse8JDtvhJZ
 DsZv+JGJxzX8jgwWwz5QKEmP4ySvoP3jO0T2bnSUdsd1R23/lSjtf9/Q7bwDAruPzxPeo0Q+nMN
 e/NLYb1x9/4e2WAP3D/gkEPyU3BGyxaDw3JiJMVJmQFFAWq5bs9B2Stt/rAv6QL80tMPm4wtYzO
 GPaCYI2f
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c4fdc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=9s0Y7IdbV4TWvyFR1rIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GQsUz4ZAEZBg3YaUtLGuvTC0x2m4WtXK
X-Proofpoint-ORIG-GUID: GQsUz4ZAEZBg3YaUtLGuvTC0x2m4WtXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075



On 8/12/2025 7:54 AM, Bjorn Andersson wrote:
> On Thu, Jul 24, 2025 at 09:26:30PM +0530, Mohammad Rafi Shaik wrote:
>> Enable audio support on qcs9075-evk board.
>>
>> Introduce HS (High-Speed) MI2S pin control support.
>> The I2S max98357a speaker amplifier is connected via HS0 and I2S
>> microphones utilize the HS2 interface.
>>
>> DT-Binding link for sound compatible:
>> https://lore.kernel.org/linux-sound/20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com/
>>
>> ---
>> This patch series depends on patch series:
>> https://lore.kernel.org/linux-arm-msm/20250530092850.631831-1-quic_wasimn@quicinc.com/
> 
> Please resubmit once this is tested on a clean upstream branch.
> 
ACK,

sure, will resubmit on top of clean upstream branch.

Thanks & Regards,
Rafi.


> Thanks,
> Bjorn
> 
>> ---
>>
>> changes in [v3]:
>> 	- Updated link-name from HS0 MI2S to HS1 MI2S and sorted nodes in order.
>> 	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com/
>>
>> changes in [v2]:
>> 	- Updated commit message as suggested by Dmitry Baryshkov.
>> 	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com/
>>
>> Mohammad Rafi Shaik (2):
>>    arm64: dts: qcom: sa8775p: Add gpr node
>>    arm64: dts: qcom: qcs9075-evk: Add sound card
>>
>>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 ++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
>>   2 files changed, 106 insertions(+)
>>
>>
>> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
>> prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
>> prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
>> prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
>> prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
>> prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
>> prerequisite-patch-id: 65730290d31f18e66e2ba0dfdeb1844d7442c272
>> -- 
>> 2.34.1
>>


