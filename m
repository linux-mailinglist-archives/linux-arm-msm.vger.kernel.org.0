Return-Path: <linux-arm-msm+bounces-66970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23220B14A3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581CE1AA0258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 08:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAA8285CAF;
	Tue, 29 Jul 2025 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yqnr8IP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD4D285CAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778289; cv=none; b=eMgQbDbTa7zftstulqmoGmU72MMyPJRFSm1fJpVzTzbyAEedGlJUtegqdL2iptRQ3fncCBJf1z5l1CNygFqSKZo4p2JeHSk1WXSkWmZvnCsHdAnlqn1cI/fHaeqErCYEljskne7VBsjvxE4s4Lvr6VzuMJiVb8q8oMvZwdUMKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778289; c=relaxed/simple;
	bh=2CKRoTOlakoVAgoUoXVDppdXBBkLdTwPeVGLg7uldsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZLok40UuWeXelbCcLrax4AWhkJD1zGKJ1s0BQSK2+zdhzJ6uzKGcLHXpLsrLfRlO7IzzYL4bdyplKT6K0CoxnSu3F7zgDW3J9keWewyiG0jl3ojI+nB5I+sKDdRBP053jAfz+sfTkTSuDF0p5ceOR2Kd8X+CrGfQqiP8BA6z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yqnr8IP5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T01vef004936
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gghsUYc5xKakDXh6woUpeDalKj8wf6qzVK3HfipwTc=; b=Yqnr8IP5tQmqwuCH
	8larnZuta/+U8dsWfNr+tyBYywiAoB6ITRP0tVqG85kwyRZmvpi0zjxwbrk3KSm6
	ecHaW3RSWIX3zFf6TsnRqajGd8a7Zt2tKA9QExLceoSyogqmIuvdpU7LUdZNY9C3
	9+xfAaHqz9hPRmzmj2ZhGQHr0ju1cfU00qTfIeiJMF96sGkXi8bhrkDakDXm73mh
	qnX0OcOBXruC731vuCZwtvGeD+w0WylYAY4SwmIWG/cz/H0SkhNBU0KZyYMukbe9
	3Uqcou0jmE5huLEDkDyhxwNKlEL75SFJ8r8ICY46L7Dmhgx++YGLHFGxCKFCTq5F
	hRDAPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr7k55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 08:38:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab77393308so14280221cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753778285; x=1754383085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3gghsUYc5xKakDXh6woUpeDalKj8wf6qzVK3HfipwTc=;
        b=U3qapE+XXhvQgJ2xL1ahgKUvOJWsMUIlAIo51oHtT+zfETrM9c8mGO9FSQyH0oqo1V
         G5FMCn+2d/SxhoVesntZbrklNS7rha4eLOl2nCBPIV0haPxu4vZys/n962hwrj0r1/hu
         NzQkLm9/ghV6+2UH2j7+sTdvFDIPMcaDvkzI3aqLHSeYsGcCYY5m62zpvJD/3sKslV9S
         aVR7+LRcwLluq13pXFeSPzGnGO7iHRJPFZrDdSWBG5NIzLZu81evlzHLvyK1JNU91VaY
         zCgf06sVjFdWI9IlzlWwH99ha2UIYbDXbyfZakAEAo9/FLMuKjxXKGOeOmIEKAFD7PLU
         /GVA==
X-Gm-Message-State: AOJu0Yzfb4dYPdN0xheHfJ2lB25ezLnfE13GiF+iOUF0qvcx7ZSAwikN
	gFL881CcIWPTuzucVZa/jv2FPM2tOD3nvTVm/bOi7kzldpVrZ0If+z7kfIZdCqhgF3zHcd44qhp
	Cdq2raUN6RYf9t9SKUjRFEoanEGhB5AReOljRUeFDwy3SWHVLYWJebQEFJHYPN9OEB/u9
