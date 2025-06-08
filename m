Return-Path: <linux-arm-msm+bounces-60546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46116AD1341
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 18:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04ECC3AB65E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 16:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733F9174EF0;
	Sun,  8 Jun 2025 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+/WLugt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CA176242
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749399373; cv=none; b=K3eiRQIhq4GvzW4c9ZUBuhFpLcedVKBHs2OBODdUa4cCk/rZKhJrFILuSkACFJj+xJydTzV0qPZmObs0VEcAJfF3vy3JPxyyT6gNJT17rc+lI08uFrTFvgLMS7uC3e7lr6qwyQkaSTeAsRB5uWBdkdIITDPYkPU4Nl45idCxm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749399373; c=relaxed/simple;
	bh=OxBUrTXg+SWiOJc0ww+XKhPts7dGDQJeof1BxyM+QtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=quFrikDtrcHvOyiofyZbFFl/kIyVDogoXpxY6I0x3LClabDuKn5ayoH572Bu3LKHJML45cwl3Bhhjwrw/24SBZAkq8PFR4WHGR6rpnH1+ULjUo2fA6RaoR+VVIsurx1iTYg/GCPV5PHaU+RDL8oHULSV0lvF//xU4UXkgo/eG+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+/WLugt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558BmnBo013265
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Jun 2025 16:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t3svtrQzhPcJLweM25Qjv2
	aAx639KNBgFsUiIFX+8Xs=; b=J+/WLugtUKgtqAuKrrZ78mentCFpRhzcbLFDCx
	z6Dv/wtFYM6QI5veiqPpdzUQ+ebIQqZKtmyHP37NN289L5rUabubWaPLX3x1YL3O
	lLNfgR9DE6/WpaWwrbKUT8Ovsx6WlgFs+PPsyvmYebNxVe5UHjMI7HzXj3vz0P+M
	Emq4BKKN8N/9/S2CJDzdytNg6AbZ9MM8ivcf3Z1PgrkJb23to8iAdXWt/zwRc6d+
	fFWLkYEPcEJtcCBjDL+sTAb66v/rUGLrVQJ0guLxEcMPhm5IB/qVXWJrOYRCbHR3
	F0CyybIifLKwcmRrsGHaoY8CLXbJd3WoDktddbiNj51Gxb+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j3aw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 16:16:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so572419685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 09:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749399369; x=1750004169;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3svtrQzhPcJLweM25Qjv2aAx639KNBgFsUiIFX+8Xs=;
        b=U8ziYcN1A6fL6CS1wl8MXdEedG6XEjNQYknksDbvAqz9Qd/TxCSylF7dObTnMLNizv
         0ZoK+k4Idf0cPZ5QXL22ohlrAgn/ePJ+Iy+0izecaBKNXpCQLfAUnDEfYjql0pKzZVpj
         nzutenYTBYAT1KoPn7K0v70ap1htfJMYclz/Sn04vxyYshgY0hz2Z/vcOsLcz06tNzNf
         ZcxvcI5NO4B6tbuTIZQwtbVM5PAU2mjkj8ghNomsgodb1AwESdYpALP3oLUzwFJ29ZmU
         phO689Jli0zsS2ZMWGYvB9ABHgoZBm4fdLkC90t8tR/8xR5ZWv1OPKipqVzyGTbAxN/N
         qj6w==
X-Gm-Message-State: AOJu0YyUAD48LpNA69HvDSHn4vwwvsnpaHGLjda/mBrQxaWIv5Sx92ba
	Fs+h6WJrUHKv9NTc1ymj7XOj48Hy46f3GPBqG8Ubb5+bC2p3bQYvXsGoHP5vE/2keyhRAWIZySn
	S0IYARFmns8k2mjadPZgKYHODlUMMIFEnh+3EkX+/2Rq3E5TFZUThgH2vqxGzE8Y+glv1pRNJ+9
	yX
X-Gm-Gg: ASbGncv6pbpsx3hzq6Ys7RnrwxdICoCcFCLrNDBqWAePx0gKaYdYJcWbD+evTE8dR2y
	wuVjbKIqJ2xxPC94xMgUOWxe9ifuD8MEVvFeV6OQVSJnW3gZc8yncr9XELp4l7E4GCMsWQxE7bV
	BKTLsM7MAjeWZhhYShSjhcBZuTXeGmKTkRaaxGbNkE/mtTqKyGDZxDEHRIwuJOH3yvgmjUl/eoa
	zT1n0RhKqG3sHlvgc7NXqkLD28t/c0si1dvzEElUCi8xjm7V0OhHtJHRI9vwhC1GMX4WBf7hYfS
	fNV122QuarRNVJd5WJH7RroQhuTOlC5edcEzpeQCORsBOQEwvbswXY3EeF/dBRTE9T1GjvgTjux
	5DQpxhGtAmxMbcBV444zj2ERBPEqWlswO0GE=
X-Received: by 2002:a05:620a:28c5:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d22984817cmr1438701685a.11.1749399369241;
        Sun, 08 Jun 2025 09:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2ECLvAGwHxlGpu/aiaKaMlVgptTqoaYM3u06cN0ZwmKGTc8l57wixyXulc+n+Bvw4GnIbkg==
X-Received: by 2002:a05:620a:28c5:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d22984817cmr1438699485a.11.1749399368863;
        Sun, 08 Jun 2025 09:16:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d01debsm7472621fa.103.2025.06.08.09.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:16:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 08 Jun 2025 19:16:05 +0300
