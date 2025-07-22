Return-Path: <linux-arm-msm+bounces-66121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52982B0DF7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7341D7B4898
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718EE2ED174;
	Tue, 22 Jul 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mq76anGx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46B32EBDF6;
	Tue, 22 Jul 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195800; cv=none; b=Aje0gGb1doWjmclncm5J3RkGbxuwoJ+WFt1FCXsutIomHbwtHBvf4zwuK3mWuUZYvH6m2XP43DwFdG1RxDsdsHeJSO52FqowMeqlGnir4BGKwOGjUsWY61EuqjQap6UprEgBD8pyGssEwG3Rqnlrttv1hzNEX/ILRNMNHwaDzZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195800; c=relaxed/simple;
	bh=211uyGxKSx8i9e/JVEAuSRVXP0SH88Ajrq//nX18ZhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MidfNWMmfIZm2rJKUe2ar8oH8k9a4X5ycP2R9tz9DwnEzrm6xyLkDsu2Om8xAEdJn0biOh8Z3Y0dORwgicX0eo6QeSQOnrAKGGgp4wu2q9JkpcMO7Gw1rxDl1Jje3+qi7EFdtgyiWu/PNjqho7xmmgH49ozrBZDPMOI1gsZsxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mq76anGx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCrin2018099;
	Tue, 22 Jul 2025 14:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Rmk5PJtvGL
	2PtAnwMtP6YM8VGll8/AGwwvaCoApa+4=; b=mq76anGxwXZxzBrXn1qAu/Kv/42
	bqrQ+ncAIX38f8upFEoyBEXqa8fjAygDO99zshSc44x3zb+AsnejHDiy3sM1hP7R
	5Cem1m3PDwQTIuoqhH4GCjd1wVTup5wmJnP5nKEygxUd5yMrLZBiYxBFgsiTdiwe
	BvmMLZPEKe1a8oR+UYwVtC2RQquDB+N4ZSpmsImm1PJVfsGfpltjvx+e5aVINJVk
	+w3rw2WiKOcNNBXqcSjJWSeJZ3HwQJpLxuookM8lQYmdVVEx5Q0xC+tpsmGkcHcg
	7xBpgxs+qT+sMuRtShlRFaF80IEVEuvJIhEWC6hKfWq/O/V8jhsvqA9g7og==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1u8ckb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEnlvb023767;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ekgevc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MEnlqE023735;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56MEnkMY023729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id DADC85E5; Tue, 22 Jul 2025 20:19:45 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
Subject: [PATCH 2/7] arm64: dts: qcom: Update memory-map for IoT platforms in lemans
Date: Tue, 22 Jul 2025 20:19:21 +0530
Message-ID: <20250722144926.995064-3-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=687fa510 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gsKajC6rj_jpGAwFQswA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfXx64vTnh7CsTs
 CM2rrXCGpIrfv7XFPLy1MAZC6/p8arNbmfaLF1Z//S3poQlm2rUQ2JoFg1FRvsIiKGkTetUWHeq
 t6LWtXVd4g3AC3XVoz4FwEjv1HdlnsphQ3HnDMllW/CB9y9ucu4ZyO/DyfTLF2RuBiYsGoQffxZ
 z5dfkNRga6mQBMBVWcEy0rfpF1xSyTkY/e00B5n+WdeejBtC8H1YuhJknBCHkk3Z3PCp49K8m9D
 WH1ghtJxFkVN4MPuJL7Futni8VkLXcXGMn8tdyoN01yPjGcSBfM5jdkRGKn4xa4jZUmgilCvefp
 /3IGhsqABYSQXS0fFBAJ4P05grSj2qi83l7TilWkUEZJCZWmdBQM3FLtr0WymvQpx73scE7kWHa
 8kj2sqT2fzELJwHc+mImIz8nLgeCYIBv6poXiBwg+3EIl3CqziXeVHrn4o/uHUwod2xfO5bd
X-Proofpoint-ORIG-GUID: dG-lk2yCjbIjEUDSKBHry80EA4PLinAt
X-Proofpoint-GUID: dG-lk2yCjbIjEUDSKBHry80EA4PLinAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=821 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220123

Stop using the outdated automotive memory map for Lemans; update it to
meet IoT requirements.

Since, most platforms are IoT-based, treat IoT as the default variant
under "lemans" and apply it to all platforms, except those requiring the
old memory-map (e.g., sa8775p, ride, and ride-r3).
Introduce "lemans-auto" as a derivative of "lemans" that retains the old
automotive memory map to support legacy use cases.

