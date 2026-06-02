Return-Path: <linux-arm-msm+bounces-110728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFhbNjuDHmqhkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:16:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C496296D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E91373009B35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602133769FE;
	Tue,  2 Jun 2026 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NulDPE2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHsZeHf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2196833B6FB
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384247; cv=none; b=R7xobf7pLNI2SrC5/fTcq1A0fvopda9fUjju7/8Z5jSpKoSP8K345jXNuVUFeNfRe953IODb6MqbLjtyV30SpyfgStR5jyhRs5ysTNoJcDbcWmMP8lk8uRKX+wAcGNpcoJyeBq+ojAD2j0YAhN0jS7xvDn9QySs70rjm23agkBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384247; c=relaxed/simple;
	bh=UOnQFRu0U48hwYAzKknwcePfAFZb1FJw7AWcMPjRHdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GFbvvvPH3+iYtqtBfEaQJIT0jFlYjKuSaumbsOT/yvyp38xcRasZgYuK6GXVSnyLgOghgsjOSAMb7T03Q+hOoDf+vL7nBK5MuiwTcEjQfn36hgwB12CzwQ91HAHzB16BBp8G8QYJNnyaAKs+xaAF2F8eT3/Fb6LIAa8cwNcDRe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NulDPE2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHsZeHf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245hJR2691980
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0prCfBwXxcW9cW9jirWBk+0w3KssAX0zPFp
	KbxfBzQM=; b=NulDPE2ZD+50OvBG9jTmCt7bdeBcFszl0NLH0QJRXXwtGKsJHsD
	TETJ2vY7qs67iQo4DkkNU3iCS0BlV196Gb2CD5W/7UZSh3UAZ5CzLl9f4PnZEhGq
	dG8ykVx9Woz42+2aPS65t1he6iAHbsWu9ecNnY6Thi2X4MRooNStNkRZwYSdJGcd
	7Q1JZH6J62uIhE8UvBdhFakx0h/y0WL516V40mwtDsGLIup9/WkfEyLCd3zD1KQ8
	lWNH9NtdsTxogkq+ciQb0NZ7gWv2eNeOmoWa1aUXBekpkg7HxaRRqQ91BbvizUhI
	LmmIQHsXhreKXIERHClSDKpjrOKuba6az3A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumgp1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:10:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137ea73393cso4703713c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384244; x=1780989044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0prCfBwXxcW9cW9jirWBk+0w3KssAX0zPFpKbxfBzQM=;
        b=UHsZeHf05pBFhbtXC5ZNDtLgYALtNc0SNntL31ETiPO2j7I9Pe+6m3DUN8Qhc62CVs
         dcGbtAFVi6TQHgxfsF4n3ZRYBEVYWENY2QqxNBSTgqYWOPcy0LQYGH7MbCb5tkYAsejw
         n03KaMB9Eg/EwJVFKqsqRqZLGQ51v4kqFX6akKmmDyR2qTW3368i5U7wGLBaqra2M8nh
         KXQGLVITFAvPInldjHmkjsWHD0Vty6TNgXXjOSUOiA3OTnAf4XYPqnkCUgCyKGF7G6qa
         Ivtai8wpK6SDGZwecody0W4/QGVB3EPoilwo1fOZQKubxfoU0UWtXYqC+nq9Y7F9DsGy
         0UMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384244; x=1780989044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0prCfBwXxcW9cW9jirWBk+0w3KssAX0zPFpKbxfBzQM=;
        b=I4Pp6ZuJ8DbtLHsISolocCHI2731zLm8lsHHk8BVMDa1WRAjjm7uwaNMCpjPNPN/Gp
         luVdmGjN2tXYyTB7d13QY8rKaRlDGgj6qqkWJmdKpT0eX9Ej1HFTVYVKU+3O8G4USe7C
         hkgOLT+K6Vf75fj8Dgbc+2iEWnsvmIuOOCqokjnqdESu9eyaAKQb2ieP5xb/q/CqHG5Z
         WwkLhp4BgZ1ecuFxh2NqLCrvMmpOPbVgb+uW6QRbD4oz7du41Miw2mrSmXk8buRhunK3
         FoO1LD0l6s8yMSft5Bd1xPNxXkymZVvI2ZtLtF5prUC5uWxMvlyQMjWMFKW1pRMQ3OTf
         JXfg==