X-Gm-Gg: ASbGncsYH/KPzfiTMadT8fLgIAnQrfGfKLWYsCIDhIMfdWwgCKBWX4K0o4Zqv/w/veh
	YwzYNOKh9WXEiZKe5o8HBFJB6W9fi3bvdoGxkSRyN7syczE7TWOqJI4a54uaUvmxW1HiLSMEeid
	ucEld2xwB7xBpgf93xrePKnMNZsSDbOXoMI+wxJGM4svWsqGfgNbUXswk7BVQ4nFdVx4dLchSFz
	EdbqM7spI7JcVjbR3IMO23IMZeWioK6pxBLoNj7uEwZMX2UFocAy0XcN+pxW8XVHLWXQiqM2PlS
	yhKfZsONdTyKSsFw8C2UPVHYxrMBNQSAOeNYI7kemC60av9Nltda6ITsWPulkhzZGC4xC31Eq2F
	7vn67YJJ8jauTMHKJhw==
X-Received: by 2002:a05:622a:4d3:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4ae8f04c25bmr88572431cf.9.1753778284728;
        Tue, 29 Jul 2025 01:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFk+8osi5NjoyJJc0sozN4PRSplo5UEsJysdEFgi1ECjypp4pJyuHqbEQ1g7FkQEOFLo3MQA==
X-Received: by 2002:a05:622a:4d3:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4ae8f04c25bmr88571721cf.9.1753778282010;
        Tue, 29 Jul 2025 01:38:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa21fcsm557954666b.95.2025.07.29.01.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 01:38:00 -0700 (PDT)
Message-ID: <d14b2a0c-8304-497f-a662-5b93dbaaa1ed@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 10:37:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
 <a6456802-3d19-4da5-a995-c8f00553c7fa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a6456802-3d19-4da5-a995-c8f00553c7fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA2NSBTYWx0ZWRfX3RV/TkvWDAyF
 upcmfrJSQNCIy5vOocGfPLr/otWA0dPYK0tTsLoz4BKF6o36xjVLRE40ksXXOxwrtPjtc/dKvfv
 EKfaNonzRA4WVPfpPekclrqcookuGGtOWMTZ7FYSPxJEF2R3Ue7Emse57584ueEq7EdQvoP+MjH
 /suwkV+cvek5Y67Pq5q3hz82YLI0dEpf0QCul7c08mtVx4uO2uc9M9o4hK7GIIDkHfqdBkU1YYQ
 s+iv/3ugCeg7KA2JzKuggng8XMkmEUxw3hBiuw1FUM8SyEOdoaNsVmdrG6d5g8ZWyReGCZxNkaK
 pdjBtsv8WKKR25jaXHuVnOz9ibXTBOn81hW2ykjl5aXqF9yGpRYR/SiZpmRJq+0Yd1C0WAx6wDC
 G3MlxAXa9WoNhqVfTvCGZOo21X7iPesHPxklIHyeZzXOr/DBqeMiI10/vGmSRxFPuuimibcD
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6888886d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZOIhAQMpLvIksW73xekA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RBLQ_EFwvwy9nBAp8D7V8C6e6tGiBLzk
X-Proofpoint-ORIG-GUID: RBLQ_EFwvwy9nBAp8D7V8C6e6tGiBLzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290065

On 7/29/25 7:51 AM, Yijie Yang wrote:
> 
> 
> On 2025-07-29 09:32, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> This change enables and overlays the following peripherals on the carrier
>> board:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>>
>> Written with contributions from Shuai Zhang (added Bluetooth) and Yongxing
>> Mou (added USB DisplayPorts).
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---

[...]>> +    vreg_wcn_3p3: regulator-wcn-3p3 {
>> +        compatible = "regulator-fixed";
>> +
>> +        regulator-name = "VREG_WCN_3P3";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +
>> +        gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>> +        enable-active-high;
>> +
>> +        pinctrl-0 = <&wcn_sw_en>;
>> +        pinctrl-names = "default";
>> +
>> +        regulator-boot-on;
> 
> It should be set to 'regulator-always-on'.

Are you sure? Turning off Wi-Fi sounds like a valid usecase..

Konrad

