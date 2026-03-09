Return-Path: <linux-arm-msm+bounces-96292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAMgCbjmrmlfKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:26:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9A23B9FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 601D13032884
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8B23E121A;
	Mon,  9 Mar 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6op6pVW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wrz6vWcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276603DFC9C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069878; cv=none; b=tsvDsWB0XiktPDwj71xqFZ/exAh/BWGmGwZC582WwrOBeWyRL+oxkYcJz36u+RAyDC43T95nKXvy+6XEJP4sCfb8zOKhyivSlSnxpd9oXm2Z2ik9HIWCF3iSyLAVQVyx7xFIwsL7+/SV2ZFR5eWvnHX/h7W9Ejxw7MTl3DRpLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069878; c=relaxed/simple;
	bh=U5q2tX73wRpdC41zAV/6p6/p62NKlJbcRhG0qnkWU3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAVDzNsH1CguXVvOXnP0EvA/O627Rtxc68zgUVH9aSLhnFAycnZ1kdEPwHvEl+JoCaeAxbjA0NBQ4Eqs6fmRfVD0jI3GSy5vr2zJbEIV9iP58bWAHkrofTJXg/l3ZZ4NGV4Tw3w+3pupqoOXWJ/iQ8WC+0t2S7HK+ndJwW2kEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6op6pVW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wrz6vWcH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629ElN7A3773575
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 15:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5g+tm1ShazgWakNg0625YZbiOGyxQS7sO34dzZFQsNM=; b=L6op6pVWofcc2Vys
	D86TUPpvQUzWrkOn8dgxzfly1s/xQLE7MvAPaWbZtXS2sF+CpCPrJ2AaOfG4c4Qe
	G03Hfu22u+H51JULJMuG2FzK/WIaLKfgWL6OvNAH4bSSHs0lGmq9SpjQtta1FZhG
	8xWDmU5oRnPwf9aWYGP3oKEPZvpsQ+YJhwQk7sbqKB4cS2zsGBxoE0gRZev4vNio
	dh6tbm58GfzHV4ELUp8O9W7HR0o9pNJCl/XHoStGia9v0rxUvMFapv1pATXxc2L+
	WvM87CcfAarLEI3S4R5xvdmXNT7gOjcAFNJmuze5DVJ+WCwk3h5A78qUZFUZZtV/
	yt+iyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa9cg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 15:24:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso1523019785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773069874; x=1773674674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g+tm1ShazgWakNg0625YZbiOGyxQS7sO34dzZFQsNM=;
        b=Wrz6vWcHzGxHsvIaSNN5IKxTK/XtLLE9UOuMKrM4kqht7Sq87yvGddiosvUKPoCcRj
         bP6dCUZqDOjvxjHI+b9KeOfgBinjH18RiYYAZv1H2kdFy59I1sByPC7xbpNS2NwqvEkK
         lTRlodXaAbk9Lnn3d79TE16zeM4bineG3jw2anQjSlwpb1w/Y+jUQvF/XCIt9+Yzzbyr
         AixSW1Q9EhrRPVJ5o7byKfPVsOHhXjH8edoCgHp+HMBoR9qy/ALgZQzXu/24979qqGOL
         lwlTah7vi8cS2HJxxXkQ4YJTx/pgp1wqNjPvPO1bxA921COghNvZvG0BY0PYTaLLWRao
         WbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069874; x=1773674674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5g+tm1ShazgWakNg0625YZbiOGyxQS7sO34dzZFQsNM=;
        b=ddu0DZkWqW3ny/F9XcN8HQ9MxJatodvybMRxoSf184F9KfMJRo4j9WItTBgbOhRwg8
         473tQ2ARrJOm0yXwbaE0mUiM32TeBq/GmMbOA2fd+kd7ttU6gQlUuQhqNaLUagXNfyGm
         ATmr10IISurj0issizbur/SGZ+469U7rEX4Xg5VkgbXbqVtIXTZggAh4zy+0SEkqdxTp
         UFJJ+bGotLcUoDiRjrNKIPwaB/VRu6ACYuzMtUjZL/ZFDADtxXYS/9cOhcYJEhW5nuoN
         UjtIwVAffrkElbZInC45kuxzlNZySBn6zQNeUiIiG7PAg3Ph2bI1HvxUqoE/+ebwBwpu
         ybqA==
