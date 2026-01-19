Return-Path: <linux-arm-msm+bounces-89680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD4D3AA6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68E4030519E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3739C309F1D;
	Mon, 19 Jan 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cE19lbJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTz6tPJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F236213F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829483; cv=none; b=kl9v5xhjNbbnpthGDv80KiGEkbsC0f804z/R0lkDKKtupa8QcVf7RGXuBFJc5CDBIE9iDxXypbV5cg/W1ob3mxgrw9bO/9+TjIVC0v3zlsctzXNPOEPBWHKHzv/TmDHC14PABae946rynfFmLL5NJsXReF2jQW5qP9V3n7ctiM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829483; c=relaxed/simple;
	bh=5ViQuA8mqn++bVELbjVqt4k8ONw4PIjygbQAyIaqaq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rnzfa1A223e762dR0k0SXMhmamjtehJDdON3oiFrNb2WWPv06+giB5fkyGY6GhlVoE0XwU5LKQa3p122or+uUVj1/Ia8dpjqYrk9YdmpiFYjglDB57j1LSIRb11J5LZs5RwyPITHLJZxMgPSJUY6w3HwGVbDaiLP9oDjjqZGrYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cE19lbJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTz6tPJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7dIO597897
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAyyhZbB6CsZuklvGfuQpa3u0GJq/DZk9ERJShqyFGE=; b=cE19lbJExcsJke5c
	0lls4LKc3Bzwkvoi6aSg7lolU3ES4jFL0OIvCNFs+hlwAl0ntKm685RYhFClXkY3
	/9g6UfsyeU59omgbXGLztu0sQXBJ30mLDv7bd4+hg62kTUeUFg5r2Xi14bUxuMoB
	s1rM+msFbKeSHSKBJsm7vU5xbxPHDeO1LIUGqU9UgPijVQOXb4CHmmAB6gPrLAvg
	ozXFo1zDkWt0tw/PysFVYKZvBGLEP+L+eVyQqCl83y2s3O/C2B5tBxrtke/WsMZ5
	3VmKft3hRUjFVe8tkqa+qmk5lU4Y89A+Ihbtdyk9EcIX7AA+oH0T/aRFy15q+2dA
	iXsBTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7gjy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:31:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so102622785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 05:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768829480; x=1769434280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAyyhZbB6CsZuklvGfuQpa3u0GJq/DZk9ERJShqyFGE=;
        b=aTz6tPJ8iiV7gnhEd+fGc49saEgn3nwP/GiGtHnCttUeJKV+4HR4VdQ59lsVnHBE21
         RHwabOlOz2rQIgf3o9dsRu6WOLRBJj1DdrrD3HTLoVEP+H/2wJpA41hB6/Igzrkff/Y8
         GW51zmeJ9iK9KnQ1Mjgn33DnJuuD3QkGHuGOd7A+DUGql7QniSDsequi+fMsS+1t3+5Q
         WyrIz9xTjTLb62jFMdgzFH/FSfOvdYAyvJmEuCm6CXQyxKk5vwEnc2t/XXPMXJSlGzlC
         cPNMQ/+DMDOYgw54bQtQEUic0oNW1vg/tLxfQsdufWf4VkTUQCD6jxrIm/Skkdd4EU/6
         oo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768829480; x=1769434280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAyyhZbB6CsZuklvGfuQpa3u0GJq/DZk9ERJShqyFGE=;
        b=cYz7+shcZezQ4Dr3XabBSZ/KGVkbw+3ZwBpSlDQcGQDt/m2JChKt6/ig8ZaQCcV/Vs
         nVXe7GRzMHh9RCialyRLLTRIK7FN5J/M+dH1KtUmdv+1LjEyR7bmEG7o2pLvpx2IO2qp
         uj6Qn6W1PihX5fw0a2bO8vgY2QYmijtNmq5F2zsv/PnMtY6M/pG/GXfTKInvdYLa7/md
         GxkMLWS1pTiNEtO6D39trKbHR3LSG2U3LaURA2Pn/z2RQCAGbX8MliMvKbohaOscw1vv
         P3eLAlb+caiH2M1t3wQROASNvHJkel1XRWJCYrADEZn5nE5sKFzMOxD35TWdbMrxwJJ/
         FKVg==
