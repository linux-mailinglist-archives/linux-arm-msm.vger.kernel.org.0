Return-Path: <linux-arm-msm+bounces-20147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A968CB3B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E81D2825D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6529C149C6A;
	Tue, 21 May 2024 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DmYV9SnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A54F149011;
	Tue, 21 May 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316849; cv=none; b=XZ92BQ/yJ2VDgxLLcbXM1qLDj1MkXFPMPCRX8Mhm4WixkVr4JN1GlD4YvwoZFd7gCXprIr5hzNcs971f424YjnOlJYyqFKLSA51xbUPqxXyT2q3GvXLefg9stcqsBpiVIIHenGQ7wRv3r8LjoPtktDZqIDOhtX7WQZ3UcYAZSdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316849; c=relaxed/simple;
	bh=svX454L73EMuirziWipo2A5ykvfNkU64QfZlqYwY4lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RBsQ5tFKzTH4XZYIVZdi2uTxOzMrtGlWM9vNxo1xVEVUipzszyRANUNzzGILLrItaXDi56J2POZYXdvny54vAsPuWHCpAr07x1S4fJLgMr3nAjDuhLqQLlRuxntBMdSzqC/SWHZqOYLv7KqGpNurbDyHoE3q1kQ7lrYHKG7XD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DmYV9SnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LCOAqL018275;
	Tue, 21 May 2024 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=bLJS9SRClb/39GErtcxjZ/NjKaKPQ4DvHuL8dZn9IE0
	=; b=DmYV9SnTmnJEENuCi8lE85Te6Ld9IbF26dsEfeZqJNqFkx92+b279VNedis
	HlccHu/y1CkVtGYgdtS0IonaKw4V+i3elBViIusaUswasPtfu0dAbJvXWAIiGkRn
	8Ekr9ZbU8VmatJ6EyNZIV+W1nkCDGuGjWMPZCDIwSe2wBxi59z7eqSUrzxxeOvZM
	KbOdDg+wKTqqSNPuswOcYRpBoDn03JVpt0Rdh5y3ZKMwwhxx4l/hmNx2I0BrK4s2
	pDtlgmxufWkgBk/VENe2nBi74C2n+sEJZp3GvHYB1iaW4JKKZjqbdG4rpZOdoxz/
	qcIU7lKDJEFOu53V0AdBR11TmKw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4p7c7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcRIA020132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:27 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:26 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:38:01 -0700
Subject: [PATCH RFC v3 4/9] dt-bindings: arm: qcom: Update Devicetree
 identifiers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-4-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DtQhngKaOHN50LilzhejxnCo_Zg7dO3B
X-Proofpoint-GUID: DtQhngKaOHN50LilzhejxnCo_Zg7dO3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=788 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210139

From: Amrit Anand <quic_amrianan@quicinc.com>

Update existing documentation for qcom,msm-id (interchangeably:
qcom,soc-id) and qcom,board-id. Add support for qcom,pmic-id, qcom,oem-id
to support multi-DTB selection on Qualcomm's boards.

"qcom,soc-id", "qcom,board-id" and "qcom,pmic-id" are tuples of two 32-bit
values. The "qcom,oem-id" is a tuple of one 32-bit value.
Introduce macros to help generate SOC, board, PMIC and OEM identifiers.
QCOM_SOC_ID and QCOM_SOC_REVISION can be used to generate qcom,msm-id.
QCOM_BOARD_ID and QCOM_BOARD_SUBTYPE can be used to generate qcom,board-id.
QCOM_PMIC_SID and QCOM_PMIC_MODEL can be used to generate qcom,pmic-id.
QCOM_OEM_ID can be used to generate qcom,oem-id.

Add entries for different types of SoC, boards, DDR type, Boot device
type which are currently used by Qualcomm based bootloader.

Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 86 ++++++++++++++++++++++++++++++++++----
 1 file changed, 77 insertions(+), 9 deletions(-)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 51e0f6059410..0cb521f0c0e7 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -8,9 +8,14 @@
 #define _DT_BINDINGS_ARM_QCOM_IDS_H
 
 /*
- * The MSM chipset and hardware revision used by Qualcomm bootloaders, DTS for
- * older chipsets (qcom,msm-id) and in socinfo driver:
+ * The MSM chipset ID (soc-id) used by Qualcomm bootloaders,
+ * and in socinfo driver:
+ * where, "a" indicates Qualcomm supported chipsets, example MSM8260, MSM8660 etc
  */