X-Gm-Message-State: AOJu0YxoZ5y9s3se7EZYTZzqenLry9pNN85cGfKgTFAKcPNKYDcs0KOg
	Cs0yz6CPoj2pKh9UV7GKsqFULqZqkCJgUgyefIsnIYLuEapmIk9AE1l81b1Slbvkget/2AGzMN7
	p4pWmwVjQjnbxaYXc0ORor/itE6AQpbsCut8JQf/89pPn7FvqMBeuikWkQr7WzhhOhRazcOE5Mp
	V+17aFaA==
X-Gm-Gg: Acq92OEWNr5PQqcXie7WNKSuewT/70v+Aj7RwL3Ocg3MfP5RPV2GVq5SAKpCsLXpHSd
	bxduOCo4rhcP1bs+kNeZT8Fqgk2TqOw/3xEHBc96Wi5qI2OlXLylP9WMdVjkKbAMwi93JzxrX9C
	AmCP38O4JpVabLrI5TvhVxbp8jOzj7/r0iQQb13I9bWglu2v34FHEpMtpKHOvWyTDO+QbuzwY4Z
	tlnxJqybZ7SESeuo0DnHH30B6QnfB1H6aSmAb4dx9f8BKSJHLaB32YhiIS2r5ZBxfQGZff1RQ/c
	4Hw3Kmzk9O1rqwdkEUNvbnOCRPqj4gFSaWdxrcw44Os0Rru+exJnoqNNx38JP7i+YHKlrVXYS+R
	RngYQv0m2SlDvyOje+i1HC2nEv6+2+YC7+xkr2LEPJfqrM1Tku2r7AE3QPg==
X-Received: by 2002:a05:7022:60a4:b0:136:da48:a3e2 with SMTP id a92af1059eb24-137d4283627mr7043584c88.27.1780384244362;
        Tue, 02 Jun 2026 00:10:44 -0700 (PDT)
X-Received: by 2002:a05:7022:60a4:b0:136:da48:a3e2 with SMTP id a92af1059eb24-137d4283627mr7043566c88.27.1780384243728;
        Tue, 02 Jun 2026 00:10:43 -0700 (PDT)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b2d04287sm11108335c88.0.2026.06.02.00.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:10:43 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
Date: Tue,  2 Jun 2026 12:40:28 +0530
Message-Id: <20260602071028.3810-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NCBTYWx0ZWRfX/ExtJDQY7UZn
 auxTk6LN4JARcN6X2qUi2CU4+ZWhUW0MCilu3zMSeObDnOJ4O/23i80923yA+3YMV6iFDOsziMU
 PDAWvenKz/yo6VW6S3RF9E/7IxunwZBsx/3s7cinn1PoqXo8mXNONcgriNCeOcx3QgjYL01sLU3
 m93CP4rwCJVUQ03LR8cTmV9NUIZ1vt2WvS5vANsoRk2S0Nn3lZRGZ5PlzbDaflNWNwUjHOxvg6u
 qX/KF1MfF6fTkxYpNv6+MmjMBVrD5M5Iajo+tH2nDmzVYDyeP0HQKC/32QuQoccCsCeiRpfiOPy
 pNL/HFBEBmE3o1GLcYbYUiBxXtLK6pSsBsV5XIJfpRabxvUP+fB7eFCwvf66WyocKYkh6N9lq67
 4woauwnumQ5LgjthZQjlqZ09zPg+KKPSp6CSC488vm9wkSHQGN8RRQcAcqxCoOwRmLtR+3QhkOK
 JAjuZmpbdFxvUIw/loA==
