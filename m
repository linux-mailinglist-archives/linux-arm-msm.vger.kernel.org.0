Return-Path: <linux-arm-msm+bounces-40708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2F9E675E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 07:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB77280FFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 06:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC9D1D9339;
	Fri,  6 Dec 2024 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LG+eE0ue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053F58222;
	Fri,  6 Dec 2024 06:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733467337; cv=none; b=jz/1HUhzBEhiNr+p6aEyACvVMQw0pECjYnnWXqpB83iJYYSsD5ig9c4IkmvkeTzyBWgvmqxJgiE/Er7nbCHKkidx5GHTpG5keQYfNQZE1LyYwig3Uk0tOpJ5jNs/08bKjWCfIRE2EA1HKgpmzUPkdjbmdQuucIh9DQAPgLJKgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733467337; c=relaxed/simple;
	bh=LfFLuF4ji/kVInVTaqlpwXqrFKokO1KMpLsxrSto4Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kBuPlcbAOYvqYo5+j6qKi7YhD8bRrDFDPd0A2+qlZN+Ep8hBzxqv+bGTIsrdUXHlVssSaM6GXNxgwAFmatqq+3wo1AaJLD30aCmvlBN28t7OrQ34fe9Z4mcH7a3fWiN88oZJQiWA/NLxKPq1p8Hq9fnG6Jj4rjv5nOD+X8JjEs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LG+eE0ue; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JhlNn018707;
	Fri, 6 Dec 2024 06:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fmIOF/1fhz42BBjw/bkKoA
	fgSj8dTtOj8CdHzCK6Dik=; b=LG+eE0ueM+ZCzejqB8Uj5gSe3pgvOJ+dEd/03S
	YznVwcUcSM5Fmu65WYaeYa6LXKqnDST6pFySnITaPdsoUm9Pz7WwT/vX+yUG2h6L
	f/CIL8LwYY8c+oAClXTcktJvUdlnOIjd0pJpncHIJYCLAoxsYjMhbiJmd39m5BGn
	7lK/RiiBXnj0eSIHXyJuzLnO7i+Sp7p1Bip6JGhPtnBJNiTiDh0EznGHLy934+Wm
	GQCNdptE6IAmfmBOaBWJIIWpANOHLPSn5vANQkG2MwgjKq9ZK6DywoNWFu4Goufr
	nWeOCHiNo7Dp4voEZCu6MCLkgbuxVWgQJzc1YDMrwTjp7kGA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8sbrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 06:42:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B66gAG2028469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 06:42:10 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 22:42:07 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Fri, 6 Dec 2024 14:41:13 +0800
Subject: [PATCH] arm64: dts: qcom: qcs8300: Add capacity and DPC properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241206-qcs8300_dpc-v1-1-af2e8e6d3da9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAImcUmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwMz3cLkYgtjA4P4lIJkXSNjgzRzczPzNDMDYyWgjoKi1LTMCrBp0bG
 1tQCLi3HAXQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_anshar@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733467327; l=2838;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=LfFLuF4ji/kVInVTaqlpwXqrFKokO1KMpLsxrSto4Eo=;
 b=apMza4Au9MGEqMRZI6HrEXSj3FhfYKBJNLc1qJwjvWaTBMYIeASwvJD3MmC0RlDyxAhce8DHp
 nhZnJ1JTUUJDp/EYYmNquDXFahVY0AKoUgb7A+kaMiHCZG2iclzXB4/
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Jt0EoEmU-QYBVz5V-UXykJxfhn9MmDZD
X-Proofpoint-GUID: Jt0EoEmU-QYBVz5V-UXykJxfhn9MmDZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=809
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060046

The "capacity-dmips-mhz" and "dynamic-power-coefficient" are used to
build Energy Model which in turn is used by EAS to take placement
decisions. So add it to QCS8300 SoC.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 73abf2ef9c9f..2996b09e4c54 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -44,6 +44,8 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1946>;
+			dynamic-power-coefficient = <472>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -61,6 +63,8 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1946>;
+			dynamic-power-coefficient = <472>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -78,6 +82,8 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1946>;
+			dynamic-power-coefficient = <507>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -95,6 +101,8 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_3>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1946>;
+			dynamic-power-coefficient = <507>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -112,6 +120,8 @@ cpu4: cpu@10000 {
 			next-level-cache = <&l2_4>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 
 			l2_4: l2-cache {
 				compatible = "cache";
@@ -129,6 +139,8 @@ cpu5: cpu@10100 {
 			next-level-cache = <&l2_5>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 
 			l2_5: l2-cache {
 				compatible = "cache";
@@ -146,6 +158,8 @@ cpu6: cpu@10200 {
 			next-level-cache = <&l2_6>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 
 			l2_6: l2-cache {
 				compatible = "cache";
@@ -163,6 +177,8 @@ cpu7: cpu@10300 {
 			next-level-cache = <&l2_7>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 
 			l2_7: l2-cache {
 				compatible = "cache";

---
base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
change-id: 20241206-qcs8300_dpc-230f7767f603

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


