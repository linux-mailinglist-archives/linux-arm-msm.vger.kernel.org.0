Return-Path: <linux-arm-msm+bounces-65701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59FB0A966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 19:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5774F7B14E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731182E6D3E;
	Fri, 18 Jul 2025 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/yaTaz0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05B2E612D
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859583; cv=none; b=IuNLJ/TPLDFhUl7PNBdKhOtXuyTdwXB4Zeog6nUHtq75zzGkTJ7116hWdd0Li2KugTQ/8ujiE8cCRj4Y9oPf9Hh8ofCO4TyvmmqPrKZOkwKg5SRJijmDmwCkbIualaZU9Te/XokxN6NQoDP/D3bO+XC5EJW4TViGnOdwa6g+Gfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859583; c=relaxed/simple;
	bh=A0Hft1j6L216tZxWQlcBGOLV5bZ4wJTunGM4c9VS3mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeoNvbdUymKvU5hokDfvSMT4ErTCKrSN3iK3AqpgGyk/vRb3ZooN4O9bT7WmWwtYjDsSzZCoAI/fhxuDF9/OTuJrpmjvZFV2xF6PTAd0O3t7wqUy02sF3tgXrG8OfpA3LEZo+utsq9xYm6or1UY1E3zfvNrFDTQpjMAVEMqqFQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/yaTaz0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IF1Rmh022444
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GduJ5YbGzanNXFF24/hf0EZK6UZ8V5SkZA+qLy9SUOU=; b=E/yaTaz0qmZcflgQ
	ctre4pLpfFrslHbuc7XQoHQTgHl0YNlN+IidqMkkjdpQuguWXzzE/pVa+OzPQJMU
	hYkqsYm/hZFRo15mndzXQsmVc7hdCmPVb4kgIJQFIkE3s3J7mbAyvmb/Y+HS51UY
	HnJNAV0b7q3NUlRljd6AX5NCN+14QnoWKzHHLXqlq0gViykiGAZ0TH+SGl1JUR4A
	bWx7b79CHFfXYWYozKj6PHJMrrCn0ObVKzvA/cGCYxcUwwD2TG98QdfBnlJLpKie
	W7m7f4nRdVIOuhChZGHhpG888hB6PBnc36y/y9ONTpFQyadreH9nj77l50o+iaGf
	/1Y5dA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsycedp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:26:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23494a515e3so19650945ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859579; x=1753464379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GduJ5YbGzanNXFF24/hf0EZK6UZ8V5SkZA+qLy9SUOU=;
        b=kbSJilRu8LT4J2SzqqCwZ09xHBpxHVQzgyyc3q1wLMRAVNK80/7FlsUswcqvFSjoII
         zoEcvHeZ9IhSBrZmwkF9JnknHJro+zlTgvhH+38+N67A8povShyxUOJcVxRvsCJEAXkq
         Ydo8RoNvSuFEFOVIO2qOxiOe1S0WrlxTNP3XAWLjn4DEZ3kUtKXwmxmhwW5bCHh5TlFO
         EOtAIPM3OtK6+fIjJ32cknf4bXvIQ5E5EPfLie34FYPFFoY5Xpc5ZMGAu8S5ILuCiQxu
         mKd6jPI0Xcmg7/6UOI7jRkjAqPKEuBcxvCyJ4DbL/QwKzoLqGGwkoguJ+5bdTXXBvW1W
         HUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9E4hyQfQdAsQ/PwXJwsLMC9hv21nNyFPmSGPf5R+V86FHEayOZ/GetdbBz+shCjO9F68F485UthC8S6i+@vger.kernel.org
X-Gm-Message-State: AOJu0YyirI2MIEZE7TV6zjnuiXM9NuR384bnRbJPtrCQ5Afa3xlZ4dTz
	AYrV9JJ089UOSosxTlB6FRoyyMFXk+e3TQ7EeEVeNL+Cb1U3D/fU81Wj/gmQ/2p8v+avaEkWrj2
	ZHrj6/MLb04jyYMta5dpnaCEl9pi1+j5BeNjYgZEw6ZsBDr7x24BbaEg/fFK4SU6+M2+N
X-Gm-Gg: ASbGnctcO7TlAuK1QazR79qjLgtvj3MTU5NSxnRTNFPl52e5KSqFQ9dukKsPD4cwDE9
	1Fixh8J2ISNJjpRveSSJJVw1DWm9JblARfTdi6ipPnk4Qk+ops0z7QwXd72GBS1bwfr1CVYkl9C
	3uNIKdZaeWOf0BXLf8q8f2Y8ZXduo6UIDOMtpph8m7aI76BLfGZnnysVrCvBazixSJ1T3VgkWyp
	6TO+9LnCX+i4ViSkWfaO7oJn1i3SMoJWxOVean7PLPAcHiJl6FzoFxYcfb5uUPU0teuT92VjXWR
	ddjzkqQkyiS2Ksj327RtY8NLFN1CgzxYsDbHYsz9nhk3QpZ8eBoK2QpgDGeMtB8japQ=
