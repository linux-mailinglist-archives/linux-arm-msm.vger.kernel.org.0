Return-Path: <linux-arm-msm+bounces-69884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E2B2D68A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46A264E1889
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E062DAFCF;
	Wed, 20 Aug 2025 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6rkdm2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D42DAFC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678558; cv=none; b=F8P+qBYGf1KOKqObuSP/6101riSKmraCiE0FTJrkFVn1xC5MfT+c4ryLEDkBNIn5QlQQ6sq9+nxW7R7/DjbSrkgi8ykqOPmLvWNIVQI0VFJVpca4cKqEFHHFV0THvgIt5Ved711ODyUfD5mr2tVSM6+GCjv6d0K8yi2LAHXpXvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678558; c=relaxed/simple;
	bh=2rSyjnOXNH6jZxqRWat3S+IfaQ+klyL79lUq0adK6VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mm1ax7B1MHJAVlXO74rMmB/U5gT5QYkNKn28MFWcp5qbcyazTmjVXxpPhWnIsXK4VAfCTo1u3XOfjp81TIl+PbhTW0B5P4xDJB4HOZQngSJs8P6pVFU17jlSLJ/+gByOTZgvBBNXtiB1tbc3cwrsKKVDmfdvhTz6FESz6EKvqrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6rkdm2S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2el028580
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8vAYM0Ri6HzYPqPusEESOhjr79e1ErFVtCFN1cMUUQ=; b=N6rkdm2SLD4tiqge
	felAGgUHNHlk9bbtBNZuzAiwTUMzTXnBMc5eovI95FucIC9RvKeGkx3+OTL4TaIK
	YH/fta/o3yluTkpTyXUzCxsHRdSfUlMPeL61hIZ257Ed3GMf6ZWdyQxnT1niTs2E
	WnJNEmHVeDLWOAuv7O7DphELJvVReCQhMl8DdDfwOXY2tU+l5Vqs2BgQ6Jp4CDSY
	8VSs0iRUMVMgTQMWG+Pzq9swu+6lL2BRdTBzbjN3Z4HJ4ggRjtRB8JuEgNtdOV7C
	LZmORbrXONpTurUMVuZihZ9LcPk2Tmi0uyWPbUaZTkCQnELYfs8SMsKvalY+aaNS
	7YdIyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52arxtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445803f0cfso66059595ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678553; x=1756283353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8vAYM0Ri6HzYPqPusEESOhjr79e1ErFVtCFN1cMUUQ=;
        b=T49NFunG+ChSWqTfs8uiZd+cscB3eVOIr0G89tUsWBT0qXXLFdLi/9pSqf6S/sHdcI
         TH/hL6rSLKGOjtMnYDlHFPvvpkCTvCJZfQujZD/rP2OMiMnOuZJ1pRgjuzWewFxHu+wW
         5W+GlLtfUEdoR5yMnSsiLLQQlwgUXF1e9/6eBZCHmieLKHm6ET1wkBQZQsDLia50v9Ej
         +AyKdWmH0AMionj/CJkhTAzi1eTTNsOHlXOMPsnrQyYivAHaL9LAXSie/SbWiOaY84Kn
         CZPyTtFlMCnpDhaO/kodiDmYzksNo/X6vcivT+FjPHB3MKIFJlFagHiIYFjp4RYTdPST
         OVMA==
X-Forwarded-Encrypted: i=1; AJvYcCVtaDfazcY3v6tqTrnD0f364P2+tOacLCay91mu5u0V/mcLS/axcKr+pGPWJ7HzBp5e6o5r8xP59H0P/yYs@vger.kernel.org
X-Gm-Message-State: AOJu0YyAepu5cJDrstrl/Ijt4RwfXQaJKKiXyWlB9XFEDPkdczzjjhXg
	d/4/X2F8YViu86XHI6+O2LCGAPtljRD1ZKAW+qoyveXUOPm3JANKTomWhQVjvC+7JOBE23Gcuxt
	aHC9gbuDcMF5gERGZ8cml5gk6EMZ29UgOFMJqyrh0bRptNB92fmI7n6n2td9w68gAThfO
X-Gm-Gg: ASbGncsrjA1gVRCQERv4jb/xUhwdejG6zBlVx3AkgvjIN2bgKdFFBJ+LLqaJyl/m6y9
	+aCkXpl7+ocn8LVKY0DI5fxbAeY2oTC3nJZWUm0TPoxly6OWaP/h/GldVXyFRz14bHQtGps2NKw
	msWbYnb6u5KpmF+wDl92hG/CnNGHwYiO67evWLZZwD+snRLXdsrd2lY+wI7kD555incNCi2eNdZ
	EIDdPOYnBAz7iALxz3rkNINlMBPbOOIRcEw202NBmx4yJODvn01IVcYr9vyOeg/rNbrPFaFjxDn
	0oiQHw2t3nyPe43TTkxLk3e+GGjPgocQ69IYiYne6TKjAucDttm4+nth7qrwx08yhGqsOqVlztI
	=
