Return-Path: <linux-arm-msm+bounces-67579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381DDB193A0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75FC43A7833
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CA125DB0D;
	Sun,  3 Aug 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcY2/U+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABFF1E8836;
	Sun,  3 Aug 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218896; cv=none; b=qXCBu2wmuMiF7/k50iFuF4dgPwHsRqq9ivzaufpIHzEInqQFPR+4IVv3k/OGEoPmwXoEBmKAyxF9uZLS52i9wGhBgJcY7KZlT6HcnPE89+XCveov/Mwczjs/a+2oj+2vcr6LD7yhPhn2skGcjGuqnrlxbpFzCDVO2BxSSOy7uHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218896; c=relaxed/simple;
	bh=CYgP8Ll5SvplyiTQ3OAauJhL1o8r03BtZtIGWIpG9Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQg0X0Kjm4x9siJ8ZNRwgJ95jm4gfM7t4b0YqJgv8OQsQDa955PJnCINxIN2x4MwBYKcp8kHrk89S1DjX0pPXuin7GCv3kudEJ4wG6/GF7I5KZS6K6r2Cu7gpSZzKblKS0IkSMDHvLFp9iNPxhDpFf83PXlwNvVEDZMoxRrH/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcY2/U+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573ADZDi025786;
	Sun, 3 Aug 2025 11:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3+2Kx+29CuM
	Isypee0x+FRiHwk11e6XrHMzIjqMG7O8=; b=WcY2/U+uyY68YiZBBdHsvetKUoL
	GTrQrL3CmETUOlAfehNo2gLt2H70/3e33w5UTpKMWHs1ypnNjrTPuZ5cFqBKd8be
	9hEmvnBBCXVIl5eHbliXJEJEzLngorv3pvkv/dz71y7NEpHMOCrSrx8cv+DZLvJB
	FHESQNX14K5j5I2AUya9688fSEpvx7Dh6YVyBu91mAvUjnnpeaQEZyzKk/j1ixKG
	Vr4s2yFWR1zbfi/KpIsrm/PsU+3R39WyoyJG96cCyfHvokjMLHdicgtMRstN3Hlx
	04cjDliKEsOfM3aEXp54raBPCQmPX//YDxQggpgxnmPKvlnXrmK/3x50+/A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899paa8pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1Jv8015301;
	Sun, 3 Aug 2025 11:01:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke03t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1Jdb015277;
	Sun, 3 Aug 2025 11:01:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1JAA015268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 75E79509; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
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
        Prakash Gupta <quic_guptap@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/8] arm64: dts: qcom: lemans: Update memory-map for IoT platforms
Date: Sun,  3 Aug 2025 16:31:06 +0530
Message-ID: <20250803110113.401927-3-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfX+AuA9f3qzTCa
 kT+rb/meXeWXUtgdmz8ysZdb/pTalxxwrw5QHS8TilJeHNgn+9cSKGxuAWrojensOpz/21L4bXj
 MjXB9m3W0Vz6nwWGo+C40A7VZG5QCdErrCW9rbYm5/KntG4WAu8F08jo1Ljsu+924eLUrZoFMJT
 mXjjfixa8IGX7vNzWDHqzqiGl6tGIlBCsPZkDBIa/e/Hz8PMttEcV5SMKPJwBONAyjien2XIutr
 FB1wrly/ioXv2QOrkTIn/AvJC8H259QI1McBsXyA9wJ+bNVyrq1U263vdt1PoIK1RBusUYQ1Vd/
 7LkUcSjFj1A5u2aONVJx/vDztz2uEPi+l6FgpDdzGoAhbE0VLXinlsZWvWxl6qAqEtpvu8ugeX4
 TDBRqv8di0kPNWRw7gLNOyMCmVR5oaNaU8v1nb6gklXuvkqJ3RcUl6Fly6/UlXYBevwPIF2D
X-Proofpoint-GUID: W7NSuLlYzXCC_zemiiuMSFkbOGm3fjHZ
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=688f4183 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ikluo-ACZQ6V8kX-x88A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: W7NSuLlYzXCC_zemiiuMSFkbOGm3fjHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 mlxlogscore=856 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030073

The "automotive" memory map is the special case for the Lemans
configuration described by this dtsi, move it aside and use the IoT
memory map as the baseline.

Introduce "lemans-auto" as a derivative of "lemans" that retains the
old automotive memory map to support legacy use cases.

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
Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.50.1


