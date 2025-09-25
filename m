Return-Path: <linux-arm-msm+bounces-74973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73758B9DB67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87184A515D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1B02FDC5F;
	Thu, 25 Sep 2025 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yap+gqao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38862FD7AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782081; cv=none; b=ppDmNBVg7ATpCIM4OrRcHOIJhJtTmR5fUTJlrMjckuuOlOCFLFczTEFC4tXOY86Q7OCAFFeianouk3PJW0ZWvzk49YfeQnV9ztpcYEyjF1Cy7wlMs5dv08dwMVNJup2sHHyqR+/6oRbfMJMOxzVY/kHZEPGwyegqIlBuJGeogcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782081; c=relaxed/simple;
	bh=V3DwzMhHyM+I6pHrP+uB1wED6tjExyI8wGLVQ1sZbgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4AhZCAJW7hzSKzXq6wwPFsmphg9lEYZukT77ND+ybszQUFi3GZ9oHu8kl2t6FtCrwTNe9nCh2NbY4wV0CT15Ofp2sXqOo8R2Bit0GfwKOhMbBX85lLeBC5zhtC4EHj1bHa6fO5M8C+DEDjbl7s2HQXyp0oAQ8pGBsSYp8PEIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yap+gqao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0MC0K002079
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uG7od70k/i9Kw+psrJ8W2o6B74N7yBSqMRRkTzry7hs=; b=Yap+gqaoaxB307WT
	ZReni9pIutsXrCI/U9v4bxsTt6/i0SxDpWi7EktjBXP25PSJKj/utwyvV1xtxOdh
	R0CcJqQxiY9rQoFCX5xzmlzmMAJqilyriSAk9bB31pR5rIusHcsmE5vncrg6c9Hl
	8MgxEV7KiGLpKJ2yC97FaGrZ3Bbd2Asac8i9bk9cMc7NYBWadnwSpvFO2xLteGDg
	d3EMf4GZMzXcQMyqVfqL7Ua6hOE/UOm3XRe93WRdnWn243BI5/OB3zGtAQGfGEqF
	+8x6fem4sdwQu+yBXJRksDFIhQwdqjGvNJorbYO3e9lZbSh+C8L+3bsyiz8GsUk2
	uvTP3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98q13b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eca7298d9so13459155ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782078; x=1759386878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uG7od70k/i9Kw+psrJ8W2o6B74N7yBSqMRRkTzry7hs=;
        b=jEQYoIv3mZMMPcVi0HVu6eqbjdggXMvDH00yDhwiXDHLYJsccfTuKjD+98XxR02hg2
         n7avvUjIZQJybobnY5KMb3xMUCEfAwcZqFyLayXYU0CFnu2KC8FvyeNZdWJZJiDgS6WL
         Uv0nrAjh7Ja6c+Mr/gWpekWJY5E30mZ6oTy3/4923yYrf2mK4Vh9TYrVQb9owix/WFK+
         NLm4L0o2dqgXVbXcqdy9cOv0HR5ohwcNsvt92YoRl25Zn0J5ayBtGqt3JmlQcIW8xwmD
         ma4KL3TgF7pqWLgayuQ/RI2eW1Ef3c89cm5LhMaI/kg4HAjQIIBDPViGqKXfbVkx/ICx
         udaw==
X-Gm-Message-State: AOJu0YwH5AIzlcBZwuCTk3gdyPHrbMEFRQa8Whvr7hyuKFxLaTSfdKWa
	XmtKJ8r7RTEh1Zo2emJpvBOLxFCwMvYHcpRv8pOQY8DDSpl6F8K5tD4Z5DKmFBNEE4SKiBRwzEV
	srCSQIkffTyaCCAzUb/17mkEQNMzXPsbIFQvA8+53dAPndS0glqJF5TMVDQ5hvgj1+iZ7
X-Gm-Gg: ASbGncvSuaIZAgnx9NkYrlN6jijfr8cusdaeaNmi5R4sd/AdvbJ/i+QHZgwTLxBpeJ/
	FwS8aEwOtFZFTzEl1kW7viknX0LlZzUPt10BE9nBu79fobyeaHOGuPXQB7LXmK9aXudZpUKnAon
	HXRKNABZ8OqwS7IE5WhJgoMoPuom3Wmh2QcmmB67CcPFaDaP0+qsoS2AuSEBq8K1w2XXg1zFbgc
	ud8uzJFF1aMD8c8HdGusx2XRSi6LRAgemREjtR14wrZs1BY4bin5rCefqr8Z3klYdu6w5bakv70
	5alg1y3HO1NSJpxU3J+iaXYs4gcIByIYILmhH7a7HQ3HsZr6mupP19ymyRjmVY/xvYe6B9Ly29X
	E9n7FLBLHe/gTihh9Gqe78scjxAiqvldUdr4wGK8bAx4gx79OlQHaxoziYouc
