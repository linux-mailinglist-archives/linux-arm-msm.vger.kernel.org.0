Return-Path: <linux-arm-msm+bounces-67008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A351AB14E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD99C3B82CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EB51991C9;
	Tue, 29 Jul 2025 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4vPjypW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42013597C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796307; cv=none; b=q/KKWyPAxAGDRVbOZ60oaPqUqfeZNvmbO2bXSby1/2Rvw4LJv3ioJ+I10hKS+WsoyaXcgvh0o8VQnkuzTHTGs2KwLINmvd5z+6KR/Yuu8DPWJTMVVKfbTkDHFPvEr/pJ8Y4Yuzi/fHHJTER5JPvjPE+Ci6HhJoE7Ab+08vXkWxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796307; c=relaxed/simple;
	bh=XRcQl2sDslI5kS3lvxmQW7gE08M2ZCXO65pFU+AsBIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLSLzxkGRwK0A7Jgv3UiHJL5gBgTFCatvnW0WwXEv7HRD/In8ll4KT3tWSt54d8C8ztxxWGeVjaN9kdEsdNfnT9iQAnLiMcqAqa2xML4jeFklb+JWFEevOatVUXTUwzgQ8wGlHIbrbxlBh7AWcoVAD01fDTIcPD/tyL8D/0L50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4vPjypW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8qBJq012394
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYu4VBFFbTuFCWo4dZT/gRUtAZuQsCf/xjeyDn34aco=; b=b4vPjypWqJTqgH4P
	UkAzdJxmq309RE35JcxUN4f7z9UKS5AZymG4QCKK95wkKLAajLGpA4eNAkruhywF
	M5xoDhG/RPnKQLYAfRXbFfPBaFG4wpnQVunX75ymzt9nTYjSgBgE9h7YnLfaWtX+
	Uni3pALhrJLPgF+YdvmBXtDt6p0x4WBE4GsJwc2C4+B0QbZ0oZDReHI8SY5Azzgw
	QjkzVuhGImbccFiB3NYcqEI/UfdCH5u04h/IxnglSBSoDykOpCFCnx4yjG1VtBki
	KgQJJtxuZVogsI7O1YFoml87kWEOY9SkIExrR7tPlTzjbtTpMJI+ygePY+NFzAxc
	E6aCnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda06nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:38:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e33990ba42so39929085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753796304; x=1754401104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYu4VBFFbTuFCWo4dZT/gRUtAZuQsCf/xjeyDn34aco=;
        b=lGdhZ3x41IrckpNYUNTfbs7vNdi9GoNRoAAksXO0pg37ahQ8uFpJmKJ2N94YLsfYNN
         HV9CQKjzJOCikqSqzt/4X33zZfVzvM+Pq68MfxVfgcvqSDaO4d58WdK0YXcEWo4CRJ9s
         3WJmMvlYpLLBdiD30zjjzqMGmLFOMoE8Z4hikXal9pY598r9UmqRWGvh9htNkjgEx9wh
         mizbk8qeWiYeLDrGFkdGRF3/IxDoXwNqedNRZOAP4fO6eTEWv8GdYiswa5HGFigGA73+
         Pq0vdCMO65tEA/R6VaPNnc9g21uAHUvoCnAnwep3GBZq4iv92ua364X5j4A2oXoyIjmm
         RDlg==
X-Gm-Message-State: AOJu0YxRTGyKUmVj5ZwFSH0mssmTKUfFTwe78XPbKINXN8WNBCnn2rGl
	4wmHUpYYM+cfYuOqxPd5oXDWUS2dvxqjm5BXm2Ies+0KiyFhEGG98PS6jYmrx4JMtnNkcrEnimN
	Y4aJczGwXUnM8WBNhedyCkYBC68uAGAtsMW5e2Y7rDMPf2jbkyY0vGF68Q7lcMdGlMKMO
X-Gm-Gg: ASbGncvZK4dYZI38O6j++907m1lkALpxuURTJ4pt5oCIP22q6q1Ygoz8yPMTf3rZJ9N
	wOlwtw29eJQpPnIcWD7ONCzyrcsWa/nm6QQdwmZOc9FhDCyeTR2m3oO2Kx+l9XF+mpE2tmpM/XB
	ByllPMQF02ib+uERA85j12LBCouB0amCaPACWT7wfoqUu62OtdggEK756WhIVeBnW/xkzDYFnRw
	CWUo/iJrgEkJOuo3Yhj8my19wtSWND5JWh4tIEF1WwY8cIjhLRLeShmaxt5lHZbi8eKjK5zA0I4
	bB4/I4WqlvDI7Hqn2NuB/Je5PvRfsc24LlZeUjvMRXBstjuuiZ/WI7AoCKgUolN+9GfG7oB+0mL
	IhtSkKfjAKV/7Ju99gg==
