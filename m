Return-Path: <linux-arm-msm+bounces-52967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B06A77DF3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 16:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F99518910CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 14:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69704204C20;
	Tue,  1 Apr 2025 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4q1mZbz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3198A203717
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518191; cv=none; b=QaJmjT1hQ9e8RZ2Os/bSofgzXj6+IAFDnBkq/5CXuKsXYayee8PrjOwSVbWXOGJbLquj7M0dPmDzd9N+fe5mktlFMAqn1cJCI0CKZPUZdAaTQhROKl/10tU/PQss/bPFGWXP3qNgPITdsjoAw1zNGXV5qo7/enCBRnCl5K8bMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518191; c=relaxed/simple;
	bh=5+8qNAjK1pa41tBTijO7CL4ICZMFSpw7xaF265SfJvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KNkR0ZsI5tWHyjB7RtR9nsDdfQvte0rd7clzPgzVuw28KYsKuzRAWVWzQyEui78bgbTgezWXcPNQ3qGCDA0T4dGo9eyzcSEtddrO8HqHx9CJM3hfPAvGxLmLfOU1xNtGD/GSmrJS43ncw2ylCLfkKVCOe1nuJRm9VhEo2pTYwO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4q1mZbz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5318L24M008422
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 14:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MksskaDKku2
	iDxOHXT4ruPYEUUI91bIugktx0ml57gg=; b=N4q1mZbz1Lz1agZl98uU320urxl
	xLTUFX+33mx83h4q7lE98yGu+ljh8FsLdrAHpkphWc/JM7MOSogpNfN5BT5JLLJe
	n3E1+BUPXlCBlg9W5vxaan67ZgCdSiPV8Nq7fjrNCUxE71LHN33Orb8DXpbDzm3X
	sr9MsOSGaW1+mwcBa/atqSQLQTUq/EA0zLd8MmdlGHEc4mOTqq4QnHyq/2l/x8Nu
	KB830c/qV0IY1O6teK9dE0tY6bBDCu9ratCr/6zgiScKql7KHhk9HSCNe3zo+dLr
	LxyHpogDoqEKVD1S5cOQiMwZTGOn9oGscIxaKuAqdP/QJ5Iivb7XVYbOF8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnjren-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 14:36:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225429696a9so164936385ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 07:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518186; x=1744122986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MksskaDKku2iDxOHXT4ruPYEUUI91bIugktx0ml57gg=;
        b=HWUM0Lze6P/eyrKNlkVaAeC7ZyHt32W7vp8YbTlv7phX6f+rj9xtE3GuauHy8RaPKo
         WTFItTWPJbveRDOAtxjn/EIvx1U39ilYVD/kh+wxqR+Bc0WcTmbPQknPHuVQcapYynC7
         sv0tx9IgobCdj+O2Am/CLzo9L5ksY9CT6o2HfvbHb85JjW25/nDKB6Qq9kywoO+UwJYq
         Q9AweAwpvajNQEHCk0skM5h+Cvll4SkWtRZWI+eh1jiowJZ1TilPb8H55wQC6y6XsUoT
         Xp6Q0Jg8zioACi3aOcwqlozTR3iza/MRCHdKhP0BIshPdbdrZ0FU4thq7xZVtT8alhUR
         9gWw==
X-Gm-Message-State: AOJu0YwPSEpMF3z85sq9ukKfMQsI99KaljuVVtFM5qiLDhRLUXlNu/6/
	tubBuDNH/BXenIx1qohCB64PHoMeQRBqeI1lPnGT7Y23NFC1MbuDdL6Ail7uLl61jpfSNGeV/Ev
	fQivWvyQIW64FXywmtzHoTyGpAuQ/hCPHPPcruMQS6BSPoAoJHz+f3mCvjc/jPUAk
X-Gm-Gg: ASbGnctN+BJ7op6OCaMjlPxa+qTPXONcFcyGapglWyFGDzpU0BV13PeZlaZiJ5D06jj
	O6ER6tEro08XOWMEB0wb+iHbIFo51x/hm+wOJ2phCnD4lOrxfj+Pv7ZjzK7NjBHHO7ubd3rfNnE
	iRtudGSlQxxmjqFgSOQZG5Mv7Jbpjrn1a7wSwF0tRY1N5/iNxqlKz68kNWhNoUOmxgc86wnAjKG
	NgpwRGRWghazqutql8xr6l+oWHtHDz95GKhTRPgnJJ/CDjpG5SWxwSZxWEBWP084XImBIkPzV3l
	RR3QVJcxFjU7VdQwQLx7GVoT3OTbEnifAaE6lIn+t+h/3mLBzas=
X-Received: by 2002:a17:902:ea0a:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-2292f9f981amr214456855ad.46.1743518186246;
        Tue, 01 Apr 2025 07:36:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWUx2PJF9wXGATPSEV4j40VJQd2/URxblcTyWdLAy97uAlx0NykMjOeo8Xtg5mfVsBlrbuuw==
X-Received: by 2002:a17:902:ea0a:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-2292f9f981amr214456325ad.46.1743518185690;
        Tue, 01 Apr 2025 07:36:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:74fa:12d3:5d67:6ddd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dd292sm89006355ad.185.2025.04.01.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:36:25 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: qcm2290: Add CCI node
Date: Tue,  1 Apr 2025 16:36:18 +0200
Message-Id: <20250401143619.2053739-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <y>
References: <y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a3VswZ9OhwXJ3lBwnE5XSZGTxkhiVV63
X-Proofpoint-ORIG-GUID: a3VswZ9OhwXJ3lBwnE5XSZGTxkhiVV63
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67ebf9eb cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=gjCkitBQ8UzLeNF7HDgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010091

Add Camera Control Interface (CCI), supporting two I2C masters.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7fb5de92bc4c..927dbfe61e4a 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -646,6 +646,20 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			cci0_default: cci0-default-state {
+				pins = "gpio22", "gpio23";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio29", "gpio30";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -1603,6 +1617,36 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x5c1b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "camss_top_ahb", "cci";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-names = "default";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


