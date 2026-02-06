Return-Path: <linux-arm-msm+bounces-92015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DJnO/DGhWnAGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:48:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC49FCCB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68DDE30579DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2776366DD6;
	Fri,  6 Feb 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7pYLLc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWRMfLtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B6830BF4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374823; cv=none; b=boN6mA90IJvxx8/EEU5OKQbpKwQHIDSvlXK3G/yGkTlybpioZmVoeOGAJNj3otSWfSgD6QHgx+k+jP7X3CZTgOC9KE1v4lEzd030g/vZ2AELd5w/jZtAv8VveMA5/En7hB3kiXw7s2+WD+pUJFv+HX4KeVXoOPKhNRx+JoGY6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374823; c=relaxed/simple;
	bh=eLiInZTxq2JkRFf/2zRJXkHHXIrNxU/ynLjvd4SCckw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H1Xb/IKw9qMlaswuyemuKwxt7DIcYfqviwitVARwgIGY2VdresfjB/3hmVlINJz3rN9PnzIfUwoX8xAlFVF6VjUfvnBulyi4osZey3uAUSBsVGwBnulerdw+uZ9AsWlnduXYV857tshaZhnMo5pjh3hfoveHIpMBfLCgvokr410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7pYLLc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWRMfLtd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168VbOs1419628
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3kyl0xN3VFk
	kAWWqIt2gq8mt/J4+TVEnW9rWYiEDMKE=; b=o7pYLLc2C5R6oJNNuSXZsNdY9g8
	XOmEcendt9KOQbE+s1K0bpUeHK27wUyoB88ya1GDPMNhhap8EfZfGs7bkLbJQp/T
	2/ztfiV+87C+aktYZE+DDToT+AQatZGXGJVQPjH2zSZypTfzIi8hcqLDnjStubQ6
	taDddoG3eipLBSOOE0ngY7QbvqqYdBrP5rnrTe6lZnrjTNfxKz8o0WtdFBiDi3Qm
	sKkIqt0Lsk9cRGhrKQG3QOZBYvgFxJNyAzEiV7Fr2MSc3le4JgyJ60g273EhQcWk
	1ZGLqxz/ZHD877GE9dPOjjjivsV5haGkUntFs9ysFyWdfaoOsMZ3nriAPlA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a9aymk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 10:47:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso1186295a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770374821; x=1770979621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kyl0xN3VFkkAWWqIt2gq8mt/J4+TVEnW9rWYiEDMKE=;
        b=PWRMfLtdsQhCYa0B/tucFoNlMgAzI+8JqI7AfeZuXZxY8ICh8bPTc/dtFR3CGDNN5X
         TvA8P+TjJnRuJOvPjameLFDhZX8JdMlzeXGbC+nH+pxwfqELTjsxKd59WvkUEWVCkjJU
         gS/dxNoorN0b3Z2v7SUc91t1XfnDVOU4j4Vi7FiUpuZgiH0EJSKkXl7XccCVrJ7uLxTH
         ZV3XKqXvpRBK4vTpRH9dIwWRa0IchpEwgN+1m06a83rdm2LaeB3bv+yPvqlNVo2nhZiH
         uJT4LIL6dDJvyvq2Lehy6B0cvTqrxWE7MBac5V3h1SwDhKMHG8Kax3BUuPKrGQQ4JO98
         9QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374821; x=1770979621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3kyl0xN3VFkkAWWqIt2gq8mt/J4+TVEnW9rWYiEDMKE=;
        b=KHi3TFG00yrjRhxygPFAA5iUO+Ot/yjxOqJAcSMjqgYqFkr5DVXYi557Sw29+RQnXn
         z7UY3GEoRHD3zpb620W/rIWlbqOpirDpo7o0h+wSYx2gGVbrdspozWZIL1ahF34NmS6c
         +01uQUuxp7P6N3NKdd7cGGX+KbwpwVPsE7ZPz2m/G6pkhpXmTD5oZ+VM+JNE2Cz/vApt
         fZNrrNZZXFSCKISplQutRgDLTQWesE1/5KNMeQJ2+OZGL+dkeZ4WO+hzVOKwYTpVZQFd
         0dBFWFE8+zK4q3TH0oor0BmxS3do4BGAv1Xr18nEcQ8Eo5eAmBAdYbP3ouMbjmjllEOx
         T9wQ==
