Return-Path: <linux-arm-msm+bounces-88723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB5D17925
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BE233003855
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B8D38A9B9;
	Tue, 13 Jan 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knrQRz5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQMFl5w7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B7264FBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296058; cv=none; b=C2V+OymyWG4cYN7YKIVmL7zSkIQcDb0BUA6sJ4y2JHyh0AA2QDiDRQSeiY6MPNy9exR71pI+eyC7ZZDgIAZwIa5Nkb+4JjGHehpevq2/Tj30i8zOoG/jlEECUSvVCtGHM3GLGS7Htz8bJgsoWfX6Q5Kanjdvj15zI3mJHkrO9OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296058; c=relaxed/simple;
	bh=blcX1nouYNXC6ol/gZDD5PA42jcTWn6mTJAJP1lU+68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UFJUE0aVAFKKMYowG3W0Q7Z1r2m27tIO4fqavlApeblnQsfd8R+OTFnzGe9sb1NFz6ul6NRZhIBB15cKhpZ3B5YhHVP0YZooK4/EWOiXCMvFdadL5uQJWOiKBeXCK/tRoTzUsEOTdHLJoyQfXNkzxKqWvR7GsKb4/+y9cvvsEVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knrQRz5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQMFl5w7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SlsJ3868693
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JegHHkHOmY4
	/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=; b=knrQRz5Se8lpMa9M39xxrtP0JkI
	UQwQwrJCw6bgKLpQ/v2U8TOBRHTTrMU412FjzG6HRfGOWweSsf5nMf9GO09jjmfm
	w70RTEb+n1tyibgo11/uvdI6VLRQqc9kDgbUxPdJXCN71XD2fvMv+HyH/uGLRJ6R
	3N4HRiwrvBV8fpAC816R4prj1+m06cNnMWxsKUqQ+gAEr/H3xARwWHNeDd0Zbd6j
	fVJrZCoR5hB7VktyQz8+cYFr4ISNTZJtEqKfwsfnk6YDDJtMlNOKIsxvQ0t34Fdx
	SAGm9gZ4tQH/RAy0A0uPdNrh05X6hNFk0phByDF1Kl1c0ZH6cEoDA/Lvh9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8n8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a8c465c1so37029395ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296045; x=1768900845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=ZQMFl5w7g6eN3WGaMN8ePEj0J7Rm6ptDk8x3n05W+ubd+VFBUBhlOZdQMZWG1JvCFH
         E8xZPB8Pu0/2cd6Kahv4o3d6GA4xFDsqGq/CJTOOZMz1UHNe6fPHPLu0Sc/S1FnNLCjL
         D2WqUrL3ZYtzMncEJ2vqLBysFfBRMHXRvL2yz4mVf7fe46EULxMouEt4jWyCikNUQj68
         uk1ASoFPIQOnbZrQIAhDLljk36utU6OuO7eDXyMLKNQNHI1Ge/ypj1Yvn/oAHPJUg7y0
         YFWDhAVq267G3cIiv3X6bV46r8OE5XXL6hC0Oo6cKrkve1kEnVPr10tjmZRii5laAx3W
         2Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296045; x=1768900845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=TwGcWIm1yZQxYp7IoVEzTfb4k3aoW8xg0wf2jnFSVkxDjBsuxzSHa3Rblr62I+GrkA
         nK/jSUldSbdwB3C7azt0gI1o795lfzfLw6r+kPGwHdP/c66gEqyL3eY0BO8CVxK+R7Io
         78LR9MJRiUfr8L7UGUHUnfZdes5bJnCBduu7ST2P0cEXXiAMIT+e5wXFC3a5bhv49Ifg
         mLlOKv98o8Rn2D4gka+2TlltYPQ30IhilX8M7KWrRslkHTIkrhLAsnrI9bOQlKA0o3Mo
         Ieesk52nGWVq1Ob9iXDEnb+pJR+1VjJLxwm4eNHzCM7MmuG2goJwQD2eN+VFw9oo6ZDc
         62Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVotDw1xxmntM1CQqliWI3gtyOTFKsCLEaZ6FR0fgvSF4hauF7Csfoor43CsUi94Xit8tfjP53nqTo/n/sW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6IHH3PsMi3+T8je9RSoLK9MdpEVIvQP+n1lJX4onv+mkJ54S
	tBHLOrXsmTtLq1rIAai/6Zd6CqvErbN3liOSfqrwTdqQi4Ii3F5BNWGa0ETkYmqlfF82qtO41Qx
	QWLFhHqBgBpHDrZqxGbyRrrR+V6YTFKACe7GjOHOvoQJpC5NE4rvYo0yNkkQClZOm1DOw
