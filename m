Return-Path: <linux-arm-msm+bounces-64547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3ADB019C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F853AAD93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66462286406;
	Fri, 11 Jul 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGEOgZ6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA3A287514
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229572; cv=none; b=qMRTo47Vm7+/pyPXtZhqNkF2HFjsGd00TCEmQc1dfzPBMlWuiXuNUahl9uNAmkIZaPPyWCpuh9dFPc3EXdWd1hIJVVsvfJp3kP2AfM34i3kR2RmYayvr4CxaaYnjhkyJsdXSZufJc/P+IyAFAB4+JncCh5sYU3GlADt/7vj4/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229572; c=relaxed/simple;
	bh=+SidfXCtxcuv3rbxX82jTyg+sTVUFkKJQD1qs/h+H5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRnXEytwy7U75pK6ixtMUJCtA3GL16+IK7OwSA92FQZlCUOKCkmR4mFWQZk/Jkh/twHCGKfnnL7Gk99nxZQGGEaV4sgZXVeoW34fF9MXRGs+jdqF0KJ/BeNnyTWYUCP4GxLuagKRQujLEf6EmPb9c6TtGXiabLpF0N09t0YBWf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGEOgZ6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BADM8s022589
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JY1eENzJ9CN
	UOF8nGSxTlYX4EawIkdpuIjS76hAatz8=; b=ZGEOgZ6pp+7u1yfsSJHWazGjx6L
	IAjfEUtdPkIzMqtC9JnlH9b9s5J/s1G3NlIgWkp4oIeG0lynJ6/3HeP84P6GXGeZ
	kre3UhQkptIyoNoIOWcrOcy5ZBmntGnNyl44DUsnp9W5t8TxNUFRWiFiVZ8uxbAY
	JjRJquQIGUxuAy9bwr8a12qXOCyFTXEaR30QDaTclq6b6HWNCbDNOJWgmtFes7F0
	VVcft0I4odSEyJTCBBpoPvvcFS5XV0Z9/NkI8DlJTH810ES3QYmQUhYqLU09B+OS
	34fhSh8QsQvzM/eh+udb+L+TLqTMTi1GdRoYOzs7LYTRDZOik4T/Fc7eJJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b198gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:26:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23632fd6248so20606615ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229568; x=1752834368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JY1eENzJ9CNUOF8nGSxTlYX4EawIkdpuIjS76hAatz8=;
        b=f+130pAzB508nYFueuL0Qb82MVHokUSfQ5oXwa+MNEddIE8qzfpSHA2UYU4hnXxfJx
         hSZiS0uRT423aAtunJpJy8ozDgnFKyUAwSZ++muclGL8GuL9xzWGUZyKYn45tzdB5pp0
         c6NzKXWojYjhVr/ZyYRHwuUZicH+TvT/8Rc9tmXhYZ4lCh2TslVIzBA+IxVqio5BTYXL
         wpGFNuJLO2lkJCGSb0fWSW0t0qLCqc4dqWJ7cqXdQ8hSQwgTEMq+wMz9vDXKJb972MVi
         VkaLwAacCTM0X3Z/NKAfzmY6/qwD8lAV8H8rH3q5QgNg+t1uJ/2Yo+5SzAe5MYx29mZT
         fVkQ==
X-Gm-Message-State: AOJu0YxhIz9uEtw9BrrfMdDBju03yBV0JaET9msS5JAd0gdS9VSVWDY1
	KIaMksMyQ+avQPPGPeNK7Meb97lbf1hJLfUxO6iaTWkCFM2RskK/3oUwZksQER7ui3WgRF3YxUQ
	jgfl3ShLB12j+tH35EVoO8zkscU+OqLUuwX41tv6Bhule9hZ91t7WNknRdEQQitus/Lh0
