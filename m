Return-Path: <linux-arm-msm+bounces-63597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7182AF85B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 04:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9830D4A5303
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 02:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E631DF26B;
	Fri,  4 Jul 2025 02:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9CZwYt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02FB1DE3A7
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596922; cv=none; b=pLl4+o+amHPd5hGOJ4tn0fsRihQDYle+E/jQZhsE3ki2ake/k79M/YOwietuJ5pAZEMlSMDdXj4z8ozTI1jShDdXOn8KkOjcjafYfykTfociEuz+aC2lfhXaEwPBYkXsC4fQMSfySHhOxwMTy3MQVCXm9MfRJD0qe8kVazqDnbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596922; c=relaxed/simple;
	bh=QGAeURqyeOSdbvxNBjiKmHOeWgFff0xmmT1r5SF5A74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3930ZCuWUg0TmHt+QDVnEdPC6nc5Z8dZxQu1Y6ayMSewWnmVVoQz8fgBGKIdEdRPOTK63fQo8qyOzkUOluoXB4JPCHNDiI0lQMnhvk3MAlJBiQb4LHPZUQWi07OOsNrdxBoTEy6lDrXQE0GZvHD8Y++7H1LiX2hprXM09GXwWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9CZwYt3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Hw7OD032412
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 02:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lPrfch2KOwf/c7/tLGBYrDbqU9wSEHHIhICPrrp1I4=; b=S9CZwYt3snTN5xZK
	j0OkC87Dit0j3HNkRLGdoqtO8qJ5cTAP768R4UmRpASbmOtIrB1NQ4Ypw0Wr/lNK
	V3rhtK0KN3B+YeYV09gmzfEinf1vEYzowJfIdhfuZghbqhbT+y7muQX7hC8tItHw
	ogSR5UJv/FKCvB5KWs1FuGLIOVHAr6OzsP9aI6EXkbP+tLR8L2tm0tKfbvasY8gA
	mqtYUv9R6vNV8QPOZZ5yWwdzN/ldMUmmPt7RZWa+1g401NuruHv0usrA99SJ/3/B
	BgUVZ41XiZVhUXKLcmadhNdGwXovWATIA231YPm9xDPoFDC8HCSLHmycOQSZKBRg
	JE+CEA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ta26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 02:41:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c36951518so537924a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 19:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596917; x=1752201717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lPrfch2KOwf/c7/tLGBYrDbqU9wSEHHIhICPrrp1I4=;
        b=SOrx4Uo8gluLEMYHRb/jDA9CaaMHC4MKW0ga6uwM91LMN6a8NSm/AQv/izv1RWoFfL
         BV6OisrOyphW+3R5RWJJhlP+V5FvrfMYT1hs225Xa3EhpyVTXX/0m2TiaP5jjirgmL2+
         eNinLLR3bjC0BhVESSNZaV6S2CiEFFwBEMXahdCPD4GKak5ieryvnaO4YJok0FP7gkW3
         hnDL2M+Jno+BVsI5TUy1XNqkklQshVVN9Zx7DBJE/JMcOH5TgdDSAHfp2Q5HnQArf8mI
         2S5Pn8wiAqB5PLHkhqIoZI40zJGRXRzORLeWoQgqEOy7Zta8xlND9uIoUr+6NQFioaqv
         KKRw==
X-Forwarded-Encrypted: i=1; AJvYcCW3l+wo0h45PALI22NJiPOAdA6TPJOmT5hlC6gYumLNR5gw2N//LdL8oibbIIQE4p1CXWqD/MHlq2qIdEzy@vger.kernel.org
X-Gm-Message-State: AOJu0YzQeXFq8Bu/eLEmK4Bf2goLB/FIf+ZWREnBEW/7/ZrpP53lCxw2
	eKsHpjlUdH0XocWDAX2vzIl+rUxH5VoUz/U79JqX66a6BR4xrg/sr43MIrQvcJtWayIbZ45ThjG
	GTezE7NzhVINto06ZHIsJ2XbeEgLxto7y2gUA8JfCZ/AT1+8Iqz7fTVnUDWz+zoJx+JM8
