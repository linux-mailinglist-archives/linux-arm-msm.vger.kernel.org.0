Return-Path: <linux-arm-msm+bounces-90327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMD4EvdOc2nFugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:35:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E78E074620
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB57F3007BB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7504D29E0E8;
	Fri, 23 Jan 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbcYjGOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6R5vMUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF86350D45
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164522; cv=none; b=t1ICDqEygVfHZm7eXpy9NGrbooff9JAdGEgsGt3gY7SrAlRoYIUMBQM7KoG8jotWCkqdJqmyv9afvZWcbJsdhZgVcOb9iYIazF5pFqdt1AD6whEDSHSPRU0/6N/UsqFECc0m/QfGf91h8VQXPRXDXM810PF27K/cyFtc4G6lPNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164522; c=relaxed/simple;
	bh=LxHpMUPEE7lDrVeBm/ciyahcyWXSM11LZUivHW0rcOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/+h9M+om6IFmHHysKvnGEYr3YzMgMvHxCr22ygJrs0JUb3++p5rtIQ3MJc6qy7BMQ0tsz/oeV52IS/0v0nsolEDh2yzOnHZPgoBIKv4leL8tPlQDgYQf9O1k0E3vP+F/7/ocQBKI2SL2USEfOvKiuVMA/oy5xLrW/TM8uD3UJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbcYjGOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6R5vMUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6Z2V03790128
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wvYgv6WMDQ0
	b5uwrRt9szE83vMmYj16VI0SMU89OPzo=; b=EbcYjGObzVfRAHUCifNe6aubM4d
	xGP/3uquTuPfKf07w4FX/rtzXp8r8sv00vHiFkXgzoiqPwcMTy4NEkjfraNuwuxs
	bqsXtrCgj354ZlE8okWkT/HrLZn8JVEJ7AA/h3dsl9Rai2zgOzQelutwqZXFLjL8
	K8Yb6+CT/YXIF/QAk4UA3JTAv3TiEL6Id2eimEybcDHm7GlqJShUTHW5Xb1PAKRJ
	nhrFf/cfScCsYdhR70zwd1zuMNnIKd2nrloPCu/zvaC91Vgp5CEUkFpsctTesTES
	MIBAfpfm550Mok+kWdwlNlJ9ZS2FcVny4dB28qdJnvC+YUBoz6XW5JMVtKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp37ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:35:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a8c465c1so17010535ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 02:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769164517; x=1769769317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvYgv6WMDQ0b5uwrRt9szE83vMmYj16VI0SMU89OPzo=;
        b=i6R5vMUZ13/pS4XYAgSYXatDPtrdKK44CxBvo0dVKr28GdQqkl57JNjiwaRbYiQlx8
         ugvrwMPH24w+Hw8/tllhGsAbrqzhXvkzSUJlsEG3WIc3HippHRJ7XvmyWyy1mNGCEdWx
         coLidiJA7qVR8wvahooeN9GZ37PhFyO1va2cJsMo8Fhf9en4qxNVoTRtJd64DPf+NKNJ
         ianP19g6DoFptyXbfUkLW7gcVcxxnONjc90RPQt0uIoYjAD0SVAwq8DV2q2frQUu6j4K
         g/73EPxhOJW0Sd47DjSBvbgr1SJzJldH37/zGvYN20VaLgyFJyi5+BhqiAACd5P7LVWI
         pf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769164517; x=1769769317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wvYgv6WMDQ0b5uwrRt9szE83vMmYj16VI0SMU89OPzo=;
        b=gx93w0XuzG3TL0l91pU8FuQEF3IFin40B0gUoiBRCOmHEBOtHqBxcZ2mYN83PoXPKc
         RPY6uIt/CZOOakambMcR/58HqOxCUCkUia38nzamRHarL5361s6GZ2Qrx8UxPz4Rs0t8
         G+Qq12HM4g/ec9SXPaHQ5ECqgu/R6tzgJf1Ei5vq9IgxlpJd8GC9fjvLEaTiBwOPNspx
         tzXA2OEi2EixVrhsQvywz78Bc9Q25lyIodJuRT9W83MoV0YJqxBA7eRRgakXgHaNZh/6
         Gqcjm8Og6xi0El4eV+N+AxXGKmwVHv7aD8Gr45zvjkRFVSAW/xX3NWVGW1WTTLuV0IbF
         J5BQ==
