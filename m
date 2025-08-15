Return-Path: <linux-arm-msm+bounces-69390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34FB2832A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 17:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B720A1CC0B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9201A9F9D;
	Fri, 15 Aug 2025 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaGRIs3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F64315F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272772; cv=none; b=rlLTo4rHmQ25nsaYgX0O1F6PlXcBY+ymY3eea14SsEPLVds0aUc6tuZ/Aa+wXai4jciv+2kNaQ0K24lw9/pf7Z+p2EaOQ2160AZibrZ4kzqZwMIQNonZqPqQj4J/8zGVzTA8rHZGctae3Qk2JcImA9UschS8c2Ftsdw5LBDcbpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272772; c=relaxed/simple;
	bh=AdyPZspn9jpl/n4EThew4HeSZsm3OTTzCIE9ywRTBiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YuJAQ0W+9oN5AQFAP3ILJYMNDmToOrcnh/SJPNY+JDr4rWOAigOaKzoeeX0EKfPEb7gdFnUBOnwah1wvpqgr5cBicyZBnEMiaGzS+4DvYCxiQCu1px0dl7RIi5nPGPR72xPGXZoF030U9sS3A/MH9dIXdid3oXdU394zDsDU79c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaGRIs3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEKPUE021971
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JeU8hefHW3uk9caYXaFowl
	+wyNewewpbgOtBogE/RUo=; b=jaGRIs3StWainalYBGQhXbQmmoy3H5Gjf9751c
	UM0V0J0KV6mi8FvYH49NFW6/bx5LQCYiKsU2BVZ7l5OHc3asNn462JVTB3/xHMYC
	1e9YQR/7VOBUSFqqqvaytJpkfnlExWApMjlEOU9WfI4zOZQf6Ifof80IppZIUVSI
	q8rDwqa8WPXhFGOLbUypxo09Qp7uws9JqeYMW+muoDTX5OXJerHI2EqtjYGOn5WX
	HTRZZk1O1R38ZXAjQksuZOriHKxburiyEZYn1+CYKFF2jHt77r0WHvC6/IAEUZCw
	3EnxkTmla2g7CeHAeKX3vWO+NkdEBm+Vt8C2lFj19AW6tPIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4qbmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:46:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a8b32a6e3so41019666d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 08:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755272768; x=1755877568;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeU8hefHW3uk9caYXaFowl+wyNewewpbgOtBogE/RUo=;
        b=UamI1Ek4HmU8/wN1szjEzTUBE7cE1DS/HTcalATJ3K+v9+EKXpw+46SDuPBYD65NU/
         UfqkmagCVRB0Qph0Be9zXEJ+oozVf6bxzTOiyS1cer++96dzF5L+3jnMHKgEdOsKsmdU
         9BQC9cYe9E4XHJrMsMj95uaAkduytayNjzSram2UiBQ4XkzhXX7dVc8heXWLWmJAZ0P6
         mizC/PFNPpqqAhYUMkLkEcCulSgbuByG8r/oW+qc5Eaz2BVv+eaVaG+3nLVP5DyUGC9i
         5XsiBAV+Kbh4TH0evJVVrVg5QjZ/lEW14nIK9nr0UX2rFccHGkqudOvaUmGCrNJa4Zhe
         fuSQ==
X-Gm-Message-State: AOJu0YwMEMV+bftgC+7xjxkyC1vsfcckLktM/ftkGoKJmmRwAem5RXu4
	rclQBzim9GVISXg1tm7xnjOLR0jv7AaEF//ILwmQQD+BzhC5eZZM6Tc9jr06o1LauF1/GrwRzhO
	8NcrO2MiFcP6Y6JFMK93xFRvWzMo7LR7yiwRPmcCBYRX5OQHehl4H7qGhnaeyIBbdADgo
X-Gm-Gg: ASbGncuVRNKQI0od+YZkzWziKKBCIltVmRU+XbePQ1ZPB8Cghv4dEYTgANQ45Wwvf1H
	T3rNQYICjs4fRO/2ovFiFrHd+UpQc0XvGqR39EkwznhRaMA8+pKfzqOGSZG5Y+NWllOYvrukX0W
	oGXJTXreBeWHkmESNNJqdr3IMwQTPceTI3srtL/XPcEGK3frEFsgCbpaGA8xJhlYjb/yApwyvZx
	BJfzW4N940vmxv2vMMcift3E5LDrKJdyoecGeOawXCPTuZyUwsZfqB3+Lt3ozX8yGeu8brRNQzG
	3DlO8JCWWDJ0S4O9bdDKlrRmDalnDo4o+Y3V5MuG2KVos5S/9NIA18nFiMB96QCO58RLElZ/yqn
	ENXmVVV7hymFCFNt5ypRNmbSMQtuqb1k0zMf2IfrOzs2X2lhPTl8x
