Return-Path: <linux-arm-msm+bounces-84217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1311C9EE5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4515D4E02A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C01F29DB64;
	Wed,  3 Dec 2025 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qv0gTuG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MI8lY4MR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D902F39DE
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762620; cv=none; b=AC8jgIVl+F6ITsK07KvZgVPEZvKpDs+fioLT/w2X1fbSJc/hrIGcPs4Zg6iRvwqs2s4nrcAMJWGV0Qe69pxNVWSi4/EunuFyiSB/3o+a7A/gqrud6uTpp8wdhXcCFMomfhLCfn390Cm25nmua58mErxJhEmW6HHlE6PMKnmrEKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762620; c=relaxed/simple;
	bh=JpWFKWR5sToJbNr1nFp4OCyMzmyboQkho+CkUGHG2qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHzvTKjMwciZc098coP+7QApC4LyBfmzqSVZ9x/rixWXA2icvxa97M63bP4raiGDCr+RaZvmwB5j3kVbtAnmr9jym4xMYBmKKwZ5m7O/tHaTmH2txfNl8auv15ljbNnPrtG/booK1XH8Ij4vEvtff2OnpFM7+33nBl33JiF+wvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qv0gTuG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MI8lY4MR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3BRhfg1970594
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vmPnZazZ+URyX26QXJDQPSeQbakIk0GxOEnDkhE1Wo=; b=Qv0gTuG7hW0URebG
	k7vtGjoeBml/6NoSHFxsAZCCUDbToad8wB6Qe1N0+zAvo2HS5Tjgg/NjgRjVTE5v
	/u3FiyN7yj5x/PLSRJRt7IQV8nVLpyi0A8mgQ1dcbsRX6duycNqRSe510w6MCMgE
	WeMjwWdwzvOh4ysEkjnghTe3ULncbi8qGHOmZNJHeuF00ytlmWBBp5EH3M+VL++N
	PNWFceUCccuEQH05gpNO+WcemO+1M5JDNqUriTZZ7lnrlD62bKBQjmBeEnAJ06sQ
	gAinsyYxpTsvJXQmSpizuE6Movf/BjEwHY/eOmOA12AClc6zf15cX0tqLMV8knjH
	y47ULg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtg1ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:50:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b184fa3ffbso166489985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764762615; x=1765367415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vmPnZazZ+URyX26QXJDQPSeQbakIk0GxOEnDkhE1Wo=;
        b=MI8lY4MR7GgIzjwXyxajhxRMwkhzRDm8UxKVYUtxWigkHo3WgygVuvlhyV9WoGf7Im
         cKtVTjZ//mzmq9bV0jS+ZCjrGtbe+66MAWN1Mu9CEhK13rk5wlHJkeYufcY8xRjMiQCN
         MXGLixdyog+DVhexCtjGo6Q7NtFTiT4yXFUxKqi5hs+Gx4uvdajoRbyKmTj6dPV0Zscz
         cmDPDamAMcKeR2EIFvmGIecNwAUQPgCo6UuXuRPBlEuz3xjtOPP6HXLutJ6TzG5ONyzI
         T2vKz8iALUEl0oCYuLcWsknh8dgDUQMRULDwM00jjhNkqM2d/oMlp024huOxUYM/EpXh
         hMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764762615; x=1765367415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vmPnZazZ+URyX26QXJDQPSeQbakIk0GxOEnDkhE1Wo=;
        b=PRruIcZqLQmD+VfGEuiwL//kmI5h/P8m7qcTUNQQHnvztkZAbyiHg0fSKZQdvxrt3L
         0wZJIvZNo+TDdmn3dVMvmbozUiB647b7JDwTj7fUG3EixjVLY0HCWtJbT/ObMupHikGi
         khQBdUnGIZs6o/0nuy4eycw/GMsJkGzAQpw7OmmB4JOUbQO6ca3JqP37NiV0ycvpL7ad
         DQprquSynIR0qu/QSweAWxjDtInaXVWJv+Z/ondh6RQGtt5uELJVOTvgX5GmeesMsXm8
         XD0tbVCFLKoQky93G3YZi3Me33sHUo55bBXS8nrGRf2/qPtYYbW39lH6Pz8ivlFcCFdN
         XpSg==
X-Forwarded-Encrypted: i=1; AJvYcCUle3NTsRIFJRux/BbGWJqETynZnyUQliSY52oVYh0yC+RDOjzdBeXcIgBRNM8OaRh5pXQFMUHVoTjkvmsg@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3DKpUSu0UZcr0I26TIve8ocO4UQlcN39HAw27dYTmwTiJI4a
	mTCXPo8x0/0A0S+JP9zxhbf3QfJa+UqQwphHA2t5fZ2CIHFvnTxkNWvQ2QdoKzwmQjKTZhdd5UP
	LRcXBfKGwcfpG54+fHrF+XCzs6JWSxa/ACx4SHXYSqWubuGOZ+P7zxWPoDVubiGHtzjH7
