Return-Path: <linux-arm-msm+bounces-38295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2E9D226D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBC3281B92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 09:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C9819CC14;
	Tue, 19 Nov 2024 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FFF7Pwpk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48DC146A73;
	Tue, 19 Nov 2024 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008322; cv=none; b=pWOHwE0v/AvAMUWaNmG1/xJ9Y2xNgXIqMx++NBOtyQuzhKMd1v1Fz+qiF7typX0PNGZYRaHjzKE9QOH8ehexz2DU0k/xwDcCSfewAKYtRYMBGd9SBT4h3y28+GF5dGPEaTJwzZboAOgiEEuQETEzMzbvWEu+2Fdl33dvJQN/C2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008322; c=relaxed/simple;
	bh=MfIk1FFoVmtGqYMb0aT0uhe0ilKeUX9d4khhphdqw18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vvn8Pq/VCaLBpZ0Hvp1X3y1Xg47DCNJZSUkaN7g1/pbtA2Tfy6Drl2aHC+vegnaBgAjxuoRrRBqo5RP3RwfqL22W2GphAE+77NwvM2eT3VXtL1IYER5LUPiyAE034lxVG9nIoGcMESJ5uiEuGsismvW4a/O9IIWFSnrbkbUiMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FFF7Pwpk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7l58W029936;
	Tue, 19 Nov 2024 09:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=/UqtSrtUW9K9gpzDqUDSAOOruYpRidbGEjB3tUkpRG0=; b=FF
	F7Pwpks2NwV8K7Tgf9/qVCRSjyS3J2Dt43GASqT6Em2TK4DXWW3lH4jfe8pWm8Po
	K6LosMP7lM/cOl8zihmbP9BuGkBYMsdllkRQsrP+k3WjK3MOSdLWGQ8A+8anQPmV
	7VZOM7/RjSN9ayYpEfRcR9/Y0mGQylQpi6CQ313J16gN6rb9R7/jLuvyQaqR9Cvu
	cF3jGVvNbrKTDe5by+ics9FqYvyRJGMum6SwYjNE7bQB6RWFdfXI2kr/moTn/2Nv
	pCza3iT0JSvxheBw/Crc8aOBUZkj7pWwOTmyEIbutlvKvVvHXnd5skDNR8wpZbAQ
	uLJ6OMS2uQE7xTMQcx/g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6a2r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:25:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ9PJHr001948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:25:19 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 01:25:15 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: Bjorn Andersson <bjorn.andersson@example.com>,
        Konrad Dybcio
	<konrad.dybcio@example.com>,
        Rob Herring <rob.herring@example.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@example.com>,
        Conor Dooley
	<conor.dooley@example.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tengfan@quicinc.com>,
        <quic_shashim@quicinc.com>, Pratyush Brahma <quic_pbrahma@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: qcs9100: Update memory map for QCS9100 Ride and QCS9100 Ride Rev3
Date: Tue, 19 Nov 2024 14:55:01 +0530
Message-ID: <20241119092501.31111-1-quic_pbrahma@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FKf-pceV9m5In98iAU0npiJIutkP6eXt
X-Proofpoint-GUID: FKf-pceV9m5In98iAU0npiJIutkP6eXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190067

This patch series is based on Tengfei Fan's patches [1] which adds support
for QCS9100 Ride and QCS9100 Ride Rev3 boards.

Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
introduced and the size and base addresses have been updated for
a few of existing carveouts compared to SA8775P. Also, tz_ffi_mem carveout
and its corresponding scm reference has been removed as it is not required
for these boards. Incorporate these changes in the updated memory map
for QCS9100 Ride and QCS9100 Rev3 boards.

[1] https://lore.kernel.org/all/20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com/

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 100 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts    |  99 ++++++++++++++++++
 2 files changed, 199 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 759d1ec694b2..0fa1afc0de17 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -5,7 +5,107 @@
 /dts-v1/;
 
 #include "sa8775p-ride-r3.dts"
+
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
+/delete-node/ &tz_ffi_mem;
+
 / {
 	model = "Qualcomm QCS9100 Ride Rev3";
 	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
+
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
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index 979462dfec30..f79954ae0d38 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -5,7 +5,106 @@
 /dts-v1/;
 
 #include "sa8775p-ride.dts"
+
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
+/delete-node/ &tz_ffi_mem;
+
 / {
 	model = "Qualcomm QCS9100 Ride";
 	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		gunyah_md_mem: gunyah-md@91a80000 {
+			reg = <0x0 0x91a80000 0x0 0x80000>;
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
 };
-- 
2.17.1


