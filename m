Return-Path: <linux-arm-msm+bounces-76376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBBBBC493B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5D464E07E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE541C5D7D;
	Wed,  8 Oct 2025 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQOFmVmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA12C3259
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923360; cv=none; b=mg8KKZGJTIYlwT+QzkR2yE0Ogbh70lX/djKCD2VaPqXNVfuxAQNEWtaDRkOaRM9Ub9IslIlw30SueVfpJEM4qy6cB9tdXrveV8ybuj6w3vGZqfvzAbIMf3+bIX9G9naT5C7HY27F9Q0XuQGtpJ8xjcOWUnYFXgYPxFzns9yezLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923360; c=relaxed/simple;
	bh=5Y1g8IlsAUsUyZg4rL9NNl2CE/y+DiX7jrFayofh7Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTKX1dfvCdQVgNmfN9mrlWoQBDBSHh4V/on26ZDGiMfsxSH+YQ3Ikp+cDCL95tkP8UkIN1YX0ngXe7fZcW6GHjaE393vUwsbzzaw9j4H+eC5A9X/aRo8UQFQgUGcQa4eIDF2zxT2gT3JOkGFZU5TWoS3FIEz0ycsqtKDS57kKHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQOFmVmO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Urn012201
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UcxtLcFi/NHIwxXXVTKMaEEjGDe7tRYGlHaZ/t/nCmw=; b=pQOFmVmO4VUYyJUR
	WsJp1Alph3OVUyni6JKCB8fp03H/V6aPEbFeV7wwvucNFgmZYHRXgg3qM8DaCZ+g
	Iw9dqWVVJz7Ea5BUNina3v7Cmc8/wupTeEJU2d9SpJ4AWcyrgSpn6LNzLx9x0QYY
	BhPtQTEfy3Z+pkxhLt03iZIWi2bMfsqZsVYeHb/C+Kr1i4zfZd1LMrBSZ2bzinLy
	ugIFRORtuZ2Ylct0NjedOlXc04Z/qccVTwkysrSOwgRfbfYxkJSw5OpK6Vzm6CN3
	cx54w1U+gU0o3ZgxL5gXGCQys3tlN1Yk6V7wWZekmEBn9dTsKgYzUgZZy2jlJzKy
	sWVwoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpw3n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:35:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-819d2492a75so339406385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759923357; x=1760528157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcxtLcFi/NHIwxXXVTKMaEEjGDe7tRYGlHaZ/t/nCmw=;
        b=bmlbScn8q97ca3jMfdqIvtsq7VAnrCbGT63K8HHVGGwGkYogzsiLfFH80ZAg3xCjjc
         iX5GmaA4nFif/Tqapc9kE6kUU68YJjkYD0ti/61c8szue0Ed1i7y93kxFj1A79jBU7ge
         lN1m8dr7JIaxTHgl+1HXDEAkqnGwtFGOpUXOeotSDyee4CUQnLncl58AZjvU7aNbNty3
         TOBQXTsQhDogCVy5MJizDvHel35oKC6kXQO2lY0Ma+1NMmtkYtKv5P/bzuxZDA8x8xt5
         oI0aPjhtXjQdR/goSlNf0tJM7es9wqLm4owRgpicWbZCi65bAOiy4hU7qFprRbNiMPV1
         b4DA==
X-Forwarded-Encrypted: i=1; AJvYcCUS95EIcqot89HyFO2zjOSYndyqFTf3Rgylmzk3hhhCL9viGHdmV/i0Fp8x4ii9LooLWhiEN10XzbaPwUE6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5JuLUeKTK0Oh+W/AO5tPEyNd7jBL3PC60xIP9b9oRv1+WZgT
	e3uhhM6DFicsUHczYJq97WY5dJbp+W8eFdsBAnbASkpel5+XnaZwyo1Wo49HdJ5x1kVlfEGm0rJ
	eVtN0namXu5sonuEg0DN9EAG6ufFI714m4p8wbEjGOOj79c7COYrDUV4zHFhCKzuk3yfR
