Return-Path: <linux-arm-msm+bounces-28810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3172954D8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1602FB22535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0135E1BF30B;
	Fri, 16 Aug 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pTyBzPyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC751BE238;
	Fri, 16 Aug 2024 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821496; cv=none; b=tsFW3ZluhwduYi761qx1uJ5D+Ichql7XTaQ71hh1Qu92UW/qPWeLIAg7AucmXst9ChTR5BI4hdNtzQpIVMIqeuqDUi0kJ3UgRIGaL/vjOWfQg9zdmSqevzV5f7GuApFkoVlN5p3ziJo3Jy5oAqQEA/05eCxckmVfU13SBjHDqa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821496; c=relaxed/simple;
	bh=LK8+aoB8ucdCz8X8Jmwhml5sbBUA488l8iN1Nqf4BpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=h/wNYXCjMO+ccts+DYmd0iu14/X1lTGZ1J4Lc73ivPBwa9L9NCJizk3MWRUFH7Vi9yUaa+nrV2Q310X5Q43TQUXGVrV2R1VGImnxcHIuvGuh4CcsT9sQJOgle4x2cHPUH8kNmzbarcB1vbVtwIwwJfCG2rILTWJ9ecjZz5C75jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pTyBzPyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G6VYwM031041;
	Fri, 16 Aug 2024 15:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWSOVwW1Oglzt60CE8fvO0tKxAC9u4HzF9ol8sz2DMQ=; b=pTyBzPyiGGrAdrrL
	tsonnImw5dNGOMzdT/DK8LOVaof1seKo3FBVKwgAtHZJUCIOGCe9zCBGCIFct/a3
	rQObuZRVYaUKxKTNyQlT5LmaP0mlChHWCJPUHCr/QWFhHUHbbEskQyH630j/yceB
	D8qD/s1FK1EpULysWRMzUvHqRxx8A1LV0wg9N1D5wuiW2EjnH8pJ6iCQHVm1lkni
	zYxOK/bU+MFxK3Jlc375Cxs8qIdat4skqvPuWZNXgDS0vMDTKdGkgiIE1Xjw1ZXN
	1/2TM0o/IE4g48gvlRZJmqh8n8HbJyC9+/qiqVzXgSKL81ioTvUsspWxpk1IwB7a
	ZV8cFA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4103wsarrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GFHeen017321
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:40 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 08:17:35 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Fri, 16 Aug 2024 20:47:21 +0530
Subject: [PATCH v2 2/4] Documentation: dwc_pcie_pmu: Update bdf to sbdf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-dwc_pmu_fix-v2-2-198b8ab1077c@quicinc.com>
References: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
In-Reply-To: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
        Jing Zhang
	<renyu.zj@linux.alibaba.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Yicong
 Yang" <yangyicong@hisilicon.com>,
        Jonathan Cameron
	<Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <quic_vbadigan@quicinc.com>, <quic_nitegupt@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_parass@quicinc.com>, <quic_mrana@quicinc.com>,
        "Krishna chaitanya
 chundru" <quic_krichai@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723821442; l=2920;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=LK8+aoB8ucdCz8X8Jmwhml5sbBUA488l8iN1Nqf4BpY=;
 b=chO35ka73LBwU99UNmGoeRTMf2tDSfa8fcBGitY+QPuxGHzcDbLDZp+qAql4BDPJGqKMNO7Ib
 CLQx4RattmmBMe9f+uGrCDJxiKgYqfZodQ0eJ+foKsy5TZ8d00/gb//
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V5tpsevPp1WpdK8dJeOQ0lmMwkf1Q5rn
X-Proofpoint-ORIG-GUID: V5tpsevPp1WpdK8dJeOQ0lmMwkf1Q5rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_09,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=915 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160110

Update document to reflect the driver change to use sbdf instead
of bdf alone.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
---
 Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
index d47cd229d710..39b8e1fdd0cd 100644
--- a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
+++ b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
@@ -46,16 +46,16 @@ Some of the events only exist for specific configurations.
 DesignWare Cores (DWC) PCIe PMU Driver
 =======================================
 
-This driver adds PMU devices for each PCIe Root Port named based on the BDF of
+This driver adds PMU devices for each PCIe Root Port named based on the SBDF of
 the Root Port. For example,
 
-    30:03.0 PCI bridge: Device 1ded:8000 (rev 01)
+    0001:30:03.0 PCI bridge: Device 1ded:8000 (rev 01)
 
-the PMU device name for this Root Port is dwc_rootport_3018.
+the PMU device name for this Root Port is dwc_rootport_13018.
 
 The DWC PCIe PMU driver registers a perf PMU driver, which provides
 description of available events and configuration options in sysfs, see
-/sys/bus/event_source/devices/dwc_rootport_{bdf}.
+/sys/bus/event_source/devices/dwc_rootport_{sbdf}.
 
 The "format" directory describes format of the config fields of the
 perf_event_attr structure. The "events" directory provides configuration
@@ -66,16 +66,16 @@ The "perf list" command shall list the available events from sysfs, e.g.::
 
     $# perf list | grep dwc_rootport
     <...>
-    dwc_rootport_3018/Rx_PCIe_TLP_Data_Payload/        [Kernel PMU event]
+    dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/        [Kernel PMU event]
     <...>
-    dwc_rootport_3018/rx_memory_read,lane=?/               [Kernel PMU event]
+    dwc_rootport_13018/rx_memory_read,lane=?/               [Kernel PMU event]
 
 Time Based Analysis Event Usage
 -------------------------------
 
 Example usage of counting PCIe RX TLP data payload (Units of bytes)::
 
-    $# perf stat -a -e dwc_rootport_3018/Rx_PCIe_TLP_Data_Payload/
+    $# perf stat -a -e dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/
 
 The average RX/TX bandwidth can be calculated using the following formula:
 
@@ -88,7 +88,7 @@ Lane Event Usage
 Each lane has the same event set and to avoid generating a list of hundreds
 of events, the user need to specify the lane ID explicitly, e.g.::
 
-    $# perf stat -a -e dwc_rootport_3018/rx_memory_read,lane=4/
+    $# perf stat -a -e dwc_rootport_13018/rx_memory_read,lane=4/
 
 The driver does not support sampling, therefore "perf record" will not
 work. Per-task (without "-a") perf sessions are not supported.

-- 
2.34.1