X-Gm-Gg: ASbGncvPE+nyJ+vl3hlPu+XPeF9O25/A/1BLOo7wMrGMs0QaSC92DIEAuDlZYNmPEPo
	O2aZoXuqkZM9S7GUSjzFQ0NGlZT2Uw28l5Grxk/UK/0yI/5D0+T74AHCQ7nV72s1guxL1pBrt2n
	c1sh+7xbXDAVO6RmEPa7pR5dGd8Kem08vx6/3jIYvPjeSZHSI9qag5CvKVGY9ZMNyDLZwRiLOkv
	gQLzXK9ygLDgGHUbATR1A85SKuAEQuCLnQv3QRkN4knc2GNClhyaHumgJa8uykBTbLC7i3OYJpL
	1SjhSlfA+zy2ttYmD3U9Py09bSO3HoGqf016mJ8fzeX6NGoOOQ/gBHPrsbGS3nHFkbUIyEbQwW8
	7tVgaljs=
X-Received: by 2002:a17:903:1b04:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23c86066e22mr17464965ad.14.1751596917303;
        Thu, 03 Jul 2025 19:41:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeWqGIPElykE9v+hg85L5a5KZ3QAOpihd97fl9vgoQOOfdPXTblhDGoYOMNi4iH4oHDkr31g==
X-Received: by 2002:a17:903:1b04:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23c86066e22mr17464635ad.14.1751596916850;
        Thu, 03 Jul 2025 19:41:56 -0700 (PDT)
Received: from [10.133.33.146] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455db09sm7648685ad.121.2025.07.03.19.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:41:56 -0700 (PDT)
Message-ID: <d628c3da-4e2e-4d9b-81c5-8cf88628e400@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 10:41:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68673f76 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=UyySFntBJEnY6qwGPMMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kurQAxegr15xY38W3topLr75hMvMYEF2
X-Proofpoint-GUID: kurQAxegr15xY38W3topLr75hMvMYEF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAyMCBTYWx0ZWRfXx20R39G4vpcz
 bUJ/Y72u0pjs5BH5nGekholm5R8TjHkHgK2Eu4MYJgS/z1iBtuR29zHLrT0HBcUwQ1lqsRrhB9i
 aza8aDyiUME35mjZ904wgO98sGZw8MZkzidxV8wKbjhAGDGjuxs+IBJUS2i/DA6sqYCqEKeG2e/
 lILWZeUJvoNRdG9zzd2A17QdOs4NI6c+XxT+sktEbhaQc5AKPUSLBOLav5CcXCh0MRCUWILMCXu
 k3LnrZ3VyPTmLTT3wVtfJLvBnQ9t5egSsZ6g4GLK8Ec0wix3f48PsKPAOM9Qwv7lxzLC6kvL4fK
 i8Xx/jZvT2C6zH1EYMxvxEhtUjL/v4Lje+l3LO3N3iS4EjcCnGMxfsXFueS2s5DH6/NqnHaWEOY
 q5GfWEopfIqwSRN5kvdE9zJDUrtoKrQS8TYvjulvJoebQ0eWE/24it6E7/L/hQ8pstd7ws+L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040020



On 6/24/2025 2:04 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is tiggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle ping.

Thanks,
Jie

> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr, e.g.
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> Jie Gan (10):
>    coresight: core: Refactoring ctcu_get_active_port and make it generic
>    coresight: core: add a new API to retrieve the helper device
>    dt-bindings: arm: add an interrupt property for Coresight CTCU
>    coresight: ctcu: enable byte-cntr for TMC ETR devices
>    coresight: tmc: add etr_buf_list to store allocated etr_buf
>    coresight: tmc: add create/delete functions for etr_buf_node
>    coresight: tmc: add prepare/unprepare functions for byte-cntr
>    coresight: tmc: add a switch buffer function for byte-cntr
>    coresight: tmc: add read function for byte-cntr
>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
> 
>   .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>   drivers/hwtracing/coresight/Makefile          |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c  |  54 ++++
>   .../coresight/coresight-ctcu-byte-cntr.c      | 102 +++++++
>   .../hwtracing/coresight/coresight-ctcu-core.c | 113 ++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  52 +++-
>   drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>   .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
>   12 files changed, 691 insertions(+), 32 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> 


