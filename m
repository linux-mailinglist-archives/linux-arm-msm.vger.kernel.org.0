Return-Path: <linux-arm-msm+bounces-64541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB449B0196D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5E73AC73F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F66A280027;
	Fri, 11 Jul 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afLMHyl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328A27FB0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228680; cv=none; b=AV/Qo7oVi/C+3qTmM15PGM8tKy5H4dYtkIsxwJTPoA2kV2DeOob2+ty/zhxn1l6w+5Gn4b6RDwpg023sgyhp5+JsRbhPdsFl20VIpsgUMdQEBCc1i+HF4uZQ1Xogg4rktGgx35q8Yp1yZU1/U6BPpybKUIz3kQx6uoTl6ZJgQ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228680; c=relaxed/simple;
	bh=wBu2kuicSP07Hyt6dvhkX9kDy7X6ECDDeaxMMhiwL3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHJZa0r0CrjYTQN0IeqcdM01EBQIqlDBonmcSuq8zbGQfok/Vstsp3ruz7hqRV4e0FmjdVndM8gJMjSSTABBPbmvrs3+qCXol9+UBNDrfE1hdP/i0uLBXLaic5hNT//k9OK+qajE7BCh7sKFXsL6SocBGvTujcE++srJNb+qc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afLMHyl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X6h6016277
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1bizVoZMRBk4iRzzp5t9dmlYcMmYl8Jc6R1Yyti/9Fs=; b=afLMHyl22C7wf6hi
	WvEgP/otA55jZsJkja05AtLYcx/p5lu/MFAQmRPLODPfhtF+K4f/GdgkBFp4dTnA
	epo0Oq0m/OPERWkK1tva9D0kWqcL+2IG3Nz+yC+99mGqAUbshmHM7aZLhRMFhUg2
	B/2zqVa6vGN/Gg0FHCBuBdimer0VEqEbqXdhBTjkQ5UTXwny+7YUY/KXQv1bGW23
	+JQQ/FCts/Y3iK0PVPH5oTKKXsWdmxWPvu/2finOudIhPnZpnQljMCVCFVHaH/Tq
	g4lhfn7nbEWiU7ccUqM8IUnSyrateYk90hgiHVX0c/cW2E2yPhsw03vatj5O/sgS
	OKDuVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u4gnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:11:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-702ad4ec207so3819286d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228676; x=1752833476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bizVoZMRBk4iRzzp5t9dmlYcMmYl8Jc6R1Yyti/9Fs=;
        b=EPArQXJWHKlZvtZ5Vo076JfQnvu1Ju+iaTb5ee7lSyDc+I2sPc6KI2Z6YsCtG3KHlJ
         BqjJTzHTck3ivM1P66CPfl4DIRIbv2XZYCZuOcugSY2B30le8HTQnVoKKJUn7tnU8Ol0
         FsjslrJaJ7Y+01ndP5aJ7H4bAw5k0sl3BmYv1Mbv71jZiCgI41M5iXw3H8ghZTCICycH
         qGiouQjcd81jbN9MhtDTZnurCwgLqcF8girQjZOL1zGtDVtZ0qE1Mb0MQNWE2x2BP9Ab
         jBlOT3sG0Wyrgxtq85qgdF0R+72SgP2BYnXZYCjus09gWolFXXf00b5iacQLOacPShk5
         Ypxg==
X-Forwarded-Encrypted: i=1; AJvYcCVOZsoKBLye+MpZlcQc41iwQTXrB8gaaVODf32ZGfcTpyN8flW766vrxhx18J4MWwL9jGWfcu2PRod4cZw5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyip/X1TDEJjH36GeQ2jcrFLXV93kEo0HoApgVcXw/YnMMf/pJ
	xbju4I5lI4UPvAENuw8gjIXeXmJdyNOnTSve9RNXvrsJoyh8Wa/QLwwktBLlpTx9ZE0IUAvfc2k
	OYUkqwUJpFqfusR+4PT4+YYVeg0w7IgVtGf6ymxaWiRtihgZfuLENubJAqWnLrdMnZSOb
