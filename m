Return-Path: <linux-arm-msm+bounces-110323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH7ZC9PUGWpmzQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:02:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D90606FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F04F300C037
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 18:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3819D3F929E;
	Fri, 29 May 2026 18:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5t1NItO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYE4qtQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC103F54D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077770; cv=none; b=h5SCpdRa3jKyqGh4969f2Bn+R+3aEBIDt4zroC4mBdW7DxufPwsjW8vrWaqfHQ52d8ItyDdNqkWplcr7Sg7DYyrEZ5gNKQC47kDYOJ+qgY3OSGvrLCHMkqIqNAr28hdH+SgC7wGqb/+adUDzVO0Jmx8/2jTEKZ097cGeJPIYCRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077770; c=relaxed/simple;
	bh=3+Oa9f4QepMvcag731FY22cwOpy+XSYq5QE7o/iB3lM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W4W05PedqJwJiZy0tGgj5gZDDZecTa9w5FCwAC9LPpELRUPLLdLxbLbi543ajjdaSPgvCHbzVY0aCf55LvF/UWY+MO/OnA1MteYwrLTmvEXZZ/grGOu9p4QHtyFgCHt7sjCvJNxidC0xNP+DSbAWkhHCDgXljeCDiz7ejpQDbB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5t1NItO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYE4qtQ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TI2Iad589608
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 18:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q+4GT+TR3WQGdrrJ6oshyZeQyk4XOz4zR/y
	TLN2j3xc=; b=o5t1NItOg3BAZLJhdKmYEGQjlh+L4y85rvNvh7XQvLN76rQbV1X
	SntDfNfMMU4OAxRjGboRPQE/wXclopGgh7kGsZ59tWN8v/49mSZA3HgBcIkWw+1S
	6kt1Sb/SZS5O9GB3abnoueV1B29Gjqo3X57MUhC9RyP/2R04PueH/Obdx7/aeOzZ
	neYcrZ3JynNLthRdOwQYLiMDEX/gZxMmvvjRH484qRI/66soUd348g6m2PzQEpFf
	MXoUkMm41W2YR4rGxnpHzyBnRppSTWAJN/5E0vVoq6YnyZFlwr4I/cYcungj+lHS
	nPFuOWyAPdOwasWC8x6gw/NeYTAMZW5ywvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcjakd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 18:02:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf08c2a24bso24592955ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780077765; x=1780682565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+4GT+TR3WQGdrrJ6oshyZeQyk4XOz4zR/yTLN2j3xc=;
        b=jYE4qtQ/YOv7yMB4hyhJRD9AwIVcONzHUHo76lapSy9vJ2A1VqxEsFBitRaOcOp+qm
         2FwxVfjr9BUqR/IYYtxWriIktlBGGyKLyDc7XpdxtiKanqgC4sl57JP8DMQw/Edk8O3A
         mHYiDTmAXFoiEQTJh8X3uo8IkRRp6snRq8cgcpiEMu8YWe/OsBaSkmw743NP5Cz+5sPz
         kvCvHX0W32VFKQWb457dZtMxTkT2fhnEPFjdbseE3PLrNW0X7UKFXFqdMu3gSN9eUi+2
         lvUC5OEpJZPDsEhJElOitlYUvMDthgOHfTXhmy0okVuFMFDXVdpwnR1dzmvnumfUbhUB
         F/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077765; x=1780682565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+4GT+TR3WQGdrrJ6oshyZeQyk4XOz4zR/yTLN2j3xc=;
        b=BZ+vDcCuwiP3MEI3fAB3MfrgIb9herQh6kPM8M++o0v1WmZjy8p/SracPFStP5PilB
         LHEhtloI7QFWLKpjdBqXhTlhDUf4PjX4HfY4Imq3kZD65NgTPkVHl+8kMwr6hdJ4cQfM
         QFl7JpeMWsQld/vh3+hz15mhMVLwcCFUeBeJyvktsEAHQpRJOX/rxTdmEue5YGqXR4HS
         h6oH7gXVHMxihfAdSdFlvDxlnKN5OCKAgpOc/ZXgaWSH1TH1oT0NFm2Um/kOOmRFzoow
         O7XHIfaZWTosdfQQwUTGIREawpeasEULrk8frQukbtraQViNghJWf4n/ge58G9ZUmJBJ
         FUwg==
X-Forwarded-Encrypted: i=1; AFNElJ9oAXj0vpx73hiZc9MoO5erQWPd/5PMsI/HMxrwUUbYSIq8LWcaU2+dFDNxWxQT1gEahE8qP5qGKjGcZzEC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41dcAUFfKHvbOKM+L51h7J3eCZ62nVSOb5tVpOAUL4TJq6xoN
	sWW4Onezt5DbEhzkz/WhHD0L1LNtWepAbb4XDGtoMn0zwAyF0Sqvy0H86ii53+UPUkKq5v9awvM
	4Rj88AXlAmvpieApf2AeGEbaBxILgsQGzXsCkYkAg/uQ7g/RNlbYXOBeFyq38R6Fr3sWs