X-Received: by 2002:a17:902:da8e:b0:236:9726:7264 with SMTP id d9443c01a7336-245ef11259cmr21816915ad.5.1755678553182;
        Wed, 20 Aug 2025 01:29:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH58s+l49kW9kCSGQZvGGVUFWqSm2Tm7559FEKLDrLbXRmO7pk0REh9tawRxJs0dbxdX2M4w==
X-Received: by 2002:a17:902:da8e:b0:236:9726:7264 with SMTP id d9443c01a7336-245ef11259cmr21816625ad.5.1755678552732;
        Wed, 20 Aug 2025 01:29:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e779sm19037735ad.160.2025.08.20.01.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:29:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 13:58:49 +0530
Subject: [PATCH v4 3/7] arm64: dts: qcom: sm8450: Add opp-level to indicate
 PCIe data rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-opp_pcie-v4-3-273b8944eed0@oss.qualcomm.com>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
In-Reply-To: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755678529; l=3189;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2rSyjnOXNH6jZxqRWat3S+IfaQ+klyL79lUq0adK6VI=;
 b=KMmLYXCx2jpkOHi6xaQPHpldFZ07RBtLf+K6gKtKbz9lBE6uK1iQtrlG7AMP4UMtkYLRWuxK8
 4KzMEreo8atBndl2xMueG3ny6n4BmAYSQJEnth69/GUc4Qp54fwwepy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXw/qt+IpCtQca
 HtIGA7XAqglmEXTsJisJFC76jJxOeBc6XY1F2IgKzWNILrRApEbZA9mNAFEG4YKcDOlZuxDwRa1
 ybhDfxLkW/HsnAQTaxsmH3JWzskKdkTUYXHCYd98JVU5L6lx47InLlZc+3czTt6qe7NuBOKzWVj
 xHoHNMNhzpB1w/Y/f94ZRj0OyAlDebj47f03WIBC0uxwhJBhpgcD5V9PYYinzZ4CD6HqIyQnlLf
 fzkfgAAzywZ2Rxc1qndkW4nlRksf/JI7hpL6kEwb14tana6kOFk5+MSnNLL/5NAdx/1lSiusd/v
 30qL3AwpkcNdaGU8/FOkh4Uv9/Ww4UpxXyAZjmYu2lSw+1zLqIU+wAGsxaFfmddzdi8QJH37rp7
 z7hM0d/ERnlh1PhWKCDpbt4Ssl4G/Q==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a5875a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 6bm_1MuEjrNjjVAxQQ7eh1cdtZBU_r3C
X-Proofpoint-GUID: 6bm_1MuEjrNjjVAxQQ7eh1cdtZBU_r3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add opp-level to indicate PCIe data rates and also define OPP enteries
for each link width and data rate. Append the opp level to name of the
opp node to indicate both frequency and level.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 41 +++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 33574ad706b915136546c7f92c7cd0b8a0d62b7e..d7f8706ca4949e253a4102474c92b393a345262f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2052,6 +2052,7 @@ opp-2500000 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
 				};
 
 				/* GEN 2 x1 */
@@ -2059,6 +2060,7 @@ opp-5000000 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
 				};
 
 				/* GEN 3 x1 */
@@ -2066,6 +2068,7 @@ opp-8000000 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
 				};
 			};
 
@@ -2210,45 +2213,67 @@ pcie1_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				/* GEN 1 x1 */
-				opp-2500000 {
+				opp-2500000-1 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x2 and GEN 2 x1 */
-				opp-5000000 {
+				/* GEN 1 x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000-2 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
 				};
 
 				/* GEN 2 x2 */
-				opp-10000000 {
+				opp-10000000-2 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
 				};
 
 				/* GEN 3 x1 */
-				opp-8000000 {
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
 				};
 
-				/* GEN 3 x2 and GEN 4 x1 */
-				opp-16000000 {
+				/* GEN 4 x1 */
+				opp-16000000-4 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
 				};
 
 				/* GEN 4 x2 */
-				opp-32000000 {
+				opp-32000000-4 {
 					opp-hz = /bits/ 64 <32000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
 				};
 			};
 

-- 
2.34.1