X-Gm-Message-State: AOJu0Yx6+AkpoT0mNsM9ONzH4FV/7b/O9E2A8CeWgpdFFVrRlFP3xk8X
	/nFxMShDJNjY3U23UKEMAVtGEtkyhGm1GgMAxpcKm+or8jM5q4OI9qs/Amswf8nT06g+5N6uY/3
	zl4YykwFghUVyMUvhKDlxz2diUrWSJGA+07O7iE2CAQUh6P1QtUpsdPvh0S3aq08M4iqZuuZvU6
	F0
X-Gm-Gg: AZuq6aKBdKe2T9FWsy3WMfgCZu9SY2oNBtkq5Fp7tYSL/COeOUifCPKNS9iNhtEteqA
	vhHeloZMWfqj2WkN+uBRocpvV61IwDWxVnKEHEI/djLswNcpFPOFCmRYnY9sh9RxEH406vfoUBq
	LwjfDaSUrgtBbcDOrQ+WL9gBgJ0VTabqm4H/v4DvbzM99Ce+ZLtU3e256IJVwbk58m5zyzSYnzc
	08DLubzJIB7+48CHLLpu5BxE4vgRgSXcK73S5tmojxovAYTVrZdHhf2yHbKesvGORcySt0/7ltI
	riQZdxnZ9YeEb7aYCFt1JvC59Ttuggq6U5OplR0Py8qlTjN5qvSo7a/QsYneYFCf3vyhy15KDOi
	zvrrug5EQaGjWueqFEvd3ODZF70tZgSOYXhSRuzRWzyI=
X-Received: by 2002:a17:90b:28c3:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-354b3e6f6b8mr1862748a91.34.1770374820986;
        Fri, 06 Feb 2026 02:47:00 -0800 (PST)
X-Received: by 2002:a17:90b:28c3:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-354b3e6f6b8mr1862732a91.34.1770374820530;
        Fri, 06 Feb 2026 02:47:00 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b21fb723sm2081136a91.10.2026.02.06.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:47:00 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
Date: Fri,  6 Feb 2026 16:16:42 +0530
Message-Id: <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: llCojrkHD9GvjjDUiV2ra2jC03MD31iX
X-Proofpoint-ORIG-GUID: llCojrkHD9GvjjDUiV2ra2jC03MD31iX
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=6985c6a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=K8I2XD3YpgONH663DNkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3NCBTYWx0ZWRfX0vEjfhFIeaiy
 m88MP3b8nP9C0v27BKFcc1TiljFI7hMESDROfDI/zi13EUMNvsBfBjCkeQchXNgZSymBzgRGQdP
 9ldwCo0XPbHW8F0ax5s7s+sW296Svz/gnX78hlrM3FFxB5PnDVumU2iKQBfXvyaGKEFCC8ISV+S
 1H6FAtaCuEeytU8hmCPK4wxDDZKG/ffH9VFGMdXEXAFKmBXbli5ga9Xr9B3p28zLuEmX1iPhK70
 6VhvQWjFslzylGhPdoI4jjH2hzHd425ZaXGHFfDg97bRoTZ6f7LPdPLdkeceITvLy53bJ/Yt+DN
 3E/gragnw4Hpt67SeVocIfXA0up9F5LWxAg3IkzUQgQqq16V1YfU6ODNhP6fDo2eXDcnxGYc44K
 2zHraE9xlKFTccRLmwxGBZt1tWZUb7qeMIHl6lOrDDdtBWLjzJXH2ibAw719X6HexsP43ZUeAg/
 Nb+qtZvuuZFjmsCe9UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92015-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,a400000:email,qualcomm.com:email,qualcomm.com:dkim,1f40000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EC49FCCB5
X-Rspamd-Action: no action

Enable the tertiary usb controller connected to micro usb port in OTG mode
on Lemans EVK platform.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 53 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
 2 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 473cc2a81670..71d1793dac3c 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -107,6 +107,25 @@ usb1_ss_in: endpoint {
 		};
 	};
 
+	connector-2 {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+
+		id-gpios = <&pmm8654au_2_gpios 11 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&expander3 3 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&vbus_supply_regulator_2>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb2_id>;
+
+		port {
+			usb2_con_hs_ep: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -190,6 +209,16 @@ vbus_supply_regulator_1: regulator-vbus-supply-1 {
 		enable-active-high;
 	};
 
+	vbus_supply_regulator_2: vbus-supply-regulator_2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_2";
+		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -795,6 +824,14 @@ usb1_intr: usb1-intr-state {
 		bias-pull-up;
 		power-source = <0>;
 	};
+
+	usb2_id: usb2-id-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
 };
 
 &qup_i2c19_default {
@@ -1143,6 +1180,22 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs_ep>;
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..2710927c9172 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
+
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.34.1


