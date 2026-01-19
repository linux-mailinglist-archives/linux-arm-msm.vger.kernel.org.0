Return-Path: <linux-arm-msm+bounces-89610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECCD3A586
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1BC13075422
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB1330DEC4;
	Mon, 19 Jan 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCUCbk6z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/cCvlsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E230CDBE
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819333; cv=none; b=N5BcXOGqtP/eegL4Vql8BATye4y3cWHMssoJBf3XentFRJZjr+58gCu/i+PkSPnxKNOK4YotUerv3toJREaF8Twf2Q1l4+6cOAiLuQPCg5AnibGMJLD+Yod8VR0WWFWsMnLotYsxB6zzSPlPg417L4en/v4ic4/L5abdr6Fk+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819333; c=relaxed/simple;
	bh=FZhwG2LalquaV0zmFxo0ONLJ27URIsK+IsXD8gMqwP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBEhq++AzDqB1sQ5RXt2yvFhnTH4Am4uuVdzXQ0jqF73A9wESiiaBJhbH1gk0IiRZjBSKRfRASFrf2ehGC/90FCnuSO5i7kz6ruM3AYqIULKyh0/Qmo19g5LNq7jzHZown+cx2QWKNWiaku0nQWSzktzeMbMftwemD7LjADOI28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCUCbk6z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/cCvlsX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90mDO1904955
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8R3naLiFgp452M0gNh0bKeRwTw6Ug+BfZAdVToiioy4=; b=PCUCbk6zLAcxyobw
	cDR5J4Nzb4QbYXwt1gpfWI3pbX1yTx4T9rFEgXBmEpDX6hbzNfQ5OdztLVaTLp7k
	5FdgOouYg936/FSQe9oZar3elFLr+si64/CmN7H6k5URc7gQpOv/40QNNs/+TYiY
	GEVrqGpZPa4mG1ofwDFrSPnLXtqZeTRz1zJpxKz/t7c7LeEtud3mjoYe/mjLREnL
	fzdnWzyXNao3W0y7j8EUshIfEuGNpVjdh2tMsfbfRsVxKRbT4JVwe33F3CUMvvRW
	H4ah6Ar4AFPJ+8M+RZUcw2wx48zgH+ZqdWx596gZIsJWUNM4McCkN+mMGGAQ1r1t
	rpFhHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8k71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:42:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a07fa318fdso33062645ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819327; x=1769424127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8R3naLiFgp452M0gNh0bKeRwTw6Ug+BfZAdVToiioy4=;
        b=f/cCvlsXmxzYzgOsNrdtvrvC2lavJrmRGfsdRGXqrgiMf8ACcX1KOlUM9rYZb90uVw
         V1vUJlIggbwUvKknaP5EEFxbEaer9vRLhMo61jRBxE27Tu2uln7juIyEMgy3+8VOd7X3
         5u2+jgZSZbLdTILpz4TlRFAAurT4mg7X4j7aGNqfveyc/8bBhmHomnBFdUYLpyQANw/R
         sj5Di+cGTk/8XxhlzmuuuMG1/sXMSCdLKubw2FMPj9D+ZrPUubVVZKH2mu+LSYylL0Q7
         tFqp4j22Mh/WrQBM96jNcnxKRfqsSfPEwgKbDviDlCtgeYvahld20SMrsN/bjQVmEvDP
         xsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819327; x=1769424127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R3naLiFgp452M0gNh0bKeRwTw6Ug+BfZAdVToiioy4=;
        b=KkBKK45Q2VnrQdzd1y+hLPB87OpkrgOP+Ua1PeNTHJ4FHmvxWSWU1OrCVTE+duU6mh
         CCKbPaeg4qPmcHq7vXXWBOvethPG6xjMSoQrXXBIMsevI/iGUg5S57MkofbhanDFoa/w
         qfn4waOzx/686h/A5G/iy6rKKSxNFTdn/8/JbSNaGr/ubIEyGV1u6QbLwSY/ctUSRsjY
         RodIPoZcBVsRSuWx6vbqdgJPlK22gXbpiVSMVAy+wvZJjQetWwiUjqgT9sjCKPlJVlFw
         XpDF2hkvH7rCIjiH4bDTNJhw54ztTbe9oJAFkmA/A7TasV1kNhZaVQyE9GjrHnCfwN5Z
         Qkpw==
X-Forwarded-Encrypted: i=1; AJvYcCUEvl55SiPSa1v+dMoUYvOhKfr1igXFXbB+FMbRRVBkWdo+VJ0MKAVp59YughlPu46qIBE2Ln8J9kKAiWsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzaW9LtEzDkJ0xMMsYHvUiEE+Tnt5CplMdqEyDaJfE9/QmYZPQ1
	aonvWFmWjA3MlMxtK6NZdVZUH5k3ZWxvykSKz/GbJ5tViE6Ki/TMJzHN+t7sfOHFJ+GVO/JxBSy
	ppWWS9N2C3vIzW0KhCSaRmZeHvARvtasIzm9/4paW5oCvl/zBBJ6btr20e1WKGJHn0yfMBfRyKP
	uoxVM=
