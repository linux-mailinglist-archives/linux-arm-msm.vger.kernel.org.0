Return-Path: <linux-arm-msm+bounces-61157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9082AD7EF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B9B93B6AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E722DECCC;
	Thu, 12 Jun 2025 23:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QXKCPUaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414E1DED60;
	Thu, 12 Jun 2025 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771515; cv=none; b=MmecZ8jXyQ64i5yz7yhLWpDht5r+6QU+PCL/YunlUIqCB37FdWh5qeeLWPAqURx2uyKNR78gjlbHYIMATqefKXnMXIofvkpFnU50k1L47KJwN3xQRNsiRJMGpTkxrJDoDj7LDQPifvJ3k4kVIaBoylWXsPUMCnc9iCpJ5qG64UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771515; c=relaxed/simple;
	bh=22sqEzXBV99yi3CgoNTapLxej6vlIPE4LNYig5EjmA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q5hQrmsyPLzSneRVc/y/3jo5rcb3bMy+mI0XJxvrmm40C774RVldJ9trWc6QVAImybN70SrhtgLE+tCbUMw+jr252wpS+pNC0xhwhNHviQeUQZdDsB6aQzxbPTbwP6pGwIFHlPB0lD5J7RaKaK99/lzD2cZZXJWPpFpbzb8cYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QXKCPUaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CG9GZ8029304;
	Thu, 12 Jun 2025 23:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rhVIglQ2ZGb
	HVfJI9bjqxtl5itXIMMUw/CfXs+/1hr4=; b=QXKCPUaInfrt4pKvVxvWGQUSIAm
	g3MHvu6qTjSECnHNTlmUaVHBvfK4Xd/HKdrgFnYzZhHDLG5sHPiFccKp/2fQhjaC
	jT54TK9G1885v45UNT6icYKGLmiqIp3K90qshJO8Cxxsku4qUArFVfKuHACFzSLZ
	je9uFwU3PXyDYoyopkYVYTC4em3P5lH0B6h+TCzZJ0YGPcaKpUTUE92yZVCNHpW2
	vAB4ka1pJh8YAFKEAvwh4W0wc13vPmzh6cC8+EK2Cbi96HeJJyO94KvgkzPiFsNF
	MobSYb1mo9PxuDcT3jVcss56ibhrlB2NHt52Jslu3WJS/JXOUgYqrNocYMw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6j56c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CNcQAm017016;
	Thu, 12 Jun 2025 23:38:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 474egnstc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:26 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55CNcPLO016974;
	Thu, 12 Jun 2025 23:38:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55CNcPMj016960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id B62105B1; Thu, 12 Jun 2025 21:24:53 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
Subject: [PATCH v10 2/3] arm64: dts: qcom: Add qcs9075 IoT SOC devicetree
Date: Thu, 12 Jun 2025 21:24:33 +0530
Message-ID: <20250612155437.146925-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612155437.146925-1-quic_wasimn@quicinc.com>
References: <20250612155437.146925-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE4MSBTYWx0ZWRfX687NxZrEV8Y3
 lyQGSCax9NkgDkDS02Z+y+/librZdg1ym4JPQDR8RHVubWMhFwt3P26x4Dp6yEhsWbbAXapBLcE
 kaz6a+Xj4kMRbt0Fq3GocW/XO9uubITu1TegJGKWqxgLr7TUnMYgaZFFxeXkCjOE2tDIQj/7MMZ
 fj8/TnKzyzvJt7ZE7w/n7MYMZ0GfUFb3awzyJf/S/UacbtQgbTDN8GC20Aw8UVD4RuSCDEAzyc7
 UrzD0zK82qST2ia4aBDJQrPCYfDteBD3t10dyZUQdCgxkPezxOyxDk8p7UY3AjeBjFSqeat/cHF
 Ld3CgYfq2yCwNu64Exq5VjPzHQuO/xJIAz7FiZvIr/ZKloZjfWM9kYq5idDRgpzu3eVyw/sdAZm
 O11nniQJpElIL1Gdy0iZYJPF7pz/gXGX/hWdaTA+KfUQcEv7GupsDtCcTlmRbh6+6mkC/LJL
X-Proofpoint-GUID: NQ7t1TuFwTii-D5vfwQJ-q7SY4uHOQ0e
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684b64f6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=chaKqUlkWSQuSFSvV04A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NQ7t1TuFwTii-D5vfwQJ-q7SY4uHOQ0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=989 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120181

QCS9075 is an IoT variant of SA8775P SOC, most notably without
safety monitoring feature of Safety Island(SAIL) subsystem.
Add a new device tree file for the QCS9075 IoT SOC, which inherits
changes from the SA8775P SOC. Update the memory map to reflect the
differences between the two SOCs.

As part of the memory-map updates, introduce new carveouts for
gunyah_md and pil dtb, and adjust the size and base address of the
PIL carveout to accomodate the changes. Increase the size of the
video/camera PIL carveout without breaking any features.

Reduce the size of the trusted apps carveout to meet IoT requirements.
Remove audio_mdf_mem, tz_ffi_mem, and their corresponding scm
references, as they are not required for IoT parts.

Co-developed-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
Co-developed-by: Prakash Gupta <quic_guptap@quicinc.com>
Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075.dtsi | 116 ++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs9075.dtsi b/arch/arm64/boot/dts/qcom/qcs9075.dtsi
new file mode 100644
index 000000000000..f3b1c5788367
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075.dtsi
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sa8775p.dtsi"
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


