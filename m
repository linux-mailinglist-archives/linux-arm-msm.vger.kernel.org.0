Return-Path: <linux-arm-msm+bounces-110414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEApHrUuG2oLAAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D08876122AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3742431642CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FA93CF69F;
	Sat, 30 May 2026 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpkVeV+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/NI9DyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB23CF663
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165731; cv=none; b=sg52D27cKl07ebi6+iDfUm+l1iPlrI3ijNso1FZCmAp/RmEymNZzLlEWA4E9saUOQmIHN9gscCNSfpcJPvLHpJYJQ8tAxPL0/9r4gXnkHtXDt/RpTuwMpj3581O5wxbtwUcha508xAVSUIRwx3eEbgj9tnS4gXbtkXQrygzo3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165731; c=relaxed/simple;
	bh=NQKSEG4TFwIgghFw3/HPLhZFDgnqaB+NAFGZeq8gBAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHa6PaiuENveSZs29P9DQWX8sdniB4ue6D34u+4MPJYQZrFMTUrgmW4y3bAaeVSREoJDHV7Y7VxiFPxZWEJDRuHf9NOO0LUKl/TloS/+6P3KbaKWsO42+9+veNomDgsK8GqgovhB7+V2+jq+dOaAS3VyPkKRunvEQnFPGnyuBB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpkVeV+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/NI9DyU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOZcD3353184
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QzckrjDhK5JtmL+5NHYbLPDrKVDpefP4B1O+ltvjO+4=; b=RpkVeV+IPQ0M6BKV
	kK7xgr8f4vsMQRtLSW8z3biPSXjFL55kyKhdAjxjmE7QR31ANMZ+3E6SX1zOBAma
	6i4CBgFu5rM+0JG5Rd1tRShShlpGb51v01IK4AZ1q/pG9d1EYfe+LgZf7qIDrv1l
	4r9hGT9ant9YGuTfezJbyXu206BsyVrlhpFbK0UMoj3QaOYTjEX/LVGyWwl87WkY
	hkiBWAQ6LY5JRqxeQGj1D2pdqJEPCfSlpewJRSPLG9KerK85fU8HXnmP6wexWfrX
	A836EABCXgU9sbTVBD4PbBXiJ8MpDx1DIYuxXTy0FFOdI4nO9AiljrD2fcclHAiJ
	qS/Ciw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2h9jpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso129989165ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165728; x=1780770528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzckrjDhK5JtmL+5NHYbLPDrKVDpefP4B1O+ltvjO+4=;
        b=C/NI9DyUWroqUFedupbmtVvr5cTF/RiF5jZUJAIYgukbqNiVrBpTsh9Axre3dQguLH
         wlBYpGueFDKYIfodD+4l1nNjdLQGpdjHDLc7660Ai6YMVdsdPF+K+/usN8nNitb9pUOO
         wivA9ahODK9HflJy9RrE163F5KNXy6+E4aBqsbZXgqt20B6ZO3hr0cWcDn/cGo7eqXmG
         Dp4O6yBTjYeivfNsb2YKPxid2773Z/vt24f4cbFi+kd0vicW3EpRSxhmssil9TxUDx+5
         MRlb081E8AUMVAFJtMyi3VefxWrvj5RpS+P60nXUgWSTA3RwKUfZ3xfv6EiXceK1+TvE
         F76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165728; x=1780770528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QzckrjDhK5JtmL+5NHYbLPDrKVDpefP4B1O+ltvjO+4=;
        b=GIuN9ZswfMzT42T2G4nclyZL3RWlNaFnBKUMp2c5gaGs2icn3SozrTbiKn2iDyonYN
         wtGVUmdN1WHi2U31RA4fySQiZZXduoa0+EtU32NtpMRBo//A7u9wW6tmaFEVoxJfD39E
         1jIvCKoP5+zcra+nqQWIf5cRaxwAA/CdYB4gVCJ9qpIKP7mfZEoFHUCB7fh6+W2ClNW9
         W6O4A6SyAI3TEutfrLu1QkGSiN2BdK3AREfGRnFUueHdLEvZEVcvr+/le/hzf1O/Ru7I
         Xn1n/TXiaWH1affR0gZQYAKWeM8PHuTfHxXLCIJdvAryF+3cTlIwOnFTbqZmrnMPcE1a
         2brg==
X-Gm-Message-State: AOJu0Yx/K+toaWj0XXbC6WbPPdX4YUSWywI5aGZ54P4M/GUPSJynCWrO
	9Nx3ITd/Xax3yixpczCbAWdtweTroFQ6EDFd6G1f6LED/RFOrI9trfOoMjhgN7qWYVhcQQuYti2
	Zj6rOvzNpuVPgTXD7TIgyDCtyQm2I4MA0M9ypmBMT/VQCRQPmEM7KIoTPzmaxJS4LNM7u
