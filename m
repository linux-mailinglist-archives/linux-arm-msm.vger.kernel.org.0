Return-Path: <linux-arm-msm+bounces-105180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI5cBgff8Wn3kwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:35:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3841493037
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92FB13004F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6623D9DCC;
	Wed, 29 Apr 2026 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgAb0Lcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7130E85D;
	Wed, 29 Apr 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458948; cv=none; b=bOpCFS2mmq82aMbdTwr3wB4GDqj6BX2XbEv2pvnioHfBMdma9UloHekmFBGBQpDyJP2of1kMN4JWKUn6sJJ8qc2cUDjot/Km3bozFIEEZqYhxLRTjfF0FGoz4uLsRs6VQjpPScwLRuaSvi0bwdHPpOnaEJ0QiIyPmcNG80j4KIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458948; c=relaxed/simple;
	bh=19Rr29Idb4huD5A/su/DfBvHKDxafFYs9o48mQd/W1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=oGupCgKrpwnFcfSZGnStmXNW+AXk65LAuyiPe3Jo1JSCxIA/abBp1BpugKZQVcBy3yWKFPvZG5CESNBMcc1WqROTNlapVUFofwgL6yGVEkyvfRCx1RFQtPgeW60mRgu+0dVTlVfVfQOZA4KHi5Nbhx63ZIrZS1Y+Ek/1U4JjSrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgAb0Lcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pxOM963224;
	Wed, 29 Apr 2026 10:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mMhgb2w3UUprI9puCgN9jd
	6YY1J9HQUZQkJdF2fVHOw=; b=EgAb0LcyYbdPjy6eut5IbPyaO+yLXwPNsq1UKc
	cjvsH5GASQcihPYw1E1THuhsYWr+uGXeiYXlhM1P94BK6Cn7jhGJD0uy+hbZBHx4
	o+Fvr37M1Czu7cYSaAEsRSO0oRAYNLobxKoj/35f/ED8DlDnx36OvVun7kTnYVN8
	um82VNi35yiJzA0/xS0JCq9PCwZOWvRB2cyzDMQPtxBkD2f6rVElDqFBnia4G3pC
	b8/MMsDZ6OhHs85OIx1EccJmfqgAkWlqINJCY8bRloEjXoJg9O/GbL6GRHrEKzXQ
	nt5mVvgzUw2m6pA5C0uaJfduizIOEhz5HoYOVYwm8mDao6PA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4u05b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 10:35:43 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TAZeCA026210;
	Wed, 29 Apr 2026 10:35:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ds69w9497-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 10:35:40 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TAZeWN026203;
	Wed, 29 Apr 2026 10:35:40 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 63TAZdDa026202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 10:35:40 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id E8F445EE; Wed, 29 Apr 2026 18:35:38 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: monaco-arduino-monza: Add Bluetooth UART node
Date: Wed, 29 Apr 2026 18:35:37 +0800
Message-Id: <20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwNyBTYWx0ZWRfX8kXWsYx5ueqC
 alR78zWuc+9l9xBtmL2h6QGhM2VVq68hHIDErfcYA2IKhbFM4j4PSexeoLshzgroWb0moOt74P7
 LO+4lnhp/NNo+J/qa4hkU8it9OPEH/ukewljq/gwJGAoVjmW810lmpG+bqODlLmEjSyVdterzT+
 N/zTwWUv381Az/mfmwTt1NFmNHoNELsSfOVNNFjdbPJMReNXgMzo0YLPv04uhwOqq+dEjqUVuCu
 Hn7moSOKu/eJXIBk7eRbaJdS/AeYpxwa586Ej39xsFlkcwSO9pwIj5gGE2HW3Fs95oxyAMtePpC
 N4v8m/jJpNwSHYvPu4lbScHswq6IuPA8EXu6ZIg0uPyh8a5RvOSF7Cnxjdfh8sMZEU/fjm+NlcR
 N4AhUjTJcl52ALaFCkkrXdY3EraYy/PYdGt/z0wnNYucXfjwldCfjeedO5UrS3qbwe0bm33F5Ts
 QbKoMx5fmHTPc34OXlw==
X-Proofpoint-GUID: V8HNL5CDLmsms53d3p9eVpky0zQvwdz3
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f1deff cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hEndWF4aPVnrLPyaUrQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: V8HNL5CDLmsms53d3p9eVpky0zQvwdz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290107
X-Rspamd-Queue-Id: A3841493037
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-105180-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

The QCA2066 Bluetooth chip is powered by a board-level 3.3 V supply
provided by the hardware. This change connects the Bluetooth
controller via UART10, and the corresponding GPIO is used to enable
the Bluetooth chip.

basic function test step:
 - bluetoothctl power on/off
 - bluetoothctl scan bredr/le
 - bluetoothctl pair <remote device address>
 - bluetoothctl connect <remote device address>

low-state test and state:
 - rtcwake -d /dev/rtc0 -m no -s 30 && systemctl suspend

cat /sys/kernel/debug/suspend_stats
success: 1
fail: 0
failed_freeze: 0
failed_prepare: 0
failed_suspend: 0
failed_suspend_late: 0
failed_suspend_noirq: 0
failed_resume: 0
failed_resume_early: 0
failed_resume_noirq: 0
failures:
  last_failed_dev:

  last_failed_errno:    0
                        0
  last_failed_step:

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes v2:
- Fix board name typo from "monac" to "monaco".
- Clarify that Bluetooth is connected via UART10.
- Add detailed testing steps, including suspend/resume and low-power validation.
- Document that the QCA2066 Bluetooth chip is powered by a board-level, hardware-provided 3.3 V supply, and that the GPIO is used only to enable the Bluetooth chip.
- Add the required sleep clock to satisfy the qcom,qca2066-bt DT binding and run dtbs_check.
- Fix DTS formatting issues and drop redundant status properties.
- Update authorship
- Link to v6
  https://lore.kernel.org/all/20260428025652.662502-1-shuai.zhang@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4..379b796f2 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart10;
 	};
 
 	chosen {
@@ -454,6 +455,16 @@ &uart7 {
 	status = "okay";
 };
 
+&uart10 {
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,qca2066-bt";
+		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+		clocks = <&sleep_clk>;
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.34.1