X-Gm-Gg: ASbGncvjJmIBabYLCMyldZhfYz4oyyxFYtRzF5t4gyAwAhnneY3VV7PHy9Vg7vu05sh
	kWAQcY5plAuYfQkhdAzsQTArccFpRDktOygyNrAKxyQaAavAD0S+l5Bjo+nE3T1BJ4p84ZriViE
	iUEZSFDU3i+oXVm8LtQ0uidHaAd89TsUn/dq6RHUiDHt/gI7C+BbhNAYQyVa+Z/InSXo6AWEbBy
	5I+odlovoWBg3TAgQ+YqSQnwEieJnmB6WnjGbO3EDhW//F+A9jUxZM3S6xyk/JWOeQGGYLpS0ic
	zmg3pamIYXhkzmwKS3cVoLIqsjhTOFyK0crgmEoi1SfsZcLEjHOz8jvkJCk6NxMJbFAqAeU+L/e
	ZgkMYMvOXmBX5JorEXlwtnv2jdCs=
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr273037885a.9.1759923356968;
        Wed, 08 Oct 2025 04:35:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt/p9KWaL1e9SZdVmnvmGbbEbWOxiPEBK7bXd20TZj+ydCuPVXuNpIcjVWSXqwKTr1FFN+RA==
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr273034785a.9.1759923356368;
        Wed, 08 Oct 2025 04:35:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b0c7sm1705829566b.57.2025.10.08.04.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:35:55 -0700 (PDT)
Message-ID: <aa06df81-e594-469a-85ee-9dd1e192e2f4@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dma: qcom: bam_dma: Fix command element mask field
 for BAM v1.6.0+
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20250918094017.3844338-1-quic_mdalam@quicinc.com>
 <20250918094017.3844338-4-quic_mdalam@quicinc.com>
 <c5d5c026-3240-4828-b9b3-455f057fb041@oss.qualcomm.com>
 <2394e63f-1df7-764e-5489-3567065707a1@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2394e63f-1df7-764e-5489-3567065707a1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vxqk_My5TJoimwasXyrEBm7bNmNdta6A
X-Proofpoint-ORIG-GUID: vxqk_My5TJoimwasXyrEBm7bNmNdta6A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXyUFONQ9FaH5f
 G2XkltrXUIuoysWAxWVpct9QlUjw93wQ05RrIBz3hbEz2Ni5GO2RL6ntq48T0kvWd4/4gDwKrJ3
 ZbG2YShD68p9J8xPXc+Oiv2VW2Op99WcjwHtoVS/yGvMApenYWtE/F5lPCbW7L/XoFY+rsOfhJW
 JotVG2tM2wpSmQueXV/u2ovj66p/Bu6AMS5NdLhOC5RKXcWyMgUcjx5grg1KOUEIOeS5n7qoQIR
 1QTbUJZmElu0pUZBkWuoCCAVfgmhHg2OZVaC0iHaPOk0n/FeW3ysJFyRsR+O+aA3rcTfGUZ/6uB
 /Bowtx9LIoE9nl4JXY6ejWXXodwvhjPKq1GzsC/BcyvhgZalVAcK27s6vchFpBYbV8v4z+mmoUK
 4mod6qJmqgt//puDYl6JtCa+7LttsQ==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e64c9e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=W9ArKkagtRzJc8iw_qMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 9/19/25 7:56 AM, Md Sadre Alam wrote:
> 
> 
> On 9/18/2025 3:57 PM, Konrad Dybcio wrote:
>> On 9/18/25 11:40 AM, Md Sadre Alam wrote:
>>> BAM version 1.6.0 and later changed the behavior of the mask field in
>>> command elements for read operations. In newer BAM versions, the mask
>>> field for read commands contains the upper 4 bits of the destination
>>> address to support 36-bit addressing, while for write commands it
>>> continues to function as a traditional write mask.
>>
>> So the hardware can read from higher addresses but not write to them?
> No,
> Write Operations: Can target any 32-bit address in the peripheral address space (up to 4GB)
> 
> Read Operations: Can read from any 32-bit peripheral address and
> place the data into 36-bit memory addresses (up to 64GB) starting
> from BAM v1.6.0

OK I misread your commit message

[...]

> For Read Commands:
> - BAM < v1.6.0: 3rd Dword completely ignored by hardware
> - BAM >= v1.6.0: 3rd Dword[3:0] contains upper 4 bits of destination
> address

This is important to point out. With that, the change looks sane indeed

Konrad