X-Gm-Gg: Acq92OEWo7FeeKp6iUQgR8/COkCknPVgoeVC/RlJSqWewjW8YUtda+f5VrMaWIuwmhN
	urUEvY3mjoIH81ceSN+fyt1U2kZQUnUXsG+nd5BEy2XtAuYyYekRJKShiGBObsQc1L0wBWxSpjS
	a0lXBkPWhVTsbkEW+AFlxjUYaI0pICcvZfC4nsJsnc+mTq6PNEVN3aOnDDMZZtd72rpXPq+m1A/
	/IYzAfIoxbofQSV672HltAExrXHCzWzfS6wQyKCaVu08bQ1tJf6nijQuj/IRrTI9kJM0pEaDNCp
	Ber4DWc5F6WJFXO8CMJVNAgXPswEN4X9F2cJ4ge/Rs+1LHiLmZY0XOkX89sBEL0lPMCQiK48Cvv
	sswmW8i/VpoZmbV7tvw5OOPDGc45Q1KQPYySqTuduvz622Ik=
X-Received: by 2002:a17:902:cf41:b0:2c0:b35d:ed54 with SMTP id d9443c01a7336-2c0b35deef4mr19990605ad.35.1780165728470;
        Sat, 30 May 2026 11:28:48 -0700 (PDT)
X-Received: by 2002:a17:902:cf41:b0:2c0:b35d:ed54 with SMTP id d9443c01a7336-2c0b35deef4mr19990335ad.35.1780165727987;
        Sat, 30 May 2026 11:28:47 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:47 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:28 +0530
Subject: [PATCH v2 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-10-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=8452;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=NQKSEG4TFwIgghFw3/HPLhZFDgnqaB+NAFGZeq8gBAA=;
 b=WMRNakvy+9LQ40Lx9p9XUl6DoLuyB+PDWixHSvLFTflnWAtq5ftWssWeIHu6mA5YgmYWQIbrN
 vPtP3B54yNKByRyvFm/E1CQgL8Yj0MUqHw/oOyKFu0PUhoBEuCRDIxn
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX2ZSkWIPpKDtB
 +sIrnsHVh+HrLx6WfAPgH22tFJIN3dL1UJsTA4xM7g/7gF4In2rhVlc5XCOhEezoruH8ffz0uC5
 tbGPbo7Nu0tOcpSuhsl1GVgHAstroBn0y1LksBnjnpbuDuxY2vV1Hr9BP6NlGaKULCv10GMfvJh
 8twch/98na6b5OUfegJvKzoBh7Ob4cg2HIVCFl6dCy856ZSCXnIKf1zOseYtb8W4fv2SnF9bzqE
 BaAd5ay38FJm+EmAxTNk+36Yl6qWa6wFvloJ0q5FRR2zD+Phuz+a5zPV6VMJK/c6M6tNhk5Ix5/
 YIsOjZKLT9dnrjInuU2NynEMiyz5dY+oC9D5AdaTj07ccqgCZSIX2tI5uOyllCrwwDaa1Wi1Npf
 iVm1TEsq17HGTQJ/hsX0TZDOJS7SgUx/rj/0frUpqAJVsP3Z1/NwgLr/AjM9axt71GYi6NkUzib
 S9+x5YYiRhVs9jgAITQ==
X-Proofpoint-ORIG-GUID: d8WbRTT_B5Q-COE08FGR8u-tK2tUswDI
X-Proofpoint-GUID: d8WbRTT_B5Q-COE08FGR8u-tK2tUswDI
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1b2c61 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0EpCGlkTwZhbVQC-sXkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110414-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,f200000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,c600000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D08876122AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
EVK boards using the WCN3988 combo chip.

For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
board-specific regulator supplies across CQM, CQS and IQS Shikra
EVK boards.

For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
with register space, interrupts, IOMMU configuration and reserved
memory. The node is kept disabled by default and enabled per-board
with the appropriate PMIC supply connections and calibration variant
selection.

Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
 5 files changed, 223 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..c2ed0396533a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -16,11 +16,48 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +94,25 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..3bfd0050064f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -16,11 +16,48 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +94,25 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 8b03d4eafa6d..a79f44aff968 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -8,7 +8,22 @@ &qupv3_0 {
 	status = "okay";
 };
 
+&tlmm {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio88";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
 
+&uart8 {
+	bluetooth {
+		compatible = "qcom,wcn3988-bt";
+		max-speed = <3200000>;
+	};
+};
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..95bd797d009d 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -16,11 +16,56 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&pm8150_s4>;
+		vddxo-supply = <&pm8150_l12>;
+		vddrf-supply = <&pm8150_l8>;
+		vddch0-supply = <&vreg_wcn_3p3>;
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +102,25 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 37e4ec799976..eb08b7199c21 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2064,6 +2064,29 @@ apps_smmu: iommu@c600000 {
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		wifi: wifi@c800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x0 0x0c800000 0x0 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_mem>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&apps_smmu 0x1a0 0x1>;
+			qcom,msa-fixed-perm;
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0xf200000 0x0 0x10000>,

-- 
2.34.1


