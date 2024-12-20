Return-Path: <linux-arm-msm+bounces-43025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AED9F9C90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 23:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A398169362
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 22:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FE922687C;
	Fri, 20 Dec 2024 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX6qF5HN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B45226529
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734732363; cv=none; b=JsIGhh8LplzpRSdACwk8G+NVxn02x5+qexhXcVp6cPqofTvYGlxP3JzcBw91+wCQytDoPLyT2Ygc+a8OXmN+F/46Tgtmc2vaAqVna4IhJAw9N9gee9S0I9Y687OB7/0Mr4Qi/u7vUBPKmFOpXlOt4iU/fHljJajizozDYm3S7DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734732363; c=relaxed/simple;
	bh=PYfMyDqg17kslvPPraNVn6LtPqttUcrIdvQB0jDY3cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suRX6qoLw9PXV9cYYmHV8dolLP2y55T33Isfb9wpaXUqkf5bXT9rzG1I/7axu8sw1vv02J+AfvrTL2wMcW6+Ky3qpJAgX/LrusgfFx5WaEhCErkU9saOUuvo7E4u7yYWUF5B+3KACb7xGaPvd+agIZ216NUExrsHO9jdkFKW34s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX6qF5HN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKAF0fT010120
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 22:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9LkFprxiUsD1tk8g3pSzxnZakkpVhYTWUC5dUvvw9cU=; b=OX6qF5HNDalc8WsU
	j1l+fCGALZntBY47aJJj/THHl+B7bxzD94dCk8um1GMoOrr92fRm9RLRh/nsGZNN
	x6zNnGIhaQjZC1Rfvg6TFDqHZgejTEHTtdhD2eHIf4X4c8qTpYwRAD8hvq2Cr9d0
	W2huSD4ejU53l7/ToTzgNE/1VfoAuR30ZbK2T6G5XCwuhZwjqqqEwtVa74xOuAfk
	DAXqXsVf4fXjRm8iL44FPC0eOiFPiADkmyLTOEJoIP6DeZEAhus6lCameWkKP22x
	i3BQOYf9JISQPokSXU0dqGglf/wJHUSXHGbhdv3eb4xcZr1mh2QCePY5Xcqwu3QL
	yr1Ldw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n6n4hnjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 22:06:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f134dac1so10993085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 14:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734732360; x=1735337160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LkFprxiUsD1tk8g3pSzxnZakkpVhYTWUC5dUvvw9cU=;
        b=BZir/nQ1N8tYg2kRdYY3G6223sc67a3EIwAxqOC10N2hAeTFosXcCY3hbNdhaa5SJe
         /D9Kd8Bk8l4obCC0Rt5R5nXhfyj/P2MJoOY6acssO5RhsLVhT8yT4gIAddoPSsHp+Mnv
         /1BzN6x2Tc72TW40Wfbmp0gnsRcpageLfIIbZ3DsKE28o/FmVyZGtWUt6OhIbK/xaAza
         FYZ8A0Otaxt2x9fVHGnNL3dNdEL8FOM5f3sAmbsJLLZjPiemz5L6KPBt3wepDW+Uepf3
         wlX7k8Ily08X3B5xAVMQq0Z+cORiMuK2QF4OWxZgHdiuLtsnRsRSjhQ3mwbkcnDd5ANF
         ZscA==
X-Forwarded-Encrypted: i=1; AJvYcCVNKoxb1czqX6RUbLdc4GjUKWkxcmovIrwS59GsKPncOZNnZOQ0xAEAnOxFMs5mGPsKxKapXx/q719WL2LP@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwIUvuBWrY6aULUPX5XAqTSDh+1KOOX/5ikVSxSSRtnno28Wk
	yu/ztUZ4C1huX+3MaDNnWNwdJzLJHfigxP3RogmD8aoh+om02AXsbRFufgKszE5pxaBcMMFzDcW
	ehcHc8L5V6HLt6qiJVgLa0GLoN0Vir+041iXGggToNvCaWOuNtkytbLSBzLdDcCrH