X-Gm-Message-State: AOJu0YyU3KE5pd0qC8LqHNzdzLViFUYKlVEW6wEVhBF97bE8WPLxKm63
	S3E+W+OsK8RV7AKTwCyhE2ouzH4aOCHu/47m5FPb87saGQHOYegXHHcVQ/cvd41fZBmanYfie0G
	SprAIH7AyrgUs0ADLwqA/fiEIxAWQwHKJVoG85t1K8hin9Nn2uEOWtCSHSW8LFe+jJ59e
X-Gm-Gg: AZuq6aJq44l1VvvQ8PjTwsW/XBo5pS9tP6cUas9FrafUW4KJKVRWMGuEsINEcRYZgzs
	qjwgTiOzSQkVcM1NqLlsdKwV0L2rkZu/1af+zwZGGZJ4cDDh3QT4ADGjOwrTBS7JINqePW3BjQy
	KDqYcVxxJy0hoeP0RGqW2ZR2LTNEM8r4TM3rlUd5pCX4CV/WLeOmiIp/Q4i+KelR3FS0R9DQfND
	9eTcdlQIsk3vOJJIvpM84dtPnilDX1WpZ1Fb+0OfWzUSTtmfxDfDlnxvVf32bUCDlgf/6ECDPW2
	bJ1JslrseAk3EDNvO/HOZdd34p42tYaizt4B/N0o4t8R8xVnWZOGwPS4RLVS9lahuBc98oRpNXf
	/6UOvmaLAx18yTDR6c3rz9BtqC17ZY60wxj+4
X-Received: by 2002:a17:903:246:b0:2a7:a6fa:eddf with SMTP id d9443c01a7336-2a7fe7e14d8mr24389185ad.17.1769164517286;
        Fri, 23 Jan 2026 02:35:17 -0800 (PST)
X-Received: by 2002:a17:903:246:b0:2a7:a6fa:eddf with SMTP id d9443c01a7336-2a7fe7e14d8mr24388785ad.17.1769164516624;
        Fri, 23 Jan 2026 02:35:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd123sm16735335ad.96.2026.01.23.02.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 02:35:16 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: talos: Add EL2 overlay
Date: Fri, 23 Jan 2026 16:05:03 +0530
Message-ID: <20260123103503.1259645-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
References: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=69734ee6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0HEmIXWpzLlmP88VegAA:9 a=eSe6kog-UzkA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JWa3xkPKKWEsbOgizzd8f9uLyEpYf2MH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX4dS32deeaDoS
 r0bWwp5CY9u0MieBpt7mP9e6MZKzYGYlLklw5UxA/JvnRmB0Uq+wOeiZdzwOJsaxNbQzdxUrZqD
 vgFmoet2xWimBMFwDQmQXboBLYHe3cS8VHmsxko1bN3LAubzTonwKZHlCamnCks3eQWOa6UnluM
 3tYpHWsbjUgBxWCO3YMl1/iayzjj7EGp88gIkaHpSkQOfLQLrfq/yaHD9aJ29ynglwo7NI6QDMh
 slnnRB/dem5+ein5/6AhL10Hpoe4UItjFYa1YiOVh43rHz6Nx8KpbfM5iV819ZMgVx55F4qBlHb
 /EJoXmJBaIGELUwDiS8X97CAoE9Hbu/Uu2kkaOgX/t2DPnXlS0B8607sFFtlwBRsI0pARt4mPlK
 4XaNkBNCIlbJBiCOg3RLbEfDnLZEbAe8D5wTS7T2lVHTqUW3C3M2tdRmBCS4Z81FAph9mdgsd9y
 mVJPTUIyQiW4S7sRnwg==
X-Proofpoint-GUID: JWa3xkPKKWEsbOgizzd8f9uLyEpYf2MH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E78E074620
X-Rspamd-Action: no action

All the existing variants Talos boards are using Gunyah hypervisor
which means that, so far, Linux-based OS could only boot in EL1 on
those devices.  However, it is possible for us to boot Linux at EL2
on these devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add a EL2-specific DT overlay and apply it to Talos IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
This patch has dependency on https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t
which adds gpu_zap_shader.


 arch/arm64/boot/dts/qcom/Makefile       |  4 ++++
 arch/arm64/boot/dts/qcom/talos-el2.dtso | 28 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-el2.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cbf7d89e432c..48ecbea17a4e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -141,6 +141,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
+
+qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/talos-el2.dtso b/arch/arm64/boot/dts/qcom/talos-el2.dtso
new file mode 100644
index 000000000000..03ca04c44976
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-el2.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Talos specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1720 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x1080 0x0>;
+};
+
+&venus {
+	status = "disabled";
+};
-- 
2.50.1


