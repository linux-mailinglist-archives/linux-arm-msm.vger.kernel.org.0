Return-Path: <linux-arm-msm+bounces-83745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286FC91C21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F2E3AB00E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97E830BF70;
	Fri, 28 Nov 2025 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxCJUASe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExUweOQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA83093AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328189; cv=none; b=kkR4tWMIH6LVD7xhzJ4U4BlTzjVfIp1lJJ3SSUQkzdsAus9Pq38cMY2TwdQOs3o9kHW6bzJjuZFVkwbNGOmEjKDj7h4API+oisDTfDzs4x+HtAr+pzqPxDnpStDyaFmkvKto8VHhtyW3vkJpe0+xjDNMJESr9UsVwXP/Yf9r01M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328189; c=relaxed/simple;
	bh=1bOlzzty8FZMxXMwi2YS43ep7klGL6q3YwBSXryK1NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szSyNmmzTc+RzVaxXx9NpHvFtbC0JTaTcQEUrWG4eNdQwesVfVBicFKbUP9BtCy1B5hqn5facDDcgmb3g1NYMFVMo36NSEzVg9a0DQupGHJlbhzA0GRRAIcX4NUDWKfzMVRTKOrcMw7+YSTxGt145m9QISMSA6Sg08OTUbnJwDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxCJUASe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExUweOQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PU8K3797238
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjc5hD17bCflggVCxPdBIikzdV2SPiF2DMyYgKacjh0=; b=YxCJUASe9Wls61Vm
	2n3VJSxaDda7UcVjaLcYVAlUlQEPg0LhH3t3iHXdtb/yH5xul5mmK45jCvLhiCzw
	/m9HksjrH5UPqmBIDE7BbZfxmj8vASTa+c0AdN6igx5vbG/ZSJfBukYDwWW3Wwc2
	6uxrqqC3i7E3OqVzW5JCHmNdyzFXhZKTPbQ1IaDrKtGu/vD6Hb1CgrIO0ZTXHsvK
	YqQ8HWCXtt8MxCKXT3usnVSFfDeKWivK6n98FpC5MvXd/+s1cqwHt6zSYdXNzLJ5
	GBu6o1mgr+6TUxVXai7zxkSAoZu00V7Ab8Y+ao4k3qgul/vQRQ7Bd21b7Yz6U5FG
	6MaYFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudax4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:09:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso2656001cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328186; x=1764932986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjc5hD17bCflggVCxPdBIikzdV2SPiF2DMyYgKacjh0=;
        b=ExUweOQsPCpey5mUrYe457GLtgCEQ+1g7tJbG/a+W59P4UeXzhRbct/jfQAufFg1d1
         KoccJExB7MvT+TiDq9T+bnaxgCUK6sPQq+doM26fIAO6OCilQI8YEPsByeuMpZ7k1qxd
         nLJXOmi2RQS3YQaAngatt/qaqkkpln1S47IW8JhYN0s66E4bIhNrqxGVPyG4RsqqVvdh
         WnHiuatxavLrJrxD+GZ8qJMGWLqg3TVHKqge+fPYOZFltpz69UTiVEH1rAojS2Kz6EFb
         MfVgYniQlR96TZMzObRGIlIErjB5MDDruzPRglr1TQ/oNal2hq5/eG1kqtOxElX9Y8+V
         PXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328186; x=1764932986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjc5hD17bCflggVCxPdBIikzdV2SPiF2DMyYgKacjh0=;
        b=MoNTznbiW4VR0R1dqUZnj97tlS/QMEsCLAiTahfPXsjB6UCCMAn0t6N4fHMj/o9Jsl
         NNZiR01atn6bDreNQyxUA93F+mklGiBS5r/Rboqao57WOMWf1buCza1gx9CMcRlisvyk
         tVv2w4yelp6ecFhihWAzztoZn4fWcnPVfCeqChSWa+1YFP/+LxgZMH2G3LZHYGZFcONF
         SxT0FG20U15RRYl2h2q8oA2N4762AH70Tz5tIPbiuIg4SRvT4idZYP8floI/CpyfXnZ0
         bTk2tadsLLu2PxcI7yyi8TJoXwpgNva3aiFRUenqarrqfXF0chyqR9q0jxfrcVuNMVNA
         xs7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmnnU5vsOVF9FrVBWa57Lu17fqSVzo35D7UA0x1+3orBfCj5bH1s4eJ9jhBuH6t3Fyum0j1KpfTde0h1lg@vger.kernel.org
