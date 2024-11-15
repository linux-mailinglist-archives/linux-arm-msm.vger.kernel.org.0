Return-Path: <linux-arm-msm+bounces-37981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9773E9CDB96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 207DB1F22819
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 09:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BD018FDB9;
	Fri, 15 Nov 2024 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUi41dl3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD118F2DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731662993; cv=none; b=jpKX97orbpbmfxW5R2RM4KI8m35+iSzm0wJyPgjs0+sxnEtrNwkbCEQthg+4SZ5KuVsvYq+m11k0a4N7kCMcnxR7CLsqnxJdBFfPtIFB0xoMHsaCVbHYi23Kb8/8n886myWfXPsZNvFj+Qyy5lUi/vBynONTvgZtgKvxoqqPTBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731662993; c=relaxed/simple;
	bh=G0zu/kxNxKcQtvKr/SX+SGJGenykagdf3bB7R8ypZfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eg96EF1ycyZA6w3W9A2tJo9qZVtAdSeDTfAFz87TvFG/oBT2zbKVP++/Fpyvv4RRl52mwM7wp7zu2X693r6hk/SvQIoLwWmOVhjrWQhjH1J+G/ndTXfl5JOE0ciQF7uWW0AQuE/BWKM5tzsGxmzJRqf6R2VqJ8SDg9iP0p5Xy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUi41dl3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF1hoQk017586
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 09:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRHknoPsbe6evKngpi5ETRwDISaYc4zV2stJIhrntjA=; b=pUi41dl3jqmaJKhe
	43DYdcPjjN1CgQkiamqK+pLIzqh0w28DV4/tmzBplW5Xp9GxBMEk8X8RYD4vfe1x
	PkBrv2FcP63HjjzIChgxWKlM0lD9RamzB4Bn9BbUEzMFapMEORrChZd5wCdZGvtf
	3Z2cvvnY2KF+jH/Azr6hGT/v1gW2qEOveOJ1QXk4ds5kJdPZLkxuGAEWRG/6MzXw
	dRFalRvWTLDU8HxNHwW1YI9pdq4nMkO44u9mcsD/u4P3PpUlvi2wmu11cc/6niIm
	RQoWB8c6NVGU4TAFfjKHSTE43IbQTuD/3gBcQtw6AKIRdyLvbcjFZt60HZ46nRYY
	0gAY9A==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wvw2h6t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 09:29:49 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83ab645ca84so28092839f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 01:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731662989; x=1732267789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRHknoPsbe6evKngpi5ETRwDISaYc4zV2stJIhrntjA=;
        b=Qd/UhCyiHDWPhlW72dPXa6IoTmxZeW7Rw0JHJGSlu7BzjstEMyBim+JoGXHiDXPLeo
         sPTNpxtD6jyVOpfbOPo6l4SXIS+B7oYtQrr9UuyRFMKjGtZTqqzYCOA9TM67a8CDSPl3
         lGN9xlw1NKY6YhzlZc0UD0fL64aDfcCrmqkk3OIaNTsHWRTHJFiLQmML+qgeCE4TRveh
         K3/2jCWzTNGurQzKt6NyHYl2jcxFZopYaizSAZk4mr1LRwL4E3T5Yyp+zMJChFgAErVo
         YdxCcz2l2KwnbIjJBcGVKkLXtyBmYDQ4l/KJbNC5VXr30B9AR1UBwQ4SCCIDdmImlORL
         LJMA==
X-Forwarded-Encrypted: i=1; AJvYcCXPyGa3EyJHAeXMEgWnVdcfuAVFRZzsnd29v11WxmA/B4CChBaLVIDfhNYv1k9BrkcBa1lUonbQVLCgGdSv@vger.kernel.org
X-Gm-Message-State: AOJu0YzU6eL6dFlWIVvRu4TpxRyhIpnIbnS41E6k9sOOjjpZIf0Zezq+
	iCBjTPhapRN09f81SxZUOi/KZ4OJr8VTm7Ke2VbD9D0VyjncrMsf5/jySyYRqgrNOdMJgIkC3JE
	d4lFEv21eGhczV+WrguAc/1Ps4YsQmA/hjy3dCvrXZVu0YNmhBl7Ydq2rS/V6IrBF
X-Received: by 2002:a05:6602:1684:b0:83a:abd1:6af2 with SMTP id ca18e2360f4ac-83e6c17c54emr62128439f.3.1731662988849;
        Fri, 15 Nov 2024 01:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH29I4bw5bnOpuIKz+9weVZfbmKQVczvtIhJBNOsApQf7VuhYEIDAZw5lf4xCwR3nEjOv0H9w==
X-Received: by 2002:a05:6602:1684:b0:83a:abd1:6af2 with SMTP id ca18e2360f4ac-83e6c17c54emr62127739f.3.1731662988407;
        Fri, 15 Nov 2024 01:29:48 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd782sm162167066b.129.2024.11.15.01.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 01:29:47 -0800 (PST)
Message-ID: <eb511e4d-d5b2-4bde-8282-eadcd2eba018@oss.qualcomm.com>
Date: Fri, 15 Nov 2024 10:29:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: qcs615: add UFS node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Xin Liu <quic_liuxin@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, quic_jiegan@quicinc.com,
        quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com,
        quic_sayalil@quicinc.com
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
 <20241017042300.872963-4-quic_liuxin@quicinc.com>
 <5fe37609-ed58-4617-bd5f-90edc90f5d8b@oss.qualcomm.com>
 <28069114-9893-486b-a8d8-4c8b9ada1b0c@quicinc.com>
 <20241113092716.h3mabw4bzgc5gcha@thinkpad>
 <c0b3bd36-6ec0-4d7d-9a65-5b8f02cd6c98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c0b3bd36-6ec0-4d7d-9a65-5b8f02cd6c98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IzX2bIRB6E7153X97K7Kd7mC8dvwD4BV
X-Proofpoint-GUID: IzX2bIRB6E7153X97K7Kd7mC8dvwD4BV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=844
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150080

On 14.11.2024 4:20 PM, Konrad Dybcio wrote:
> On 13.11.2024 10:27 AM, Manivannan Sadhasivam wrote:
>> On Wed, Nov 13, 2024 at 05:19:49PM +0800, Xin Liu wrote:
>>>
>>>
>>> 在 2024/10/26 3:24, Konrad Dybcio 写道:
>>>> On 17.10.2024 6:22 AM, Xin Liu wrote:
>>>>> From: Sayali Lokhande <quic_sayalil@quicinc.com>	
>>>>> 	
>>>>> Add the UFS Host Controller node and its PHY for QCS615 SoC.
>>>>>
>>>>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>>>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>>>> ---
> 
> [...]
> 
> 
>>>>> +
>>>>> +			status = "disabled";
>>>>> +		};
>>>>> +
>>>>> +		ufs_mem_phy: phy@1d87000 {
>>>>> +			compatible = "qcom,qcs615-qmp-ufs-phy", "qcom,sm6115-qmp-ufs-phy";
>>>>> +			reg = <0x0 0x01d87000 0x0 0xe00>;
>>>>
>>>> This register region is a bit longer
>>> I just confirmed again, there's no problem here.
> 
> I'd happen to disagree, please make it 0xe10-long

Ignore, I was looking at the wrong SoC. Sorry.

Konrad