As part of the IoT memory map updates:
  - Introduce new carveouts for gunyah_md and pil_dtb. Adjust the size and
    base address of the PIL carveout to accommodate these changes.
  - Increase the size of the video/camera PIL carveout without affecting
    existing functionality.
  - Reduce the size of the trusted apps carveout to meet IoT-specific
    requirements.
  - Remove audio_mdf_mem, tz_ffi_mem, and their corresponding SCM references,
    as they are not required for IoT platforms.

Co-developed-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
Co-developed-by: Prakash Gupta <quic_guptap@quicinc.com>
Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi  | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi       |  75 +++++++++------
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |   2 +-
 3 files changed, 149 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi b/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
new file mode 100644
index 000000000000..8db958d60fd1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include "lemans.dtsi"
+
+/delete-node/ &pil_camera_mem;
+/delete-node/ &pil_adsp_mem;
+/delete-node/ &q6_adsp_dtb_mem;
+/delete-node/ &q6_gdsp0_dtb_mem;
+/delete-node/ &pil_gdsp0_mem;
+/delete-node/ &pil_gdsp1_mem;
+/delete-node/ &q6_gdsp1_dtb_mem;
+/delete-node/ &q6_cdsp0_dtb_mem;
+/delete-node/ &pil_cdsp0_mem;
+/delete-node/ &pil_gpu_mem;
+/delete-node/ &pil_cdsp1_mem;
+/delete-node/ &q6_cdsp1_dtb_mem;
+/delete-node/ &pil_cvp_mem;
+/delete-node/ &pil_video_mem;
+/delete-node/ &gunyah_md_mem;
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tz_ffi_mem: tz-ffi@91c00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x91c00000 0x0 0x1400000>;
+			no-map;
+		};
+
+		pil_camera_mem: pil-camera@95200000 {
+			reg = <0x0 0x95200000 0x0 0x500000>;
+			no-map;
+		};
+
+		pil_adsp_mem: pil-adsp@95c00000 {
+			reg = <0x0 0x95c00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp0_mem: pil-gdsp0@97b00000 {
+			reg = <0x0 0x97b00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp1_mem: pil-gdsp1@99900000 {
+			reg = <0x0 0x99900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_cdsp0_mem: pil-cdsp0@9b800000 {
+			reg = <0x0 0x9b800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gpu_mem: pil-gpu@9d600000 {
+			reg = <0x0 0x9d600000 0x0 0x2000>;
+			no-map;
+		};
+
+		pil_cdsp1_mem: pil-cdsp1@9d700000 {
+			reg = <0x0 0x9d700000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_cvp_mem: pil-cvp@9f500000 {
+			reg = <0x0 0x9f500000 0x0 0x700000>;
+			no-map;
+		};
+
+		pil_video_mem: pil-video@9fc00000 {
+			reg = <0x0 0x9fc00000 0x0 0x700000>;
+			no-map;
+		};
+
+		audio_mdf_mem: audio-mdf-region@ae000000 {
+			reg = <0x0 0xae000000 0x0 0x1000000>;
+			no-map;
+		};
+
+		hyptz_reserved_mem: hyptz-reserved@beb00000 {
+			reg = <0x0 0xbeb00000 0x0 0x11500000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@d1900000 {
+			reg = <0x0 0xd1900000 0x0 0x3800000>;
+			no-map;
+		};
+	};
+
+	firmware {
+		scm {
+			memory-region = <&tz_ffi_mem>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 9997a29901f5..bf273660e0cb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -514,7 +514,6 @@ firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
-			memory-region = <&tz_ffi_mem>;
 		};
 	};

@@ -773,6 +772,11 @@ sail_ota_mem: sail-ss@90e00000 {
 			no-map;
 		};

+		gunyah_md_mem: gunyah-md@91a80000 {
+			reg = <0x0 0x91a80000 0x0 0x80000>;
+			no-map;
+		};
+
 		aoss_backup_mem: aoss-backup@91b00000 {
 			reg = <0x0 0x91b00000 0x0 0x40000>;
 			no-map;
@@ -798,12 +802,6 @@ cdt_data_backup_mem: cdt-data-backup@91ba0000 {
 			no-map;
 		};

-		tz_ffi_mem: tz-ffi@91c00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x0 0x91c00000 0x0 0x1400000>;
-			no-map;
-		};
-
 		lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
 			reg = <0x0 0x93b00000 0x0 0xf00000>;
 			no-map;
@@ -815,62 +813,77 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@94a00000 {
 		};

 		pil_camera_mem: pil-camera@95200000 {
-			reg = <0x0 0x95200000 0x0 0x500000>;
+			reg = <0x0 0x95200000 0x0 0x700000>;
 			no-map;
 		};

-		pil_adsp_mem: pil-adsp@95c00000 {
-			reg = <0x0 0x95c00000 0x0 0x1e00000>;
+		pil_adsp_mem: pil-adsp@95900000 {
+			reg = <0x0 0x95900000 0x0 0x1e00000>;
 			no-map;
 		};

-		pil_gdsp0_mem: pil-gdsp0@97b00000 {
-			reg = <0x0 0x97b00000 0x0 0x1e00000>;
+		q6_adsp_dtb_mem: q6-adsp-dtb@97700000 {
+			reg = <0x0 0x97700000 0x0 0x80000>;
 			no-map;
 		};

-		pil_gdsp1_mem: pil-gdsp1@99900000 {
-			reg = <0x0 0x99900000 0x0 0x1e00000>;
+		q6_gdsp0_dtb_mem: q6-gdsp0-dtb@97780000 {
+			reg = <0x0 0x97780000 0x0 0x80000>;
 			no-map;
 		};

-		pil_cdsp0_mem: pil-cdsp0@9b800000 {
-			reg = <0x0 0x9b800000 0x0 0x1e00000>;
+		pil_gdsp0_mem: pil-gdsp0@97800000 {
+			reg = <0x0 0x97800000 0x0 0x1e00000>;
 			no-map;
 		};

-		pil_gpu_mem: pil-gpu@9d600000 {
-			reg = <0x0 0x9d600000 0x0 0x2000>;
+		pil_gdsp1_mem: pil-gdsp1@99600000 {
+			reg = <0x0 0x99600000 0x0 0x1e00000>;
 			no-map;
 		};

-		pil_cdsp1_mem: pil-cdsp1@9d700000 {
-			reg = <0x0 0x9d700000 0x0 0x1e00000>;
+		q6_gdsp1_dtb_mem: q6-gdsp1-dtb@9b400000 {
+			reg = <0x0 0x9b400000 0x0 0x80000>;
 			no-map;
 		};

-		pil_cvp_mem: pil-cvp@9f500000 {
-			reg = <0x0 0x9f500000 0x0 0x700000>;
+		q6_cdsp0_dtb_mem: q6-cdsp0-dtb@9b480000 {
+			reg = <0x0 0x9b480000 0x0 0x80000>;
 			no-map;
 		};

-		pil_video_mem: pil-video@9fc00000 {
-			reg = <0x0 0x9fc00000 0x0 0x700000>;
+		pil_cdsp0_mem: pil-cdsp0@9b500000 {
+			reg = <0x0 0x9b500000 0x0 0x1e00000>;
 			no-map;
 		};

-		audio_mdf_mem: audio-mdf-region@ae000000 {
-			reg = <0x0 0xae000000 0x0 0x1000000>;
+		pil_gpu_mem: pil-gpu@9d300000 {
+			reg = <0x0 0x9d300000 0x0 0x2000>;
 			no-map;
 		};

-		firmware_mem: firmware-region@b0000000 {
-			reg = <0x0 0xb0000000 0x0 0x800000>;
+		q6_cdsp1_dtb_mem: q6-cdsp1-dtb@9d380000 {
+			reg = <0x0 0x9d380000 0x0 0x80000>;
 			no-map;
 		};

-		hyptz_reserved_mem: hyptz-reserved@beb00000 {
-			reg = <0x0 0xbeb00000 0x0 0x11500000>;
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
+		firmware_mem: firmware-region@b0000000 {
+			reg = <0x0 0xb0000000 0x0 0x800000>;
 			no-map;
 		};

@@ -915,7 +928,7 @@ deepsleep_backup_mem: deepsleep-backup@d1800000 {
 		};

 		trusted_apps_mem: trusted-apps@d1900000 {
-			reg = <0x0 0xd1900000 0x0 0x3800000>;
+			reg = <0x0 0xd1900000 0x0 0x1c00000>;
 			no-map;
 		};

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index bcd284c0f939..a9ec6ded412e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

-#include "lemans.dtsi"
+#include "lemans-auto.dtsi"
 #include "sa8775p-pmics.dtsi"

 / {
--
2.49.0


