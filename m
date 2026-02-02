Return-Path: <linux-arm-msm+bounces-91434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aILVNWBTgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:33:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C17C92E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C01093001598
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1C6212548;
	Mon,  2 Feb 2026 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URDqceV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxgfQJTZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9B2877FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017629; cv=none; b=WwEzt+VE8ia8dFAfLuTOqZtnYGvfNKt7567Hsx2uYCQM5Wd9anJ8XSV5l5lmiUaXMf3HwMYu7u536EhhBZzC5kWBcn/wSpxFxuFiGAMZvNacIUOV2xmWMmz0uloLHZomUVus/KCYqs9+OCSz+P6qcxrjlZxNdxsbSeD2dg4kNuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017629; c=relaxed/simple;
	bh=wJcPckga84qkJikfAo1lUUPEEg7e/J/GjdkMbFVlIWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gyjOBWcJVtAUVcjLeNo4oSLT+f/p/gbiPW6lxLccBPea0aMoUEkAy0H/dqKseY/8AWcAKgj6EnxQIbPcO7aoJMgHIudISTHUkW8w5uo79IID/ol+4f9MifV7J8kSNhppQG8lDZ7qtGRx1lFOy1eHmWNRk2RtjROqHT3vqze9MP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URDqceV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxgfQJTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NKQfJ1192166
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+BdPd3+ghSB
	u/MxiQx/PvUJlHOTK+MgLo/HmYHxFwxA=; b=URDqceV8wABAzPNMGWP2hbzgHPu
	npmpmLFrp8aHrcwbttY2iQbRNiTcUjBq75AoaUa/qO92z2jh9V3k44wnJMnJV5EX
	cSvis25dXDEoijEJ/lHCudkfJ72IPetD80xTlVRg8YfgAIIlEIDLHaqFX4Ir3Q6u
	aNprTxugwJle2E61dUNkAAmrMOQCWFYwuE7lBcznUAYuzBPczARBjkIj6U1Ye4hr
	n0+z4ycmoR9cp+fiROifh4hfysO9GTgF7HeD6U4XpdxfBXZQsqWt3ZhZ+p3Zzi1x
	eIKHn3vm3Vq5zpTmllIdeAZZAi2zmHiZo9+pyAs5D+R3tsw8ri1mLncaqyg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4veym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:33:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-352c7924ebcso4380266a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017626; x=1770622426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BdPd3+ghSBu/MxiQx/PvUJlHOTK+MgLo/HmYHxFwxA=;
        b=bxgfQJTZedxj0OUFHL28lZjXzRmeD4NWwJv1r8dXqWiN8f7kNcaYiUFuRFOtcBu8mq
         SxZB19emdphCYuaZ+lwa5F4ZLVtl4PHYyTaucSfM511AqSHapOOAJ6XKrrPZa9wf54gk
         xltQngE6aT3hQSTF9R24T+pbsVWKW6o2TjP0y7iXRERnFAj9HEg+DyX6b3nYFE75JRIP
         2a8mTOt5q5Fl+yUvLYJ59Red3QXQgKGJwCJ0sJdEbBr20hUl5WyS1DzOgey3CH0qnk1U
         4B/R5ujhM88wyDW9i8ldD7Ttr+v4V9wosfeLPvaSZ8lmu/C9HInq7NaTr+Tx8+n+567J
         eoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017626; x=1770622426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BdPd3+ghSBu/MxiQx/PvUJlHOTK+MgLo/HmYHxFwxA=;
        b=xGeMpN0qF153FEUEQllDXDlu15VnIyru8Kfo6Md7eCVhSkM4+KTJ3IhUMv7fjKbKni
         OAfMtXydEVsNHR+87Mtp3AYdIwUaxRiAibU9+xc8GakQ5h1KBkKOHUH7tDopbpli4ZRx
         6YNbosUme69keQzngekzRXjdVdXNC3sGa/e9wv6dPzE4OP/BXi0k+y0IyTVXPjwhHtKS
         Zk8V8JLlzQuVafTTAzouLvPXxru4icdFQxfvEKGlGVFFqOLHp4xFv7hFmHZreiuEbZcu
         sVyT5h7n7tm1M2r/h05Y9U6+i8ZIusCu3BhI+Z7LLvjsDwFgj/RqvvmY2rhdn95YKd53
         4ggw==