X-Gm-Gg: AY/fxX6V0xDGl+f2SB3IJMhlUkLrHAI+joHSsbXyPpcOcVhOUNJYybOVqjWKeMY7uxo
	b5sr2hGV8i3YBIVON/xMYibYaFPFFJTWz5Ux8ChVpKyD7gW+QIF3SIxRVKZbznSvR5j+tzQ1TaA
	EA/mWgcqrXzElCl9W2b+2aAU+s3uBfr1HDor6HvAM7oJDEybdmepWtm6neAvz0NbnLu05hTDuA6
	3+lXbAQg1IWP5CfPSbUlKeFjszRNg6ulLR04cRcOOSjqg/bRRO18n2T0ZeWL1ND28Y8kfe4rqsZ
	UWLEwnIsQg0L3IVZPv3q8ImgcEIFwN3F2G1+Q/Uk78lVc0Mz/OcpeSML7kJtgG7Hb39cZTp6YHA
	GdeUTVmabM6/weLy6XZz7mRXWtvGAqikCtHtG7yP2oEDg5ellewwdnpJwGTJVWqnyf2wcmDbXCt
	AnA9942pnsgYOhyu2aMeKhv2VWcpD1eXFXlh/AhwQ=
X-Received: by 2002:a17:903:2344:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a58b49e424mr23819855ad.5.1768296044708;
        Tue, 13 Jan 2026 01:20:44 -0800 (PST)
X-Received: by 2002:a17:903:2344:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a58b49e424mr23819515ad.5.1768296044238;
        Tue, 13 Jan 2026 01:20:44 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:43 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Tue, 13 Jan 2026 14:50:19 +0530
Message-Id: <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OXkyTeq0D9HJpv5PuU2GuhJb5PeXtKDS
X-Proofpoint-GUID: OXkyTeq0D9HJpv5PuU2GuhJb5PeXtKDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX2RQvr+fRaY+T
 sP5J8kEXyw4NHu0nxzaVaSydSJWyBfqBvxj6/hCJM4gF2hI0lYnjvP9uih6oLjpyAY3lmenKNaB
 p/oTopFF9pW2FjZz3wBJe8uzh3y1bFOnjudYwK8BrJ9CIWDpwnlcpWnGv9SnqFWEefiL34Y+7T9
 22pE+5ea/jc4/fVYXoAiIG2AFog7YjPsdomPchkmWnB4WvVkZHuyWzH08IKQH3UfXePty+YZLoF
 VDgLOugpimg3QFKfMdMp4Z0hWIaSK/adz90IoWp5CnZh/Hsms/B0qFbzCtABBTxxMDudQ6miBl1
 SpjXebiGLs9BrxbReAjWa6U5MihjwuxfcX2IgvvS6SIsM52J1ekC6oHZ4rTLC7/JYLDyNUZVMT0
 2056n14OLp/PBx8b8VWvrJ5L38beYScjHM20SxmBfGL/+7NP8kGguRYwKRgQFTd54iILFT7sFyo
 cjXnJwTu3xUss8Amhdw==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69660e6d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=etOpb5xliKOozrl2HNYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index f024b3cba33f..d077f0ed9e46 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -717,6 +746,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,
-- 
2.34.1


