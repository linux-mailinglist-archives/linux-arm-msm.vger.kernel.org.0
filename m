Return-Path: <linux-arm-msm+bounces-117314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMrJH1H1TGpksgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:47:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8660671B807
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:47:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="F/27N1KZ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XN2rAm9D;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117314-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117314-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF5D93054D9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCC5414A1D;
	Tue,  7 Jul 2026 12:39:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814EA414A0B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:39:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427986; cv=none; b=ev3pjastOp0xomqtlBay10eOpPeiO/7mX/WXFUUBNYROf1WTWbUA8zdg0CCg1GBI+CKeSsiFI67XtVDCNgE718wPnSyLzF21CKwkAsyCcU6Z1FS/RbTGkkhwdO5qnWOcirfCYyTB+01mt9yWmsuuSHbWk0gktesQ9NvUJANshAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427986; c=relaxed/simple;
	bh=neBtQNse/ecsziDxpxfBl0a32ezo9CFgc0jRzYaJAY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNDDcHPFztBDaJEa3XCIIj7GnK0J5GbE/JTNdY8GykQse/O0BfjEghF1n8ef0EzK+SG5zysJtVED0QAYygLmkuq/l7UJBMcSGOHbffeqan//SGQFs/aA5Pv/+/hawxgxQkOXqbqRXWU8N7etLFkZfMKj/FQsA1gTItqDRET4l2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/27N1KZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN2rAm9D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8ZCN3783380
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a9hprayaUcC
	Zzvmd2wG6Bvw5gMa2j/pZQUw6jFuYCt0=; b=F/27N1KZft/4kbNTGEQCWzZdVvx
	d0BSVpnVthtd2XuYJui7pm5T4GHS8S705WGEaKMRJ8tg4XmP15TDaVv56aZtGOV3
	OFuTz3y9xhaUIcxOhY3leBPYVB7wWsZMSfVr55Qzl80miYTnNRidY36nnirwDMVO
	408/3EVdgv2tS/nhRX5Bg5RWaE5ioWD/XS0zvi7hTmlxg7b+i+OgdV1vq54/yz+i
	t9BeG5KcQRD5WMpn5uAxt/xupsFaAWju85ZIZLJ7Hodf4ksPRjuP9EN2LmUfxFPj
	vu53bBGvyMgxbs8/uGg7lDjSyiIR6dl4a3DPhWWiom5yp41pIWMdDv/7L6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11s78a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:39:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e934385db1so54853856d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427983; x=1784032783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9hprayaUcCZzvmd2wG6Bvw5gMa2j/pZQUw6jFuYCt0=;
        b=XN2rAm9DuONtLTMfK54KgByjJ6lOe4w7CuT4DQfMd0rjmfPcmrb/1Rj8QazHcoFIVt
         GQmZE52fvukiI0EEST8MZmkXsL+hqTYKmF6g2FTCUedSrhpeNOtfzQhJO0/EKoAv7XUc
         RN2Vqqh4xaiaCL3FAMEUFxMRpmax0pRbRczqLKGE/ts4NQFIDSJ2P055WV5XwM+Ql4NE
         b6hOJK0lBYXinlzDXQ/1JywypYvElGmuXIfJw1oDs/lrufAZFMGPRyDpJqW6URB+MvlA
         hLMTDAYQjokVuNXd3Yi9F8pIFKw115J+PE4dK1jp9s1JoaE+o/RhPKOy0e5/ZIK1G4zj
         zxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427983; x=1784032783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9hprayaUcCZzvmd2wG6Bvw5gMa2j/pZQUw6jFuYCt0=;
        b=iWHpCdg/1Nd15o7Hz92THPUvvoMVahjmmndts7ee7+6PmeHlgjGDWKyFH4PD/VKTF1
         eGwYW0/1MjOjZI9h9z+5sDfj4WpcV2fB+3ZaNZOvBkgC0Vd6EvdguTbMn+dS2Khl8bYd
         6OWCdiOcWenkLtgTzK0fmVF/DL8D6nha2lj3trjAIHsHBHP3D8QfINCUrEUE95HO6QJB
         qdOEwWkj4si6Awh5WMVYjn5RmhNiGcdofzBrqKlAzFm7SEfJjEsFS7gkaZjzeNPwZkAE
         +Iw8sNMLazXgw/OO1Del+W4pGGDYqMNH5EsRld+hjsDJSQwZYxxRN5h3zwSDs8RH5JLU
         IY7A==
