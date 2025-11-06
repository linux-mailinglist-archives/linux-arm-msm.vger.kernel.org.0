Return-Path: <linux-arm-msm+bounces-80517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F288C39264
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 06:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCB3E3B353F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 05:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4812D5957;
	Thu,  6 Nov 2025 05:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WY5U3PG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcAoRb7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C824A058
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762406424; cv=none; b=Lj3cTgYzpknqfrFd3IXAydWI9h73xqRqQDRgw9MO312wKI/a0X2t0M77mQA052tTO0+p54/F5q8r2fSqc7UfgzVE2NIAVD5NDd6I2l7vI/4ldUXoL5r/XVKdQQaQcijRGelzhnWyzGeaQNEoxcYZRAiZGL4L6JxrpRy0196Q80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762406424; c=relaxed/simple;
	bh=PCRT/VnjscuohG3qd1r/9oEnwYE+hozkOIujPshDmnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap4aGwtIknOKyTY17gcPD4+v3Bhj5CyAjrgXXVWfGWAio4xNSbMM+6of0UvTjxe/nHwNWjtYjZ7a/dbTUqK73u4BxeUcCc/Kr5zz2PRtlBkUpcKCS0leavO3kpUrN6Y4dzDQNmkHvjE5EX51y0z7pswFJXn4D6xOb/HGzpT9sco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WY5U3PG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcAoRb7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KF5jE1688977
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 05:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbncP33QuByCSLGI1byB0rZspAPVjU3fy2uppZLE2jY=; b=WY5U3PG4eUJLipRu
	BebhURNIeJ9CDJWrOCxeTHjrsPo5v3vVvjZ5rTe62ecmyJEkBvPfDPSnpDJYWLY3
	LtD8YTOqv3vzjXA82IizMEH/BAZXyh9ubpV41rpDKnOv9tbFUaLShk5O0rpAtRvR
	8aREZj1pZblM5WYszuAAj7vxoXGSOOoxc47MEptdZZOKj8Lzt8e+9XkdHaRcjoGH
	DYC2UE6tv6BXeraAQQFkXjQG19VkrUcp6eKEaU2TBqJkPP/NfNuzjKb7ODqRvJgj
	gspW0qNK4zE+4u/ghe+kkteBNMB/oG7NLhJyGjwK9LdWmMesN78fthJWs3A4KPeW
	FVkPdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pjabhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 05:20:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34188ba5990so144021a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 21:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762406422; x=1763011222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbncP33QuByCSLGI1byB0rZspAPVjU3fy2uppZLE2jY=;
        b=DcAoRb7UqWV4XTxnjhnwEGrCDSG9Qd+owjHaCXckLXsUJecLOW+X+cKlvsvCwqp1XJ
         seoGwSBwdpmWhlUg3+n2XW/ZeAMG4C4gnk4gq/znECMBKHLdB9kXLripgosn3TuIyCeh
         +tB7nJCxwx/GZFXkVN4sfiujY5a2HKe9twpS0aCPdbJAlcj81lr78Fjpx7FmFcW83DOy
         mIT0IirHaxJaLAjOJ/sBAo93rLqdoeN8vf6+dGwnWcz6b4EsEZO/lZtu9KsCCgh3CVZo
         JGkcG296zeFTJTZa57Y/gN53pAlO60rQwkQpr1+ZTY2aq0UMGTP3x8EiIrDotDdZbdxQ
         msWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762406422; x=1763011222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbncP33QuByCSLGI1byB0rZspAPVjU3fy2uppZLE2jY=;
        b=FOn0SiyqGt14YymoPX6SCYfT3idBYEj32sSaqNiq9krujRjbpxbKr79Fqyh+jkbB36
         pYwrs19UkxrYp7m5j57ZN2btB30LKzoVItXLGpLoSEJSSk8hpzrU5WXhXyt7Xf0yoDMl
         GJ3Z+BqXzD+JZdDWdQ/soT9ICPV/VbmxFJhPEIcAMyaMOy6WMhiwHaFk7qVR8I1izlpu
         nUFNW4jfw6O+If6sFfazJgoutufS8ZvD48LJL+OlzaCEaK4PWYX0HNQMmuDDcT0MS6kP
         jbIqIgGw3oqVhHSUfuObIwKcEosMfVHx2fY2tCu7V98gRBvidzkx+mD/u/vKyHWWfpTo
         V4oA==
X-Gm-Message-State: AOJu0YycrKYr3LIoJRHxK/ZurV0265OGQIZa5IT6FcpTOuCDRaNqKJ4I
	DtWwyzSAEuV8gNef+HNs46abAYLJgzBBqYfoZ4uWwlO8hO5Rt06KOMsDDnLMZEd9DCxpfLlSuRT
	auR+mtvCwdOQyRKSATbOA2YLM8a54ss1mGGkZ+i8F7VdnhqcaFsubYlBaF2XeYW/bXXxS
