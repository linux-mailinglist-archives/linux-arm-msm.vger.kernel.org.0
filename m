Return-Path: <linux-arm-msm+bounces-37593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E89C5642
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05C928FB0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D511FB75F;
	Tue, 12 Nov 2024 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l4zM3z4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A231F77A7;
	Tue, 12 Nov 2024 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731409324; cv=none; b=T62ak2TB0JsgqmD3BoebmiPH6qvvRzv8s6TU2B1a8Q5kcvuR8WAwMWN786c2Y8bVf1A19SaJeC/zeH3MtoDq4FWD3ux8H9J6yJ4BS6FN0b7ne/nzKAz5uNYapa8pYQ7y1Xn9z4QHJw2+KQg/ubCycJSsclP3sbD9e77KMCVYkds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731409324; c=relaxed/simple;
	bh=5KfUg0YOsEzPPCGT9maCxQzQVsth/OgqTvMecB45+jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=i/MynGebNzy6Hkn7I3Ap+0GN8qP+v1PKz/Uxgu5Lv1JnTfCbbc0cWjqERjMk/3PE5Q2tHYUV+gUniDDNO/DNn6MKdqmlhuYnqRGYfUYPH2a6YhmbGbjvsyCqCogLZWE8KCcZvju0XxlslkWFM6wtMa+SKfJJC8PMly7cnMr3YOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l4zM3z4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2DtB6020024;
	Tue, 12 Nov 2024 11:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4eIblupSAURCtRr/i0Ikcl
	C40xnjd6QYmYxBpcye40s=; b=l4zM3z4LdEoelNax/xsz7u8vDXyjaJMbyo46n+
	dcTS7thFVQqDx9RNBHOBpI8Kq7+nBSs6AsKrDOmG5N1jyEtFmz2khxihuhVzxDXt
	BXdNfda8P32r/iAkfPzD8ybrny1X/DYv7P/5erZ4FZ+2n9cziEnQqdTfQPdSdLNP
	XvPPXm8rBVoUoh1Xh8b5vYfx91nWIXxFwbxcTKyyMICoYb1MnF2HAGLHGbjTI17/
	9XfBtHLJJn4c8MnCIMIMv+9LJ+mXqHhxQgVKCeOO0VZOF8WUMKa+sDNISfiFNm2U
	yB5yZoJPv1gxd6OiqjtusGgj957ZqM24N8yGrnzCkNbV4KRg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t1186xk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:01:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACB1wAB027366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:01:58 GMT
Received: from hu-mkshah-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 03:01:55 -0800
From: Maulik Shah <quic_mkshah@quicinc.com>
Date: Tue, 12 Nov 2024 16:31:51 +0530
Subject: [PATCH] arm64: dts: qcom: sa8775p: Add CPUs to psci power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJ41M2cC/x3M0QpAMBSA4VfRubZyDhpeRdJwximxtkhp7265/
 C7+/4XAXjhAl73g+ZYg55GAeQbzZo6VlSzJQAVViEgqmEbr2o2zu2TZWdW2nCyZVhO2kCrn2cr
 zH/shxg/IlJPBYQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_lsrao@quicinc.com>,
        Maulik Shah
	<quic_mkshah@quicinc.com>
X-Mailer: b4 0.12.5-dev-2aabd
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731409314; l=3117;
 i=quic_mkshah@quicinc.com; s=20240109; h=from:subject:message-id;
 bh=5KfUg0YOsEzPPCGT9maCxQzQVsth/OgqTvMecB45+jI=;
 b=B8HsMrlFyk5OPwp1yMHvOb+r3nRtzbs5/dSqt6PzNCoLsJb1EasRdnQ6lP6c7eadz3LfZCvbH
 RTzo/VDdufVAqkXLhnq7vKg9YzkbPw7KmV8pLwqQhp7I089DeOSoA42
X-Developer-Key: i=quic_mkshah@quicinc.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uaGX6g4n-rNX8wGs1U7TukbF8gonsgZ5
X-Proofpoint-GUID: uaGX6g4n-rNX8wGs1U7TukbF8gonsgZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=826 lowpriorityscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120090

Commit 4f79d0deae37 ("arm64: dts: qcom: sa8775p: add CPU idle states")
already added cpu and cluster idle-states but have not added CPU devices
to psci power domain without which idle states do not get detected.

Add CPUs to psci power domain.

Fixes: 4f79d0deae37 ("arm64: dts: qcom: sa8775p: add CPU idle states")
Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9f315a51a7c1..26290feb768f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -44,6 +44,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <1024>;
@@ -66,6 +68,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
@@ -83,6 +87,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_2>;
 			capacity-dmips-mhz = <1024>;
@@ -100,6 +106,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1024>;
@@ -117,6 +125,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd4>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_4>;
 			capacity-dmips-mhz = <1024>;
@@ -140,6 +150,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd5>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_5>;
 			capacity-dmips-mhz = <1024>;
@@ -157,6 +169,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd6>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_6>;
 			capacity-dmips-mhz = <1024>;
@@ -174,6 +188,8 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd7>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_7>;
 			capacity-dmips-mhz = <1024>;

---
base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
change-id: 20241112-sa8775p_cpuidle-5f3bf2a97219

Best regards,
-- 
Maulik Shah <quic_mkshah@quicinc.com>


