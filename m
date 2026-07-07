Return-Path: <linux-arm-msm+bounces-117367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7cxNAhMsTWp3wAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A879771DF0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:40:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lZDzziXs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K2F8L0Rz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117367-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117367-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D8FB3084B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E5B437875;
	Tue,  7 Jul 2026 16:37:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C1436BF7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442241; cv=none; b=irZOed9eoFxsR2lVoxpD0pzuYyNNOSvYrGpVzkzaXtPZytHZ/NMn/e7+UJ4zFsL2ZBrjHDctgYBSKF6BsJMbDbdP3ikbMmVjWvRopNQ9GxRyIODBUPtsbbsaD7E9VdBymQgytWxxdkcY94NtqbprDpFu7FHGhnSpLq2wPvjV0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442241; c=relaxed/simple;
	bh=Nbtqzz+dZVUyf1v2UGy7V3O9+oz0T37ydqh5TecULoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvxiTZCJyZQaZSDyUntERRKTR9QX6vVAQCJafXYGn5T0kK1yvXTjIhmEzXHmu9PZ0wr0sSjZBSHTchl35vmlWaxyZRSxaTkZBG8bYMMN1BMxKqoho8jAjmxwjBoVZDZHKMAoVc6bCqel+2yEBUSGNQDCwgQrNoZwE50Eh5uRkOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZDzziXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2F8L0Rz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTH9s018141
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bGb/NbfNTIp
	CUdOEEOTcmP0Hr63dnzZeDHFZIS6E++8=; b=lZDzziXs7w0EKzIfFmHaHQhC9eN
	QQR2zotJbEKNzEzcnDwTHekXN/AWgix1c+OQnPtmL3Hhego5LgqKXb7NXoRGGn3n
	ZPQmiQGJ2MAOSl7VFVhxlai/lqZOzBdhXo/EP0JmZ69rs7Ug/xOyU0NE8nEUZXan
	tf+EfyduWvJ/0I9NZykKufBkc2cps0Uc7kz1G6kC9M+dvVK9LhzBdD5NKvZoFOcX
	hfSwKu/31GWJlXVhyHTBRqPAXBbP0udXcoQcMS+ys3ZwL248TqKOkFEjAog2Gspg
	eVsMPcb72C6mI2eOUHeHxShfkneCa6yWHlSH93GGb7z3Sjv0eq1FKIkci0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep266t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:37:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e63df032bso84271085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442238; x=1784047038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGb/NbfNTIpCUdOEEOTcmP0Hr63dnzZeDHFZIS6E++8=;
        b=K2F8L0RzkFFKUzsKBEJRCPWIa+546cDcjl3iUKMKRFpuGNELim7VcNihKUvzj6cywY
         Vhq6ZNRRO8y7J6ovJIGQxHFmBbKH2c9m6jcIGV3/Wh68MJnm4hJTV32GoxQYJKNQw469
         So07cttCuTXqLp3kMHAYB389VrWDWWryi2/rzew+oLAuq781r2udoDesSEhrsEtth6mf
         pUOAbEWrSDImByh5acWbdT/9G8fmnpKa0QpeRryZkUifpFVE83P1ZiylKabDMvyOq+iS
         vjwTbGt3I+qQLDaYfaPgv3rdhmHw451P6rXNeI90h9am2ORZJazrTgMkw21cArcLdbJs
         hGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442238; x=1784047038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGb/NbfNTIpCUdOEEOTcmP0Hr63dnzZeDHFZIS6E++8=;
        b=Yyrsb4bxE2Wii/JQZzxtVvxhwR5qCwN1vRFPIrugRUDJK9FNBCaAuciMN2WbVcykmF
         OdURHDAfdGDRIsZGg436R+FZOgHup7R3gjaC3JzdDtFJbEQtIOI8fJtG85JrAUOXyyNv
         ACkhz96FB1qarkrPm2DtoKBtnZfz4An/ifxIHIdurDR2gFdm0YC/y/eGkKJn+tixtddZ
         58UyUr7KCk4zmIVPHaLtCxno0EAnj+ql5b39kn7Fytu4Huc+/g1p0zbm6y85PEEfOwYj
         +FBqWmF3j3+jENu/4ngFQndniXL09HmDkwsbXNtWfFS/6G9VLMaEMRRdVzoClSjrN0HH
         MBAg==
X-Forwarded-Encrypted: i=1; AHgh+Roks+0ByjSPuygLJPpGm8U5t4YzhKdm1CiAO26zycSwZFeyEjh2xj4G2XS/R7HiHgEprs1XfaK+no7MZ06a@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7CQzCqJF0ismLt37oD+J6cVZ5tVwK5ULeS95TiJ/gTbUoGQr
	J/9JeyJcZK4t1vR26et4k88Aejqg20yQ6RHzzfNgab1WcZbHs0kUh6VV7RL1vu4B98EB2iQlNE7
	7rQZ+SVrphYfp2Vh6dH5QlxfHTIfxiMT/Kf2cjAMThBWX2cJIQbmGYLgEwbGSUlu8dB2Q
