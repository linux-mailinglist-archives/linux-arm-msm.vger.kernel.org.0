Return-Path: <linux-arm-msm+bounces-64135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D397EAFE281
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8A941BC75FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE79273D7B;
	Wed,  9 Jul 2025 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nyCbAk92"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9991EB9F2;
	Wed,  9 Jul 2025 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049545; cv=none; b=LI/1JRZuypLI7b6lse4VycPom6XgtH07atsG/fTZKfns23fFzrnLnfj6z5wahXCosyN/Dh8DINlYz6MdWAEvIsL96o9jDsCZoCEBDVGGw7ZbBZY/P9xidemJ6nsW1NkIYD6Poba9xZY3yv6V+1AG+72RQcTxl3vFS5+qAacBrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049545; c=relaxed/simple;
	bh=r5RG0r6VfhGCnEFFMGPgiUsflE0JaER9sAslCslskZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TPUicTLCz/32oUWFqv83K6hfREuUNjJvmuvY57Tpn/dtXha31BpYILzHcXH4LlCngIE/rDCejuhDHqQWQr0RbBap2LEgTjZzXKYQZo4czLnJfs+tDw4pblZFsFbrqmVLbmYbg+LNW5qPfJPuZfHZVXNwkH+Kt2YiNRozNtH+t7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nyCbAk92; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697mBnU024365;
	Wed, 9 Jul 2025 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COZ2Sh8sxgfBJ7zX3NCff/RrAJHNSAnAxPWUBtHFUog=; b=nyCbAk926zsau2SP
	mJvfxBRtOB72Ar4axeO5P4YE24XUL8E5DeVRR5Z3gx0RUjY0wEU01dOCacmVZf3c
	6bYfLdX3iHQ4Epq8O9wZpvdQhP3hvVZp3EpiioBzPkyTb0wMyQInHfR0KZ6WcChp
	JEkbSC60UjpysnQRGl4Y5RibKiAMY5oPOyDPjCzTUkHoxowyTup4J5FJW1p9sdX5
	z5UZXzOJ3vDT4292P7xL4zMMLNKafsGto0WZhtQiog7E6tqtVXPDyDVbX4ib9vSR
	sw70Bar9vbKvUfmKUgOQtCDY4m9BZoEjX/OEOQQcYUh/k/cz8tMtmFtSMovd2DKz
	0llc0w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnr3pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 08:25:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5698PUG1032555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 08:25:30 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 01:25:26 -0700
Message-ID: <c6cfc51b-ca0e-4eac-8462-00dcbc136afd@quicinc.com>
Date: Wed, 9 Jul 2025 16:25:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] coresight: Add Coresight Trace Network On Chip
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@arm.com>
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA3NSBTYWx0ZWRfXyx+D+kMo8223
 4eoDswe4moMyOwyx0wburBNMbnB1aTQXTun3ltK1ZZpNOjZcHFCFKcottbVMxagf7nW0gVB4ihr
 xG5b43lgtn39gHuDXJh1pNOllBlcL9RATeFQs0nmtj3cRp9HTx8YNNlwJFhBaNLKEJOM1UfMd7e
 LqzfGvHGx/t0adL1n+gGwezi9FoyF/xuJu0P54q8GIBvyf4B+RD7kXQVaQwiFTmPMnK5JN92xme
 Z6FFbTEblJZfxrJCst3YSN8omXZvV5mlTjhhT1ZQiRoURIDkwfxrh55/LGLkEkHdpGCsUPb9Nwd
 ROkoTM4X0Wn88oQrBDTDSQc1C8EjR0+nBbfLjAAaB3KnsOT3J7b7G7X96uO43DHjnuFL/h7cj9O
 oGSIRB2kSA2Hg3A6UFZI8kyMnfsyM9pCYWYj9vQN9yPJhlQQlsUM+qhTzkgWgu1AwgnQynVv
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686e277b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=6ZaSXbcDHRiDiM3bpcAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fn5V7WnPvgFSAqDRf_6MBVoPXphwGdGX
X-Proofpoint-GUID: fn5V7WnPvgFSAqDRf_6MBVoPXphwGdGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090075

On 6/11/2025 6:42 PM, Yuanfang Zhang wrote:
> The Trace Network On Chip (TNOC) is an integration hierarchy which is a
> hardware component that integrates the functionalities of TPDA and
> funnels. It collects trace from subsystems and transfers it to coresight
> sink.
> 
> In addition to the generic TNOC mentioned above, there is also a special type
> of TNOC called Interconnect TNOC. Unlike the generic TNOC, the Interconnect
> TNOC doesn't need ATID. Its primary function is to connect the source of
> subsystems to the Aggregator TNOC. Its driver is different from this patch and
> will describe it and upstream its driver separately.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Changes in v10:
> - Rebase to coresight/next branch.
> - Link to v9: https://lore.kernel.org/r/20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com
> 
> Changes in v9:
> - Mention the binding is only for Aggregator TNOC.
> - Link to v8: https://lore.kernel.org/r/20250606-trace-noc-v8-0-833f94712c57@quicinc.com
> 
> Changes in v8:
> - Add sysfs node to expose atid.
> - Link to v7: https://lore.kernel.org/r/20250523-trace-noc-v7-0-d65edbab2997@quicinc.com
> 
> Changes in v7:
> - Move the content in header file into coresight-tnoc.c.
> - Use scoped_guard() to replace spin_lock().
> - Invoke coresight_trace_id_put_system_id() for registration failure.
> - Link to v6: https://lore.kernel.org/r/20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com
> 
> Changes in v6:
> - Add a newline after return statements.
> - Use 'x &= foo' to replace 'x = x & foo'.
> - Use 'x |= foo' to replace 'x = x | foo'.
> - Link to v5: https://lore.kernel.org/r/20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com
> 
> Changes in v5:
> - update cover-letter to describe the Interconnect TNOC.
> - Link to v4: https://lore.kernel.org/r/20250415-trace-noc-v4-0-979938fedfd8@quicinc.com
> 
> Changes in v4:
> - Fix dt_binding warning.
> - update mask of trace_noc amba_id.
> - Modify driver comments.
> - rename TRACE_NOC_SYN_VAL to TRACE_NOC_SYNC_INTERVAL.
> - Link to v3: https://lore.kernel.org/r/20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com
> 
> Changes in v3:
> - Remove unnecessary sysfs nodes.
> - update commit messages.
> - Use 'writel' instead of 'write_relaxed' when writing to the register for the last time.
> - Add trace_id ops.
> - Link to v2: https://lore.kernel.org/r/20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com
> 
> Changes in v2:
> - Modified the format of DT binging file.
> - Fix compile warnings.
> - Link to v1: https://lore.kernel.org/r/46643089-b88d-49dc-be05-7bf0bb21f847@quicinc.com
> 
> ---
> Yuanfang Zhang (2):
>       dt-bindings: arm: Add device Trace Network On Chip definition
>       coresight: add coresight Trace Network On Chip driver
> 
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 ++++++++++
>  drivers/hwtracing/coresight/Kconfig                |  12 +
>  drivers/hwtracing/coresight/Makefile               |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c       | 242 +++++++++++++++++++++
>  4 files changed, 368 insertions(+)
> ---
> base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
> change-id: 20250403-trace-noc-f8286b30408e
> 
> Best regards,

Hi Suzuki, Mike,

I wanted to check in on the status of this patch series ([v10 0/2]). I’d like to confirm whether
it is planned to be picked for this cycle, or if there’s anything further I should address.

thanks,
Yuanfang.

