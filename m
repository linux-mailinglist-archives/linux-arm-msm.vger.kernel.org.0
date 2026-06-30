Return-Path: <linux-arm-msm+bounces-115301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fO01LW5sQ2rdYAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:12:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0596E1017
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:12:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MqjhJza4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JsCeNKNP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115301-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115301-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D6313056890
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00013D6491;
	Tue, 30 Jun 2026 07:10:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3EF3C10AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803450; cv=none; b=D7FjQyBzEmoVNHDpSwIMxBUeEM4g3LFPjp9+YwXcwsdcMNB977AbP20GHbiITbae5wRKcvz6lj76X/QBdytF8e/CgEYGLtSbjzMMf3Cr2Fu1rrIPknuTm0O8qw0Phv3Hgllu9XdxUid+LO/v4ll4k383mPt06qsk6dxh162xslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803450; c=relaxed/simple;
	bh=gimclyRf2l8zKgltM6nyu6KRx9qmaAy67XR0saKf0jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwWEnxJYQSJp3yvTZEQFmBZDiivvrhJ4lE1B28JzWxgmEcsMS8V9N/VdfhNriQdiXhuWIQnWNdJjp9vlnx8vvIRFYLBlPnDtThbLXMRb5jWEPiZ+EEXbZqiTdNsnn5ZztYt3gCPiTNoAv9lrQmJzmfqUqQ5HIO/LpJzqOR/1qoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqjhJza4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsCeNKNP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CXIZ1009113
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=isELQ6kAQUg
	Ee6wg+omWtZPPGG1axsxltur1lpQHZZM=; b=MqjhJza4ECcUkGXzD40K/kLRREb
	biUH649bCsMMx5ngyNh9IHmCFCak9M0pgPdk0Eh0IVWNQPUJQ9BWyuGnYUyZzlGA
	9EaoO88f2s+v2KZji33OGWzOQo6JcON52YyY9xUZgZmEdvPvLU1EhesxNGYaz+uA
	EfUr4AeacAKWJ+y4lG8E4J+5SE07plxii1iXnQd0mNSoiONUCUHz9Lht4eqRPjA7
	2eeAu2GjZ8Aq6347BKam+tgO238IZKnxh2v1ZJyVIbVRIoJWIw+YdOE5X45ZubNg
	2XDoT9eN9lWzEjmUu5s0DVevBpnD+SGXTPd1gnJKgXHFmhvduvUkoHTLMPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw91wcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso41007836d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782803447; x=1783408247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isELQ6kAQUgEe6wg+omWtZPPGG1axsxltur1lpQHZZM=;
        b=JsCeNKNPgftb+CR3UpgiefYEwRPeTABVI0PwmU/SytOfU3DcnXT4CNeBiuwA9FVUv3
         62SHfNhiWROlMEQsOmT1eddLy5v0GVJabou+3hg9iv2kCw6QKaGbY5z39a7OcXQ0t9Yc
         vwjkgXCBOPziPmZfp0VqP7MYZM8J1qnN72+h3eSjJSedhOql3Wc9mVgHQHw840gDaqk0
         T4dwlgtlMLm4AMdPvXs88sAmo7oTDD+SzMKbINQUl7jzJi0SKZ5jT/podpF2Kgw1A4na
         BSwAo6V1SVP8rrGdVVeGg3frUuT4xElxG/zfI2glNDYk18NpNeU1XJ7A3zZhE7EvX9vk
         NoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803447; x=1783408247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=isELQ6kAQUgEe6wg+omWtZPPGG1axsxltur1lpQHZZM=;
        b=XHcTpNzaquqYcVh9IbRRRe3QptK0nOLJDt2920KsfZOhcbaQ6Q+7afRWFegcqkQH0I
         e2eodFL2VFjxb2I2VqkxwQpap9aTkk80iNjEmMZNY8EBBDAhzCs7AXCEyF6rmKkcsccO
         3/LuH41N3fcqxOUNklvEmdP8iCmCMYFKfaZ0g9TIjxlwOhT/QI9twCz2Ww9xOHYqL4hL
         b+HnDDcqDpUCESOZYpc1k/6h1fxvnveu4Ze5v/rvSft0Ct0c0jxq+MbWGZVYa7d9vlk1
         shs6fz+t/R57KdKlrsQG8RwQ7HuAkPLUyRxD0Y8kLFRY9ZN76KbUbCseB9pLX8ANxPN4
         sqHg==
X-Gm-Message-State: AOJu0YxogRgLZGyzRcCSOESODs+3tYivTPOd1y36+p9CdhlY0PvYqPSr
	/y+iFOWAtu442eVZ2itZVKkWUhLjfHWxD6N7OMjjERZJXcElZpT5gHzeOq8tu9DpjVGq5T8MuEQ
	tnTCQKVINcj7sVIOPz0fvY2D9pgYaycmCmJN+Qsmxw2GJBRSFLHYBZWFZC/BHA0ZU61xO
