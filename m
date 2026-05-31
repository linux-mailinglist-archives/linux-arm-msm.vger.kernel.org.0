Return-Path: <linux-arm-msm+bounces-110451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPjmCunfG2rUGwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 09:14:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCD614CC3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 09:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4597C3034328
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91EE35838A;
	Sun, 31 May 2026 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz2yTVTT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYacKecS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECBF34CFD3
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780211681; cv=none; b=NargNcNwIE9a/venEyHkisy5GIuZOWFlqDf6OnvQlfG5u5LfAgK8Mah13UDIVDLr3yJMGfj6PF3atvoYnM5dnODU87KKimG2nYgbNK513cMALKqFSYJWeymME8iMFai6tj0M1t3NY0sBYtWsUcBW3Q4Up3mCxQ0z1yrZE+UPlbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780211681; c=relaxed/simple;
	bh=sRD8+h/zrGWwa7bxwhqrYIs3S5bmPLnHUYLktp5llKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ah5ke15qMX5Tiq7AJomWQ+xGYmuuH7Ts4PNHZCG/7X+CiUTNzfYR826p37xUB5yXTWruOHUoSAB3cD0RImgeEjuD7e5SqJ2znmKQC/5SKJdYwE9Hffn+15/yG+C7r3enKDx+gQQhZ6tfa9JwRsGfTYHWJUlv0npbLMytsDLPXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz2yTVTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYacKecS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UJ03Dr3838769
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 07:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8uUv76Qs1gcSv4smC1VE6Aw4WwFIqRUE8Ob
	wAip2mAs=; b=bz2yTVTT91/oVamPLsAFgQdm+rmsoUb18rd10EtzTNhGEbOoBmc
	ba9TiH0IAOaPhChqDsa9wKjGnGjrS0aW/+KVwUwapYU/Na8CK1i3W1XcipOqAGF3
	D3seYFiBwHm4ipGhGlLReT1Nc27Go6Kk6f/OxX406ucmHLTky5M3T6RR/zJKcYE3
	0+KiomhKV8VYmt8uIadWjNB5xfGxAI3pv9b+bklWB0A7L4UwdRQU2fCfYLS0PjOJ
	fdHlurDOQ4STjJinlc4F0CTM/ihol73MsHlZnp4XUL38NXXYIaFlyB2+AzljvVvO
	qzk9WtIhgk1KzsYsvONAixty++HJDguif9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fb2wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 07:14:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-305fe3b697cso303334eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780211678; x=1780816478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uUv76Qs1gcSv4smC1VE6Aw4WwFIqRUE8ObwAip2mAs=;
        b=OYacKecSK4l7w/hvN4svzZrK4J8oojjAIJLlKkGEYlri3pu6SbU3YJ4VpKmR7O0f8q
         zKSJ+PVTRnClsVkbw60iUoEVRkj70aKnYNbJe/2vRmKIEmMnvQ1X4nZaDuIiCW8fZqi3
         hMgJVAYHJq/FV0HIJcbl75gCd/OdKFXZt4HNkN3C8tiHD23StOaG6PAag833bPouS+v/
         BS6c/knt9xtiTPz6d717JlFgyR5CSCKh3zwf9+9L3aL57I3XPJWb+lMyFXSeASV70K1X
         Lfms3hmC4re8PIfLJ96BZob6GVWfSrGr1HolZn86Ss1BY7hwEZHvuxlIgW07n/MS9bc9
         sFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780211678; x=1780816478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uUv76Qs1gcSv4smC1VE6Aw4WwFIqRUE8ObwAip2mAs=;
        b=jU6OK37S2fhhY4VXyTvES4Pcg+8SOyLBLhFoeMKuiyssLDUPVQLP2K09SP6oFcQjMy
         QnjWB6ugBSPGRAq1JZ1EO/BvbZ9GVOvTfLNbAhkTHelhma8itmFOt/PVrfGIfCAm/vdh
         llKVncYlO5pF3MAKoPM/P5N8pjYPLZxMGrT8xJ7DvEtMfifwsDZaVds6p/YijMgJJBvW
         QCRoFRvGrpWZeZpofQcX/sysBB38d+sUXqVHHlGZTm3xCjAjNmpN/jhEuarv3xyFwkib
         slCLJ1yG7TduRHTV16dsWTKaHZ1hs6nInJM/m/lFLoHRBZC3j/AImhSSmO44Zqjmc1sx
         nbkw==