X-Received: by 2002:a17:902:d60b:b0:235:dd54:bce1 with SMTP id d9443c01a7336-23e24f49451mr169690505ad.15.1752859578715;
        Fri, 18 Jul 2025 10:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiuApPui+DrCZGh1uQCxP+63mJXtxF2yZeaEggDdwLKQBX3di0tn4hyxBqo1Jj6zmyDWaeg==
X-Received: by 2002:a17:902:d60b:b0:235:dd54:bce1 with SMTP id d9443c01a7336-23e24f49451mr169690055ad.15.1752859578204;
        Fri, 18 Jul 2025 10:26:18 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d19acsm16005375ad.144.2025.07.18.10.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:26:17 -0700 (PDT)
Message-ID: <e36a9e5b-f6af-4266-98f0-a82489fa5d72@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 22:56:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org,
        mturquette@baylibre.com, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX/ZbCgEYr0RFo
 MfYgMHv6j6Az1EVOmjbey6d5lJBz5haV/KHbkYMtTmh+ej9w9ebNUgeiWmpkGFdPoYB8TYl0jca
 s7m91TrOZV9hCAM92XExpQcO4V6qXeeCQL2CwtQmLMbZf1sjS9MjLYkCraKruMcBvpEjFqEubzg
 SR6PusMqh+X21VJT1Ldsvn3eURMXTGtf7FWP9bsvU5T5hZ8jHElk9ymBa6iIo3PCZ0EZzor9aka
 sxR004vnWds2LCqsXIBElpBd+rm9XDXz3eyxZelVK2SqpUAPQ2PR4atS3Mtn+gdZPJBgF89pfUw
 h5Lw8yCOWFxWQ+h7WYDnLxWMnJthtnS+O3eBkgazHrS6gXveSCYWselFP+zjiLfMoBnzPJdbLeF
 ctGSgIz0USCflV/rs4fpHhCEQqR5wRujDQ32use/cOf8Bpy8WyVkppZ5hUn1GL7uqaWjrmJl
X-Proofpoint-GUID: KHoBGS07v1RvzzvpzbbtsCDmWobd917H
X-Proofpoint-ORIG-GUID: KHoBGS07v1RvzzvpzbbtsCDmWobd917H
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a83bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=tMiizUMu9hGndvLFPAJAbA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IDfOk1lORozFkaJI5SoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138



On 7/16/2025 9:58 PM, Krzysztof Kozlowski wrote:
> On 16/07/2025 17:20, Pankaj Patil wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Add support for Global clock controller for Glymur platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig      |   10 +
>>  drivers/clk/qcom/Makefile     |    1 +
>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
>>  3 files changed, 8634 insertions(+)
>>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 051301007aa6..1d9e8c6aeaed 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
>>  	  Say Y if you want to support graphics controller devices and
>>  	  functionality such as 3D graphics.
>>  
>> +config SC_GCC_GLYMUR
> 
> G > 7, please order alphanumerically.
> 

Sure, will update.

>> +	tristate "GLYMUR Global Clock Controller"
>> +	select QCOM_GDSC
>> +	depends on COMMON_CLK_QCOM
>> +	depends on ARM64 || COMPILE_TEST
>> +	help
>> +	  Support for the global clock controller on GLYMUR devices.
>> +	  Say Y if you want to use peripheral devices such as UART, SPI,
>> +	  I2C, USB, UFS, SDCC, etc.
>> +
>>  config SC_GCC_7180
>>  	tristate "SC7180 Global Clock Controller"
>>  	select QCOM_GDSC
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index bf95729678f6..cdc3d9ba9024 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -94,6 +94,7 @@ obj-$(CONFIG_SA_GPUCC_8775P) += gpucc-sa8775p.o
>>  obj-$(CONFIG_SA_VIDEOCC_8775P) += videocc-sa8775p.o
>>  obj-$(CONFIG_SAR_GCC_2130P) += gcc-sar2130p.o
>>  obj-$(CONFIG_SAR_GPUCC_2130P) += gpucc-sar2130p.o
>> +obj-$(CONFIG_SC_GCC_GLYMUR) += gcc-glymur.o
> 
> Same here

Will take care.

> 
>>  obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
>>  obj-$(CONFIG_SC_GCC_7280) += gcc-sc7280.o
>>  obj-$(CONFIG_SC_GCC_8180X) += gcc-sc8180x.o
>> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
>> new file mode 100644
>> index 000000000000..a1a6da62ed35
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-glymur.c
>> @@ -0,0 +1,8623 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Missing date.
> 

will add the date.

> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