X-Gm-Message-State: AOJu0YzIc6tfeEyb/yLBR0GGBPaHTSZ0V3wT1Y1Q17DP5GtNDeGKxRDr
	Eqv4/cnv+rp3es1KqWsurySfHjyQQTFJAPgm43Vb9ETEoztwnunLaiJ5PZp+NIMSyTeX6REKr6W
	o3Yr5OIw5FG1mcSOfPS2aXk/a1Dcr02hpXbs04V9VnpXaoepU06orZRHDAhXaE6i/I0t5
X-Gm-Gg: ASbGncs3NqK1nOIMZFFHao/3SczHDTYSu2AIB8PifIds6HrKtEylGxOTbO+QV+j6xj6
	W7GTQmGv4/Ca7Vhx1t7hR3OInXiqE/3KYC1nOGFxbFUk7q1WD94rIB1U8rgppE9PRtFWeKT70x7
	SmD4Y6H2KMLYGpgAjeJQX4hvJMjD4f27uhqZ8PMQ/P95wAooujFhuyt7SfoiJbb7YMeZmUVIq82
	b9Ho5CafA5Kxm4zKJlXXpo4Oi2L9nAdWbWAzx6bBNU5zwm2JV0UnJkGWXsfmpd6IheoCKYVtWPI
	pzRWsOtL/YEkLouo+HUSR2L2J0JV0EjVvx9GYhcz+2VlxVjawuRpyd71eF4Ue2R0Q/fjk0Vbozp
	sTznhs/LyCPpQuTzYs0i+Q4CURAHjUDnF1u4fyZyMnECfgj2//e3n/hxjKM+5NS/Ysi8=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr280074921cf.10.1764328186481;
        Fri, 28 Nov 2025 03:09:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkoR5Oca1UrGpk7XxIRelKSiBYVKOyn73Dg2K3CHSTUfG0c7/OR701j1oCzPaF/4k7pX0esQ==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr280074471cf.10.1764328186108;
        Fri, 28 Nov 2025 03:09:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm397239666b.37.2025.11.28.03.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:09:45 -0800 (PST)
Message-ID: <3f4a830d-a9ae-480b-b31d-44175e63ec92@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:09:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
 <40aed2f4-ec33-4087-8245-7c4acf861387@oss.qualcomm.com>
 <aSaVEWlyQ2jzGFwN@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aSaVEWlyQ2jzGFwN@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cQRfDST4o71fIXBp8rD5mYbbAKOxv-MA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX7ZB8ADUhpAaM
 /J141edLovS2LkqQwmi6f6qDRYcfMMIh/JMHt2ODKTysV17g3wAgZJsr2kUcRgQk4eLUOzZ4CBO
 LL0aaebOV8dcZrXGz8QHm6IjAl4pj2DAEOayKW1z6lGQels9IenSgKoRNRPo3OBuLsnaEqpy1M+
 pJQSvOM4zHFJgBf9+994MArOIUEuMNL9DEFG7LNM8J7g5INu6kKa4vfiJhzmlABMUjdp9DC3KYr
 +oqzT0Tk/veFcoq8TYHOfJcaUNEUkAFt7luUa/eNk8s3n5fhvgTp5VKhLhq71QcRzPJEjkRYLCo
 PrnAGqpFp1hy6V512T498zHG/72Xx+NF/aMKbHALfWcoI1oQWCFAjuSq/bYbrmCIgYAaf5l/Y13
 lCszVBPFGFDFixpLjis/agKXGeA7Cw==
X-Proofpoint-ORIG-GUID: cQRfDST4o71fIXBp8rD5mYbbAKOxv-MA
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=692982fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9Bq4fA3S1XDnWHg8PAkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/26/25 6:50 AM, Varadarajan Narayanan wrote:
> Konrad,
> 
> I intend to follow up on this patch series as the previous person is
> stuck with other assignments. Will address the comments in the other
> patches too and post a new version shortly.
> 
>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>
>>> Enable nodes required for q6 remoteproc bring up.
>>>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>> ---

[...]

>>> +			glink-edge {
>>> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
>>
>> Shouldn't this be 323?
> 
> Since Q6 uses 321 for glink and 322 for smp2p we have to use the same
> in Linux too. As of now 323 and 324 are unused.

OK thanks for confirming

Konrad

