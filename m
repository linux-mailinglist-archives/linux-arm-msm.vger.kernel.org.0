Return-Path: <linux-arm-msm+bounces-74936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1CB9D9C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EED1731A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE5F2EC08A;
	Thu, 25 Sep 2025 06:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRymTrTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53C92EBDCD
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781779; cv=none; b=hEPXSoEuwR5RvdtUHZ5yMUoafCi9Dgis2e/AQOEOHg53rp8SSLJ/Zq+w+fKm0nW8omOOq9PMjFdQFFCcf5suWJRs4uLy8THVf/VvorE/jX+litKMoXroxaGio9Z8yTcXAfJYSD+8bdIzGxx9Korf8z5Toy4nwsMnbzIJraiCJpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781779; c=relaxed/simple;
	bh=uBpyNXxBek34lXoKZHB1xpUK1S6YGoyCu6EJBXVQ9MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLU6EONSYQN0+6eV5a2mjMHu/rGcXZErfuejNLi/dyhhxC1xQayQ3wdgMndVWEy9WbO+uh1EAeu3k4lagLY3BMUKYConp2SgLPdOYp5fi+SuXbVZT27usDQtaCaBVl5wpGkhXZ7p8CXfXCk6+1OU7+jbwAfqokGxiMh0MP7jacg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRymTrTa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONoblO025518
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Kj8zpXnqTa4oRX6rrL1uXULQtmQx7l8fFyKB5TkaB0=; b=NRymTrTaVbTqwIDA
	ahXZKTCphI17ZXDXkuq6iv3filsdRoEEQXlGJ8V0PkZuBpLppV8WGsfISpCz/fAv
	AldXlofCIfIz9ajP27cJEgR4Kk6QSX17/tDhrC4JZKmO0zPH4Xqv9yoP6JbLWYDL
	zUqjffn/dCA/cK+2zhNF2EklVijOM0eoer4Ua3U8j/1NUBhqSUprJO1QEkpFg6kX
	O0nGqHuRhC3ce/3wpwZSiZ8SLH+jw74n8KI+RKE+N9Ed8aTxqPNR2W+PID/kKzdw
	D+LISo5nDiF4cncYwxqXOL2J8xSHooEvM/z1XMAiCCim/aOY2fpOUPqS8jfB8agX
	n0O1BQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeyben-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f68c697d3so540724b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781776; x=1759386576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kj8zpXnqTa4oRX6rrL1uXULQtmQx7l8fFyKB5TkaB0=;
        b=oV5FJ0m0Z86IknCNfBjfRCdBf17DiiAhzZGcx5D6UL3R10rXzYSsfodjA55IFAw6OQ
         h83iEjdgi9+saeLrV7ErfoNOsz/6z1kZbFkUJ4LzfQHjf5eM9SyCZD/T6sFbvpCg313t
         SROPDp2S6d1ABG9WJ5R9wSeWHlmD+SL7oG+bQtJu2Xg97stKAbLY2i8L4J/BRf8BxfY7
         2UpBbkAnOe3AGNnQgAES0gbuHjs9rOATLI21pcMwNUdnDxkQS9+PwiRf4YC3XbMfG8OF
         Xk10Y1qZunJbbzrBxuqhqIoUD2cSb9UXDPEIijK4aQ3PQDOWNRxEjpmEv9PgeuuKtGBr
         GCmw==
X-Gm-Message-State: AOJu0YwN1Us+tNPzIaA7+DYbpU3UYgV+37W7TSKWyd9bMekV4IEDeWcv
	9j1o27F0bVmRJ+jHDZHzxztW+AKoBSuzOhf5x7ypOKVpi3MHSuI5NCxUVg0vzFQtN+4Ce3389uq
	ixsrX0lopV+ypqnMPuzDV7RIn3BiW2GT5C4Jmp1zv2fgCaLw3X0wzSCnSmiY+YTkavLzmzh3+gC
	qO
X-Gm-Gg: ASbGnct+nOaTGiQaQm+VTo6XvJLj1cYYjUByBA1QvaiCzs76CsL2SZNQUlV9d0pmYOv
	GsaJz4B7ik4o+l2dtOp8pEt+YcGs8ky8EER0ls2VlMvfKWbKdiV1oQJx4Tl5HQdMyFe/oqNXAYe
	5zSTBnVXxabEnROeDc9Byc6ax56K0wk6W8zZQu4M6MXM8Iran1kOvqZHPwmCLWBZoPfEa93Rd2U
	7GaezUCINSctIO+RMtIWLvhsLyOU5bUW40LGrOhGJtSJIFm+JnchbAjN8olwGTOanl6fLu5iD6j
	Ch++YD4a1/06ZeeSJRWcayAJG29bnRcdvXbdBsRQDIhdI7X6FItoqKwMoi/5r63PJE8e1/a6G/l
	cncpv7Vc4CVVw+AeFlGtI70alcUPTbX3Jn1Q5rKR3mg5qtDiwlgvuDJn/PjCF
X-Received: by 2002:a05:6a00:ae17:b0:781:802:45b7 with SMTP id d2e1a72fcca58-781080255aamr585831b3a.12.1758781775927;
        Wed, 24 Sep 2025 23:29:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL5HniixRjeNZsKDdR3SnJ8q5xPlBnuviI9FZhv0rIK1xC3ldyzmknTaSHiKLvhCp4H7O/qQ==
X-Received: by 2002:a05:6a00:ae17:b0:781:802:45b7 with SMTP id d2e1a72fcca58-781080255aamr585799b3a.12.1758781775512;
        Wed, 24 Sep 2025 23:29:35 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:35 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:18 +0530
Subject: [PATCH v2 12/24] arm64: dts: qcom: Add SMB2370 pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-12-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: cbvEFocnuWy5Hrcc64Wxn2UDXva89oPp
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4e151 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SyH_bpr75tbjU19HRJsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXyZzEMPw5rLqj
 ASozeHugfnRRgDdVR3L4yAH+xGRS61T+1SOhLf9JvXlaHPhB+vFfUrBzHlwfIk+5gayEZOVUNLe
 gtXxmfqddTHug+9kKyiQVUeTqjEfVvR4C0e48P4xbWm0ZKQCUoF60W7aT+8CtEfRYRmmwLahPNX
 p53cA3ADPD3/0fyVQlSveAVp2iWrP7X8WMPnxxhbP+YRuVB5mqXoapVi7nHpktyb+wHWZQwgWNT
 KwvnigfvE8TTJTndqGnzV3DyVOnQqbFB9FwDlc/KEvGHIrmCN6cHG++GruaM7XFcd/xRbIDY5VO
 BxePKbuG7bN0YsGj5/OLlVbcXvXzyt8TVMNWb+erULotWWPbfIGpMidSGrWYO+j5JR2vs2rD719
 gtKXG3lu
X-Proofpoint-ORIG-GUID: cbvEFocnuWy5Hrcc64Wxn2UDXva89oPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

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


