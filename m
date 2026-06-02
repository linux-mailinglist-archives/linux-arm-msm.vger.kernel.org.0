Return-Path: <linux-arm-msm+bounces-110727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFnZKdmAHmo3kAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:06:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F770629586
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F06C63011798
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F6C379ED4;
	Tue,  2 Jun 2026 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gty3hKHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOz96wZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DC32F7EF5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383941; cv=none; b=FkURZpInDv/7QjtyycrMIPqrsRMQOPTN3112v8HCMZCYnWegqFraf0Lmpuq6RlFEROrqVyALYLBaMJNUrBzMidhrsY36QmlMV8Kth7N6BXdsRnuWF83pVkZjhiTeARlSB2uk3AhIoUkbNwSDXixqaxYvV5g1W0IpFO4xuKF5naU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383941; c=relaxed/simple;
	bh=M1z4d/AkWMR7KXcpNBR+aKejM7ycMN5MP/ihy5uwn+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dzlgI9QGquptJPww9sY+yNphrqMxLPytWr6B6Le0k9n7bZhdQkV1CjbKwU7CTqpTQcWkUkm/lYXROksUU/pXLJz0xU01yVfjeecA+Ae0glVBw4U+RrVgDaQWUMEJS2WYqGPGtfd7ZJRm4Fy544F8Qlm0m+edq/6s6VODYgY4CHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gty3hKHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOz96wZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tcI24012499
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YffJt0zE+Kte35o46jx3rRp1xZd4ANe81of
	6Ua9ODGM=; b=Gty3hKHcwvdfcjvRTZKukoG0iNdcp5QsmhZMIBM6Ux1+AhtpSaX
	aP+basxry/Hj6zl5lt0yjE1SqUdbBdp2xZ1sxfiUrlG0cZ68vx63LONGJ2RHs3lq
	YMu7I5euYWZUISYapTBhmg//dcR56PxnrtNMKoWrZTvscwGdy1dt9neojk6wH1N8
	PA0KXSwx1jimP2eBkw5fEkHR1EWHg3JlXu9H2dZkzDDEImMZnEC0jkKIUb3I+dKO
	EMoZUSCBos6y8xh1R+wi7+vpDA/HrYk76q84q3O0wk+NcubjbM4bCLefcAN+49vD
	1u1CQ59Q9mSSi1PG1S0UQQ0rqitkUyMBCyA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4g92b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:05:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-135de949041so19192144c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780383939; x=1780988739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YffJt0zE+Kte35o46jx3rRp1xZd4ANe81of6Ua9ODGM=;
        b=cOz96wZJKFFYmhDYgfbesCWD+kIsNsvvjqpJqVWKMm7AmbKyOkqhglrzYbuNo2uK5X
         eKIjChezgDOqNM+f9/rr+HTIGCS20nIL4bAu+N6NaGO9OgfBZiXqGBMnk+KCap+A1GZU
         gvq1YuzZfTXLgAG8StsoSSkC7D/+4IU4zi5Ap6J6XjxAhJGvjsENnyM8pxd7E9RdmwJ+
         S4TCxHyJPUdHj0Zl97q9Hg9xZC6idgTdwUfTceF89mg6INBnuQIpb7aZ4gyVCwxAEqFw
         thriIdb40UNBxg7WS38u3vKCk9acb5YqC5jnudZiJU9JEvfJNO9TPBZTsD4hpjKxNL6T
         wjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383939; x=1780988739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YffJt0zE+Kte35o46jx3rRp1xZd4ANe81of6Ua9ODGM=;
        b=hpOlQoYrwICigkjlPV5lmBAw7T/+FpvoOVUR4Mk40PBwgGCw02EFv/smkWTVNoGmgK
         5tka/2gjl/Kslp0Hf33RcOermeopsauX1VlXgYYS+Upzak9IRsnnBO8OcxBIB9y/Mp4h
         UhuB7aEOR+1T7X2cvG41QvRtw0CppbD6ySi6KribyX4AzSNRYcKKmIakY3u2PFnoyZdh
         +0wtVdZmY8sYcneVCxlTil2L5YyhyVPrhnPwLtDsoIV2gII9D8VXUNVP0Fw9fdW9OkY0
         mHNecyN3CMghRwXq44MTs+teevxes5QVWsd+QY1mndD9TmRYlpee9ovfUJaArL+arWOT
         Wxog==