X-Gm-Gg: ASbGncsn43AzU3aiB5eiGDl+8/Gj4oIC8/tbXEZqiDMZeEC8lvs/Ej2ncqKGZeQ+Km/
	/kDpe4dTYyxJRKFEcMskH6yzWTa2QRErOy9BscpSZvUMfjc4OZxUSl9/vbWBtt2YlgRTlHMlmVu
	iUbtvR2U5uVBLBHmG98rValcij3mnwVa7elNjGcaqK38y83ZESCdi1Cp/DyEv46D3s1CoCu4CwW
	DCsG80AVl7r2GBK7GaShA7UC41N9eGSMnnvZnvEdwdJpvEjHGBbysB373e9qerkp5rIFJ3eeomJ
	8Dnf+HlR3sv8Xl1Tp45illpe31HgQWXNbY0EEbPr1xM5SfWeS7DP5AbksIhNuU/Og6BhGJmiOQT
	BP7Q=
X-Received: by 2002:a17:903:17ce:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23dede468b9mr45540905ad.16.1752229568159;
        Fri, 11 Jul 2025 03:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmI00xrUh99K4pgQvetVoxMNX9SAHA68gstkYI9J2o3S/QZh7Nsy9BahOdnTQSE8IWKtLR9g==
X-Received: by 2002:a17:903:17ce:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23dede468b9mr45540395ad.16.1752229567661;
        Fri, 11 Jul 2025 03:26:07 -0700 (PDT)
Received: from a10065738a1d.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436839bsm42861375ad.253.2025.07.11.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 03:26:07 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mdtipton@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V2 3/3] arm64: dts: qcom: qcs8300: Add CPU OPP tables to scale DDR/L3
Date: Fri, 11 Jul 2025 10:25:40 +0000
Message-ID: <20250711102540.143-4-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6870e6c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=PerH0Zu0CQqllubMy4oA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MyBTYWx0ZWRfX8s98W7kiA3ui
 idq+rWpsMoCnsDz44w4dXW+34i6ZERDWlLL34/ZA6/BbWNlcGh63vG+nxfp+Mr8kVqvxRkzlpe8
 3yYPnIdG5t3IAOOeQnsT/Ekca9ivXrJCKkPewHlbmyrJxbRf3m3d1sgKfo04M2XvHZy1I5pgasW
 r/Eq4bq/3kPPaREQNYEk75bSd04w8aPlMndOc82LEp4MlJtc7BxGEkp5W620y7mo/tEy8Z7yUMC
 sCnatmNkjNuYfJ9hxkR5ALNCv/PCtKNXnx8arwNUnLtl4kpiHC2C/6q3XfjoMiSSgojOYe5tVEy
 Gvp2r8K8sI+tp6rT50EGDc9J9bF0l+enqJCDl9cGg9Jl54Cudq0gbyJnViWlny/xGHIvGnpL2D7
 TZen3JlsPvhFJcbcR0loIvw/xgE9NM8ukUDdgV2S34i702Aem5pWxKAwU2AAX39/9K95IsH+
X-Proofpoint-GUID: Btocgl5t2B6bjpebTAwPRDPvBaXRjoue
X-Proofpoint-ORIG-GUID: Btocgl5t2B6bjpebTAwPRDPvBaXRjoue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110073

From: Imran Shaik <quic_imrashai@quicinc.com>