X-Gm-Gg: Acq92OGtsyg7vXuViM12jZL3kUJ0Pop9/GXjl+B7QdMIiP2UI44CdQOkp/0X/P4kUk6
	XwuTEkM1rE+puWFJJUjrNv0lRHPt0q/Nl4OWySPlXNY2KfetGn5jZtVcPFsUeBZnPqng+tGA+Uu
	KgZID1GUAiBeATyf2oeu2AfwCuWtXNKa5WakVxvNzF8U0HlWu2bxEXIT4vTnGASWImz3ql58A3A
	VZXoZoqmeAdSC/jYxMl3K/HRlE/QujnwEgv1PWGWRhi6lQ+eNuaRMrvPV0wctBo4FCn4o6/Xin1
	SGvQKiKI+QQJk4AHRy9WI8FDQdysDnBjeKUvZXcZWc8ANYnfEzpk2z2W4WJ6TTq4MxREDaetgCC
	604akCqcBfjeChNSRAvlSPPHp93yaWUyvMZVB01u6CGT1Q764fyrRCfzmDY297g==
X-Received: by 2002:a17:902:e88c:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2bf36879045mr10387835ad.38.1780077765175;
        Fri, 29 May 2026 11:02:45 -0700 (PDT)
X-Received: by 2002:a17:902:e88c:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2bf36879045mr10387125ad.38.1780077764618;
        Fri, 29 May 2026 11:02:44 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm27268345ad.52.2026.05.29.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:02:44 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
Date: Fri, 29 May 2026 23:32:34 +0530
Message-Id: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NfgpRL_k6qduBLV8UMOuwlgo-yWyKchA
X-Proofpoint-ORIG-GUID: NfgpRL_k6qduBLV8UMOuwlgo-yWyKchA
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19d4c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=86PJZVPQ1pRugi-lMccA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4MCBTYWx0ZWRfX3g4E+kn7/0nd
 Zly1qcEV0I+39Vl/lWi5ck/gEsSjHUoXwjjcQzhmohJNruzF9xmqzA40Rlf619Lqd+X9H0IBtfw
 8fEkx5HnkysT/unuvAErE9cKJNgBWZVtqrENj8TNndlwpkGqxyEz4P/h0vNFiOrDcU1fvrRgs5B
 FbT8zhlRH+eYWwAZ5M0TyPVLqIcWdOUmCf0VmeKBSmpaqHMpAZtZPAFjRLxsbdoAJ8Af6oEXsKv
 qWj8uuWh2Sy+oAaXxfELF5l9goMB0B/AGoZs8TxBeV2F7/WiCiwAWV+Lb0KVhei9y0d1CaXYD3k
 6nfNYlErdnpIRbLu9gXpryn+uz9EH5KzIcV1lwisHNPHZu/dg3sECDuWvhrsP6KtOVNDlBOHtlV
 7JZ4ZwNkkqCbpLzULuDiTyT6l9NunMySMEspc96cD2MwFgCS0uar46XT9Tw/DeutrAZQDzgPw3C
 r3SiymTkZP7AXsHrmAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290180
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-110323-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4D90606FB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
industrial mezzanine board when populated with a QCC2072 Bluetooth
module.

The overlay configures UART4 (gpio16-19) for Bluetooth communication
at up to 3.2 Mbps. Sleep pin states are defined for all four UART
lines to minimize power consumption when Bluetooth is inactive. Host
wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
SW_CTRL is mapped to gpio86 for power sequencing.

Disable UART7 in the base industrial mezzanine overlay as it is
not used when the M.2 slot is populated.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 ...3gen2-industrial-mezzanine-m2-cologne.dtso | 110 ++++++++++++++++++
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso |   4 +
 3 files changed, 116 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..98b2d6402a26 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -173,8 +173,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
+qcs6490-rb3gen2-industrial-mezzanine-m2-cologne-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso
new file mode 100644
index 000000000000..905a40f4b938
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+*/
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&tlmm {
+	qup_uart4_sleep_cts: qup-uart4-sleep-cts-state {
+		pins = "gpio16";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart4_sleep_rts: qup-uart4-sleep-rts-state {
+		pins = "gpio17";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart4_sleep_rx: qup-uart4-sleep-rx-state {
+		pins = "gpio19";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart4_sleep_tx: qup-uart4-sleep-tx-state {
+		pins = "gpio18";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	sw_ctrl: sw-ctrl-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&qup_uart4_cts {
+	/*
+	 * Configure a bias-bus-hold on CTS to lower power
+	 * usage when Bluetooth is turned off. Bus hold will
+	 * maintain a low power state regardless of whether
+	 * the Bluetooth module drives the pin in either
+	 * direction or leaves the pin fully unpowered.
+	 */
+	bias-bus-hold;
+};
+
+&qup_uart4_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart4_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&qup_uart4_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&uart4 {
+	status = "okay";
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
+				<&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
+			<&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;
+
+	bluetooth: bluetooth {
+		compatible = "qcom,qcc2072-bt";
+		max-speed = <3200000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 83908db335af..c96c7f52ea7a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -288,3 +288,7 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 &wifi {
        status = "disabled";
 };
+
+&uart7 {
+	status = "disabled";
+};
-- 
2.34.1