X-Gm-Gg: ASbGnctJe5v3l1s9Pb9dgaB2UeZ62kaOsyEHlBsOq2WUP1LJ82eL7KgjpZmbacaSXGc
	zosvFnMqiHL4B33W8kDGAvyFcliUNd3e1ald9OylYtrQynzAdftG6+D2EtRU5iewtKPhbW6eGsg
	xf/bs0rMGFIgvufZPEgDCa9hZnMWAFhbhCexBYV5fB2tGOIszymkzQdtT/+TwocaGDEtDcqyy6u
	D6WX8EgWGAN00FoIipjDZJlH6deOhgcsUs82DEqEAYKZZjm/V32MRjK6WkVmQcWDAuvCCMb9EaR
	KInObRPYeDnqdWX6brSWQfT0Zo2oVIqRzosMw4nneoz9Ir15cUSpYA7j7vgMCkSvmri1OWXtzdE
	9+GEPANAm1kvNPgIXlwfpjcNcjrZsesczVMQtJ4GZnbb9hWVcVGnoVHyab37XZKTX
X-Received: by 2002:a17:90b:4a0e:b0:33b:b453:c900 with SMTP id 98e67ed59e1d1-341a6dc3ef0mr7716773a91.19.1762406421334;
        Wed, 05 Nov 2025 21:20:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA8v7A+ayync/726jkKTD5KYJxkRhenVh6tscIPPHnasEdHKYvxouPnrmMzhPLa+hczUysXQ==
X-Received: by 2002:a17:90b:4a0e:b0:33b:b453:c900 with SMTP id 98e67ed59e1d1-341a6dc3ef0mr7716756a91.19.1762406420807;
        Wed, 05 Nov 2025 21:20:20 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d1347db0sm535859a91.4.2025.11.05.21.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 21:20:19 -0800 (PST)
Message-ID: <cfc7871a-73b0-43ca-bdf0-bcb8b5f17396@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 13:20:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] coresight: add static TPDM support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rV34DwQXTLdV0IruBAZFSRlrqdNqc_TY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0MCBTYWx0ZWRfX7/iMhzf1LGub
 0DlttYkLlvhAZTnBY+5c/tUFkPBeJWmZIUyRJhJGRNrxoKxaVwwhrmNS+uQFbKrRyjSN6oevlaX
 eajmwlGFXlha7BBIZ/JEKwzrOJ6LjTDDGHE9CW/Of15Q6kK9t2E6LfILUzdadROAM5K53+4wKD/
 YPteqGaF9ae2EAEwOXeM0yVx3ctlF4hhvSIhgCGNE0jI1gOg0DPfSqdgIB+1FK89zjFOEijBygU
 hWGl4+qN2AaMIYwVB8i+c2TYksdfCobTfnDbYy/iZ9FC5Gp0YpjP0AieO1LogZL88e0VMilBpJR
 Gyg0Z9wG0XE94B2Vx9/7NoUoMT62S8/XuTeFl9fNqfRjs/AHra9rpgFf0YPIrog7/G3uZUPjYQE
 oEy2xqab4Ah2KgLCvdUL4KcuVds2ng==
X-Proofpoint-ORIG-GUID: rV34DwQXTLdV0IruBAZFSRlrqdNqc_TY
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690c3016 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=43WlQIeRwcEhdZomQpkA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060040



On 10/28/2025 6:11 PM, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> Meanwhile, a function has been introduced to determine whether the
> current csdev is a static TPDM. This check enables the TPDA device
> to correctly read the element size and activate its port accordingly.
> Otherwise the TPDA cannot receive the trace data from the TPDM device.
> 

Gentle reminder.

> Changes in V4:
> 1. decouple from tpda driver code.
> 2. Introduce a new solution to identify static TPDM.
> Link to V3 - https://lore.kernel.org/all/20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com/
> 
> Changes in V3:
> 1. rebased on next-20251010
> Link to V2 - https://lore.kernel.org/all/20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Remove the dependency.
> 2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
> Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (3):
>        dt-bindings: arm: document the static TPDM compatible
>        coresight: tpdm: add static tpdm support
>        arm64: dts: qcom: lemans: enable static TPDM
> 
>   .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 ++-
>   arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c       |   7 -
>   drivers/hwtracing/coresight/coresight-tpdm.c       | 174 +++++++++++++++++----
>   drivers/hwtracing/coresight/coresight-tpdm.h       |  12 ++
>   5 files changed, 279 insertions(+), 42 deletions(-)
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-add_static_tpdm_support-1f62477857e2
> 
> Best regards,