X-Gm-Gg: ASbGnct8kcpFhvjB+Xb1aTyL1TjSgfj97P4HpTCSIZo6DTiBqBdJUlVYOJ0wZ2A8RJv
	V415AUU/gjuMs7Y9Y+LZYqKGOJlLjmkjsuDg8of6T/S1xLGMFgufc2fc6UbdGuPeMTbx+a3SZB8
	o+vyqlU0rKwrbXvNQKcVlsnHum0fk463y/Ek9Au+1T1M27HsiYdRMVYxjpCDHy91/+cf5heHJfK
	9TdcSQUX/paRssO5i/iaep84dQxN19x04LpPvMgSQadAWpUdyjbOljTkqHigGpnOPrsrCst0+FA
	f786Yo6rCSxO8OzQIxEBDi0Jstg7pNQNCOU=
X-Received: by 2002:a05:620a:17a0:b0:7b6:e126:3dee with SMTP id af79cd13be357-7b9ba71292cmr244461385a.3.1734732360443;
        Fri, 20 Dec 2024 14:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHDi1i1hytvqYgiaDYCCC63bgwu6iKUJ6GlNcbQHn3uxugwlsISW/jSe1exPxzhd8K+GSWew==
X-Received: by 2002:a05:620a:17a0:b0:7b6:e126:3dee with SMTP id af79cd13be357-7b9ba71292cmr244459385a.3.1734732360111;
        Fri, 20 Dec 2024 14:06:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3ebsm2100297a12.7.2024.12.20.14.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 14:05:58 -0800 (PST)
Message-ID: <2d1570a2-511a-4200-b4cc-60f56cfe4423@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 23:05:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k
 PCI module with WSI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
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
 <768ef22a-855b-472d-9432-49db7daaf2df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <768ef22a-855b-472d-9432-49db7daaf2df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KKoCF6pUlu6nBjs3IKL96uoQjiMC5uF0
X-Proofpoint-ORIG-GUID: KKoCF6pUlu6nBjs3IKL96uoQjiMC5uF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200178

On 20.12.2024 11:05 PM, Konrad Dybcio wrote:
> On 20.12.2024 10:47 PM, Jeff Johnson wrote:
>> On 12/20/2024 12:03 PM, Konrad Dybcio wrote:
>>> On 5.11.2024 7:04 PM, Raj Kumar Bhagat wrote:
>>>> The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
>>>> to exchange specific control information across radios using a doorbell
>>>> mechanism. This WSI connection is essential for exchanging control
>>>> information among these devices. The WSI interface in the QCN9274 includes
>>>> TX and RX ports, which are used to connect multiple WSI-supported devices
>>>> together, forming a WSI group.
>>>>
>>>> Describe QCN9274 PCI wifi device with WSI interface.
>>>>
>>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>>> ---
>>>
>>> I think this description is missing the key points:
>>>
>>> * what is that control information (power, data, radio stuff?)
>>> * what happens when the OS is unaware of all of this (i.e. what happens when
>>>   we don't send any configuration)
>>> * is this configurable, or does this describe a physical wiring topology
>>>   (what/who decides which of the group configurations detailed below take
>>>    effect)
>>>
>>> And the ultimate question:
>>> * can the devices not just talk among themselves and negotiate that?
>>>
>>> Though AFAICU PCIe P2P communication is a shaky topic, so perhaps the answer
>>> to the last question is 'no'
>>>
>>> Konrad
>>
>> We already pushed the non-RFC version to our -next tree so we cannot update
>> the commit description without a forced push.
>>
>> https://lore.kernel.org/all/20241211153432.775335-2-kvalo@kernel.org/
>>
>> However, Raj Kumar can submit an update to the description in the file, which
>> is probably the better place to have this information anyway.
> 
> Sounds good

(although bindings usually land with Krzysztof's or Rob's review tags,
but that's between you and them to talk about now)

Konrad

