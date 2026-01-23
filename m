Return-Path: <linux-arm-msm+bounces-90342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IXfAU5jc2mivQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:02:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B817C75822
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DDF3304344D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F134331AABF;
	Fri, 23 Jan 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LX+bqICh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYRt8zia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F12A349AF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169640; cv=none; b=OsMqfjTYpwszUupx1NGQi8u0CiY0BQgkQSm0LNn1Qtmx8CTxTwrqZ5J87H2OjcSNWT2+0vLrnF1Wu7DfDmv87Z4c4rMvuCVMXBLL51JyKrMhAghus/WELZNEZutk1Qy7jfdSatCVFhouZeFDlQrhdVnLBx5ckd/LPluG6wwfUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169640; c=relaxed/simple;
	bh=hF/b32ukfCLQN0CGDM2N1sNsOSIlI0Pc0Jfbni0I5Ao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WikhgCTgDpN8fFq0D7f+Ld99KblgzoCZ7soxu0nIDHNuRG7EGp2i4UmOuyn5IUkFyP8h1tKt99gGUwnFJpSdRa+4EpZ9JpBW/rBBbi3WXk+2Rc/sD0SctuVEfNXADvft3dGFFCTQNbnd1Mb1kXAMYbBqKDE1ZRfTEyGxy9K34wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LX+bqICh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYRt8zia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N9748s722623
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a0oRFhVBMAA
	/MRcBJ7GOTygpsv1bOmw/lNxdwt2fHfU=; b=LX+bqIChfovTPFFAscnheaTlpPo
	osPZXzLCEJ6x4p/ftJZ+sbgR/+vmLPO0BakJekP+7tR4wxsO6Fj0js0dnnG+5Q51
	zUSNUqlNNQuVNA5V/NJeJFQqoJnOv1jzXw43DsColiW9wJsxIzeydi/PYHhVbuny
	NdCCFyfTTU8AOPgLchHuJ0wUs14qkEkN2UQXzi0mtczcff+6sHQTV0AWWmhiqBmm
	OFhpwexEq6akFgre33lxPTWlLWCLTxDHc6LXS/d8jiIOm4rIqI6oo2miIhgp73xA
	ddvPCBLIGDKlEYuGapbN2zRuzYIFL8omHXLSpXGDVIPd/H3mUpdAV3EcANA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv069j091-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c54e81eeab9so1342598a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769169637; x=1769774437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0oRFhVBMAA/MRcBJ7GOTygpsv1bOmw/lNxdwt2fHfU=;
        b=SYRt8zia/3Coxv3x77MvqRJeB57VkXvADMBl6Ss1T7l5I/v7g3wLQWYT5mkc6ke2p5
         tFDHgwl6rVXLSt1c2MFyU5KZAtoT0Df6LpP/wmx5BFFp5pH53dgfk3Xx8AGGT3V5vfiE
         Su5BSXNVyzaot4DxAmkZ52n8ueBwT7G7DQqqApiQu48+j/MI3tZHYV4wRKejRG9NWbjZ
         s3qBJgTZWxFFypsrz6Fc7n3GTY7tFUmzNY11s+zhsM/WStRIAhZkBhQZFot+WZQuGPgD
         ywWy5BeGhsoave7OfTeL5hx9HSN/xMFpVO/Ka+t++h6FFEUIPVxOSP6W+4+lI2ZixGFN
         TxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769169637; x=1769774437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0oRFhVBMAA/MRcBJ7GOTygpsv1bOmw/lNxdwt2fHfU=;
        b=GB06lAXJvektk1nQPtNJP2XXRIrNjQAInyaYCkP/+Z3Na6294JGKcxXSsKOdkOSLkE
         sWg3JjZ9Q0oV+Qw+iXN/4MSXbmmQL0itzmp5OmcB66XSvO+8JjpccI8sCY4zKfK/sB/N
         bepsVT//af9/a1brSbZ6JnS8Y+rDzCjCZP78lgj7ACeFer2iI8CKLFqgm/hoL3CqAIy0
         WfQqxKgFgP+pd9H4XcnZ9wPm/TxF3NVottIRPiajgBhWW5Qr/xnaXfyRnU/cYI4wdmnY
         V7V5U9wtxKKMeP552sM2+LZNIpaeglGnHt9di6UBhv0V0CrmvFwCbnwUw3p4s+5BE5lE
         YCow==