X-Gm-Gg: AZuq6aIUkEwc8EILZbgvxPUToIvTi232cs61BacdJTmwTdqgWBuQx5zcl44NMNdRaUt
	j6iBcim91k/74SZ5awd7pk8Li5zOG/GhGCzWp7q7zKfIkWsqWlTReawufey4/Tk/Aqb7r0v53te
	Bv704QYsn7ApXNtCP/Eawvo0wVWkn42hyvysVVkgjB+mUm8Ooh/y58SxH+64CuZL5MuRSeVZDew
	3u3rxZgD+G8P08mrwUObfqINElHFhnPftneqKZe1vxvNQn+bcwdAX0bgZUnCn0iTTgB96+yWpPx
	45iH2htJHDNgsLCF/NNgmnIsrb6Ov5vkSa1zOBn/MmOteubeibkiQXWZH4mqwreiIXgczLv5R5q
	zj9ri18cLg601yEKckruV4MaGfAIeoWf6sf2tGqOm0zCUtPXO2oFsySZpwG+Hfm4fnuqix1/+zl
	uj2Vc=
X-Received: by 2002:a17:902:cec3:b0:2a0:97d2:a265 with SMTP id d9443c01a7336-2a7175339eemr92386975ad.14.1768819326937;
        Mon, 19 Jan 2026 02:42:06 -0800 (PST)
X-Received: by 2002:a17:902:cec3:b0:2a0:97d2:a265 with SMTP id d9443c01a7336-2a7175339eemr92386675ad.14.1768819326459;
        Mon, 19 Jan 2026 02:42:06 -0800 (PST)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab921sm89623335ad.8.2026.01.19.02.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:42:06 -0800 (PST)
Message-ID: <c96e955b-6e66-4164-bf94-eb50a8f7a1ab@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 18:42:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
 <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
 <eawxuhblnho4pyeyskvk5s4ouqser7o5jh267ttinzeeowxfxs@y6nl2qbdydb2>
 <e1c00e57-cac9-495a-9d27-f77ceac5c5ce@oss.qualcomm.com>
 <7sbof5mgm7mqtm4gh45f4w7264akplqtkfyplrerek4w6seipl@ith7sc3wmgih>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <7sbof5mgm7mqtm4gh45f4w7264akplqtkfyplrerek4w6seipl@ith7sc3wmgih>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX72BaE0Y7prxL
 OUTl4orNO/vIW6ykm0caHi0NfzgzELtErl2o774lv9p55fGvrrD0ze+VMWatOfg0JKU7KZ+60Km
 uaPpBSNmh3hPdxOqGlNuIY/wxNheUTyyvG/+2g8rRZ1TRQ9tH1WIa8BwKazMz6a8fP0PyQHU2FG
 LvAB70DxHcrR4pGnLt46pdTnLaS0P7t1DRsEDRsoNiKXiMlz1ZurSy5kjZKSyyJFzFDmQbzXWqA
 zMn0Dq+NBTRaG0SPPjos6B4AUqPVNxzampeU+IecdEaAIu7bfae8y9JczeDVfhDplAVWIo5mR2R
 Di4a60OGcfOK4r5e2Qa+K3+n2tPAWQHntgKyJukvpuz+I2aQq2ZpiwXQxJ4Yvwld5L7XwpGO6eY
 0qCUdwVdmPVSMWlYQhi/qTPs+riXhXEjwhwyXs9mhhNRf/hwTVzPDFjsMbh/LYU26esYMA9mIiL
 G3CjE9jU2aUBnXedPXQ==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e0a80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C50igqWIdSMoUx98drYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Wdzc3cyTn9T7Du4CRfSylmY8ln1K45Id
X-Proofpoint-GUID: Wdzc3cyTn9T7Du4CRfSylmY8ln1K45Id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088



On 1/19/2026 5:46 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 04:48:20PM +0800, Yijie Yang wrote:
>>
>>
>> On 1/19/2026 2:33 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 19, 2026 at 11:13:29AM +0800, Yijie Yang wrote:
>>>>
>>>>
>>>> On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
>>>>> On 16/01/2026 11:41, YijieYang wrote:
>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>
>>>>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>>>>>> embedded system capable of booting to UART.
>>>>>>
>>>>>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>>>>>> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
>>>>>>
>>>>>
>>>>> NAK.
>>>>>
>>>>> Warnings were reported at v3. Did you address them? No, you completely
>>>>> ignored them, so warnings are reported again at v4.
>>>>>
>>>>> What do you think these emails are for?
>>>>
>>>> This warning is caused by the pcie3_phy node in purwa.dtsi, which is not
>>>> introduced by this patch set. Since it does not impact functionality, would
>>>> it be appropriate to fix it in a separate patch?
>>>
>>> Why can't it be fixed as a part of this patchset?
>>
>> 'qcom,4ln-config-sel' is a property related to bifurcated PHY support, which
>> Purwa’s PCIe3 does not provide. Therefore, introducing a new compatible with
>> a corresponding binding would be more appropriate than simply adding this
>> property. Is it acceptable to address this within the current patch set?
> 
> Within this or in the separate patchset, but it needs to be fixed before
> this patch can go in. Otherwise we are enabling broken PCIe3.

OK, will fix.


> 
>>
>>>
>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> -- 
>>>> Best Regards,
>>>> Yijie
>>>>
>>>
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