X-Gm-Gg: AfdE7cnR+kB4jMMgAZf1r0w57M0rLvf7YYKvSWyoH4PlrcHAwEBWCe1HSLH3jak5u+0
	unZzoL6ATIKDn3JAavMTPqQD/TZkf9uGta4XA1Isof7TKi4WDdMR+XzlATflCi9y+4BHarI3uLM
	fY6ktTExEYAggdepYGGrFbkBb9SEbirewKSBcTAYP9a1Pp/adVqKiRrRYEe3tk3UFky1pQoC6d9
	BMeWwlpKvy5SIt3t8xWr6x6z5Qe3cHTP39NwoWQ1Ak9ouhTUYM43egl6iy9aUVgNCvpRDe5wnNh
	OcsQG0bwgE3LJxfH9t34DRE4h2JNR6D4WId9ESbpMoBcfh1Yo5POYNZnbJ1VugongfVpql5ie3N
	QVVzXadQAd7Yx8bGszfwzsKCYwV8kuPcQ9RjvXr0UwavIH+vhHrX+otvim44KFgXHfzQYDw==
X-Received: by 2002:a05:6214:128:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8f1bbec28c4mr27529356d6.51.1782803447176;
        Tue, 30 Jun 2026 00:10:47 -0700 (PDT)
X-Received: by 2002:a05:6214:128:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8f1bbec28c4mr27529156d6.51.1782803446592;
        Tue, 30 Jun 2026 00:10:46 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f19f770c41sm17471956d6.0.2026.06.30.00.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:10:46 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Date: Tue, 30 Jun 2026 15:10:12 +0800
Message-ID: <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX8JNXzGKPdHmg
 9JH6P/1ySs0PisqWCW4rKXO3h77KU+CrrASy5aPLXg/fhdkRJuXVGRx/6wbKmqVZf6Y2EUrTZAd
 MSwRjtMadrXPqj2rm4EnrNO/o5Z9GoU=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a436bf8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=L-xlEkxGLorroyIPGu8A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: VjXLJ9W5qdbEYJFSm2sVC6K1oDvhDSqA
X-Proofpoint-ORIG-GUID: VjXLJ9W5qdbEYJFSm2sVC6K1oDvhDSqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX5buEXCEF3mW1
 NHbz0/iXf3rbtu6daFNxa19aszQcq7xsUMcPDqiJRUWySdtQJBl80oIi3GeedGVLgAoYLM7ObTT
 HBwNtqcPoKloh5CnPghjnoFPiTMlgYaoVsIMFcSA1nhrCQeUtBuSmJML3XAY8yvoNN16gP4ai8P
 ch7woLcMSo0CNyllqKz/VH3PjmMh3VW6mPZ5R2lKiZe59/IcAKx3aw5CeqFv7uPiZ1+tJrlrbRg
 dQK1iLGyID3FkypPyAQUx3KChPz05461B24+Ctlpk6xR+I3IrDcoH821xuMYX+esHHKBRhplFRY
 Qc2cPJ31h19AtIbrTQNGqA3NsAgo0yFcQF07QDbN93Gbb+AoTUtkSQjFrCxE5HmXi3bviCJyBcB
 t71r3p2v4L4ir/WEujcYT+gDyB8Q5o7MV8LJjHOitM4QP6eVsIY/5ICDYA9Q+Z7eIaQmYGcM2+6
 qkbF73r0cFoHcQhdsbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300060
X-Rspamd-Action: no action
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yuanjie.yang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115301-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E0596E1017

Add the device tree for the HAMOA-IOT-COME platform.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

Hierarchy:

    Carrier Board
        -> SoM
            -> SiP
                -> SoC

The SiP on the HAMOA-IOT-COME SOM is equivalent to the HAMOA-IOT-EVK SoM.

The initial device tree includes support for:
- UART
- Regulators
- USB
- PCIe
- Pinctrl
- ADSP, CDSP
- UFS
- Graphic
- Video

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
 .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..549287e3eeba 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
new file mode 100644
index 000000000000..935af96c2b85
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "hamoa-iot-som.dtsi"
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
new file mode 100644
index 000000000000..5c6475b34cc6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "hamoa-iot-come-sip.dtsi"
+
+/ {
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
new file mode 100644
index 000000000000..99c47cd953b8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "hamoa-iot-come-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Hamoa IoT ComE";
+	compatible = "qcom,hamoa-iot-come", "qcom,hamoa-iot-som", "qcom,x1e80100";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart21;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie_x8_12v>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_sde7_main_3p3_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_sde7_aux_3p3_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&pcie3_port0 {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
+&pm8550ve_8_gpios {
+	pcie_x8_12v: pcie-12v-default-state {
+		pins = "gpio8";
+		function = "normal";
+		output-enable;
+		output-high;
+		bias-pull-down;
+		power-source = <0>;
+	};
+};
+
+&pmc8380_3_gpios {
+	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
+		pins = "gpio8";
+		function = "normal";
+		output-enable;
+		bias-pull-down;
+		power-source = <0>;
+	};
+
+	pm_sde7_main_3p3_en: pcie-main-3p3-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-enable;
+		bias-pull-down;
+		power-source = <0>;
+	};
+};
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};
-- 
2.43.0


