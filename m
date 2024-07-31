Return-Path: <linux-arm-msm+bounces-27525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA47942D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B13A6B21FD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 11:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F16F1AC434;
	Wed, 31 Jul 2024 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n9b/Zi6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFFE200CD;
	Wed, 31 Jul 2024 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424811; cv=none; b=mPwsZsgSXQOaTVCaTHatQtuVwYv+jQ/mGPrgmTJgYQxCWqZprGe+TOYiVV0lWiSqkLfUsNoNjJuYXnPLjLQ+tYmEukEarfSIsmoBAYdxE34l8x2OdFWxytR4596H1Qinu1m5JWwOnuNNasmCQo+Dxcn/oWgDuNYEm046+mvWkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424811; c=relaxed/simple;
	bh=s9xMpfXpLGnBk7GaLD5jMyZMIUsZdL6zWseyyaUXlv8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Trsk0ueI36vNip2LVfQAaC5G3FWoeenyPw61pmJWDeZPmYjTDoVj62PhpiL6DoQLDLh0ZRFhMS4PeEMYepnRM5cde1DJ8Vz+dvfgCG2wNvC35703Tzf1IO44bqNGpQSn7YQnw0tK2QXeHTzrp3bV1XvC2jDDRAf+WyRZkcSmUMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n9b/Zi6K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V38g0E017606;
	Wed, 31 Jul 2024 11:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=Kk97qkhcIxJx
	nzA2qwQDsXu+UvBUjj9QbJg4EA7FNDE=; b=n9b/Zi6KjmWHau/ymAl5jCAMsIOO
	hnww+7JiVdt2xEtX77HHJcbzO/nfMN8rfawLZXVFpzqXabkWogLvB8UXZbWO3iyp
	Vehvk3LAyUEy/Dj35ReTIO9GgOAsVYXWDHS8iDHX/kirMJOT+Hy0eEEfQU9ofTW/
	+/D3BRH6tON36j1rU2/8pv3i7lA+9AGJkQLzDoQ/j8rFMflyH6CYzPmKH0zjC7Db
	y9SoP2HmaCcpQCkiR/UtMcfEBbGYw7v3d1KHBU3O+Umyh/nEaesCL7ejlk9Lq4Sx
	XmeAatg70NbznUMlikA/d9FhOVMZ3pzSs3r59yUrMVWjuvvfrLZuXffbug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mp8n3cdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 11:20:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46VBJu9c020502;
	Wed, 31 Jul 2024 11:19:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 40msyma5yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 31 Jul 2024 11:19:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46VBJuaD020496;
	Wed, 31 Jul 2024 11:19:56 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-anshar-hyd.qualcomm.com [10.213.110.5])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 46VBJtrr020479;
	Wed, 31 Jul 2024 11:19:56 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4089000)
	id 5F4815001A7; Wed, 31 Jul 2024 16:49:53 +0530 (+0530)
From: Ankit Sharma <quic_anshar@quicinc.com>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: Ankit Sharma <quic_anshar@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH V1] arm64: dts: qcom: sa8775p: Add capacity and DPC properties
Date: Wed, 31 Jul 2024 16:49:51 +0530
Message-Id: <20240731111951.6999-1-quic_anshar@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FtHajuGrjlxghVEF9OI9QusRYLOO8a3q
X-Proofpoint-ORIG-GUID: FtHajuGrjlxghVEF9OI9QusRYLOO8a3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_08,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310083
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The "capacity-dmips-mhz" and "dynamic-power-coefficient" are
used to build Energy Model which in turn is used by EAS to take
placement decisions.

Signed-off-by: Ankit Sharma <quic_anshar@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3bb609c9d2ec..ab15556e0647 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -68,6 +68,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_0>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -88,6 +90,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_1>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -103,6 +107,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_2>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_2: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -118,6 +124,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_3: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -133,6 +141,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_4>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_4: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -154,6 +164,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_5>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_5: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -169,6 +181,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_6>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_6: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -184,6 +198,8 @@
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_7>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			L2_7: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
-- 
2.17.1