X-Received: by 2002:a05:6214:528a:b0:707:7090:5400 with SMTP id 6a1803df08f44-70ba7ae85bfmr28039816d6.17.1755272768451;
        Fri, 15 Aug 2025 08:46:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRYLaK7tDeymqSjMuecb9APSDwBwGnwNEXCRuRxqk2zC0HT2M9Xfu1AiO5sN8hjfEaAL8SQQ==
X-Received: by 2002:a05:6214:528a:b0:707:7090:5400 with SMTP id 6a1803df08f44-70ba7ae85bfmr28039266d6.17.1755272767838;
        Fri, 15 Aug 2025 08:46:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef368eb8sm346967e87.59.2025.08.15.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:46:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 18:46:04 +0300
Subject: [PATCH v2] arm64: dts: qcom: use DT label for DSI outputs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-msm-dsi-outs-v2-1-3662704e833f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADtWn2gC/1WOzQqDMBCEX0X23FgTtf6c+h7FQ9S1BhpTs1Es4
 rs3ai9lYWGG2W92BUKrkKAMVrA4K1Jm8EJcAmh6OTyRqdZrEJFIo0wkTJNmLSlmJkesbXMsbln
 NMc7Bn7wtdmo5cI/q1BbHyVPdaUItCVljtFauDAZc3FVLcmhhj/eKnLGf45mZH/lfb/rfO3PmJ
 08i3tVF16Tx3RCF4yRfOzr0C6pt275biPvb3gAAAA==
X-Change-ID: 20250724-msm-dsi-outs-dd8e967b1e38
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9101;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AdyPZspn9jpl/n4EThew4HeSZsm3OTTzCIE9ywRTBiw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon1Y9Ydl8N2on6D7hVo6GoM1ZpeVTOw9tpy+tr
 6A/n9MM6GmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9WPQAKCRCLPIo+Aiko
 1VQoB/931zHPkfIzBRvpcX9t5//9EnKXMe9w/9YWLSm0ctKWGDwgbrZ42g4pEwKa+lfB3RrfRzY
 Yoblcr3loQC0tcu1lx0rVMn//6HSunKBUjgdrCJlXHtQKiuksRyGqBbyD1wzGXeSwHd6WM9xbm0
 Xa1Zfj14xD08MjF+cQxVSRhm9Xql1xwq8Oc8pL4wf4OzOXOWMaEMGAM4hoaYUQ7aO1oih4RlQ0r
 TNedGA4uAXddzbZBuyH+gcIKy0wWsCwsWKZcK6upBPm3OUD8DDqcFSFdV/XpA8+Th2JMykOTfei
 RcYv23FsFFyn12l02mqC6VMOThgZ3m2YX3+2P5ldD8JBUyKk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JhF8-7QIcEsk2SxN5DaZqtOnReG3quDX
X-Proofpoint-ORIG-GUID: JhF8-7QIcEsk2SxN5DaZqtOnReG3quDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXwul4UPZpzjf8
 ivNKaK7RrZKqWFOlKD05Hn0uKaHv0tEfbxcUEafIrZNrExAXOMMqRBo2Kq0m+a2TYA0wasfgJK8
 JIMUZDjtYCJ41Q851CybufDk+K01/esDOuNLJMoXNrIZcvrN8zF0/tzIrp+TUOprSobVC36ZzdI
 OYwKncttJRJeFySUj9NmP0lT5vhysPkPYhrZTKjtYexXf4SVBcHDE8cHCVDBLJSmjQhBaEpoAnx
 +yHPOCaOvELB41rpwFsxYaJBL45iHEo8ErPAuzrXkY/uNwJM7ysFTW+h/j4HA+XIsVkhPYF1xAd
 jNiel2Es6tu9LL9PnyHF62+FC1dMEnAJz5K9MgaRjX9R0W8LqsBmKBYmcAX3l+VFSY03DalEYHG
 mq3Dl/9T
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689f5641 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EQR83U5SduvbdnQy2FAA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