X-Forwarded-Encrypted: i=1; AJvYcCXfqf4V2g6o8d9B19O/6ot4MFeJs50uXFWsuqhJ+9l1DIrBmWAUIhFCVRhDEOYqIQ/iO440f1TYbcEu3Jpw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5xHk1ZoHQBi69h9ccWMAS1bwPLGpJ8Yy8GYib9QRBtyQeSYW
	KUqiMBuQZlgoMggNjrIr7+sDD+S8Lng/JNvckYDHC36y3bIo+7Ptt+oms/xMCl7TVNzf7BTl88i
	/y6xTHGwDWnB3SfyZD2extlfOyASjdFTJaJGiRtoAk6+ToQkoSRTsjnVnHwHOkoOH7HFa
X-Gm-Gg: AY/fxX5KxGZIkp8u+hCsAnl9id0XN0q6ONKdOUElTSZ1OFmf94BNJI9vsmFZ03Vjq4w
	3HUyXEMZxM1z4uVD/mwdKAbE/OiUtPbwXjecA9ZCJoL64c6lAx/ECXPEizT89C4kwUXwFdUzTCB
	zQjRsR7IZ8s+mojXHMGHKT82tOfbJiwDxk++knFTLPBJxaduBD9SgTYAOs6moZoFJVYT45KBnQl
	RIlDY3Fk32rp9c7mAP3olIIx77HiI69EYuOKc8ilcNY36pQ3HrawSxEExICPB3AS14ChRkqqQ6p
	w2xIktLMQ/v/M9dtDLA1r+//CDD6a18mfnUWwxCbYQLsIkBJJaPyqR9+sofdYqzJSj+ykSoNAXz
	Gpv7XCpZ16rhYDK2rcVa9kXcqteR5IPD2X4W3ZVHK7RIZfPK6BVBtYSc35IlQOq/5ioc=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1224549585a.5.1768829479805;
        Mon, 19 Jan 2026 05:31:19 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1224545785a.5.1768829479299;
        Mon, 19 Jan 2026 05:31:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879516900csm1178682566b.23.2026.01.19.05.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 05:31:18 -0800 (PST)
Message-ID: <d1d05b31-f70e-4250-8ff0-bfcba7f5923d@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:31:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7sbof5mgm7mqtm4gh45f4w7264akplqtkfyplrerek4w6seipl@ith7sc3wmgih>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExMiBTYWx0ZWRfX+oa4FQZ2pooc
 HUpdH8wKyF6PVu84AY+pPTt7NwD0YBYTtnVwkJTpUVQwYIYmNgcnp7jr28LD8JAYdUXd6np4Neu
 A8/oBTv/g6RQFUcgnZrYH1/bNZuX8WvejvSWC4oIgRW9DUFZlGCRAYPuITzjSuzU5uWLWTvy2y1
 fztXVNKvfBpKIkOR9v8fpC+W/lbeOWKfTUiSn93B3/Btlz0rcKz+qhQIv2jxZOaSH3lwoqNHQC2
 6GGIm+F8U/89c+iXWFlbaU8R2bbbIU7SF5t974L7T14SBEB0fjy2RIhW6jFrkdRkSA8oR6Y2Nf4
 3R01Y3NqsECFIuv3CupiqODRntCICmsDAaXjAqFy8rKI0zVr5ZqB56MFVsLA+GwNAMnseBuOCId
 GYp8c94dnyQyUGGwaFpHTkRErK84Uf9MKAwysfooYLcYkFmkfIVZlaBiNbLqOLFlmA7L4EXz0d+
 tzfbNR1Ru2/CVAdpl/w==
X-Proofpoint-ORIG-GUID: hggPKkn6kfGvTQbpg_Amz_R38h3r0Cv7
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e3228 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=C50igqWIdSMoUx98drYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hggPKkn6kfGvTQbpg_Amz_R38h3r0Cv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190112

On 1/19/26 10:46 AM, Dmitry Baryshkov wrote:
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

https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u

Konrad