X-Gm-Message-State: AOJu0YypX56f3Mz7KCE96JQm39LOqTb6N+WS1BgLZmS62s/0PFn6SFHp
	RldRlTFScIBhfyJ0x7LYToI17lp9Q+Ope/vAFCXdyiewiBoUxzdUqdU3+uyUG8Nor6TfdTrYrLt
	do8eZOk6mdeymOnGUWJ0R1MBS9lLot53FxpLQUeVQMbY87F4/I+6JEdK3z42oVI779eqXjL6qwc
	rv4CzadQ==
X-Gm-Gg: Acq92OHQ9nRTUaJoY1Q6K2dQrrejV9wxO8Dfq1jYugyxHz5fETcpK7zVZT78vdeLVvv
	JUepXCcbKthiM/nn2OLAj+67K6KvpSqAQhpoCrSi+irr1Jx4hMqaeex2DOfQ8JtgPBLtyhoNMOr
	h1aVW7baAeTR8kBnXVVv2NOLgE71XyzhbPDcik8ke8Y+qr88YDsHCRude2jkUiJofgBi1sb9SU6
	vWK9UMUw4qa2rNEFDXddH5j+pd/H3p3F2SY1gDGowZfnSAx3Uk0mfMbPwEU3HXubwwjWYrhZhKh
	WuRjxMWMnr1AalhKtkFSACWYAczo2zDVUPtKyl8DjtlyntSRSC5P/Slg9YIvINGnnTmf3wjcu3a
	/N2W9fYOyysuiMIZYREB6egnfyCsaf0T1Qq2HNcCTegSA42wAA4aGTfy+eQ==
X-Received: by 2002:a05:701b:2211:b0:137:ea00:3f49 with SMTP id a92af1059eb24-137ea00436fmr1092256c88.35.1780383938591;
        Tue, 02 Jun 2026 00:05:38 -0700 (PDT)
X-Received: by 2002:a05:701b:2211:b0:137:ea00:3f49 with SMTP id a92af1059eb24-137ea00436fmr1092243c88.35.1780383938004;
        Tue, 02 Jun 2026 00:05:38 -0700 (PDT)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137dc179940sm6834129c88.5.2026.06.02.00.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:05:37 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
Date: Tue,  2 Jun 2026 12:35:30 +0530
Message-Id: <20260602070530.4194262-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MyBTYWx0ZWRfXwt2SgMPW4H/P
 Yo9DKyY+R1OiDlT2ANSzxav36U98zlX65C/6R7sCJPX18umHv1Y+FWn3SuQQBQLWfRbwz4aQKPj
 8LoJv/dfnMjgXvR10mqxXqswvduGLCUaygq2deu9dFBuRvk63pzhRwhyGLFjeH+dAbUgcbFvZXM
 rQJigFu2HbiFucUDMlpQWqDWfKk6umIYglihTHTUv8vYRzvLg6cetxmpLo2ZvGWgfeK+RlUDv8N
 oMRfvls3tJH1tRal9qmpwj/7/6BsQXF5Tkl6EardU7huO0UUKZ2vZ7ZnZf38n/V8DlOpLQIPieR
 ZjhxMgKOoNl7xee05VmvIn1RZ+VzlThFpmGANOO8DCRg6vzMaDvbEI1UGB+ddwqCbd3ckqtlIeG
 iDcMjh5/oTnSros47X1ix22CIm7n25B7ELxwmxcAQtePIv8QMLbKjhDxYvPwngzHD+jUKyT6vSJ
 rvC0Yano737ZbcGthUw==
X-Proofpoint-GUID: Sa0sF9Tu5r76o6sriSkgUUrE-OdRG7NF
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e80c3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GbHRhdJkuxPqJwqa-VkA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: Sa0sF9Tu5r76o6sriSkgUUrE-OdRG7NF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020063
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.1:email,0.0.0.0:email,0.0.0.2:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F770629586
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


