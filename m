Return-Path: <linux-arm-msm+bounces-67725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2FB1AC95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 04:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F218E1805A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 02:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A5F1DD877;
	Tue,  5 Aug 2025 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W4tLOclK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273DF19067C;
	Tue,  5 Aug 2025 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754362532; cv=none; b=LJmhAJLflYiYdcY+xUo0kdQAG4oi/zTV1PwPbU3JZFzeUAXUxWRxPzYM5VtxEy51IDCM7LIffktw12c1HylT+EggPP6v/Mf502MarhHxKkEw3DDjgLOZUEA0R+yknRtE6gj4ckPePwjmQWmuD6OeFstKVBp+EEYkqMqTnEJRJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754362532; c=relaxed/simple;
	bh=+Oa1SYk7rH7RR7dwTN4cNqhgSPkcTFZqD/QlZ4EoxYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mv3r6EsIXIL9qWWL09OG8RCHnn8hPflI1uhMkdzInaxyzYSMx/cHLNIHMQ20kL+ly3P5d5nh9YkiseXxqKCMKMKGYIgsK7I5Zb3oo2KN/onHmq50mohHzPjHV6CU+CVufXM2gH2AoTPbwBuys+DPvzszdafqGHu7w7Mw6ybgwqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W4tLOclK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574E2AWT026093;
	Tue, 5 Aug 2025 02:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2lMJIGQ2wZkzoNhGgGAp72JyXMQq+SgmtR2nOQ+WF8=; b=W4tLOclKhFzdJ7TY
	p1hlSh7RUdotHoFcssmqkAuoB8qHv10Amc08xArT1J2Dt5oVwVng+qD3dkjtLyeq
	4YYVI+JRUtn/Prz+pcrTnHzUI26B7I2sc5KDB9ngWupi9qLO2kdGlTAGFErOQ9bq
	eScXdJ+fgd1oNuCzizmljkgxNvsU2ZVvMdHaVIKiicZqOoF/RA3GziLVOrsuYChi
	8S4pOa1r0Vjt/PAebWZsNYZ18WHOGkZqvwIIqjr/RVKQgesa/Mj9wCkYQgRCHlkD
	EQyKP03E2kMR2Nh7YDzhxXhWuPPaHe2kXHctUqmWzu0xxwn+/F7seh5PbGQQ+LZT
	KNtm/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvu9yeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 02:55:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5752tFDl016636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Aug 2025 02:55:15 GMT
Received: from [10.133.33.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 4 Aug
 2025 19:55:12 -0700
Message-ID: <13cd5f5c-99a8-483b-a722-86dd636e092e@quicinc.com>
Date: Tue, 5 Aug 2025 10:55:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] coresight: Add label sysfs node support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250717125343.3820505-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20250717125343.3820505-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAxNiBTYWx0ZWRfX+Qr43J75r3TG
 HCF035D1DuIckO3bcKgRL+sDnns8Dpjuu3DCBLmaOMtzWU/CxxJHi6VPwPLwXz1aR6KhMe76gl4
 ByM6iejaJ9vWs9AglB/dkpH4YCNbpFnCuEMITsYrfOoOmn6qV+FWaq2WpHSZsrC96rKJgaABMu/
 IxD8aewS0Msai/tnFXqnbaYrlz9FslrD9KfHfiuOpqUi5G2EWW4vubaYlG9ktrYVzk33Ox0SATf
 LFrqUQFvOdU5hxAcPj50pq8A4ArIunOkjL9TZeV4O9IMkHsAuZwyagsN33BjuCq47qCXz26mTfi
 37dGhALa6ABhTlYMaUGeZDKq+b72rf2E8xcR+cFiFrlmG9QSVNqnLMXsrK2v1M/OD2+ZzQaC8Wh
 a3cXszeEFSw32dYTVETuuNDJlMjc5OSAUt+8LwwNmoCJ5ntzt2/YbMl8Jjb2KKXWKjostcUA
