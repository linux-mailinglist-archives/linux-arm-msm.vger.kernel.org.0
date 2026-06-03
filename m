Return-Path: <linux-arm-msm+bounces-110885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oevFHLKKH2oInAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 04:00:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73040633912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 04:00:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oIE5zmDm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XtW5cV69;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110885-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110885-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A37F63007B2F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 02:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859E8397E80;
	Wed,  3 Jun 2026 02:00:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404AC39656D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 02:00:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452012; cv=none; b=Tm+AToMV9ADkjBPYzbKNxifCkcBdb8uzhzJRYEZeW3/G3imvvoy5IG914BzlxJy9GvWZ0DEScdD19us9DZ/s6AZKnawPN1ZmKserEypZ0USLF8KyriR184KmwtdRBea0Hk3Y46RT6tJsGkdoXwrbDS8QDcOuFlY14ODJy+z8aSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452012; c=relaxed/simple;
	bh=DiriHkxQBNQtpfb6jcC9iAgcy81cVNXDaqSL4Lor/go=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pz44bqU+8uD6D/WllPOXhlUfU+liAdMRfrK+DgresXXevY4D+m5GU12IKf37SBRx4IVfKXZJ1tDeczKzTvTsoKxnU9pnJ1lKiXC0ugAe+eFPwmmD/iMuknIRZ5cko3DFADJl5q8J4oW6oYd3g8SvxHz+zB6kkadw6jxxkKGjYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oIE5zmDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtW5cV69; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652JNRi31316842
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 02:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LcNrlUHYv+FofxZOQiUgqQOI8dtRfNTi8nB
	Nq6zOxI8=; b=oIE5zmDmsrCQJzMY7pm5mJ3PRJ2lvcFwrqh1l0SW83PXztzlhPd
	RD3XMfLqqZnyShxxtKfHe5Df6Z7qTmWdIYaQZU4xJU9k6B2uHp/N/fRo00fQRKx8
	fGN8N1Filog9GCnwDHJq+05cpjy4U/1SAie2RCJBF7yWDmyjTeq1V+b7IURfsLd/
	hJV+p5TYe1WFOeKc+ORzHcFRL6Q9RZm75ESq0EleGwF1H8KGbue6MVFrj6dArztb
	wHQdfV274Spor+kvGxKAcPk4KMJcCwk7hnA6trYJPqCH06pvwb8ox7GJbnXlNBZ2
	dq/TE9p1KCQPv5MkvFeLhTH1h+MUJSsJ7Gg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vvrap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 02:00:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ee7d1368so4994540eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 19:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780452010; x=1781056810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcNrlUHYv+FofxZOQiUgqQOI8dtRfNTi8nBNq6zOxI8=;
        b=XtW5cV69FagQUchbvKQzI6futHFseFz5RLmjt7f4wSG1TuVuMmD/VSa9o2AbnkTW0W
         Vl0KmfeUm86qnkeKKT3KqTMzB6LiCuv27qSFwA/01Lk4SgOfLfqnYQIgl+H35OlDV4Sk
         voF+UHRYzrH2JeqDMv1pGdx6jpQjK91hcAj0xQNrGf09LRoA0LtXZ6mRZuGcDW32WMLs
         sCPm7uFRedosNNS2cfYDjscZzyInr9yA94U6Ep3BtUZ1Qd12v+WfMuBCBH+7QYz2SGkg
         XBK3VoYSQIji0UaM2CJnXSqliptqAbDVtchNx+15V7M32kYZVB7IK5bJm7eUcya1P46t
         R6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452010; x=1781056810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcNrlUHYv+FofxZOQiUgqQOI8dtRfNTi8nBNq6zOxI8=;
        b=TaSB8PL+pKXPR60NL4UNT39EAw9ubbjeFV7LvQHVhG3ffDy1L028BbwrMGk79AD1D3
         hpsx0lTo//qeDWuG9Et728hSRqcT8Cs0BxlWD6vS9M5iOp6W1UPOKNK+ldq2UGcXd4+9
         MTqhdFOp7rpB1QVBz2E20pckbzFjyZ5PNk5FCn9g7tTI+HR0HDzD+xYp+HddBDXKNDjP
         N2VLecYczrOFav/pVIvUf9rR8+BcvMyg6H4Ys88Ag17tmjXnN1L3pOECWR20oZ4/GaQx
         ehMVmXUpBZXFqJQRv6vQN1cM1ytd7ipkaSAySDtmslK7+OPU23CsnrVFcdyryS54XJtU
         987g==