X-Forwarded-Encrypted: i=1; AHgh+RpnV0BkI9fY9kKJY7Avp+cXfRtR+DKJ0R2Eb/ADMCjH/Tn3t3YE6XA8D80yKli+g7QvqE1aH/ob4Rg5o3uU@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpzKAyMrM+HAYJ+E/Ca6yJ18CjLjuLoaoO05JcFS7eReOTyxb
	4nVVNRGFdJjcGFo7ch7zO3+Y64xIaS6pGjl8WdqjMSpk3Ku3/HmEo3zm4P7LOvP2KdN4qv1MUCg
	ZrAlKk0FDgxlK1tIqDX2dMgcq2K6RwIut7UVFcoXGa4omTPnV56FMCkloGgZdjJ2nN9Cc
X-Gm-Gg: AfdE7cndDuA/FZyYFjtbwlkRvm8ST46rcX140q+DhHTql/T7l1vNBhG8H54FhEBdahp
	jUQ2sNZCrVKIwqyszEIHqy4Umx7evgtGbTTV+zidHA4uNGphh7TCgefiwlfBFG7Yj3rW2Zkj0p6
	1WQG4qJ3DuzCz4yavv6dAZQOeXSFF4l3DruCLP+CMx9EJd3GW8OV5bcUGBBx7Ws8i0ygNXzGWRi
	bkzF+Rsw/23yHTLct2lg4xqe2XYjnVLfddbNDjY5A/4j5mQN8YP7WVY5l8CqPuX94RJg/fV5jkb
	X+2kGSsOOzoKJz+Ix4IfHMUfgLv42dp7dkCU+4Ruu4hZSSbPAg64efREA8ibDRRjOsx64h/dgzR
	NE087DosWu7VwYNeclmJIw4Om09QXy7ih4lkW2j6H7p+HS5caUp5nKgMmv7H+3Ald3DOAUdQ=
X-Received: by 2002:a05:6214:519d:b0:8f6:7335:4f9 with SMTP id 6a1803df08f44-8fcb54d299dmr62408326d6.39.1783427982438;
        Tue, 07 Jul 2026 05:39:42 -0700 (PDT)
X-Received: by 2002:a05:6214:519d:b0:8f6:7335:4f9 with SMTP id 6a1803df08f44-8fcb54d299dmr62407876d6.39.1783427981879;
        Tue, 07 Jul 2026 05:39:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46ea3ff80sm159724616d6.15.2026.07.07.05.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:39:41 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Tue,  7 Jul 2026 20:39:02 +0800
Message-ID: <20260707123902.3868016-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cf38f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 2rf7s4s2ckVVsVXQ3FbRCfzLOEmLYfVj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX/RmXK32yy+j0
 WR845peG519WhMyB/2iJrn8LHCqTIJoZfPs04JvhmgjE/oXkIDplUk+vcFY/k4jQgPMyqs7muaj
 jrN3DXnUiGvad3vL/BhMUXnXoSAfBVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX5rO5R1OWshsI
 93jMD8eVNNOlnTzjCWNT1HC5Vi/5ZTBE1dwxyjONd4d3aJmtIpxDnR4i0pxDbcfW2zHQ9HRzN4Y
 7MQeADJDLOov5VvIT5EUjn7io8hd6kj7U+zkK+ZguHfa0PpUYu7j5qd3srDWFpMVqKgLixrOadC
 AUWbhNkifUHiP6cnz15pDX/Bs0kfFbXwqEpvGM8mNlzgENvVGfsx4SQD1QanYEk9joHYNUas/PN
 Pe5c+ClMGlkC7i0g8vLUQEG/d7kOIK/lCwtY8ji7sbWEFrCIM7kFwhqPFke0O+3nT2+K8Cg2FiT
 94CVrLeqjHDbD8CNBTIdT/FH8YgDOBjhdBT3feCCtFQYYQDViZ8U0QdN3fHjhxzuI6wigTGLBnA
 HpDQSJgFpz4haIyWzDokhqU/c2+jC/MDNA50j4VsDdwAKFPmaKfkC97GSAayT1fVH7jk0LZB2Lq
 yMBIEaRVPoEKI2eXDEQ==
X-Proofpoint-ORIG-GUID: 2rf7s4s2ckVVsVXQ3FbRCfzLOEmLYfVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117314-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8660671B807

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts | 240 ++++++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb1a99a3e01c..8e6ef4116146 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..d1c28698a970
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-sa8797p.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,sa8797p", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic_kobra_thermal: pmic-a-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_0_thermal: pmic-e-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_1_thermal: pmic-f-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_2_thermal: pmic-g-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_3_thermal: pmic-h-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_4_thermal: pmic-i-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_5_thermal: pmic-j-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_6_thermal: pmic-k-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_7_thermal: pmic-l-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
-- 
2.43.0