X-Gm-Message-State: AOJu0YxonTwBlTT1oTSXV8kbDaUOB3j+r5JPt8dEfffU1E9275/fDdrt
	tPCRqD0Jvn/FitdxffJQEH1wXYM4HCAJ+WrGrtj4edP8/kb5yqrWngUH6VSg/7yZSn66SlVLOr5
	yEzGJitHYAlyFupkLklVwWDfJojFIedsdefLf32OVI371uJMeoRYDmhNXi0RtdNHKek6fDvfD54
	xVF/64lg==
X-Gm-Gg: Acq92OHaDCDlpItwpY8nK1YdbLEhhlBeOgFAs5F6vIIinE3zJcbO07GQoYDF5wJ6+Ct
	fCIqlRMQEsmclbXNJcCLmMzHcM2KKvkoCW8xucc9DNscGfmf0BIESNRdZKtAvSRDj/mNKG13mcS
	BtgT7387piigX/PrkvqRN1S73VBDzydPZrGmaUmKm2ESgeIfArtWAblvG3s5CcqkJS7coFN8OdJ
	jGMBmpFmnWYGBYhib99ze9gCDDldAZzQim2IcgvHEZ5pGUAspmUJUV8vIplEwqTZZA8l4aqcShr
	cuLX0xfdgwYXugDo21iktjfDL6/NKad5CLoGWUc7FP8EHuoiWEdcIfOFGqm9kVd3j5SMCeBc6VV
	ZC3zdIeJEawpUvm4cesOk/Ng+xh1/P7S8jhcPYztB9TUxwy0JrWLY1GcIxA==
X-Received: by 2002:a05:693c:2c86:b0:2c1:7793:7bbb with SMTP id 5a478bee46e88-304fa64c553mr2812119eec.27.1780211678100;
        Sun, 31 May 2026 00:14:38 -0700 (PDT)
X-Received: by 2002:a05:693c:2c86:b0:2c1:7793:7bbb with SMTP id 5a478bee46e88-304fa64c553mr2812109eec.27.1780211677533;
        Sun, 31 May 2026 00:14:37 -0700 (PDT)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm5790518eec.17.2026.05.31.00.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:14:36 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B WiFi support
Date: Sun, 31 May 2026 12:44:09 +0530
Message-Id: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wZiVxlOpsRmnAWOvFeJGoYBkMi8_S_iS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA3OCBTYWx0ZWRfX2lx7Y6zcKjkt
 zf83oCgoxzO1VlMrwsYsPqVdx8Vsq9jZMbYDRDRwURUYaCeNiF9P+qPB27nr379YNQrAUeGfjii
 6jkb9cZh96wS+kl+BlZBdd2FtQ2jUIetzI4DwG5IPjHFjFqiy3Vv7KmDi46kdpbYPeWagliog9i
 zu93fPdZyCA27EodKZMNDZJ7sGoBtfbIbGSC6AULRIikBfz9A9oJsfwLiyU2RWb7cyKmHcCLGHg
 +zsvma1HAGopMET/LwTuzbC+G97JNrF0rURP+Coy7jCnEiZiJGBzEMPRgFMI28NKx4g2JMwzyH0
 0UcYWMLKF54zcXEc+WSJujU/9G6Jwl4/75aCePiQqlxAbpLRfYk3ZuaCZdapT8OORBvnAzwcZCY
 ZZuwl2KXAwTXzr6Bi5jV5DTRS5MZmAtOiF5JNpu2zu6/Mrs1UQRFCU9qISO73tck7d2XWeDYVNv
 0YDCV1ofBgxy2jjURJg==
X-Proofpoint-GUID: wZiVxlOpsRmnAWOvFeJGoYBkMi8_S_iS
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1bdfdf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BREHGghRuHsiCQVRwxcA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605310078
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110451-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,0.0.0.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0BCD614CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
required:

- qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
  pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
  LDO regulators consumed by the wifi@0 node.

- rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
  management.

- wifi@0: describes the WCN6855 endpoint on the PCI tree.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

The Arduino VENTUNO Q board uses a QCNFA725B M.2 PCIe WLAN module
connected to PCIe0. Two GPIOs are required for proper WLAN operation:

- GPIO56 (wlan_en): The WLAN module enable line
- GPIO54 (rfkill): The RF kill line

Testing:
- WLAN module (QCNFA725B) successfully enumerated on PCIe after boot
- WiFi scan detects available networks
- rfkill block/unblock correctly toggles GPIO54

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
index ca14f0ea4dae..bd5b8a161e7f 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	rfkill-wlan {
+		compatible = "rfkill-gpio";
+		label = "wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
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
@@ -347,6 +419,29 @@ pci@0,0 {
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
@@ -448,6 +543,19 @@ adv7535_default: adv7535-default-state {
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