X-Forwarded-Encrypted: i=1; AJvYcCWM8RArMO5NjRxB7w5TOB67BAskySkF4jy4yDJtfF5C4U75azuVx0/D66dUw6AcA/xBFdBzJVZqOKgkzKu8@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtSMQjS9i1J7zICsZvUoX5ZtasFfZPAHijzO9qBGPpoHUAYXH
	Jyfv9gYJzcv8ZS5i0Lzt9lMza0MeE6wVVOuFK/fFjs3I/JHhRgN2xNZOFnhND+1YDKBSXvC1hQ7
	hN1DtGvFKa8vhGrdFi/qA/LpEEN3D8JZ9P4YzB9BTN1yPLAbhldF2TimHyM5/cVtpxd7b
X-Gm-Gg: ATEYQzyqjoWUC/Krq85SSBDVUKp013akjYaQK6m0oCqbMEd969McnE9vUamv7bznM+h
	fJoUhxGWHAfSzIMqFCCgTsnEVdUEqNlGl439ePyGFNftw4yxu670vpqhbcmpSFHupn6xsGLFRIR
	24MTzT3wSJgfxOPHakOxKHg9F/PXt3JyLvXZMY39y346bSZZBuH7z2JBG838Dqwxp74rhfo7Ex5
	ydHozKS/dkWzdtC6pNUh4HCIXGPK7EK3F7/R1/CUVdXVtw722M0gEH88PMfIkPKBNkezreA3v5B
	C7oZLcIZgbarfWf5SiMs7Tchc5whBmjE7sRfmDwR5jvdOZUnUiU+GxQ01Ll1Df5f47Kh0vM0G69
	g7oqIgsH51qCjQO3cMWxE0miVO4DfEvbWVpvYkI+h0o/PVMiM7Z7Rb3s=
X-Received: by 2002:a05:620a:d8a:b0:8cb:2732:81ef with SMTP id af79cd13be357-8cd6d3a033emr1379919685a.35.1773069874284;
        Mon, 09 Mar 2026 08:24:34 -0700 (PDT)
X-Received: by 2002:a05:620a:d8a:b0:8cb:2732:81ef with SMTP id af79cd13be357-8cd6d3a033emr1379914485a.35.1773069873685;
        Mon, 09 Mar 2026 08:24:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a59fc36sm192812515e9.9.2026.03.09.08.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:24:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/7] arm64: dts: qcom: Add Arduino Monza (VENTUNOQ) board support
Date: Mon,  9 Mar 2026 15:24:15 +0000
Message-ID: <20260309152420.1404349-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6wtbKvV91YEOWC0NWUCarqSo9fU9Y7f_
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aee633 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iuzt36_cqZDxinQef8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzOSBTYWx0ZWRfXy9xk8Vzei4cz
 gy9Vk1WK25ZkpRta3pouB42gzLh/NPHggyS0xVQOIbvOVYDSYI122JZHbGT9qF40uzVBKcTpoXe
 r9V6SKY8dWrS2x4chPjbdhvDz2X+AHgJcCLAtym4Ks1ouShFuuMhbnn/BMFPsmdCYdsFd7qPD/9
 dIDksorTc4I6xpWjuy8nIICFdZdm6hB0qEBSxFZI8GyQ1/LMHwd93t7nzM9bStYIGmTIoe3+LAe
 3XQTP2MSKEvpGV0bBUoQXX909xEkhHIoaHYiOY141q6D/t4ZMUN75zU8F/Q5DnQLWWEYRNmv5yk
 EWpxwAHSXAoE3PUR2TMlLj024KTBskZTeP48HS8dxKQju9LtCeMzMAIeJnvIUreIfBHWwkq6B3r
 C5fbTZ6o8U1lEDUXmjhbRoa7O/7T1Uy3EG2ANl2fo85gmyKUS4m3tQ3SWyaYOjOsLYyvI7Lwi+Q
 mn+qcGvLPZBxg2fxgkQ==
