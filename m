Return-Path: <linux-arm-msm+bounces-59865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44FAC8ABF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9DB79E2F6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18C3222570;
	Fri, 30 May 2025 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a0DGJ29c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1272421CA1C;
	Fri, 30 May 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597343; cv=none; b=NzAvr7T5yEqlvO6DDMWx9Hf4NVRg/cY3U3B7dWzMcaARxzDOlaTA0Dx/3eafbNbc1MRfX6jDrJOaMRwO6CgRsR83/ebuk+JrjnZXAsH0xHE6joX9b0UVysMsXbvvkcdLI+JIJSu1RyzHRSUJoQcuJ3lzSYuTDdYiR7OZLt45XR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597343; c=relaxed/simple;
	bh=+nnAW901u/7kim1WteT+SbToRv8MGG7Jlhk2AneGY0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIrjjgG42qhiu/T3iVTi1Fz8GQ6oSEPbZhoy8UnSAb21gzEyBFbd7ick2fc5nmlfaLa1xvi+M8Gv/sgcnNjKJP2tnrjee50eTWvMLoQuK5Xs5I4peRs21QZpkiaZ5teaCUBeNhvyWBlg3nAE++EDOOePu3ppt/jjzmn/kYhPFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a0DGJ29c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0HtcL011636;
	Fri, 30 May 2025 09:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rPTtssiBb0c
	T02GWRXrKHcoWtGBOpMfNNrIk01XIVOg=; b=a0DGJ29cja4baqDAndviQ+8Yvry
	0lXgESpXEPQSGsWlGQ4iEOFzpnC6NZXmgO/vFaVkUKC+eNBMJUxdNk+RswMR8o5Z
	jPYBGEG+EPkaAG1syLu16U7Ku3avCAMEkGa+qfZh4vuMVseNCt5QW9/G0XEK4InL
	RUEvRxsU5jMJC9swr+Hyia9pE6ClhyCfwmPH2FQON1U4ZapqDyYAAuhZVsYZ7HN7
	CZZxU/f29RHgJdJLKRIK+ZqB/34kMDThRUq7/4bxbBoVAAhM0moQuQoXZaxl9Q18
	Ikcd2fVjBLmyMOo0XBk3aDw4fnviDsg34G4OCDQNIM3WBZrVGx8ZDh1/axg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g98jnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9SqLb008748;
	Fri, 30 May 2025 09:28:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76my9gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54U9SqIn008724;
	Fri, 30 May 2025 09:28:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54U9SqNJ008718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 2E1FF5AF; Fri, 30 May 2025 14:58:51 +0530 (+0530)
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
Subject: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075
Date: Fri, 30 May 2025 14:58:45 +0530
Message-ID: <20250530092850.631831-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530092850.631831-1-quic_wasimn@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68397a59 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=6-hPHUfSg4vTJukFU5oA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kem6xOdGyRCOom30fZYvtWoy0Bhp6U93
X-Proofpoint-GUID: kem6xOdGyRCOom30fZYvtWoy0Bhp6U93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA4MSBTYWx0ZWRfX3Mck+3BoW+h/
 Q7dJW143CPLjZJUJrq917AL/r9THrq5p5L+1r4qOQb5ctejWR8WU2fEvo9VveN/ueFwhOp+vxD2
 nao/Sb9AVwF2OJvuG/MkXn6H9DmU1WcMK1dq6zJ1aFRPOktiWfDYaWgENTYdWsWyedHSWyFDZ4k
 JoEZ+DykQqCxQsKqQaib94+8gpiGhiiXyzH1QQKA67s4iz3svacqNp7ED1W8v4wb1BSHFfHlPVh
 VGVJgrfIcb1eUaYWj+QvktZ/W2SHAXys5SqFwawnFQac8ShL31F3xIKvYtpfSnmlsvREeITJ/JG
 +Cs8u++K0fqpDFGSdCikGrm43yFnGLsoeiNQQfgVdyOBg1yHGYaZuT07eZVBDvS2GA8St1Fsfsv
 cUXM4Tz/ZJnM+hM3AABvHxOWw84PBpI26BnbvL46iQdn5ROeXeFm2fD8WKVEmvUYepXc9B7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300081

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


