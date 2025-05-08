Return-Path: <linux-arm-msm+bounces-57298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD39AB01B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 19:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 649A03AEA69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 17:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BF727470;
	Thu,  8 May 2025 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEL7x8tp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241D278E6D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726434; cv=none; b=S4GAL/Wvyvo6KeVL3IJETQImlBb0yRYJ/d3K4muDyGXMz3szga+q2udy5Wkuo0KosSwNunCmp96uSmLrGAIO7H7URgcIxj7KUsYQF8E+L7Lt8DhU2Lmiy5IzHPkoxuIKa7l47n8OHPxufOaMlq4bhMIRdrKFop6EPnuIuJwYW60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726434; c=relaxed/simple;
	bh=CnTmOWW0avGJ6C/4/XZnLnyUkGJhjTDMBIMrJHJr3F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LniO/VaX0pHS2cDQSf6wLXJpOrklPtKRix+y/dQidqfEAmBGB4Nj8KVgsllP/+89ECpm2qN0rO4qSVnuA2HTAJW0TvNlm+h/TvAXMVx8uvn2GVXMFMHsiWvZ+f3qaRWqR5g3I81nXUS8J1orAWkZMANRkGTuc5nHgfzOwMIose8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEL7x8tp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DiZPo031336
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 17:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xaLf4GClFtgPLfJkjDTotRAbPu1o0/zG7o/KB9SvqY=; b=mEL7x8tpiT4BDFp5
	N9N68JESPqJMOYiqDg7gP8tWwBCprdxxpw4ot+Cx5FKLRweiB7p7OL+16REj4qEe
	Iv5EQebFGHM3PGpbPcjGOzC0RXbGGx5P6RJbTRKu6bMDRjL4KVf20T6Q9IzeXpod
	YEEK3J31wBhHXFyZvgMqqVHQYENlVyX/Ui3/l+GsZwVWBEfp40N2MxisviQoSO+G
	G932TR7gTGFkf/9iWTZAXGSGo9DA70hibQkY75wuQ08+F1DdPzSQJYRiutajAAbA
	I5GsqnIZaDzVqAM+GpZg2gGQgH8flWyXu4T5+U0avVvdcanb0xJThau7cmthufxo
	krV+gw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgj4e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 17:47:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476695e930bso2765331cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726430; x=1747331230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xaLf4GClFtgPLfJkjDTotRAbPu1o0/zG7o/KB9SvqY=;
        b=Fv/xxOzpQn7r20M5XLjLsDtTuM15osijXaD/5aDcdxePfvaetfLIG2jYUDJDk4VUYe
         RyfjGjeevo/KHlXlO1wAzXNEG3Mu9Z9njAg9oUOVu/eHnAnJeVnSkBgGzCMIvqUlnDbr
         ek7/Y/hixtlT4EvWbDJSEPgv7U9EdcZc0pAaQ74VpQWj5qtZdONiypxVAYINBfVj69iQ
         Y/MmuoERRtPekG4nyMShwFoA0NhgRnBUSNUzy2NDRYZIfDRf3eumaosZGTWrC/dSYcis
         3OEO58WIlAf3UB1NeogjWCOn8sq3BRxF35PUDOhUW/5YM6K8fxH8LmoqWhCJfUfw1dZE
         fmhg==
X-Forwarded-Encrypted: i=1; AJvYcCXyM+Wu+1TI/Ti1NVjX2CDjL6ACpQ8MojJ+9XB3LWFgEcjX1/LTeK6A+mi2g3wMhVqdgC9n7Kvl5L4FjpNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzBb2vuDc1/lRXzvCXMzqJtLYaroAh0I98j+df3ji8hnQSjzGdP
	pW0J/bgVTy51C8gLOjU4SJhWTuwlsOcvvQfJ9XF7+dvqk3YBywfNE4pr0Ft4iaaGYWUzz+CwZJm
	FVkoSzt7SwPvMgKMf5rRfpMcVBgUewXaH/3vsjWjWStwIEnCEywgpUh9lnStj4Hes