X-Received: by 2002:a17:903:2348:b0:275:3ff9:ab88 with SMTP id d9443c01a7336-27ed4a4e174mr28604515ad.49.1758782077550;
        Wed, 24 Sep 2025 23:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMClKDtQH+qECejIvMWPGGkEdMWo5ok4SO8IcD9cNru1IbuOp/phxArSeUpSw8LHoytbJ5Gg==
X-Received: by 2002:a17:903:2348:b0:275:3ff9:ab88 with SMTP id d9443c01a7336-27ed4a4e174mr28604085ad.49.1758782076937;
        Wed, 24 Sep 2025 23:34:36 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:36 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:32 +0530
Subject: [PATCH 24/24] arm64: dts: qcom: glymur: Add remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-24-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: xoxZSe8W6dWb4o7QJ8-0tXEiBdskgT4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+qBzCj1AWNVU
 ndMcdfrP5aZ77ow3jzElgjjh2Woyw9b48aV5U0sebn6JH12hb+7x4Qpv5s4V2gxW/KMYxF5Fm6W
 HRgLFRk0xzLVXAKlvHkaZ5LONo2cNyFtC0uuFqbMbONm8o3VbCtYHiJXgpKBSwyvfccOnFkGQY4
 zGqYDXclprkRSL7gzfWcGl88fZAMsriIMqMid9rI2HGPAzL2LWR3gdxX4xVfI3DLWAT+VOsnPfU
 99gfkf1x8cgQF1DQhsEYu4Puh7eJ5ACVQCGCPkAqfCyVWFPCX5hm2DXuhw2LMhESf+ADd5D3yRX
 oJBmKU6jDOB/2TJveq/fJ9332X27hLk3Y5Nr3XS165A31KqMWcZc4/L7OZzUIK8QZGcwzgDg/wq
 l6svzoqN
X-Proofpoint-ORIG-GUID: xoxZSe8W6dWb4o7QJ8-0tXEiBdskgT4m
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4e27f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kLNDb2lwuo9xn5iZXl0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add remoteproc PAS loader for ADSP, CDSP and SoCCP with its SMP2P nodes.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts |  21 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 234 ++++++++++++++++++++++++++++++++
 2 files changed, 255 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 100519aa5a7cd905285d3aa41ebe5f63ae00aeef..17c8f1a4f4061303982a210b7690783c96ef80b2 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -548,6 +548,27 @@ nvme_reg_en: nvme-reg-en-state {
 	};
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	pcie5_default: pcie5-default-state {
 		clkreq-n-pins {
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index c48d3a70820e551822c5322761528159da127ca6..a131cd6c3d9e7f14ed1c4aef4b68e1860cc3bca5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -782,6 +782,82 @@ smem_mem: smem-region@ffe00000 {
 
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc GLYMUR_MPROC_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc GLYMUR_MPROC_LPASS IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <443>, <429>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc GLYMUR_MPROC_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc GLYMUR_MPROC_CDSP IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc GLYMUR_MPROC_SOCCP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc GLYMUR_MPROC_SOCCP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		soccp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		soccp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	clk_virt: interconnect-0 {
 		compatible = "qcom,glymur-clk-virt";
 		#interconnect-cells = <2>;
@@ -2417,6 +2493,59 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc-soccp@d00000 {
+			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong",
+					  "wake-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 10>,
+					   <&soccp_smp2p_out 9>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"wakeup",
+						"sleep",
+						"ping";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc GLYMUR_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc GLYMUR_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+
+			};
+		};
+
 		usb_mp_hsphy0: phy@fa1000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -2944,6 +3073,57 @@ pcie5_phy: phy@1b50000 {
 			status = "disabled";
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			iommus = <&apps_smmu 0x1000 0x0>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc GLYMUR_MPROC_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc GLYMUR_MPROC_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
@@ -5311,6 +5491,60 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			iommus = <&apps_smmu 0x2000 0x400>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>,
+					<&q6_cdsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc GLYMUR_MPROC_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc GLYMUR_MPROC_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
+
 		sram: sram@81e08000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;

-- 
2.34.1