X-Forwarded-Encrypted: i=1; AJvYcCWgQGvlmMt6reKweQtRv4Ra8exDqc5oyDnLlKz6CF1e9EiPi03o3ltmZ9aK20Dgw+ec3TJt2lV+5YT6FTmU@vger.kernel.org
X-Gm-Message-State: AOJu0YzE31BBH/MVVfPtNPvKd1ItJ+GtXODhonMocNiHV/0C2dHwjcum
	FbLthTt4N68JzY/sO6YH79SHaPsDwbrINtsXUxyOTbiyJ0/nTI+OVSON7Qs5FceaNajIEhGFzwe
	L7hqR1xU01eA0Z3mQ9uFaipPFzbonAn4hmDVb+gi+WIQeHHh7ciExhHeV6SCEYacMZWzU
X-Gm-Gg: AZuq6aI/jJ+dixWTrbU5AahdKpqZFTRxdIJf1JubnWe7rsJXHPlxGyx+p7tmToMD1jp
	ZULalKa4ZSHnG6oJK9kqdBcBs0mTmESf1to96OSDHvZesOZ5Btxx72zvGYlPlR0jQ2F0kjf3Efh
	4WES+OZKDIHmb0j+ux5/s+5lAegs/lhXWuqqlC7yTpba7I76d7hH5yaGoWd5gruuZ3/xisU5Oe4
	qIkAxbfgqZFU47G0LTrK427NFoSU2yTNUcxMhYlxI83UwXLUKzNfVfGF9Dlm5+TNjjC/NWWIFcj
	ebLF9QmWH6l/Nx8wBIIFHCyTaQY0hhnANmb4aSdoM7cjrzJVqDxUer6304sqZoMkvMCv7LupKYa
	K4hJUe4esZhr4bOOm6rFjxedM4wUY8qfk/kEJzYUYsvALfxfEOwQ4S3DzAVqBbUniIdnc/exMXN
	OBOFS/eM2hgPtGWPTx932VEuWupnWr4RaGLEjjRjw=
X-Received: by 2002:a17:903:2441:b0:29f:2b9:6cca with SMTP id d9443c01a7336-2a80ec6825cmr9386235ad.44.1769169636786;
        Fri, 23 Jan 2026 04:00:36 -0800 (PST)
X-Received: by 2002:a17:903:2441:b0:29f:2b9:6cca with SMTP id d9443c01a7336-2a80ec6825cmr9385915ad.44.1769169636278;
        Fri, 23 Jan 2026 04:00:36 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dce0ccsm19047295ad.32.2026.01.23.04.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:00:35 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Date: Fri, 23 Jan 2026 17:30:16 +0530
Message-Id: <20260123120016.3671812-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=697362e5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dVVBzcRkQPyMEGPpQ3EA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: popEpE_PIJnNaXyq8vHRVuM1ElpAsoQL
X-Proofpoint-ORIG-GUID: popEpE_PIJnNaXyq8vHRVuM1ElpAsoQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5OCBTYWx0ZWRfX1x732TqK9tql
 vAhBlutoIVLsrIawg6xeYjUwqCeGUo+GGQf1hRUr9aGeN05MLuwdSti6eGDyVFPfUnkUZykVXNW
 uTEvXZXbK6wM76UKo/9D3OkVE8LBdPGoXDzP2lYu80I4kyVxFbyO2iKc3QGGyS9cfSj/l8kjZH8
 f/FtZh8yXo1V1fFYyqtaekynoH+4NKyu7Mp3F0eLuqzncg0+U/5dsnrTXapQQGareEvFWIhJ+az
 TchhCpA6w03NaYXCvAvRQ91f9A9T/a2uYYT7x/5vFTDSwPQr4aqnwlUJh5a8BDEFuuy0cUy/x2I
 D7djjua/+rwBGJSCmO37M4wICTq7VYwd1R8GTCdXe4ZkKuwkR1Azx7WZ+B+XZOC82Akuxfp+AaL
 L8/POXIl4Rqrwp12RfNEv6SBlFrqhpoyFppDcF2I/G134ktQ+RVle9tJWZdueCcozmeXqc2x6eI
 vrQMpf6guI+f2w31R7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90342-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B817C75822
X-Rspamd-Action: no action

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Instead of including ipq9574-rdp433.dts and disabling NAND, include
    ipq9574-rdp433-common.dtsi and enable eMMC.
---
 arch/arm64/boot/dts/qcom/Makefile             |  2 +-
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..d5fe12ef4300 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
new file mode 100644
index 000000000000..c4989d00b18a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * IPQ9574 RDP433 (eMMC variant) board device tree source
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9574-rdp-common.dtsi"
+#include "ipq9574-rdp433-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (eMMC)";
+	compatible = "qcom,ipq9574-ap-al02-c7-emmc", "qcom,ipq9574";
+};
+
+&qpic_nand {
+	status = "disabled";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc_default_state>;
+	pinctrl-names = "default";
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	max-frequency = <384000000>;
+	bus-width = <8>;
+	status = "okay";
+};
-- 
2.34.1