Subject: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing for
 second USB connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-c630-ports-v1-1-e4951db96efa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAES3RWgC/02NQQ6CMBBFr9LM2sYBKWivYliUMmAXFOhUgiHc3
 UaMcfl+8t/bgCk4YtBig0CLYzf6BNlJgH0Y35N0bWLIMVdY4lXa8oJyGkNkaahqEbusKC1BOky
 BOrd+ZPf64EDzMznjMUJjmKQdh8FFLTyt8TwYjhTgP6fFL9aTJ37xt4e3AivTKKVMq5cM6n1/A
 0QU1wDAAAAA
X-Change-ID: 20250608-c630-ports-ae7d00f146ce
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3452;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OxBUrTXg+SWiOJc0ww+XKhPts7dGDQJeof1BxyM+QtY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoRbdGNzhmbLV5Cxp7xfsO2uXQgMvf4n7qhyHXW
 4XnmI3DVDGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEW3RgAKCRCLPIo+Aiko
 1XPjCACFiWDtKVUqHyE7H76GRKWQ1inlljYNLIcmLRcV72U9wUWLA66PUFEiBe86DoFKoLYHwm9
 8i7Yw4Cx5erhQ6i94D36F25xX+Vz9aYnvR5+U4E366jJvaJsxuKfAKY1K1a0p+6y2Qnx4rs8qZm
 cjn98D8J6Ge6or+9qJzSrUc4gNglB6StgPlrhiZm/lSQB4OOjEgJbXB8K00fvg1ppVAeeWiNGFP
 eexhQnhZliDf63BO2SKb+lcLauOb8s89MSRN6zOitvqDvV0ROiBJvx/7tiyVoeo8WgW7Le4ERQp
 IsGytg1D3ZCs+mrwTKM5a/sAxky999wHTAOELCpYk0EQQDf0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEzMCBTYWx0ZWRfX2c2jLgS6J1o6
 9S+OMhHQyzuAZZ5lmQnxowlJYB14XkDBftvWOYQuwEyPzV3B/uMFw2b8jvsVO/S7jMMvjywJb78
 rz10kPNYMEaM06ch8yvwdOK9F2GyMDJb2lJG4MPirCcB0LKa+Aht5BvewWKI8Lh3iToMAToMvfz
 9yysgZMgq+xYpMWUVWpM09XqVvLJkWxGbYs8vShwF0uKlVir4rnmbB2gJCkhZUc+WHyBRptM0sY
 kwW+xD093t68ki7Dd91CDPKjE4pcP12dmob8nkQi5kB3KOZEnrRDqnEBCi1pFVC81/25oJt2LsM
 UwsCLJ5OApdXWncjAvXkSDVVyLx8nCcBu61W3sx5y0S99EsOu+4A6fOBCib5xYWaTyMfiWOVW0x
 WV/ENT6SIbfPi0+67TxmSfP0TtL0mjBvmm+ryifpkjZ39FhbBnWLd+bln+0y9Vzu02E5L71r
X-Proofpoint-GUID: 235NagRLPZr_tWkJhkLf3N2mUZd_uQmf
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=6845b74b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4HiTP562T1y0kxfXC7QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 235NagRLPZr_tWkJhkLf3N2mUZd_uQmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=961 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080130

On Lenovo Yoga C630 second (left) Type-C port is not connected to the
SoC directly. Instead it has a USB hub, which also powers on the onboard
USB camera. Describe these signal lines properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note, corresponding DT bindings were submitted at [1]

[1] https://lore.kernel.org/r/20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 104 ++++++++++++++++++++-
 1 file changed, 102 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 3b28c543fd961c787d7e788995f8fe0e980e3f68..794ff455bca58c3e201208a338238f90bf4f1ba7 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -421,9 +421,46 @@ connector@1 {
 			data-role = "host";
 
 			/*
-			 * connected to the onboard USB hub, orientation is
-			 * handled by the controller
+			 * connected to the onboard USB hub, each pair of lanes
+			 * (and D+/D- pair) is connected to a separate port on
+			 * the hub.
 			 */
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ucsi1_hs_in_1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&usb_hub_2_1>;
+					};
+
+					ucsi1_hs_in_2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&usb_hub_2_2>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ucsi1_ss_in_1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&usb_hub_3_1>;
+					};
+
+					ucsi1_ss_in_2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&usb_hub_3_2>;
+					};
+				};
+			};
 		};
 	};
 };
@@ -836,6 +873,69 @@ &usb_2 {
 
 &usb_2_dwc3 {
 	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usb_hub_2_x: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+		peer-hub = <&usb_hub_3_x>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		camera@3 {
+			compatible = "usb4f2,b61e";
+			reg = <3>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_2_1: endpoint {
+					remote-endpoint = <&ucsi1_hs_in_1>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_2_2: endpoint {
+					remote-endpoint = <&ucsi1_hs_in_2>;
+				};
+			};
+		};
+	};
+
+	usb_hub_3_x: hub@2 {
+		compatible = "usb5e3,620";
+		reg = <2>;
+		peer-hub = <&usb_hub_2_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_3_1: endpoint {
+					remote-endpoint = <&ucsi1_ss_in_1>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_3_2: endpoint {
+					remote-endpoint = <&ucsi1_ss_in_2>;
+				};
+			};
+		};
+	};
 };
 
 &usb_2_hsphy {

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250608-c630-ports-ae7d00f146ce
prerequisite-change-id: 20250608-genesys-ports-09407ab555ad:v1
prerequisite-patch-id: 6e11f311167600e5a2fe4de47eb499a87cf49acb
prerequisite-patch-id: 18df27b45207f004f55a6dd5d558b84ba8b224c7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


