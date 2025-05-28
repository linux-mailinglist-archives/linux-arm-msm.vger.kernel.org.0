Return-Path: <linux-arm-msm+bounces-59696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5CAC6943
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C6A189D077
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C11E2857D1;
	Wed, 28 May 2025 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mWiQLr72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15F284B50;
	Wed, 28 May 2025 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435284; cv=none; b=umKVDim7FqNcKIIfVMyVnzUZ231qKnioNrFazGlWBwEtNLH0k5NvUBglx+62dwstmXXodZtAUWIBEQclmiv+jcQDiV9qeodXr8Sw2Wq/KCQ160T+tPF5uGJ4ipLYeK1Yxok7qhakcyGPvaKbB5yTogWNRK04el7ewAC4zsEQEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435284; c=relaxed/simple;
	bh=+nnAW901u/7kim1WteT+SbToRv8MGG7Jlhk2AneGY0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHWwQXdKkQoD5IaEX8rpyz0Eox8zce1YGteCtGJNlfY8rFvrv5e+Z+ldXd8bWtwRI2iDqedvBGF/hzGw94mMD+ng6G3rZE7cClNarqSAw4fRn/hhM6C3j1DgS1/6WaD6dRwtc/wVfnuZG7qdKNarH1Xu7K0bCkG/WRzcEtSO4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mWiQLr72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5nIRX028909;
	Wed, 28 May 2025 12:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rPTtssiBb0c
	T02GWRXrKHcoWtGBOpMfNNrIk01XIVOg=; b=mWiQLr72FDK4/0jenvVqDPectut
	X/d5Bj+1V3W10+W3TMDujvQjJep0ohoS7bPOHDhB+2gYTcCFEvJ9QP65QYKT/RCp
	dbFaXfjmVZS4Rf4RY8vun2gQxaQphR3q2yo961OgYqUsj2ZeFMjV0lBYyQJkXKGb
	k2k0Z/YwtgsYQJY+uLpowm5eTVAO5/1gEAD+n5kDmZuL+gHtdWIYZjS5CXJuqYfb
	M9vGJu8ydn1nmaus3Qlm3nzFQFX0mNmvOpGzNqHVdundoCrz66gMpYtHCu/w9TlQ
	k03mj9OVn+zUhzvbHMBy5d4wW3vAKRohn4ZhsCf4jF5CYyDlo7vWPcrYkcA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf2j22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCRuPa011486;
	Wed, 28 May 2025 12:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76mxk33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54SCRt6u011461;
	Wed, 28 May 2025 12:27:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54SCRtfo011453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id E30B25AF; Wed, 28 May 2025 17:57:54 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v8 2/4] arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075
Date: Wed, 28 May 2025 17:57:49 +0530
Message-ID: <20250528122753.3623570-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
References: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=68370150 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=6-hPHUfSg4vTJukFU5oA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TWOpRRSqVYZtk-nxZ8QqZlXbYVUgSofJ
X-Proofpoint-GUID: TWOpRRSqVYZtk-nxZ8QqZlXbYVUgSofJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNyBTYWx0ZWRfX6D/QbZn02b6v
 AGh99aFQ/qS9Rh+ebSdCOr0Eh096iHmoWwkEmfSB27/AANf/3tVhee3JYKtllwYfoVQnf4t6hrp
 6sa6TtT0eO9lYk2Hw+TItzKqfH/EHQih1cXb6xZfYZAsDC53YoMwyFuLnfhe8EqNIZLtR5YNl2u
 jiWIDdUS45wiiRt6OtmHoyBB/5YVh7RHUnyBBu1cg8xk8lPaq+seg/3dc3Ib7A1fopcolWDxTML
 rxjsdyRgTypOqEbUFoW7qeLY4hYaZwKnAEV0GBIpg8doylaJyIsDANMWsUH7B3S5WMs6PrbpFCx
 RiWcEZy4MKauqxgqlfD3yn1Bt/yrABX+j3ApN/WSaGUkxzC5Q2WcRoIZJ+e0uQ5tyR9t5yTzTZg
 r9uiC66qnc/8eT3oUFtYBhg45GkZfcG71cm7wkpaognsvUQ3thhEljdCkrN1d+tpkyVUb+xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280107