Add OPP tables required to scale DDR and L3 per freq-domain on QCS8300
platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 282 ++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index d6a58e228091..7d38ddd2cc9e 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -54,6 +54,11 @@ cpu0: cpu@0 {
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <472>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -74,6 +79,11 @@ cpu1: cpu@100 {
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <472>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -94,6 +104,11 @@ cpu2: cpu@200 {
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <507>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
+			operating-points-v2 = <&cpu2_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -114,6 +129,11 @@ cpu3: cpu@300 {
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <507>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
+			operating-points-v2 = <&cpu2_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -134,6 +154,11 @@ cpu4: cpu@10000 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 
 			l2_4: l2-cache {
 				compatible = "cache";
@@ -154,6 +179,11 @@ cpu5: cpu@10100 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 
 			l2_5: l2-cache {
 				compatible = "cache";
@@ -174,6 +204,11 @@ cpu6: cpu@10200 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 
 			l2_6: l2-cache {
 				compatible = "cache";
@@ -194,6 +229,11 @@ cpu7: cpu@10300 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 
 			l2_7: l2-cache {
 				compatible = "cache";
@@ -324,6 +364,248 @@ system_sleep: domain-sleep {
 		};
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(681600 * 4) (921600 * 32)>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(1017600 * 4) (921600 * 32)>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <(1708800 * 4) (921600 * 32)>;
+		};
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
+		};
+
+		opp-1344000000 {
+			opp-hz = /bits/ 64 <1344000000>;
+			opp-peak-kBps = <(2092800 * 4) (1075200 * 32)>;
+		};
+
+		opp-1420800000 {
+			opp-hz = /bits/ 64 <1420800000>;
+			opp-peak-kBps = <(2092800 * 4) (1152000 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(2092800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1574400000 {
+			opp-hz = /bits/ 64 <1574400000>;
+			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1670400000 {
+			opp-hz = /bits/ 64 <1670400000>;
+			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
+		};
+
+		opp-1747200000 {
+			opp-hz = /bits/ 64 <1747200000>;
+			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
+		};
+
+		opp-1824000000 {
+			opp-hz = /bits/ 64 <1824000000>;
+			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
+		};
+
+		opp-1977600000 {
+			opp-hz = /bits/ 64 <1977600000>;
+			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2054400000 {
+			opp-hz = /bits/ 64 <2054400000>;
+			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+	};
+
+	cpu2_opp_table: opp-table-cpu2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+			opp-peak-kBps = <(681600 * 4) (921600 * 32)>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-peak-kBps = <(1017600 * 4) (921600 * 32)>;
+		};
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(1708800 * 4) (921600 * 32)>;
+		};
+
+		opp-1344000000 {
+			opp-hz = /bits/ 64 <1344000000>;
+			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
+		};
+
+		opp-1420800000 {
+			opp-hz = /bits/ 64 <1420800000>;
+			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(2092800 * 4) (1075200 * 32)>;
+		};
+
+		opp-1574400000 {
+			opp-hz = /bits/ 64 <1574400000>;
+			opp-peak-kBps = <(2092800 * 4) (1152000 * 32)>;
+		};
+
+		opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <(2092800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1977600000 {
+			opp-hz = /bits/ 64 <1977600000>;
+			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
+		};
+
+		opp-2054400000 {
+			opp-hz = /bits/ 64 <2054400000>;
+			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
+		};
+
+		opp-2131200000 {
+			opp-hz = /bits/ 64 <2131200000>;
+			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2284800000 {
+			opp-hz = /bits/ 64 <2284800000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2361600000 {
+			opp-hz = /bits/ 64 <2361600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+	};
+
+	cpu4_opp_table: opp-table-cpu4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-844800000 {
+			opp-hz = /bits/ 64 <844800000>;
+			opp-peak-kBps = <(681600 * 4) (921600 * 32)>;
+		};
+
+		opp-1113600000 {
+			opp-hz = /bits/ 64 <1113600000>;
+			opp-peak-kBps = <(1708800 * 4) (921600 * 32)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
+		};
+
+		opp-1305600000 {
+			opp-hz = /bits/ 64 <1305600000>;
+			opp-peak-kBps = <(2092800 * 4) (1075200 * 32)>;
+		};
+
+		opp-1382400000 {
+			opp-hz = /bits/ 64 <1382400000>;
+			opp-peak-kBps = <(2092800 * 4) (1152000 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(2092800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1574400000 {
+			opp-hz = /bits/ 64 <1574400000>;
+			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1651200000 {
+			opp-hz = /bits/ 64 <1651200000>;
+			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1728000000 {
+			opp-hz = /bits/ 64 <1728000000>;
+			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
+		};
+
+		opp-1881600000 {
+			opp-hz = /bits/ 64 <1881600000>;
+			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
+		};
+
+		opp-1958400000 {
+			opp-hz = /bits/ 64 <1958400000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+	};
+
 	dummy_eud: dummy-sink {
 		compatible = "arm,coresight-dummy-sink";
 
-- 
2.43.0