X-Received: by 2002:a05:620a:c55:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e66d755f00mr46585a.12.1753796303766;
        Tue, 29 Jul 2025 06:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKI4hIaiKAmbCU3iCvheBP2tvLlX/4n/EHL9QP1TiceX3J3baQPxmSmT4BEC5BFoqWNGF/sA==
X-Received: by 2002:a05:620a:c55:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e66d755f00mr44585a.12.1753796303257;
        Tue, 29 Jul 2025 06:38:23 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63586008dsm591768266b.16.2025.07.29.06.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:38:22 -0700 (PDT)
Message-ID: <3802c3a3-9774-4bcd-8819-41e5395df18e@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:38:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
 <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
 <d37879af-a1fc-41d4-8e31-2abba6fd6d57@oss.qualcomm.com>
 <d31c5e0f-dc50-4e7b-bd81-256269c82ec3@oss.qualcomm.com>
 <0aa2b07d-8c66-456d-aacd-c554bfa7664f@oss.qualcomm.com>
 <e3d04cf8-6d9c-4514-9d8f-782e2d1505a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e3d04cf8-6d9c-4514-9d8f-782e2d1505a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p3vOgqs437yLnZrqgVdybDu_m_d3vTdZ
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6888ced0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_xSS5P9aWiV-_plMCQ4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: p3vOgqs437yLnZrqgVdybDu_m_d3vTdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfXw528HCPMAHpf
 Q+FDj2GlQ1xV0mFhfZJq2bHZlpJQlOpnp8xUJn1a516K/Lg0IoDFtlDsjL7iHSpp73BF4OVFA1S
 dRCWjFdO4R1qFIjbs65hv69y3Fel8eP4F6iWMMSK+Z/L2KGC2HTuDXR2wLLoccVHiSzcyCGeeNl
 8osuCrMyzGCl+jbVK9kIHEsXbXQb1PEWy71UWILOOpL4wr0UMNH3h7bAxg4Za4b2Qt5snu21ynq
 WhpAa5uUgKNwtqcANQbCLTlMlnJcvlnA1sXAV008NKbcHly3DDjNilxK3kk1uAKg/PKwVoFdRdt
 WSZvnOVscgNyVSgD428BXiRimcsFC5cKBbWLwjAQPCOeUd2QmU01oel4eOUDpjYC9QXSOlUftPF
 BjbK2hMzk2/OUqBfZyV6hGUWQODhmzuPPt+AOAAd3WhBPA9hxcFV7LepTVVxtaAycvJZrdGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=915 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290104

On 7/23/25 3:06 PM, Pankaj Patil wrote:
> On 7/23/2025 6:23 PM, Konrad Dybcio wrote:
>> On 7/23/25 2:07 PM, Pankaj Patil wrote:
>>> On 7/23/2025 5:25 PM, Konrad Dybcio wrote:
>>>> On 7/23/25 1:48 PM, Pankaj Patil wrote:
>>>>> On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
>>>>>> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>>>>>>> Add DeviceTree binding for Glymur SoC TLMM block
>>>>>>>
>>>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>>>>> ---
>>>>>> [...]
>>>>>>
>>>>>>> +      function:
>>>>>>> +        description:
>>>>>>> +          Specify the alternative function to be configured for the specified
>>>>>>> +          pins.
>>>>>>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
>>>>>> Any reason for           /\ to be uppercase?
>>>>>>
>>>>>> Konrad
>>>>>>
>>>>> glymur_functions enum members fetched from ipcat,
>>>>> this does not exist for sm8750.
>>>> I'll repeat my question
>>>>
>>>> Konrad
>>> It's in uppercase because of the way it's in the driver,
>>> I'll update only the bindings to lowercase and repost.
>> No, the driver must obey to bindings. That's what they're for.
>>
>> This value is only used between the OS and DT, so it doesn't matter if
>> the docs refer to it in uppercase, so long as you keep both in sync.
>>
>> Konrad
> Okay,
> Yes both driver and bindings are in sync.

Please make then synchronously lowercase then :)

Konrad

