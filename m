Return-Path: <linux-arm-msm+bounces-43024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 724FA9F9C8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 23:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6534167439
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 22:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FDB226551;
	Fri, 20 Dec 2024 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jM4tac5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733BB1B0F0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734732310; cv=none; b=Z9/kJyFkAct0HVtgTg6BYRuhGcFtI0bVoqNErJzwziffnvJjbUiRSyrpWMMW+YZEVbmphc5ito9u+eJnn5tgVRrbdkT4WEfg0hkHPzjcuVMYIsBVkEphuyShxz5aVEl9I7QxIeqT8AuwPK4ArLLBLntrKJFt6KVsNtjysjx0t+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734732310; c=relaxed/simple;
	bh=gvkrV9GXj0wRQAp2oIxV5+RD+MUdz/v8NjP/GVR/DY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unZyEOTVTvFhXBmBwnnjJ0VWxfY3InD/APxjWKXQtGWl+nikAkiLJVuPOXWgK/yB/aJQdYCh9CcrDECwkarn38S3UrX6CHr1bLcJ96ibErnoqXestxly2SPAkeGav75TShNFNra+/SIIcaDMTzigcTElU+vkZ89sACcvp/Ukr9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jM4tac5B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBcIKS024466
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 22:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nXlmOB68+QOEFBXeep/xRRq4DE+UR1z1GZdCojJSEE=; b=jM4tac5BpDylR9/B
	rf26wgMUoNCUHR6nLjoRVZ5ivHx1uNfXax3XRQ4xQ6PUyIcYK6GeNT3Kd5DfieP6
	XoY0eRyA4KsIsFMjiSgkHTwqLpBvqY/WkjHXt+Z74g6GmNJxacaBalHz4eUsxOXY
	aZSnpQsG4wM2qDzXIbMIjN9gRrzAUtxbtFLemYEiUMBeQ35FdXGvtyVUx0PyUzLE
	qiXxmHW+g/dPjtCQ5c9ajnfN6FI4Gv97admJU0p/SXG/YPACp9hB32v/kJr+efJY
	1+zJgiviAoS84JXyOkmBVal8QMh0Wf7d092U2726zS5b4iDpmeDGiPvaebkIemJ1
	bufTsA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n7vg1gp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 22:05:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467bb3eeb04so4592901cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 14:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734732306; x=1735337106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nXlmOB68+QOEFBXeep/xRRq4DE+UR1z1GZdCojJSEE=;
        b=uRBT9EdeV7jM847Uj2szQCFtjYelSKRp2o4tq+xrDWHGpWcglvTMQYrM60igNTfOVP
         555T7uCjBn97ILFlnGjU/XKcIyb8CwYpS+QhWcKjx1qmPr5+PVP9XFl5VXzDStaRXRpm
         rAKmO6UrWNnMCqSXRjtCBwHp/yTbGvTSmXAK9uJajWz+qUdqWv1Ge+GPTLtFEOyJhm85
         vB/K7qgTa2uvJOJj99b3yGyZXfhmJZauoVBSUBfb4C48LtF7MeZiYA+UiEioyXpy7iwg
         OZE6QTsthEb7rIDNiEANZlOBiJGDfI6nES+tMs2Tb8iGf/41lmTaV87QM2ozPfw5IlzM
         H23Q==
X-Forwarded-Encrypted: i=1; AJvYcCXohYLc7/LTsNJwlF6eC9Hmwh8eoDqtRKp6NDaRKcDp0QALOMlIuHT1PT+lttwQb1NK9vjyVmeaeR8TsqTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzEs+gxIAbTuq2XGOqhYfnNNN+Ml+OLbe5RS1r8UBp8BvVxFKKJ
	W4B5ix/ECTs5lKmIgbuQ/WtokBwDCyDeermb22XSBVE6G+H9rEpFEYeRMU+UbKiBZMYixhBeZVs
	k/yMVbWvSH8of2RIjKrdUiXuS6Zf2xWLb8E8lur9WTO3HTMWWMFfKNf3/woJbG+WB