From: Pratyush Brahma <quic_pbrahma@quicinc.com>

SA8775P has a memory map which caters to the auto specific requirements.
QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
inherit the memory map of SA8775P require a slightly different memory
map as compared to SA8775P auto parts.
This new memory map is applicable for all the IoT boards which inherit
the initial SA8775P memory map. This is not applicable for non-IoT
boards.

Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
introduced as part of firmware updates for IoT. The size and base address
have been updated for video PIL carveout compared to SA8775P since it is
being brought up for the first time on IoT boards. The base addresses
of the rest of the PIL carveouts have been updated to accommodate the
change in size of video since PIL regions are relocatable and their
functionality is not impacted due to this change. The size of camera
pil has also been increased without breaking any feature.

The size of trusted apps carveout has also been reduced since it is
sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
carveout and its corresponding scm reference has been removed as these
are not required for IoT parts.

Incorporate these changes in the updated memory map.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi

diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
new file mode 100644
index 000000000000..ff2600eb5e3d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/delete-node/ &pil_camera_mem;
+/delete-node/ &pil_adsp_mem;
+/delete-node/ &pil_gdsp0_mem;
+/delete-node/ &pil_gdsp1_mem;
+/delete-node/ &pil_cdsp0_mem;
+/delete-node/ &pil_gpu_mem;
+/delete-node/ &pil_cdsp1_mem;
+/delete-node/ &pil_cvp_mem;
+/delete-node/ &pil_video_mem;
+/delete-node/ &audio_mdf_mem;
+/delete-node/ &trusted_apps_mem;
+/delete-node/ &hyptz_reserved_mem;
+/delete-node/ &tz_ffi_mem;
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gunyah_md_mem: gunyah-md@91a80000 {
+			reg = <0x0 0x91a80000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_camera_mem: pil-camera@95200000 {
+			reg = <0x0 0x95200000 0x0 0x700000>;
+			no-map;
+		};
+
+		pil_adsp_mem: pil-adsp@95900000 {
+			reg = <0x0 0x95900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		q6_adsp_dtb_mem: q6-adsp-dtb@97700000 {
+			reg = <0x0 0x97700000 0x0 0x80000>;
+			no-map;
+		};
+
+		q6_gdsp0_dtb_mem: q6-gdsp0-dtb@97780000 {
+			reg = <0x0 0x97780000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_gdsp0_mem: pil-gdsp0@97800000 {
+			reg = <0x0 0x97800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp1_mem: pil-gdsp1@99600000 {
+			reg = <0x0 0x99600000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		q6_gdsp1_dtb_mem: q6-gdsp1-dtb@9b400000 {
+			reg = <0x0 0x9b400000 0x0 0x80000>;
+			no-map;
+		};
+
+		q6_cdsp0_dtb_mem: q6-cdsp0-dtb@9b480000 {
+			reg = <0x0 0x9b480000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_cdsp0_mem: pil-cdsp0@9b500000 {
+			reg = <0x0 0x9b500000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gpu_mem: pil-gpu@9d300000 {
+			reg = <0x0 0x9d300000 0x0 0x2000>;
+			no-map;
+		};
+
+		q6_cdsp1_dtb_mem: q6-cdsp1-dtb@9d380000 {
+			reg = <0x0 0x9d380000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_cdsp1_mem: pil-cdsp1@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_cvp_mem: pil-cvp@9f200000 {
+			reg = <0x0 0x9f200000 0x0 0x700000>;
+			no-map;
+		};
+
+		pil_video_mem: pil-video@9f900000 {
+			reg = <0x0 0x9f900000 0x0 0x1000000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@d1900000 {
+			reg = <0x0 0xd1900000 0x0 0x1c00000>;
+			no-map;
+		};
+	};
+
+	firmware {
+		scm {
+			/delete-property/ memory-region;
+		};
+	};
+};
--
2.49.0


