Return-Path: <linux-arm-msm+bounces-67726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD65FB1AD0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC223170265
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 04:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DDC20126A;
	Tue,  5 Aug 2025 04:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eayeg82A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856181E9B3A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 04:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754367080; cv=none; b=TNUA8nvn5CUMMndTnLGyQu/XUus2UvO1vPzynqytksCEqxUbPt2TdLCl/6Nosn3fzPI/s0GRoQaeeNgqWMMHgXL9XIAtveBwbZYCenstkx47o9H+JZHprzLSzbDHCAaZr5mJ4DGpOGDnlXs1XUVZ87KXjwLQsM58yoIn/00zGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754367080; c=relaxed/simple;
	bh=W9Q2+j5V3GLOUyMo5vpmA5W++Yp0vx100jLA0XAUDMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWrgTteikAPOJZNnxQT8gNZQrzjWuut0fVouvdH7HuQgg071fJZM+RvcxixrzWLB/EgtWb/3s3Rs5z27HOscCbih2w3xL+lS6jNtBVTBD1qmg5TkQ3WRraHZJKQm6RA2cKuatgBubwqFYXVv3q0tPAmAc2knTTo2CH816kANnv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eayeg82A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574Gq749013747
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 04:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4kHQ2TM2MYW/R6mLsfnEzPj6Fkc3FKZAGp4pSK5pRZY=; b=eayeg82Aq37cLLGQ
	BLdT1z6L+tJ7UuCQtn9YY4wLXwDJQ32uofVOhjslGd0/H7robygmo8SzBeO3IEif
	t4wdgipGUV1OoHNeV+OIcohrvOxUF8Q4ODbKwYS66ri62WqbpL9ITB8J5mwgLC/R
	vRiZv3UREZ3Jj4vh1rK2KsF6qQXJ1MsL30nNIHyfxoyxIYIbvLsO5C0VgZNix7p8
	K+7+5/TDv+KgRZMUYBIHaEJ8LYK3RJUHhry8vwjT4SKkhQGHI6F4059vevvOCwFi
	aIoCCansChltb5OzRo2Vv2f24eSMqsz0cyGR0/Q27nUMjps0CAec1ZwNUB6r8jiK
	+jMI1Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek73cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 04:11:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76c115731eeso2306441b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 21:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754367077; x=1754971877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kHQ2TM2MYW/R6mLsfnEzPj6Fkc3FKZAGp4pSK5pRZY=;
        b=J7Q1V/0y1CpEoIVgUOJhC797S3iYjvM8j3K5Bl04KUYpV0yRqvi9cv3WuiPHlfZXrZ
         Y6WZCm2rYp2Ki5dHCQ9vXqUzCry2vJEfSd+yoQJJOqcB+ziQ0xwYKsUu5quC4B5Ne/oG
         FWrFZuefFFIMV6DhRk+Bc19Eq3G2cmikV3O5PfxRVU3V7J8i/rz/2F9jih6+85cgT+oL
         jdDItLFp7J/Bw4Q3wmxLsoG6kxWqAXOmMFhtNxizLybbqRPA5RZ5FphA+oLNKZ3tcjhA
         qLBVzHlh55P6BGwGy7ogZvCg4/KpJoe+MXjW192Rf9r5WG9Lb22I81Q0DSNHtsueruGJ
         89zw==
X-Forwarded-Encrypted: i=1; AJvYcCXs0w/HbbwRJ6qUL+bURMm+eockftolsc7VN8FRCbwwtJns2yJF57gObFVythteKH4t5nq/dCtTlpuL+YpB@vger.kernel.org
X-Gm-Message-State: AOJu0YxxboKvnATpKyeMTQvEYmVlPSQVLz9HlmODTYCffxQuBchLLHQp
	12vU48KCpPQRA6YbrFNBDexrqiTGR5Hn4IBbc1+Uf4cbzi3C/lK21cfNJwhIHnv5z1rron089c2
	pTQMvuA/ADrSoPFo4gdGf6HULn0gTZ62NQ+yqHEglYi+RHt/fYkDauXKCY1+eprRJheO+