X-Gm-Gg: ASbGncv5m9imNBnRx7jzkMmQ09e8yEgMraENyTc+XyouHQdH+JvPaxmafoUQgXJNuw+
	D99cFbPHkJv1axLg1JKx2PsuSGwArySbi7m+4wwYjW7MuGRZoSxd7U+oB8aBfUfOgAAUPAv6CQX
	8aQKhQOaW76IeEY1ACsmEtoI0WtJw3QgX0yWW14pm0ilnRfjlyHaDuKDP65cs4fI/QcKYVM4DDn
	zMI2+8LdiTAa6XRz4hdeFhI9QXgz4UwMXJRW66rOIfTOkLqACrwXnKplOjOVwJLoUmDW/S8K3B0
	T2mmB+6jjDCRz7DhhwdLJkkkX5u83UX2qoiyKhrzTY6QNQX3mq/OtmjzLJRu+pfjCp0=
X-Received: by 2002:a05:622a:650:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-4945275b3f9mr1708651cf.7.1746726430464;
        Thu, 08 May 2025 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvhGykg3X8x9Q0Y2p1gf5EMP1KF+odq0oA0O4J05qY7nf0M9TJMJFEshlbuvl4ZscKtgIAKQ==
X-Received: by 2002:a05:622a:650:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-4945275b3f9mr1708421cf.7.1746726430099;
        Thu, 08 May 2025 10:47:10 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm17804466b.141.2025.05.08.10.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:47:09 -0700 (PDT)
Message-ID: <703fc6bf-5816-4d11-96c3-487f9921f346@oss.qualcomm.com>
Date: Thu, 8 May 2025 19:47:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
 <7bd9fd43-7159-48a2-bf0a-712de9cb2bc0@oss.qualcomm.com>
 <4d922876-d78c-47f0-a467-a01d9754fb2d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d922876-d78c-47f0-a467-a01d9754fb2d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681cee1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=geHZUW-4pJ_eHiBijMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE1NyBTYWx0ZWRfX5+EZOPbIwG0w
 8sYP0i4hbW7daKMOwcfszyla0ZZOCJNQqzvlkwzYOSjgWj2ohajpgKifDFHLhVlEWS7psQsCKQM
 8SeUrTC5e0D8D0f+MrRf9Hif19lK3lMfkUHW4msIqfBgWV7Ls8s585mjDz+u3LSaLuyES1Hf9/g
 mjos+P4dcD0DLxUDyEu/Z+vdR51/5reYViTNpQgcBRaNEzAFO7J6AK0LiqoOJYGayIORUmm+4SO
 2sHHtHb5JyxskkM05QU95MxjqwSjys/7XULmjgq+H9spSlOuZ+4bLwVMyvRRKMNrH9wbtjIPlHS
 BWUn2eWzsYZRreFPwr5XNAQA7lhhL013cnQPHY5vLTeWgGMbWLke9bYzEtAAkpXYLoqxbisV6K2
 3zNC3ECZMN8Cot67N21GsEKVMDbvZYk6Q2uM7hhPMh0iqazXsxKcj4U9+wi5CXKktVjikv/U
X-Proofpoint-GUID: RZe2jvAai53xsGYDljtdPjQlC7Kwutay
X-Proofpoint-ORIG-GUID: RZe2jvAai53xsGYDljtdPjQlC7Kwutay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080157

On 5/8/25 6:31 PM, Prasad Kumpatla wrote:
> 
> 
> On 4/29/2025 4:21 PM, Konrad Dybcio wrote:
>> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>
>>> Add WSA LPASS macro Codec along with SoundWire controller.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> ---

[...]

>>> +        swr2: soundwire@3250000 {
>>> +            compatible = "qcom,soundwire-v1.6.0";
>>> +            reg = <0x0 0x03250000 0x0 0x2000>;
>>> +
>>> +            interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks = <&lpass_wsa_macro>;
>>> +            clock-names = "iface";
>>> +
>>> +            resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
>>> +            reset-names = "swr_audio_cgcr";
>>> +
>>> +            qcom,din-ports = <2>;
>>
>> The computer tells me it should be 3
> For swr2 - soundwire version-V1.6.0 contains din-ports as 2 only. Please refer below link
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/arch/arm64/boot/dts/qcom/sc8280xp.dtsi#n2931

I'm referring to what I've seen in the internal data as parameters,
please doublecheck

Konrad