X-Gm-Gg: AfdE7ckkjgvv2TdhyBRS/31q0lemNyQFkcq5X5X29ROlAxNa+vxR9hyCMh0efzUi5UI
	YLQfZ52829hufSf6u2H/pKjqX9tIbR6YV0PY3GdBjCuep0157eVTwexgEDUPx+GPhcsTgtkX/Ck
	ss6Rv0rS7Ncy7W6yXBh+vlzV31mSHoj+Y3OpJkEU7kDaie1y0GZLL3l7OLGFpz8V5MtegJQ21nh
	LGB/8yGpdT5Q/AXZkAfjf3lVmEDm+soqL4BEP+4Drb0NIwwsDc5YXiEBTihJaXpBvriHJhbbvlw
	4Cici8nEJp//C03Yr2cVHnhI4NzUe/J78zN24KvejVE5UmNULDjDXFGHwiXwLr77NDJtbQZtjuR
	5dLeEnHge+Dvyp8FnTk05qHUQ
X-Received: by 2002:a05:622a:2296:b0:516:82e2:7788 with SMTP id d75a77b69052e-51c7a46db9bmr35265181cf.1.1783442237375;
        Tue, 07 Jul 2026 09:37:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2296:b0:516:82e2:7788 with SMTP id d75a77b69052e-51c7a46db9bmr35264701cf.1.1783442236823;
        Tue, 07 Jul 2026 09:37:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay for Waveshare WM8960 Audio HAT
Date: Tue,  7 Jul 2026 17:37:03 +0100
Message-ID: <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eU7Y6ZnAv0-L3sHJcV19VkcVJ9MBkdUE
X-Proofpoint-ORIG-GUID: eU7Y6ZnAv0-L3sHJcV19VkcVJ9MBkdUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfXx8c0JZ7BVqu7
 cp2zdlVGnK4gSS9hQzj8ZBLHfFyUGWI1baDBLixOQ1ATNoFDnYnVQ0js3InEsqpZAEs9WoCb7Zu
 /E8cdvT0qPAsGnNQgfQtJFZQFosx6eLuwV6ZeoyjBZzEkUjbSE74g4mz+uUbbdr4oGDacKz0+bD
 ZDvjhBXdEIbEpezpaug9voacB6lBwoaLKytdInOsNDsSBCRAqa38KFH/jljqUkFQZBY7Mr8tjD3
 88MGUYdHMgoJ1NP+msxeibl7k3U+VZsdrmRbP3IetS7z+L3q+Jf6CucK+7mAf1xeaB+9RSPPry6
 ZuKdQsxrqR+Jk4SyUkzJvrRZsIy4a2oDDVbDO09lndUZiJysbIrYsLrjS0+2N0bHFCC1fAKG923
 g0XlHhS0Gj6o/+zZS2dlbsS+q0KGRwsb4exRMy0HxHK9uxf/fZX0ltKIkp+5cgOZTty+gxIByAJ
 o5CGr5u9plgZaz8zi5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX4PGGQYYZ4tit
 KAdjwSLAOnnoCno2aFHjkJUVUDdTccIcvvl2iLRUG8+qliw4hE88DHJQLEyFK0BeOm0uIhABssx
 B0VoZvbj3eUV8CycKpgcoy8HqygwN9k=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d2b3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PXIoQbnlezZRnfWnQ40A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117367-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A879771DF0F

Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
the WM8960 codec on I2C0, and the corresponding I2S1 playback and
capture DAI links to the sound card.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5a1c56cf98f6..27cce61893ad 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
+
+monaco-arduino-monza-waveshare-wm8960-audio-hat-dtbs	:= monaco-arduino-monza.dtb monaco-arduino-monza-waveshare-wm8960-audio-hat.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-wm8960-audio-hat.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
new file mode 100644
index 000000000000..cf7b6a220bab
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Device tree overlay for the Waveshare WM8960 Audio HAT connected to the
+ * Arduino Monza 40-pin JHAT connector.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&{/} {
+	/* on board fixed crystal */
+	wm8960_mclk: wm8960-mclk {
+		compatible = "fixed-clock";
+		clock-frequency = <12288000>;
+		#clock-cells = <0>;
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wm8960: audio-codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&wm8960_mclk>;
+		clock-names = "mclk";
+		AVDD-supply = <&vdc_3v3>;
+		SPKVDD1-supply = <&vdc_5v>;
+		SPKVDD2-supply = <&vdc_5v>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&lpass_tlmm {
+	lpi_i2s1_active: lpi-i2s1-active-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "i2s1_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		ws-pins {
+			pins = "gpio7";
+			function = "i2s1_ws";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio8", "gpio9";
+			function = "i2s1_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&sound {
+	pinctrl-0 = <&quad_mi2s_active>, <&quad_mclk_active>, <&lpi_i2s4_active>,
+		    <&lpi_i2s1_active>;
+
+	i2s1-playback-dai-link {
+		link-name = "JHAT Analog Playback";
+
+		codec {
+			sound-dai = <&wm8960>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai LPI_MI2S_RX_1>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	i2s1-capture-dai-link {
+		link-name = "JHAT Analog Capture";
+
+		codec {
+			sound-dai = <&wm8960>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai LPI_MI2S_TX_1>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
-- 
2.53.0