Instead of keeping a copy of the DT tree going down to the DSI output
endpoint use the label to reference it directly, making DTs less
error-prone.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of linux-next, solving the conflict.
- Link to v1: https://lore.kernel.org/r/20250725-msm-dsi-outs-v1-1-18401fb9fc53@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           | 12 ++++------
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            | 12 ++++------
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     | 12 ++++------
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 12 ++++------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 24 +++++++-------------
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            | 26 ++++++++--------------
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 12 ++++------
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 24 +++++++-------------
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 12 ++++------
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     | 15 +++----------
 10 files changed, 52 insertions(+), 109 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 33ecbc81997c5ecb5606c7555adefd1a53634b80..d99448a0732d9d165be1b5a1b1e15b2424b98b55 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -725,15 +725,11 @@ &mdss_dsi0 {
 	qcom,dual-dsi-mode;
 	qcom,master-dsi;
 #endif
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&lt9611_a>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi0_phy {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 0146fb0036d44893237520aae5449931f17f1cc2..19cf419cf531f353f17b83b89ec57dac697d5134 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -323,15 +323,11 @@ panel0_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&panel0_in>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi0_phy {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
index ff8996b4de4e1e66a0f2aac0180233640602caf3..4bea97e4246e160bbd4497551a15a9abe50167e3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -90,15 +90,11 @@ panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&panel_in>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
 };
 
 &sdhc_2 {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
index 17908c93652011d69a2d04b980f45f6732f16977..6078308694ac2085b7958704335dd81dc7109e27 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
@@ -148,15 +148,11 @@ panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&panel_in>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pm6150_adc {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3ec2c7864f1ebb596f1ac2644de58d2f7a2b6faa..8abf3e909502f3c3b82c0ca3d7509fdaf23d882c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -534,15 +534,11 @@ &mdss_dsi0 {
 
 	qcom,dual-dsi-mode;
 	qcom,master-dsi;
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&lt9611_a>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi0_phy {
@@ -560,15 +556,11 @@ &mdss_dsi1 {
 				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&lt9611_b>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi1_out {
+	remote-endpoint = <&lt9611_b>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi1_phy {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index a98756e8b965fe7aa475271f72c0b73b20fbceaa..63d2993536ade229a84da16e811e8bc83c46bd15 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -445,15 +445,6 @@ &mdss_dsi0 {
 	qcom,dual-dsi-mode;
 	qcom,master-dsi;
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&truly_in_0>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
-
 	panel@0 {
 		compatible = "truly,nt35597-2K-display";
 		reg = <0>;
@@ -483,6 +474,11 @@ truly_in_1: endpoint {
 	};
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&truly_in_0>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dsi0_phy {
 	status = "okay";
 	vdds-supply = <&vdda_mipi_dsi0_pll>;
@@ -497,15 +493,11 @@ &mdss_dsi1 {
 	/* DSI1 is slave, so use DSI0 clocks */
 	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
 				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&truly_in_1>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi1_out {
+	remote-endpoint = <&truly_in_1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi1_phy {
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 480192c86fb7c6981011923ef619b83b7460c78f..90efbb7e3799b9aa75ac4df84fe0006d470ae131 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -598,15 +598,11 @@ &mdss {
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l26a_1p2>;
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&sn65dsi86_in_a>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi86_in_a>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi0_phy {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index e1e294f0f462ac824bffe96615b36ddcd8996d80..0339a572f34d01633ebf09e473d6fdff9005682d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -478,15 +478,11 @@ &mdss_dsi0 {
 
 	qcom,dual-dsi-mode;
 	qcom,master-dsi;
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&lt9611_a>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi0_phy {
@@ -504,15 +500,11 @@ &mdss_dsi1 {
 				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&lt9611_b>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi1_out {
+	remote-endpoint = <&lt9611_b>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi1_phy {
diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index f9de0e49fa249af52cb3cbdfdabb394815ce82d3..24a8c91e9f70f40247fde6eb63aa5ce58e258139 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -385,15 +385,11 @@ &cdsp {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l6b_1p2>;
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&lt9611_a>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi0_phy  {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
index cb102535838def8c9a354675545d4f4c988ccd0d..5a594d7311a71f6c5a106683c1b7376f8978cc8b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
@@ -60,19 +60,10 @@ panel0_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			mdss_dsi0_out: endpoint {
-				remote-endpoint = <&panel0_in>;
-			};
-		};
-	};
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
 };
 
 &spi4 {

---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20250724-msm-dsi-outs-dd8e967b1e38

Best regards,
-- 
With best wishes
Dmitry