X-Proofpoint-ORIG-GUID: 03GsdhDGP6VMR2REpAT7tyJyEqTwMIWG
X-Proofpoint-GUID: 03GsdhDGP6VMR2REpAT7tyJyEqTwMIWG
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e81f5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Zrvy3XWoeDs7RjMT9-kA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020064
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.2:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37C496296D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the QCNFA725B M.2 module (WCN6855-based)
connected to PCIe0 on the Arduino VENTUNO Q board:
- GPIO54 is the W_DISABLE# line on the M.2 connector.
  Pulling it low disables the radio transmitter at the hardware
  level. It is modeled as rfkill-gpio so the kernel rfkill subsystem
  can assert it in response to airplane mode or a hardware kill
  switch, keeping RF state consistent across suspend/resume.
- GPIO56 is wlan_en.
- QCNFA725B provides only a single external 3.3V supply input.
  Lower voltage rails (e.g. 0.9V, 1.3V and 1.9V) are generated
  internally by the integrated PMCA6850 PMIC and are not exposed
  as seperately controllable external supplies.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

Changes in v5:
- Change rfkill-wlan to wlan-rfkill. W_DISABLE# is active low.
- Refine commit message
- Link to v4: https://lore.kernel.org/all/20260531071409.3557734-1-qian.zhang@oss.qualcomm.com/

Changes in v4:
- Replace regulator-fixed + vddpe-3v3-supply with qcom,wcn6855-pmu for
  GPIO56 (wlan_en) power sequencing
- Fix module name QCNFA765 -> QCNFA725B
- Link to v3: https://lore.kernel.org/all/20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com/

Changes in v3:
- Replace regulator-fixed with rfkill-gpio for GPIO54 (rfkill)
- Reference wlan_en from PCIe node via vddpe-3v3-supply
- Fix subject prefix
- Link to v2 (wrongly named v1): https://lore.kernel.org/all/20260501051918.1990713-1-qian.zhang@oss.qualcomm.com/

Changes in v2:
- Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
- Improved commit message readability with bullet list format
- Link to v1 (wrongly named v0): https://lore.kernel.org/all/20260425031712.3800662-1-qian.zhang@oss.qualcomm.com/


diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f..7e045397d649 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -154,6 +154,78 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wlan-rfkill {
+		compatible = "rfkill-gpio";
+		label = "wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlrfkill_default_state>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en_state>;
+
+		wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply    = <&vdc_3v3>;
+		vddaon-supply   = <&vdc_3v3>;
+		vddpmu-supply   = <&vdc_3v3>;
+		vddpmumx-supply = <&vdc_3v3>;
+		vddpmucx-supply = <&vdc_3v3>;
+		vddrfa0p95-supply  = <&vdc_3v3>;
+		vddrfa1p3-supply   = <&vdc_3v3>;
+		vddrfa1p9-supply   = <&vdc_3v3>;
+		vddpcie1p3-supply  = <&vdc_3v3>;
+		vddpcie1p9-supply  = <&vdc_3v3>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &ethernet0 {
@@ -348,6 +420,29 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pci@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			reg = <0x20800 0x00 0x00 0x00 0x00>;
+
+			wifi@0 {
+				compatible = "pci17cb,1103";
+				reg = <0 0 0 0 0>;
+
+				vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+				vddaon-supply = <&vreg_pmu_aon_0p59>;
+				vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+				vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+				vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+				vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+				vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+				vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+				vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+			};
+		};
+
 		pci@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -449,6 +544,19 @@ adv7535_default: adv7535-default-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wlrfkill_default_state: wlrfkill-default-state {
+		pins = "gpio54";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio56";
+		function = "gpio";
+		output-low;
+	};
 };
 
 &uart7 {
-- 
2.34.1