X-Forwarded-Encrypted: i=1; AJvYcCU3iAVISbVPZtfeKJr6VVBMLdmPPbZz8nOXPkp8P7DtaEztZXjBkSn+TBxT5Qn/Cq2GRgulZ1QbP496Vm56@vger.kernel.org
X-Gm-Message-State: AOJu0YzsSnQjgYDzIrdUlB6DRXXnIov1jm81F2huRX9hAtlPJHl+EUf1
	D1/OhDx2tsWODx2Cy7kyZ2XXq51NeUOKCfpfLN3a/1WBAjmR5K831NB/FZUFmVisJwp2InJc2Zd
	+C2eHzJYEsnSL21JuV/aj95wXnUdExyIAWXoGT4CIIQQ83vZGkZJwdqfStnCZqFcXMRF4
X-Gm-Gg: AZuq6aIECbfwjZKyOS90gek3Rbyv4UO37eRLHQrFXFwHZirLpnKlQClZL8pNbLxut52
	mSLkta5Gb8KslV4UDb5eqZygUPOVK+hl1Zp/iAarI0SomhwMvgMkO967FNnbLWoPNwNe0gbjBme
	Eo0GOEdhr9SnFuyd73DtyUggTA48RYjaSBmDEotDzoomp50ozXVb3Bki+U1AboprmV0Vcz8o7F9
	SuvUdrrjjnds1fyWhgtVU4L9hGv/3/X0hPHyNgmjAQrpa7SlJL1f9GHLNuZy1P0H06havenHfDi
	k0WpW6WvFsPC0IsGflKR7gVAgVJUaBeGvLZeCUVuB8BgD1MgR4kQxrcFD9O/qcwpyeUoRAASJR7
	EDUU6p6R2owH/LGcEbQR7Z/iGwMYlFpal3WJlJQPk6cwUPRdDaP1q2TvTpAsNPZysEqnC+0J8bG
	wszNpxb59mobKKCIg2XsOwKPGyHr41ip/PEO3Hf8k=
X-Received: by 2002:a17:90b:2d4c:b0:353:2e1:95f4 with SMTP id 98e67ed59e1d1-3543b308529mr9198445a91.13.1770017626238;
        Sun, 01 Feb 2026 23:33:46 -0800 (PST)
X-Received: by 2002:a17:90b:2d4c:b0:353:2e1:95f4 with SMTP id 98e67ed59e1d1-3543b308529mr9198415a91.13.1770017625728;
        Sun, 01 Feb 2026 23:33:45 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e25sm20758332a91.1.2026.02.01.23.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:33:45 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Date: Mon,  2 Feb 2026 13:03:22 +0530
Message-Id: <20260202073322.259534-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OsQwjTEs3YnWbBXS1Od_cIsAmA3QoK5_
X-Proofpoint-GUID: OsQwjTEs3YnWbBXS1Od_cIsAmA3QoK5_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MyBTYWx0ZWRfX7rXZuDOtIA/O
 Muj1gmgcm3h8VbtMgN9wiq/HYCA5q+TrwbzNJlU1lM0ERtneFtk/YWXfzNnbywTQHHo7kdVmlRI
 Ol1TQ0+JnvDgmV4/4lSXdC5klO0nE5MNXF+jp4rWt1LDG6+rUjleL4oZrKoAxiA8OB9YPrrVncb
 mDTbfS0zgNNb/9KZBRu6TLZ/dv854eIB8Y8IdkdwJdPYJtCz5cs0xQP8P78cgCQpDNv+pXx7xW4
 gnNdSt/6DL1rgpHXKA4mJh/5zNDOaDDh4XpfnnKcqWuJEBDMRwx4gtFqRw9Upu7Z/OtRY4bkObG
 QrVLb6LlUHuXHELs2R0gDDrxmuTG25buLfyq14hIAoqK/aUIMkS/zBnUrx3NKW1TqvIGP76vv3r
 R0yVRMjeihHhjUHZl9bgHRHhLfU0kHAE1LaKztvURleCcmtL8QgnnelduvPYHNPKhrK9873Nif3
 aoHKEjMoGaYuC4XoaXw==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6980535a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uDUrP39lUoFQp6OTP2wA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50C17C92E9
X-Rspamd-Action: no action

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v4: Move sdhc properties to SoC dtsi.
    Disable nand (that is enabled in ipq9574-rdp-common.dtsi) here as
    the eMMC variant doesn't have NAND.

v3: As qpic_nand is disabled in ipq9574-rdp-common.dtsi, no need to disable
    it here. Just enable eMMC.
---
 arch/arm64/boot/dts/qcom/Makefile             |  2 +-
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
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
index 000000000000..9053838ef696
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
@@ -0,0 +1,24 @@
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
+	status = "okay";
+};
-- 
2.34.1


