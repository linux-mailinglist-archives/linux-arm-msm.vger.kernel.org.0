Return-Path: <linux-arm-msm+bounces-82618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD25C72818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE61C4F117A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 06:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53E92E54D6;
	Thu, 20 Nov 2025 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L6wfkspG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C26DDC5;
	Thu, 20 Nov 2025 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763621644; cv=none; b=tCpJ2YeP6WxcTF7j/LDoPxRa9qFcWQz0NMy4kldaUYlMcGOcrgyxQeuWR3xXa427K6qNnbRGNE9rYRYQJ8NS5GN24jMFrwEMZ51xFdFBwX7kc1mGnWVL+xiEYcDcaOR/AWNM8fjoccCtuSgGznVCYzKhzBo3IIbKwYIDHQFBjyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763621644; c=relaxed/simple;
	bh=hkjij/zX3JVIfSuOza2XqPdgeDk7dxGTXRmAIPoRw58=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H46apZtpbfug5YykTtDNfpFmGJCvyVz6hb27ReFz9ZFcdGHECXkX9UbnHqnQfiRKcdI/JgdWL0Ugns+ryqeM/mX9bdJoqqXUFiTuPWLXsittPFZF32lWvhJWZhc0mZB53t+j5vEHOfFWFE/GKzsklDt+BYdkzdfKB5xg8kZybFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L6wfkspG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4preg4184965;
	Thu, 20 Nov 2025 06:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DO3VvQ4RcRpYRA8So4tEM35B5FUuJpvBr89lRxkmYG4=; b=L6wfkspGu8CWW/3S
	mbMQsMIrJtV9+xEAuvvJI5C71u8TDutJf3JubJfsFpuR0vr9RNjoenMlleKi3ucg
	cgiQjpMPEWmY+EgJ+ED2hUU/XXXFA5ZBubTcezPQHKgQkDXb6YHBfKQ3aVXnIEWt
	Aw1q4Y6YQcfvzXjGca6qYcDJJVtDjoSa1bEe8H5lPN3KMn1uutx+uv+yyn5McsE+
	cVYiQzGoSw9EmQa4RXiiEqwUkna2H8uVZ3gUVQnuEdrp/TJX+IuQftrN/wEWC0Ob
	H4FiohedxJGtLaJu/SI+mpVPQNhyB9ye+thCsOXFuSUzwfAEN93m7rkDajfELx1b
	EN7Q6w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahbt6u9sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 06:53:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK6rvSw006777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 06:53:57 GMT
Received: from [10.218.15.40] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 22:53:52 -0800
Message-ID: <9085099f-8f6a-48c4-8502-8c94a88d8370@quicinc.com>
Date: Thu, 20 Nov 2025 12:23:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <aiqun.yu@oss.qualcomm.com>,
        <tingwei.zhang@oss.qualcomm.com>, <trilok.soni@oss.qualcomm.com>,
        <yijie.yang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y1eKMzj3mTy81BU4dS2Y5OjCm1ViIwMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAzOSBTYWx0ZWRfX3bH0J0iwVyso
 zXGCDvM9+jkPMczNPB5Tr67HNSdEjdK1FuJioSkaPh0obV0DkVejkLl8wQY9rmtzE/KAQnAtG8y
 pk1oAYSm9fmZ/tUMphModCHodIr0Gs7qkZk56FakdeTZztX2mz+eXLCqg+1jIzNbmBE8ahb9sjH
 wjpLms5lWxhwSZmEW4YyPKqaoPbVjXuhUfiZRB+e3SvKXnbCvX2Mk8GG/lZHqw1KvuBS2RlS9CP
 oXPZRGNtdx/dtE8z6tpNLuzVUmkIqQRZa0c+d3JKB49YyiBGr00PTU4gmvOKJ6eIbGnD3STChmr
 CmNdm/dvAFnRfy9olFruFfVN2n7sxSU5DJppkcCCWE+l2WQgyBQHq/ggUktyjqpRBvIodjhOEOv
 7InrCZhO2Q+seB2k38m6FjFPGMKcRw==
X-Proofpoint-ORIG-GUID: y1eKMzj3mTy81BU4dS2Y5OjCm1ViIwMz
X-Authority-Analysis: v=2.4 cv=PJICOPqC c=1 sm=1 tr=0 ts=691ebb06 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Mwlp8W1QIZXQ3w7YCocA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200039


On 9/25/2025 5:47 AM, Jingyi Wang wrote:
> Kaanapali is Snapdragon SoC from Qualcomm.
>
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with uart
> - SMMU
> - RPMHPD
> - UFS with Inline Crypto Engine
> - LLCC
> - Watchdog
>
> Written with help from Raviteja Laggyshetty(added interconnect nodes),
> Taniya Das(added Clock Controllers and cpufreq), Jishnu Prakash
> (added rpmhpd), Nitin Rawat(added ufs) and Gaurav Kashyap(added ICE).
>
> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1320 +++++++++++++++++++++++++++++++
>   1 file changed, 1320 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> new file mode 100644
> index 000000000000..b385b4642883
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -0,0 +1,1320 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>

Missed to include "kaanapali-ipcc.h"

---
Thanks
Komal