X-Gm-Gg: ASbGnctwIz2QA0kp3HjpFbw6Nr7xvMB1BVKu/BKbMpHHvloYhNdHVlHSbvDyTd4X5Ge
	8hMbOm2Rb3G+jsNWl+BMNgKorLl+ZuR1EL5MNSCYXYnVV/q6pTrk1op0yHTGN67hQD6r2Ykd4jn
	QTX6OYmobv/jXv5xv+8fgN+4dBA0xBidrTvUW3McVFlks4C/EzzxcOzIDw3SQqFYa30QoPzREHt
	qatJM13jo6HMHMyT7Wgo6Rba49M1KFWEEJJdMHupvBhtuvY6RYRq78saXnwTZKHyle94sa4uS+U
	DbZGviLc7PVuNEEQczZkqF9REAC4GMiMutk=
X-Received: by 2002:a05:6214:2a4e:b0:6d8:ae7b:6b3 with SMTP id 6a1803df08f44-6dd233b3944mr28522296d6.12.1734732306277;
        Fri, 20 Dec 2024 14:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmjK+yjXoyEKenhMrKpOs87S43uRGWsCZ/F/zqhyQ4b6IznVFNEJlW+armIOoWtpiVDZsBVA==
X-Received: by 2002:a05:6214:2a4e:b0:6d8:ae7b:6b3 with SMTP id 6a1803df08f44-6dd233b3944mr28521986d6.12.1734732305820;
        Fri, 20 Dec 2024 14:05:05 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8961a6sm214801166b.57.2024.12.20.14.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 14:05:05 -0800 (PST)
Message-ID: <768ef22a-855b-472d-9432-49db7daaf2df@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 23:05:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k
 PCI module with WSI
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
 <9cbdca90-e76c-4ebb-a236-a0edbd94a629@oss.qualcomm.com>
 <62c599b5-20b2-4e1e-810d-e4502abbc682@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62c599b5-20b2-4e1e-810d-e4502abbc682@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ROAT3WyRpr6LEWoZfrJ_kur0hQjJj7_N
X-Proofpoint-ORIG-GUID: ROAT3WyRpr6LEWoZfrJ_kur0hQjJj7_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200178

On 20.12.2024 10:47 PM, Jeff Johnson wrote:
> On 12/20/2024 12:03 PM, Konrad Dybcio wrote:
>> On 5.11.2024 7:04 PM, Raj Kumar Bhagat wrote:
>>> The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
>>> to exchange specific control information across radios using a doorbell
>>> mechanism. This WSI connection is essential for exchanging control
>>> information among these devices. The WSI interface in the QCN9274 includes
>>> TX and RX ports, which are used to connect multiple WSI-supported devices
>>> together, forming a WSI group.
>>>
>>> Describe QCN9274 PCI wifi device with WSI interface.
>>>
>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>> ---
>>
>> I think this description is missing the key points:
>>
>> * what is that control information (power, data, radio stuff?)
>> * what happens when the OS is unaware of all of this (i.e. what happens when
>>   we don't send any configuration)
>> * is this configurable, or does this describe a physical wiring topology
>>   (what/who decides which of the group configurations detailed below take
>>    effect)
>>
>> And the ultimate question:
>> * can the devices not just talk among themselves and negotiate that?
>>
>> Though AFAICU PCIe P2P communication is a shaky topic, so perhaps the answer
>> to the last question is 'no'
>>
>> Konrad
> 
> We already pushed the non-RFC version to our -next tree so we cannot update
> the commit description without a forced push.
> 
> https://lore.kernel.org/all/20241211153432.775335-2-kvalo@kernel.org/
> 
> However, Raj Kumar can submit an update to the description in the file, which
> is probably the better place to have this information anyway.

Sounds good

Konrad