X-Gm-Message-State: AOJu0YxIVhB3zU70wNYiXpHo1sF0wvy295Re9R3hbN2+ixYRbYrCPadt
	EqYrWt6+5/O/w14kmeyS8d1Xn0AhIqJYWUR/jUcIKOj97wXnrtD9ScgoODmoWzv1Z1X2cZxkKO+
	ImmU3G4PGctL3HFGMSkVJj7CDQlWBcLmGpLARblri2pN7aDexRp/eEeneElf5JcJzCj3jxAREV9
	m8dWOYSQ==
X-Gm-Gg: Acq92OHgMBTIwATujrD61KFmuQUH73VKJlpfbdSbsPwLHXnoRvDkEWg4QuX6fjWUyGX
	2FQOBN4OQv1hnvUT1JR3wfBB8q9fT0/cVvqtcqYhQX3H6dli2fnhNd3fqZM5EVtRwNHjWSQBcpS
	Z9ePWibL6KUiNRJHytFbilcCXVJPzb5iDpfp2q/+NYzE01fM0j7vR87rDpXvm2MLS2kc8+wzf8P
	gF+PUugZukPNP2swquvY8wnQ/YxXcZM9oXFW18VsoOGimyu6vNBqAUUH/ghtU6heHQKzgKg6brI
	EiLVURe8MWTHE2CH8PTs7Wx++V8a62jqxsEiuNiZJoECOm9BtHzhwAac7W7uAedPYzXT32/1mSv
	i4S1nnNotqki5QNichDacEGNzMsAgOygRzvhYW2XFrwGzrNtM8Ms/PBvlKA==
X-Received: by 2002:a05:7300:c86:b0:304:d388:c33e with SMTP id 5a478bee46e88-3074fa4c122mr718694eec.1.1780452009413;
        Tue, 02 Jun 2026 19:00:09 -0700 (PDT)
X-Received: by 2002:a05:7300:c86:b0:304:d388:c33e with SMTP id 5a478bee46e88-3074fa4c122mr718648eec.1.1780452008021;
        Tue, 02 Jun 2026 19:00:08 -0700 (PDT)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074deaab1asm1043882eec.17.2026.06.02.19.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:00:07 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v5] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
Date: Wed,  3 Jun 2026 07:29:58 +0530
Message-Id: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3S6NDSdhVCnQuSk18zZpWsk8C2LoaYRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAxNiBTYWx0ZWRfXyp0I/aguqNcp
 RF7qL0i3Y72BpMUzzWpI40J1uqxZ7USFO6v+ifExawF87JdKjbrYXU9kmwZS96xdw5hfq2eLKa1
 bL9P8RjGajmr5ZwvVt/BBDMLImrpfXJD6JL1cESEo+I6gjePsrrmR2BklO6iZRtJ7oIXrIvRSWc
 OO14+CKCckY8K0rXCsOiTQfqMsDk8zOeMX32MoQe8eu/2laEI++sGC7TMUP2RafMavRiM1fw9g7
 n+NZUjNku5phNjtxr4vBmmDPmhRz7DMgeV7PkYsdoabHfbwk/onqW8I+5O/CF2qzwxiq8npR42t
 Kw94IwGkKM8kck2t3TlKzGE2XcZVtIojQptAqk3oj7EiXp4zN27xZIiHm8UkTwBsyYiE2SGxVNA
 hjO15UBnH/ybLzQO6V831AHuTxlPEHYvzpaF1fy4ZPQp/jTGSx5Y3hJl6oE3H0TCpFx3Z0+ShqR
 ZTJYcBntH3y4mm2bKoA==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1f8aaa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Zrvy3XWoeDs7RjMT9-kA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 3S6NDSdhVCnQuSk18zZpWsk8C2LoaYRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030016
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110885-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:qian.zhang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73040633912

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
- Rename rfkill-wlan to wlan-rfkill.
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
index 379b796f261f..c4011ad51074 100644
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


