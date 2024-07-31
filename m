Return-Path: <linux-arm-msm+bounces-27465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F88942565
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 717371F2470F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 04:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A76C2BAFC;
	Wed, 31 Jul 2024 04:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VVHvtLCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE0E266AB;
	Wed, 31 Jul 2024 04:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722399890; cv=none; b=OHkOJ/Wq7s/rXs3Z6pLlW8dO2djqkkFZQZ/oUnq7fAzyKuZe7xBXlSv8Kgea6T8qGpE8GBDLbY90Ron+YXQbOk/F5nUcYbgkCPttvq2NUXfAMg97GsQzexK56CHsookWWZTw2rod6CKaIhNiT/7gjTVNBE/cl0ZpC+WYA/vB0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722399890; c=relaxed/simple;
	bh=yoe3akxi8woa+MaJwNH25WEaC/OJX/PYzDruIh6kkEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gxgbJDpfytDzTkTssa/tmPMCuxJZJYnjFcQju4Qy6aN1MTBcJYpIpdMTSRuMowEEvf2Yma57809C1t83ql/qGHjuTGCATR0wgCGmFEhULL9ETL0ISIx3ML7b/XJ9kHRyE7Un+oJFClKpTt9xf6M5mMoF/ZGBJGJgZPhkTG/+TjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VVHvtLCz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4MUdV011943;
	Wed, 31 Jul 2024 04:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kwy/iKXM1sgVDjh48w0Ncd2y/B8DQawXDZCRAcrhLJQ=; b=VVHvtLCzcSkf/u9C
	vlAcgiKZK+CZjnT2a25jtutPrrUAt/ftCnhAnPatKtIUVWdgiiiSyJK+P56/xNSN
	DVbGwF+YmP+Xk59SGaXfWaljxgj2kRxPvK8ZjNEXIUExS4ekH0c0TOm1dS9wDHlG
	B9zudC37IAJgwUm8fsmHOHw9XDve0nDj9RlnWukib5X+gG6A6gZQU/Fg3ptEyCr7
	jwcGiNezPKWxfh1yNlU0sPL44tPAgRLwbov82bmSNsUJRrrHuRlj/37N+r3V6qCN
	2x8blaRKhLDhkUfMpuQ45kDnbZ4wx+MaJd3hWQu9OBpVFeXtXRMPqJhPzczzrHBQ
	Ry/xNw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mryu1wm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V4OMSj017121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:23 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 21:24:17 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Wed, 31 Jul 2024 09:53:38 +0530
Subject: [PATCH 2/4] Documentation: dwc_pcie_pmu: Update bdf to sbdf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240731-dwc_pmu_fix-v1-2-ca47d153e5b2@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
In-Reply-To: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722399845; l=2867;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=yoe3akxi8woa+MaJwNH25WEaC/OJX/PYzDruIh6kkEA=;
 b=yEfdyJkdguQbmMbky2gLqlJBeeahscy4VEvDIfYzGqJxzRLvkL2ItBeihjW06f0oMfXzr0OIJ
 AEhqGMJHYHABbwg1Nx6jxbYDCkfu/cOi4jTy8NWy6nTVXSTnB6BcOGF
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MhuPj_9rDsBZToFMN3OO_E43QH5cwhvO
X-Proofpoint-GUID: MhuPj_9rDsBZToFMN3OO_E43QH5cwhvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_01,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=905
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310031

Update document to reflect the driver change to use sbdf instead
of bdf alone.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
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