X-Gm-Gg: ASbGncu30T7Tl+ERlZBAjtIQEWxyk39v1Sf24Q+gJuhlrKfJ8krKQiHHApnzgHwcBR+
	aFq5kXx6SYoAyCINdXjevQjx9wXYNRffzgA8qCI6ds8pAItQHjW//5vmWADLHi+JElHCd14WoCp
	qenpW2P6FbfaBDX+Z79QEcy5YnwIecirGGGe4DVxVd0oX7IO2w4FS2FO3Z8YZY6aYii5f2Ny7b0
	fhvu03P4W+lRG9/DfTiAO2uu0uWACPxT4clR3e8/gGbJ6vB9vk3AdEEh23Em8tuudVCwEQiWtk1
	FJ9vjG4iN4G/N4fF7J5oU7EIBmIja/QXQvbOQx8sgprXbIWmF3S+c5XXa6ZM/C4dbMxDlMSmJ8w
	vQ6FCn9ZpLhBY66bFu8Au
X-Received: by 2002:a05:622a:4815:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4aa35e97ad9mr11950291cf.10.1752228676333;
        Fri, 11 Jul 2025 03:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+yFGrRyih5NM5B6WfEaKNkJoTbFkt+BimwHv7L8hV/2ji1McRuQtC7efF6UfATIdIB1yjOQ==
X-Received: by 2002:a05:622a:4815:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4aa35e97ad9mr11950071cf.10.1752228675710;
        Fri, 11 Jul 2025 03:11:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611ed4c1830sm602759a12.69.2025.07.11.03.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:11:15 -0700 (PDT)
Message-ID: <7335064d-60ee-4045-a119-082daf89464f@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:11:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
 <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
 <aae21139-a4cd-4c5d-8147-56c2352ae195@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aae21139-a4cd-4c5d-8147-56c2352ae195@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8SU7XyfJ9TfJNjRFWHftNwBK9f8alhvY
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=6870e345 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8
 a=tkMjx__ORyt4N1e9db8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MiBTYWx0ZWRfX57C1or3JOsLJ
 /RaYXQhfFaFsaMcMp4GIFgkU0VTL/y9sLCUX0AaRDBNknWDF6qxWgdpyt7khDFh8Zg7zX1sUkg1
 WEqhhjo4bvjmwXp8ZSo9i2x8aA/cdq2CBct+hk4VuXw8J7OdJu5igcQIR85AMZyc5aDXmkQ5T+Y
 JJK77ck8VGMjca9bWiEBe4dUPgrEQvcojiL9JFbVysgg444PgF79OSpCgS22jHetlQisbhZ6Lkj
 93wSYLoNfLn2NC0QA31zGkSgrH8qwr4c5hCOnJbpkLPiRtdJJdcr3CUGuI6zdTEJHAlb4/GvGBs
 hUD8EUvssIrSHvyul9KXpkDX0h9B48yamx+BDF+E8KvjjFNh1Ekjk06CPMif1RMfqCh6OySfl33
 Wxi3eUwK4Xpf5qDBTcU8Ye4CoLiUmU+8cEr67z07mb15SGjekS8RYRXZQzETT/fQArlQrjxl
X-Proofpoint-GUID: 8SU7XyfJ9TfJNjRFWHftNwBK9f8alhvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110072

On 7/10/25 1:03 PM, Jinlong Mao wrote:
> 
> 
> On 2025/4/25 4:30, Konrad Dybcio wrote:
>> On 4/24/25 1:58 PM, Mao Jinlong wrote:
>>> Add new coresight-qmi.yaml file describing the bindings required
>>> to define qmi node in the device trees.
>>>
>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>> ---
>>
>> Is the service-id hardcoded/well-known? If so, we can drop
>> this devicetree node and create a new platform device (& probe the
>> related driver) based on the presence of qcom,qmi-id that you add
>> in patch 3
>>
>> Konrad
> 
> service-id is not hardcoded. Different qmi connections will have
> different service ids.

FWIW the OSS qrtr-lookup utility only lists the one you included in
the example.. I'm not saying this list is exhaustive, but I'd like
you to provide a counter-example.

https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L71

Konrad

