Return-Path: <linux-arm-msm+bounces-74964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B304B9DB0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B472E31CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BF42F998C;
	Thu, 25 Sep 2025 06:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3d/0jBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68472F9996
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782051; cv=none; b=eWYPseIGfc3pJz1jQANpSlaNXdbwsavzsTTMcz4yAL4s9Yo6cdAfOlv/9RS5EUkSS5hEQrS5tpYC5emkMhCP5yZylgC67OAzuV5Tn2Ay8qStJtX7kIKhecF7Wn21Hn52e33ClHCn+Y5QOdD5AwCE+6PxSXiRf7T3aET/Trls+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782051; c=relaxed/simple;
	bh=yedJEEqL4ZUtTo4ypXp6TiEKX/zqnJ9N75AqBUCVR0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nONyOqyqbx5YFUUaa0dY2TYn/2H8CCt7ysCwh3auXcm0JAay3fY/HttaD12ZoVjtgi4mVDqEnDWc0dJ7ruTqCTFkIP8tIS7HjGn1oZikUzeHyS5yCREzpVPnfn225KdjcvEOlp2aCPFTZeWJ2uYLliGVgaTVd1D0hn3zHMCeKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3d/0jBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1fAfV017420
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M+AtpvCg1CmpAe9sYGyWQJouaSiovRLjPzDEo50wF9Y=; b=I3d/0jBt86AqBxzc
	t24PNTRjUmNhpRlQ8ynOBwPJieYujq9GIIwsE91xzS6DAuRs9N9YxygtthLAn51i
	3dThV63mQF7pIwitdXiMj40qkf01Vi7OWHpA5g4dgsYHL7AhxXY5HqLyjx/O5xIz
	JvnenCEp7utn7irzfnP0v4z89SUoFDANLsOK2eWlU8DFm9UDz9EF6WBoigUPT/9e
	5WYTrlW3EFT2xqboDwvYo1ZgTgUEbreY+QB2LslmTW0dOBDJ7QczzBuhYZbIrZ3E
	qd6zvJHtlqmEAjtP0w9xgkyTQuiiUsIqD2bc8mGHY/KFPX8TDbe+6jwTDwCEtd4k
	nwJvSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0c85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54ad69f143so860038a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782048; x=1759386848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+AtpvCg1CmpAe9sYGyWQJouaSiovRLjPzDEo50wF9Y=;
        b=ay3cdBrowgov5m7swWXI+IZ2FC/xGMUnFiDk5gsI4ErSDbsuT3nH856SeQfZ4yGElI
         YCyOe/wi1bY1P/acSLWSAkguJRY0TWE443jppBR0cgLijLRWTVbuHENcfoRN/NJsVvAd
         SoT/Aegd3lwY4LNvAttNPu9Pf0m1Z8GGUNm4w+ejFFripOsJRy0G08281rj3MSLXHmaL
         jbztT0CxZ/PgvJ97wjnD9gqyiEP85RnyQvErB1i7FemDEzdBNZSGob/OHPYk+n3sni8c
         NOQddtyg4Lu9F+/8WaIDJnAvbYZACZGZKie9jdm6LKoO6kghu2heeeYyNQ9Bv04SX6Pt
         zIQA==
X-Gm-Message-State: AOJu0Yxla92P72qGi+jpQCFOUZ3th9Fs/uEui8S4MIxMrifzcpou+iUa
	RtmwsGuprfDAj2N2z9KnjjsJc5IVu8NHnXvazQM1ylrdXQSpa6PV4i41WT1BrGL/OyeJKEVmqho
	7QTNCyWDnptb4Fpn+W2bh0lvdIFVViRqd6d/quK+EKhmZWdk5vKRzDKXolSlMY3DSD297