X-Gm-Gg: ASbGnct0yXkySo1s45a9NLA4x8o83aCMTRtrPrQ/duA4B5Q78y7lq3WIeBCXmohn1x7
	e/qjVeB/Y7ydpSFgTr0KqNB17bbECVH9+oV+vre2aV59ivaux/ThoDDfliXNg/lWd75owZeGWIy
	/iPAqrdbi9KciXXoVJEKqqrstZjLZnO5fquy4bJ0tLiX9AhkFKRyTtkp1Nq8K7LnC5WSBmqVnf6
	3O7uBq2nlWnpqx+njQ4CD2LuyuLPtoVt1BAWprsRAjh8C6XUiiGNMANKD14pLgtBZiIPMBM1evN
	k9fB3/4GVh5ffOWDtiKsHk3Q7PvFQfHZCX6gauzY/cV6io+F3/xTR5uKUUjXzahGLaWwYyNr9OI
	PNrscOTuAqokrtB2xASXAUuaJGwcAsfkKdy7HDheQWPDP6Vf8KBkglnb+WpLgd78yKg==
X-Received: by 2002:a05:620a:192a:b0:8a3:d644:6930 with SMTP id af79cd13be357-8b5f94f3f46mr85821585a.5.1764762615157;
        Wed, 03 Dec 2025 03:50:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETeeiqcYG3BpC1x4b6CjlH54mSfOS/0WBzj6rhUNfljLIfG+eTrPV0WqTjwf1M/Zg9dkvOcg==
X-Received: by 2002:a05:620a:192a:b0:8a3:d644:6930 with SMTP id af79cd13be357-8b5f94f3f46mr85818985a.5.1764762614733;
        Wed, 03 Dec 2025 03:50:14 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519d828sm1761354766b.18.2025.12.03.03.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:50:14 -0800 (PST)
Message-ID: <94d6d26e-8009-437d-af9f-0a3c69fe8ed3@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:50:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8550-qrd: remove data-lanes
 property of image sensor
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-3-vladimir.zapolskiy@linaro.org>
 <9252338e-c775-46db-9376-53002edf429a@oss.qualcomm.com>
 <40980eac-9e9b-4293-8986-bff46f30a50b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <40980eac-9e9b-4293-8986-bff46f30a50b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=693023f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WjA3L6o0EGsnvM4WalEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: dLTsy7z8QX9EeQRcL6iDJZjv28iOyt6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MyBTYWx0ZWRfXz8X+MXxxVnbW
 ztnBF6sl86TEN3VhYQNeaV7Upz8l/wqOIpRCXcmjGMYmeqseASHnk4F0g7e4G1C5BI3ixRFTSBs
 iKLY/WprT1kBNChELxekevfwupaIIhF7o7EM4pJQdNMBmD1AvKEVwpnHHiSY+G9lfgPjmzc2hTg
 9B3Gj0qNbOEoi0yOyVkMDIzr8lNhjgPHBcv/g0dFPbJwAvRvsrPuDOpabQ0XJGDMxrlkhhaWMKy
 blQ0loupN47brodcLTaxYhI34zgR5loL+S5K3u2yR88KrQP4uByKkHS/kIiz6uq24CrwAe8nFq3
 lKebG3ZwQfi9gfY7YwpvHf65ZkIjom/dDIrwtsMrPLV5LjdSM2HzU2Tm1164S6A6JNdpyVP4NML
 8NZOY/vfVdfggxli8ACw5gPdRQ5D+g==
X-Proofpoint-ORIG-GUID: dLTsy7z8QX9EeQRcL6iDJZjv28iOyt6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030093

On 12/3/25 12:41 PM, Vladimir Zapolskiy wrote:
> On 12/3/25 13:11, Konrad Dybcio wrote:
>> On 12/3/25 5:05 AM, Vladimir Zapolskiy wrote:
>>> Samsung S5K3M5 image sensor supports only 4-lane MIPI CSI-2 interface,
>>> which makes the sensor data-lanes property redundant, and it can be
>>> safely removed from the board dts file. Noteworthy that the property
>>> value is incorrect, because conventionally lanes enumeration of image
>>> sensors starts from index 1.
>>
>> This seems to vary between sensors
>>
> 
> It should not, from Documentation/devicetree/bindings/media/video-interfaces.yaml
> the clock lane has index 0, data lanes enumeration starts from 1:
> 
>   data-lanes:
>   ....
>     description:
>       An array of physical data lane indexes. Position of an entry determines
>       the logical lane number, while the value of an entry indicates physical
>       lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
>       assuming the clock lane is on hardware lane 0.

I interpret the last sentence as ">>if<< the clock lane is 0, then data lanes
start at 1. I'm not sure if the spec mandates that's the case though.

Konrad