X-Gm-Gg: ASbGncvGrO8Msdn/+kduPNhH2Vd+bDeoHYMIdY6HRdvMjq0G4/BiY+TG7/liQ11Sb9H
	BUzBDBLFYjkvI5rs3FSTSCnG8kbv99OeXKeYMHzcedrv34x5lZh0m2fmAr9xG0mvNmOCaAOFOGW
	/cDXUFOTpuv0roUSrHVoTEqBMPvBuxFrKKK6tuChPE8jLnKfgZ6AQKIyuqMmvxrMAB+8Y2tCdVI
	fGoLaLIrD9FQFypj9m+ltFy1yKGxlSooxiOTDVG/i9J1MxUdXrp5zx5cJYrWXmTr4YNlrUDB5Gf
	D6i2HIvjexzn2zE812IymnoaL9zVJmWLm/cLUnlyrOSW6MZEbeqdPi8CHF8BKGvefDRSFLjsD2B
	8K+k6tz81rqTi1YQfZ3bMqtsaLtDi4w==
X-Received: by 2002:a05:6a20:3d81:b0:238:351a:6437 with SMTP id adf61e73a8af0-23df9189244mr18263452637.43.1754367076699;
        Mon, 04 Aug 2025 21:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtTAk56CVTseMtlmWU2iTkuQTCHIahoYybtZSWtXQGXXH3Mha4XmAcqOGGI95Im8nvqjAow==
X-Received: by 2002:a05:6a20:3d81:b0:238:351a:6437 with SMTP id adf61e73a8af0-23df9189244mr18263419637.43.1754367076319;
        Mon, 04 Aug 2025 21:11:16 -0700 (PDT)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf067e310sm6747918b3a.25.2025.08.04.21.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 21:11:15 -0700 (PDT)
Message-ID: <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 12:11:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
 <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=68918465 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DOWyofZu-bKnVY_GfnMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAyNyBTYWx0ZWRfX128abOukf6b/
 KTc29gHPk6tF0UzXhHsIlC9xOgWP2UdFkp4WgGi96umDY44sZI5Okj/ShTVnG1m/UCnadlJBTnV
 GIGlVQ2JVpVUtAlus2XPA87nZKXXWDFRNs/PHvtxt7QvBlOcKb5A9CJfabzE3PRrv1uzzARzrbu
 OLeZjb8xA0se/e8b0LzeKGotC+wHJcnM3Pz9+ggP06QIxPeQKzZ4ynqikwqmTrRqoOtUinS87gB
 rU0yLCY8Mq8l2IS+S+ycdlCOLnRpM8yVek7xVAauTAwpjcL43GPp3JI8K1Vf2Dg7JKbjj0R7iyM
 WDTNsWKBy2mXipzOD3e7p7RI9l4IoP3YXstkEkYTmVIaYXyl231dPt/us2EWLLbQbRrM1XXdUW2
 ucSUmJYl5+LWIqwU/iSGO+ozmMziTXhfYsCvZ9jc/ydS8HDpAzycf58VZUWFJWiEIP8Te5hv
X-Proofpoint-ORIG-GUID: jf_ag4nUBXPvfB09ZMFf2SdEfoAGe_-5
X-Proofpoint-GUID: jf_ag4nUBXPvfB09ZMFf2SdEfoAGe_-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050027



On 7/28/2025 9:08 AM, Jie Gan wrote:
> 
> 
> On 7/15/2025 8:41 AM, Jie Gan wrote:
>>
>>
>> On 6/24/2025 5:59 PM, Jie Gan wrote:
>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in 
>>> binding to utilize
>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 
>>> shares same
>>> configurations as SA8775p platform.
>>
>> Gentle ping.
> 
> Gentle ping.

Gentle ping.
Hi Coresight maintainers,

Can you please help to review the patch?

Thanks,
Jie

> 
> Thanks,
> Jie
> 
>>
>> Hi Suzuki, Mike, James, Rob
>>
>> Can you plz help to review the patch from Coresight view?
>>
>> Thanks,
>> Jie
>>
>>>
>>> Changes in V2:
>>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>>> 2. Add Konrad's Acked-by tag for dt patch.
>>> 3. Rebased on tag next-20250623.
>>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Jie Gan (2):
>>>    dt-bindings: arm: add CTCU device for QCS8300
>>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>>
>>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>>   2 files changed, 160 insertions(+), 2 deletions(-)
>>>
>>
>>
> 