X-Proofpoint-GUID: l2AN4s8sIN7w-plOzh3hZP6lef8ODsAx
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=68917294 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=D19gQVrFAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=z2QAkc51omxNimOJtHIA:9 a=QEXdDO2ut3YA:10
 a=W4TVW4IDbPiebHqcZpNg:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: l2AN4s8sIN7w-plOzh3hZP6lef8ODsAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050016


On 7/17/2025 8:53 PM, Mao Jinlong wrote:
> Change since V8:
> 1. Add label in all documentations of coresight components.
> 2. Add control of the visibility of the label sysfs attribute.
> V8 link: https://lkml.org/lkml/2025/7/3/985

Gentle reminder for the review of V9.

> 
> Change since V7:
> 1. Update the conflict when apply to coresight next.
> 2. Update the Date and version in ABI file.
> V7 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250226121926.2687497-3-quic_jinlmao@quicinc.com/
> 
> Change since V6:
> 1. Update the date and verison in ABI file.
> 
> Change since V5:
> 1. Update the kernel version of ABI files.
> 2. Add link of different patch versions.
> V5 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20241210122253.31926-1-quic_jinlmao@quicinc.com/
> 
> Change since V4:
> 1. Add label in DT and add label sysfs node for each coresight device.
> V4 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/
> 
> Change since V3:
> 1. Change device-name to arm,cs-dev-name.
> 2. Add arm,cs-dev-name to only CTI and sources' dt-binding.
> V3 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240131082628.6288-1-quic_jinlmao@quicinc.com/
> 
> Change since V2:
> 1. Fix the error in coresight core.
> drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers
> 
> 2. Fix the warning when run dtbinding check.
> Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition
> V2 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240115164252.26510-1-quic_jinlmao@quicinc.com/
> 
> Change since V1:
> 1. Change coresight-name to device name.
> 2. Add the device-name in coresight dt bindings.
> V1 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230208110716.18321-1-quic_jinlmao@quicinc.com/#25231737
> 
> Mao Jinlong (2):
>    dt-bindings: arm: Add label in the coresight components
>    coresight: Add label sysfs node support
> 
>   .../testing/sysfs-bus-coresight-devices-cti   |  6 ++
>   .../sysfs-bus-coresight-devices-dummy-source  |  6 ++
>   .../testing/sysfs-bus-coresight-devices-etb10 |  6 ++
>   .../testing/sysfs-bus-coresight-devices-etm3x |  6 ++
>   .../testing/sysfs-bus-coresight-devices-etm4x |  6 ++
>   .../sysfs-bus-coresight-devices-funnel        |  6 ++
>   .../testing/sysfs-bus-coresight-devices-stm   |  6 ++
>   .../testing/sysfs-bus-coresight-devices-tmc   |  6 ++
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++
>   .../testing/sysfs-bus-coresight-devices-trbe  |  6 ++
>   .../bindings/arm/arm,coresight-cti.yaml       |  4 ++
>   .../arm/arm,coresight-dummy-sink.yaml         |  4 ++
>   .../arm/arm,coresight-dummy-source.yaml       |  4 ++
>   .../arm/arm,coresight-dynamic-funnel.yaml     |  4 ++
>   .../arm/arm,coresight-dynamic-replicator.yaml |  4 ++
>   .../bindings/arm/arm,coresight-etb10.yaml     |  4 ++
>   .../bindings/arm/arm,coresight-etm.yaml       |  4 ++
>   .../arm/arm,coresight-static-funnel.yaml      |  4 ++
>   .../arm/arm,coresight-static-replicator.yaml  |  4 ++
>   .../bindings/arm/arm,coresight-tmc.yaml       |  4 ++
>   .../bindings/arm/arm,coresight-tpiu.yaml      |  4 ++
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  4 ++
>   .../arm/qcom,coresight-remote-etm.yaml        |  4 ++
>   .../bindings/arm/qcom,coresight-tpda.yaml     |  4 ++
>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 ++
>   drivers/hwtracing/coresight/coresight-sysfs.c | 71 ++++++++++++++++++-
>   26 files changed, 189 insertions(+), 2 deletions(-)
> 