X-Gm-Gg: ASbGncsDY73JFw2Tswvfj379Htsy1UD4MY1RGJFQPOp9ZuG2jOxYVlLEiUoBME1VxeR
	dSJqz1+bPwBGNqD3bPRhIIptmjlNRZddUZamg0UW3l7zJmxBNyay4u8RkYPqtDGDhuPXOGtaBYF
	HaPckYso5W04yoxcclXpP46V8TbDsWIkeLbQiQg/ZOFq/fADq+8Cr8Y5NC2bVwg8tO3YEtICZxH
	KpCp6iVEYG3xE/RQ+lygnTG2mFmJo57PdI+JWhFqIwm6OZ8dNSR7cAXcuM4lGTn8Ov1IvdYqlZp
	9ovBwHD/vbvRj9yk95OqY5VfMPnJ+rgkpuTM307zPpmbz/vDDy2YHqlJ/436Ir69GV/IkODZV3z
	5IWc0UW+r1mcij9073iprcJjrYImO1Ewr0YVKcelrr6eYk7maPFIrD9be8+Vj
X-Received: by 2002:a17:902:c94d:b0:26f:7db2:3e1e with SMTP id d9443c01a7336-27ed4a492b5mr23503925ad.47.1758782048357;
        Wed, 24 Sep 2025 23:34:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgrF8YXI5qrH2oGWaWVaROurOESlVDpfoWAlJYyO0U4Gqvvnt9Hj5fX1Qq40tnD437M10PWw==
X-Received: by 2002:a17:902:c94d:b0:26f:7db2:3e1e with SMTP id d9443c01a7336-27ed4a492b5mr23503725ad.47.1758782047864;
        Wed, 24 Sep 2025 23:34:07 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:07 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:23 +0530
Subject: [PATCH 15/24] arm64: dts: qcom: glymur: Add PMICs dtsi for CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-15-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: mWz1gvWB-g_7Uamjxs3WEM1lBM1DfUF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX/aCIZsP5xBzo
 gCX5aGumLmHxkYPuhmajRKKmAQeWYwI30IV0+llOucPirSrTzzm4VYqBiRMDL6QKec7cRfuKhZh
 Wg6iYEqKLYRxiSdZjUufDj0pvQZiRQDUB/s/LJNA0GHGGLiddXJ00JmslD3JPBVV6ZYUPbM6hi8
 kGLfRilKsAI84CCcanXHve4uBUgZfbBJytaY+UAibctOlrQcq887C2KxsjAH/AY1UhLqcMGu5ct
 mnAe5ZWl5FYOp4zMZ29Cwds4V0ZIsZM9M+Sls3WixpPnRb8wKMhV1ABZ8kPMN+G3+WFrb/WOv/n
 QgtE1myVKlLpXiQpJT3TiEH7TpNjmR+rxEZ1yhI1cXkNwstarpJLnuYxquW3jBmIKZBPXLGAC85
 fNG0EtLL
X-Proofpoint-GUID: mWz1gvWB-g_7Uamjxs3WEM1lBM1DfUF9
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e261 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-PhwRXPgPXS4kyLjRL8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Include all the PMICs present on the Glymur board into
the glymur CRD DTS file.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts    |  1 +
 arch/arm64/boot/dts/qcom/glymur-pmics.dtsi | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index e89b81dcb4f47b78307fa3ab6831657cf6491c89..97f6eedd7222368f5cbfdd02e9c4d87261d7f19a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
+#include "glymur-pmics.dtsi"
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..59dcfb67a203a7c576406037377fc9fbdce51a97
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define PMH0110_F_E0	0x5
+#define PMH0110_H_E0	0x7
+#define PMH0104_I_E0	0x8
+#define PMH0104_J_E0	0x9
+
+#define PMH0110_F_E1	0x5
+#define PMH0104_L_E1	0xb
+
+#include "pmk8850.dtsi"	/* SPMI0: SID-0*/
+#include "pmh0101.dtsi"	/* SPMI0: SID-1*/
+#include "pmcx0102.dtsi"	/* SPMI0: SID-2/3/4/6	SPMI1: SID-2/3/4 */
+#include "pmh0110.dtsi"	/* SPMI0: SID-5/7	SPMI1: SID-5	*/
+#include "pmh0104.dtsi"	/* SPMI0: SID-8/9	SPMI1: SID-11	*/
+#include "smb2370.dtsi"	/* SPMI2: SID-9/10/11*/

-- 
2.34.1