X-Proofpoint-ORIG-GUID: 6wtbKvV91YEOWC0NWUCarqSo9fU9Y7f_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090139
X-Rspamd-Queue-Id: B3E9A23B9FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96292-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,3d:email,1c:email,0.0.0.10:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Add device tree support for the Arduino VENTUNOQ board,
based on the Qualcomm QCS8300 (Monaco) SoC.

The board features a Qualcomm Monza SoM and integrates various
peripherals, including:
- USB Type‑C connector with dual‑role support
- ADV7535 DSI‑to‑HDMI bridge
- MAX98091 audio codec
- 2.5G Ethernet PHY (HSGMII)
- PCIe0 (to onboard WiFi chipset and USB bridge)
- PCIe1 (to M2/nvme)
- Button (via GPIO‑keys)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 446 ++++++++++++++++++
 2 files changed, 447 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d87be639aac..8a9093c4b534 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -47,6 +47,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM) += monaco-arduino-monza.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
new file mode 100644
index 000000000000..b6db2a7151f1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
+#include "monaco-monza-som.dtsi"
+
+/ {
+	model = "Arduino VENTUNOQ";
+	compatible = "arduino,monza", "qcom,qcs8300";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		i2c1 = &i2c1;
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector-0 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "device";
+		power-role = "dual";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_hs_ep: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&usb_1_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-home {
+			label = "Home Key";
+			linux,code = <KEY_HOMEPAGE>;
+			gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+
+	vdc_3v3: regulator-vdc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdc_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vdc_1v8: regulator-vdc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vdc_5v: vdc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vdc_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		startup-delay-us = <20000>;
+	};
+
+	vreg_nvme: m2-vreg-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_m2_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+	};
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy0>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&tlmm 50 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&i2c12 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_HIGH>; /* GPIO_16 */
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_3 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+
+	adv7535: bridge@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+		pinctrl-0 = <&adv7535_default>;
+		pinctrl-names = "default";
+		interrupts-extended = <&tlmm 93 IRQ_TYPE_EDGE_FALLING>;
+		avdd-supply = <&vdc_1v8>;
+		dvdd-supply = <&vdc_1v8>;
+		pvdd-supply = <&vdc_1v8>;
+		a2vdd-supply = <&vdc_1v8>;
+		v3p3-supply = <&vdc_3v3>;
+		v1p2-supply = <&vdc_1v8>;
+		adi,dsi-lanes = <4>;
+		#sound-dai-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp0_phy {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&adv7535_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	vddpe-3v3-supply = <&vdc_3v3>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+};
+
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
+	pci@0,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		bus-range = <0x01 0xff>;
+		ranges;
+		reg = <0x010000 0x00 0x00 0x00 0x00>;
+
+		pci@2,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x021000 0x00 0x00 0x00 0x00>;
+
+			usb@0 {
+				compatible = "pci104c,8241";
+				reg = <0 0 0 0 0>;
+				ti,pwron-active-high;
+			};
+		};
+	};
+};
+
+&pcieport1 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+};
+
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	usbc_default_state: usbc-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio5";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio6";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		wake-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio22";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio79";
+		function = "gpio";
+		bias-disable;
+	};
+
+	adv7535_default: adv7535-default-state {
+		pins = "gpio93";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&usb_1 {
+	maximum-speed = "super-speed-plus";
+	usb-role-switch;
+	wakeup-source;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&usb1_con_hs_ep>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&usb1_con_ss_ep>;
+};
+
+/* Internally connected to the MCU (e.g. for DFU). */
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};
-- 
2.47.3