+
+#define QCOM_SOC_ID(a)  ((QCOM_ID_##a) && 0xffff)
+
+
 #define QCOM_ID_MSM8260			70
 #define QCOM_ID_MSM8660			71
 #define QCOM_ID_APQ8060			86
@@ -267,16 +272,79 @@
 #define QCOM_ID_IPQ5302			595
 #define QCOM_ID_IPQ5300			624
 
+ /* The SOC revision used by Qualcomm bootloaders (soc-revision) */
+
+#define QCOM_SOC_REVISION(a)		(a & 0xff)
+
 /*
- * The board type and revision information, used by Qualcomm bootloaders and
- * DTS for older chipsets (qcom,board-id):
+ * The board type and revision information (board-id), used by Qualcomm bootloaders
+ * where, "a" indicates board type which can be either MTP, QRD etc
  */
+
 #define QCOM_BOARD_ID(a, major, minor) \
-	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | QCOM_BOARD_ID_##a)
+	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | ((QCOM_BOARD_ID_##a) & 0xff))
+
+#define QCOM_BOARD_ID_MTP		0x8
+#define QCOM_BOARD_ID_LIQUID		0x9
+#define QCOM_BOARD_ID_DRAGONBOARD	0xA
+#define QCOM_BOARD_ID_QRD		0x11
+#define QCOM_BOARD_ID_ADP		0x19
+#define QCOM_BOARD_ID_HDK		0x1F
+#define QCOM_BOARD_ID_ATP		0x21
+#define QCOM_BOARD_ID_IDP		0x22
+#define QCOM_BOARD_ID_SBC		0x24
+#define QCOM_BOARD_ID_QXR		0x26
+#define QCOM_BOARD_ID_X100		0x26
+#define QCOM_BOARD_ID_CRD		0x28
+
+/*
+ * The platform subtype is used by Qualcomm bootloaders and
+ * DTS (board-subtype)
+ * where, "a" indicates boot device type, it can be EMMC,
+ * UFS, NAND or OTHER (which can be used for default).
+ * "b" indicates DDR type which can be 128MB, 256MB,
+ * 512MB, 1024MB, 2048MB, 3072MB, 4096MB or ANY 
+ * (which can be used for default).
+ */
+#define QCOM_BOARD_SUBTYPE(a, b, SUBTYPE) \
+	(((QCOM_BOARD_BOOT_##a & 0xf) << 16) | ((QCOM_BOARD_DDRTYPE_##b & 0x7) << 8) | \
+	(SUBTYPE & 0xff))
+
+/* Board DDR Type where each value indicates higher limit */
+#define QCOM_BOARD_DDRTYPE_ANY		0x0
+#define QCOM_BOARD_DDRTYPE_128M		0x1
+#define QCOM_BOARD_DDRTYPE_256M		0x2
+#define QCOM_BOARD_DDRTYPE_512M		0x3
+#define QCOM_BOARD_DDRTYPE_1024M	0x4
+#define QCOM_BOARD_DDRTYPE_2048M	0x5
+#define QCOM_BOARD_DDRTYPE_3072M	0x6
+#define QCOM_BOARD_DDRTYPE_4096M	0x7
 
-#define QCOM_BOARD_ID_MTP			8
-#define QCOM_BOARD_ID_DRAGONBOARD		10
-#define QCOM_BOARD_ID_QRD			11
-#define QCOM_BOARD_ID_SBC			24
+/* Board Boot Device Type */
+#define QCOM_BOARD_BOOT_EMMC		0x0
+#define QCOM_BOARD_BOOT_UFS		0x1
+#define QCOM_BOARD_BOOT_NAND		0x2
+#define QCOM_BOARD_BOOT_OTHER		0x3
+
+/*
+ * The PMIC slave id is used by Qualcomm bootloaders to
+ * indicates which PMIC is attached (pmic-sid)
+ */
+
+#define QCOM_PMIC_SID(a)		(a & 0xff)
+
+/*
+ * The PMIC ID is used by Qualcomm bootloaders to describe the ID
+ * of PMIC attached to bus described by SID (pmic-model)
+ */
+
+#define QCOM_PMIC_MODEL(ID, major, minor) \
+	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | (ID & 0xff))
+
+/*
+ * The OEM ID consists of 32 bit value to support OEM boards where they
+ * have slight differences on top of Qualcomm's standard boards
+ */
+#define QCOM_OEM_ID(a)		(a & 0xffffffff)
 
 #endif /* _DT_BINDINGS_ARM_QCOM_IDS_H */

-- 
2.34.1


