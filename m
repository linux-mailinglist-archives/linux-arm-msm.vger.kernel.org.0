Return-Path: <linux-arm-msm+bounces-74961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B4B9DAEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC463BA76D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF112F7AB6;
	Thu, 25 Sep 2025 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyTDdLWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950182F0694
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782042; cv=none; b=fOF8nndrGnQcMx9speGN81DSawKjid8XU/R47sT6RAaOtPzuJuInQe++NsTkYcwdxk6SSshe73M1St9Bl5iw5SmNy57s7DoskrcN07aHxrzwIa4sLvdKaeikRoVe5YKar/ujbg3clRiAg76R2lpRuILPP03Rs+lEWctJhzzGWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782042; c=relaxed/simple;
	bh=uBpyNXxBek34lXoKZHB1xpUK1S6YGoyCu6EJBXVQ9MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6mBwdFANpXUuyfogf6usIuiam7nCMJROsIGYDkF0vOBn//EyXMVgeUO3m9Gve3evxpCkHl1iG9WA6Rt+KCyTEWrJc00ZlTg2bClvvNgh7zw5fs1oyoajJ4YMu13frVBdzwMiuj+wH/3/sdGlqNF5HzCnr0o4BHR8FOwqeVLRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyTDdLWN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1Rx4F019931
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Kj8zpXnqTa4oRX6rrL1uXULQtmQx7l8fFyKB5TkaB0=; b=OyTDdLWNRyJpLFEv
	h4nEJ4PiNatMEUfQpInyFBR28ciRoGvk+OudJKnw7QuPtXjG63cFboCdHiYANwzB
	akgvgmV/BX8MYdTqnq5FsfY3MeHzWSEF3cPJJfSeZv9CPRIHu/Pvi/qdj4pt29vr
	DSgxADBX3lxxfxQP9MPvMRKUsU9v71ZVDijG+NCw0vpYHD8NBZNtVi4Ain2ZzrX5
	hYmrOXJmOKFIeiCf5oqJaMJ4cZReZj9P5K1fGcUPD4GqDP1eGtlVJ2QQorITWpHP
	5IAA5SLUDUIytj+RoeQlWg7+mPo0vJ3H8oVj/vl1i0WXMuxcYkuog8sar2D/q6uU
	aXtUoQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe08x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-252afdfafe1so7181595ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782039; x=1759386839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kj8zpXnqTa4oRX6rrL1uXULQtmQx7l8fFyKB5TkaB0=;
        b=R3hHezie9Db5s7mY/dv9W0jlvH2KUw7LTsg6qMmoLkYUNMWuo2EhiItMhMVVMmV+qd
         98p1Q62ITOl0dwY3IcVlgqe/KJWhWAFy2peXCAMhcuzQEevNTIQ9BkAWmO7YVcG47kii
         i8P4ZoffeINpH0hxa9NDh1cpqoomGdjw24MNnUCMIOk7cLXBR/NlIunvNy+N8yaBgpG/
         2REiiYwZCjfvLIaa6m1bxVWY1kS/rVuGj9yHZDmgoU947mr04jMkPqTG1T4pcvP2ZTvt
         fayyPVL6DTmOwtfljAu+KoHRNHHewdnkrsgsk32he8RWu997xKH28jo5cWCYt0QtBcnx
         kaCQ==
X-Gm-Message-State: AOJu0YyMZKmp41tcRxfH1/rP2HEKFduS7GQji/aUa/a7ZM7K1Qi0CU1g
	JKV4gcucsfv4JWZPKr8NWs6ns1BmaUG2iAMrWxBa8M+RoDHTiLYk7ji1nsVOLKUDBINn06HFqot
	hwS7F8e5ZY1JNO06Rb6hY1dueIeJzAzLoA2wzQ1HAWlCTc7UpJPVpD2vaFwdonf0dmuYD
X-Gm-Gg: ASbGncvgXFGtnMD8Txo2MtQ6Ne4NwMViLFS62huwdVeQnXI8+vCesHEb53WSSNkUcT7
	Wr8risQpw8EvYCFkVPK4etJQVT1z/Ik6V1C6sc/gypcndamgUXnD7QZR/h6x91r2EZnahdcz1r9
	GrF48f+y7DAyyIDsrjLxj7thv3U8dGKuz+oAXiALoSfOT/sLUrwryvKizsT6lYjyxVw8ALkmJQY
	1VcK9roU2FUdWIRhksMWQP/e5TGMf2xsavxFaGKxBxLN9FxO4BO/7OoY55dZF3I3W6AfqY30kaz
	vQbuHFi7vm41O9XRqVqKjKZ6rsgWWrDNC4loekDe081Gy1RZ2JtyTUTdx10hdDkk8RoD09n3uw/
	74RM9sEUzcMKCv+4nV1IRyQbj8UoLb1VIMa8+cz0rmpJgbBZ696vYrQ5UDAxp
X-Received: by 2002:a17:902:f64d:b0:259:5284:f87b with SMTP id d9443c01a7336-27ed49d0965mr28719505ad.16.1758782038759;
        Wed, 24 Sep 2025 23:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp683rEPgCw8NvSk1RJU72jidt199quQvoOhetoHVrSwP2pinXYMmPcugbmk4ZmPCU9x8PAA==
X-Received: by 2002:a17:902:f64d:b0:259:5284:f87b with SMTP id d9443c01a7336-27ed49d0965mr28719235ad.16.1758782038289;
        Wed, 24 Sep 2025 23:33:58 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:57 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:20 +0530
Subject: [PATCH 12/24] arm64: dts: qcom: Add SMB2370 pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-12-24b601bbecc0@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Z7gvDV7wtKCC_-PYIClVdez-cSFnMHYW
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4e257 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SyH_bpr75tbjU19HRJsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Z7gvDV7wtKCC_-PYIClVdez-cSFnMHYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX7n7z8+vjxLUP
 mBL+CXLQ/HuYJExSi6ZdJwbVtkjdvONe6IZkyGq7IAygYveFHQM4lrmD4ZfM22D6eV0Nzux+GBv
 07qiX3y+KHc0ySrANBcN0MSIdAdEpOIcjREMtlWrh7bs5OE/0Ub09qwlCO2Xn1Rs41bAdygIeUi
 k/ZaOyTztiCJQAyowOR1RwOo7QoH0TlV7ogV6Oz2mCnjvXmoyNJ2WicbhOzvxNp6uw1x1C6xEab
 l4MhuMtVCcN2u/5H0UvairG08fb/h7u/vP/UcFO1ChBuhTRG4KfXr+KNuVWStQ5Se/fRlWw7ucX
 uYNvfc43j8TxOSIqKKmlVJy1iMm+kXACwTojtVDeOXfeTfbvC6AXdLIL8f3/mbDaiGxO8fp3nV9
 wILYQcI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add base DTS file for SMB2370 along with the eUSB repeater
node.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..80f3fdae5705044b5bd422ac3fc3a6fa6b0fc23c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+&spmi_bus2 {
+	smb2370_j_e2: pmic@9 {
+		compatible = "qcom,smb2370", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2370_j_e2_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2370-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+
+	smb2370_k_e2: pmic@a {
+		compatible = "qcom,smb2370", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2370_k_e2_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2370-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+
+	smb2370_l_e2: pmic@b {
+		compatible = "qcom,smb2370", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2370_l_e2_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2370-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.34.1


