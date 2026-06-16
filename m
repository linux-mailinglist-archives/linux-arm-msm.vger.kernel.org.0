Return-Path: <linux-arm-msm+bounces-113416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMElN0NKMWqVgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:06:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A468FBCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MdpqrQFZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H0hTKCMy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113416-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113416-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2778C31B0697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0027836D4F1;
	Tue, 16 Jun 2026 13:04:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E59363C60
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615061; cv=none; b=awuV9Ux0/JPvsSBaFqe6FKgFotlkj5Zkfw6UV62AO4nNxx1/fpchV55HMA12VxN66XbR38K3/t0SfTei7T4xC3HFVh2LkRM227+97o87baVVEXcgZ9AzWjcRnq5ZBJTFxoLW8TPIiRy2Iw4JvGQjsxN6UUYuUp8lXyoxLXnli/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615061; c=relaxed/simple;
	bh=EGv4GYvLJhMHC7C7MhV0I+x/rtFPkL/J9u9qJvy2w1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOKgOglHWswBacViHmGLeTgXOSTHMIQ8UEn4nsEaKQBwlCxuufQRJ5YtHz1DvyoOSBZwLtCGynGcyCaDT1mTa5S7p3mweGKfRGalpWZ3b01U+sgbEpVWVgibmHEP1Gic/1wa1TUHUxxiT8PX0I52uqbe4FnVNakswma5A3d2zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdpqrQFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0hTKCMy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABt7D3384276
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kH/fZ8T7ln1
	R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=; b=MdpqrQFZcYbZ1SOj5C17F7N1TED
	BJ2tSDM5B8ERWZFa8aAXHL2oq7g08xkL0rirj44c42rX7i0WxBvCXtWd9a/pqsX8
	H1labU+9vQK/l85gpLhPI/QfFKd1PNbFmkzCQ+fdhQJJE916VpfgtuuDM5GollRv
	kqboL868Ccqv6asg5q2/puOPy3f1y1gCTGTcPSBa39PEqPHDmNmUJo5+jFwy4lqS
	d8zGy/b4KyBI2yvhxjAVnQLynTPJa+NTeVUJVqWX9TDjHwfKc2YxvgFt9MqlqE/v
	1wyr/nv0yQshEnbNkgr1GpOXvwoBqSV9dNv7W1oj6mmjcB6F7eb89Qq/4uA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep9gw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8596e4272aso4882427a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615059; x=1782219859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=H0hTKCMyUL1K2ns0hl17OmZAHRAFxqj8KWbezVqXx4j0Ysca48Z/JhYdIu91t0S7yB
         rIGjCOMaQ7j3MeT+iLq/b8itgbbiQf4D1ZdVnb+9NWbWyMylzTRwmeKDQaVv87fRwrpg
         J47upwntl4yvfCdcJe67FrKymsxFvXrv12vVZ4Hwo2hFvLlcwRgFUepotGcU/QuiKnBK
         VTDpV+itzrAG5rWQCDq4lbes2aTzJHxCVfv+BA8+h648AWQTNNdPbhYUYD3WGyk4rB/F
         faBntUzf+h4Cx4Xtne3bhXjHZsh4PkPTRTYDCuxiRwh99PvWF1YgSPLCNxPX2UUyRR1L
         s3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615059; x=1782219859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=Px1EdsrtysfvzCHXNL5c2v3Kq+OZXfOir5hfQem/s4lAP1l7cB//jW0Q+yP70kCcP9
         eQJ9f4eozGU4nRWjfpMHsiOoYSPoxU39w33dyjzcRk6jinRVLSrMVzh/hOMb2BrvxLga
         BFOydmVKT+klz7Jke+/0Sj3u0bvJHb/y6hGu4FBTq3mOJboPR8H82wAjFXHMd20R0aD6
         vu6xeIl7R0L7kO8mFtAcUsHzYjC2CKOMjCJgnpymp4sjEohMUIIksy8tMaAZqqF7cCu0
         aHPlqwefivjjvEmIuB6R3KtP+DG2LjZfVRNz3LY93/rnL7H0BbAvfZdH4q1dyC/spYjl
         pc2g==
X-Gm-Message-State: AOJu0Yxii4+QeeVoMh7ydP9hUFevx/arDh09HOWc/6ovNkmotGLnjR4A
	Dw135+P4MFcdDWqSo9VWkDyxqa7uhyvP8RgM31fw0s9wxTtHXnzi0j84B8C66FrHbg9q3o+rWoq
	FkLLAlqT20A+2VsVpbC9jxMObFX7aSjxo84MtJQcUXZtYMgCXg3B+wwYqy18WDMAXH43o
X-Gm-Gg: Acq92OHzJKGUN1SkZYMsIWkqrqruGuUrK/I3wDahMOLpVIIzQnA8QY1W5jwFQztbObF
	y7UXnBawXTFzoAiS4XPrumr8JO6UT3/TTJeYsna7uJGOLNhPpm3qm8Cn41usl2iUKS5wQpzkOyS
	8OBbcdZpfvCbjhglqWizUcmW3vv/IKuP7YWVPm2T7DEShPErveQHL0pGfOXSFaIib/kP0F1xhhx
	vwCBWi9o1i7sKywa/Wh2OFPT5DcRN2mZOyC2XvuuopZk1sbcIeyqUiTidB0e/OfIcgkVFnwQhXT
	xXFp5+MLnG+qcbkKcgMGLOolxPqehSlw8gSLBKiiPH/1b+WxWonq8TwuAbE5hLjctxtXrEUp1Na
	hderInTETxLHSJyCZEQC+fakx+oXgD/3O9ocxIvV3WzWS5cHkdcc1SYVM
X-Received: by 2002:a17:903:384c:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c69a10fd7emr42853125ad.15.1781615058267;
        Tue, 16 Jun 2026 06:04:18 -0700 (PDT)
X-Received: by 2002:a17:903:384c:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c69a10fd7emr42852175ad.15.1781615057590;
        Tue, 16 Jun 2026 06:04:17 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:04:17 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V2 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Tue, 16 Jun 2026 18:33:47 +0530
Message-Id: <20260616130347.3096034-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a3149d3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FCMv9EZ1guwIjbhFI0kA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX4mpkmvOi9yX0
 lrZTiYttpkzyIEnRK7D359l0uyOh1yPqLOl1J0hDYggVDnj3qzWatjc0Db0OhA0mdZwkiaymaZv
 7LH6VQ1BdFOC/s7gEFZGXG4vurIPbQA=
X-Proofpoint-ORIG-GUID: E_pJjvLq2-f0hzGIpWQGpDS2q8wmey4B
X-Proofpoint-GUID: E_pJjvLq2-f0hzGIpWQGpDS2q8wmey4B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfXysaRtUvTL039
 /eW+jtOuUDgoeYbHT7qmVkhoADLumFQBaYm4LN6id/CHT37ugX1kwO3+fe6ipTcdAdutZAHxUKe
 Ovh1k+hJ8mt/PBBEgSyGmdJVfPy8HgQDwoqhJCbqtMk3oQE2+rk49mj65U/bt8OBd8CdirtbbkJ
 VZZX2B5yElj3qSlXqTmZmdqv9WiS3Smftfa0g6mg9arOk+Ym56ZnAD0y4rryL7HPP1R12CAUUjW
 CuPeWu65PyJrDMzhyo1JR9nans2lLTWrH1KGoFPfxqNneTHlBK4NNt/UIg1ocL0741gRSmuTda3
 4LRex+bOt0VwmUqR9vww4xxYpSNhC71ba1iCzyLyJJd6MpqAitSHyDpFNeV/ocRqJ0XbsukjtwM
 lY3U6Do0BdbCOPOKn/3FYKE97xOGalCr0qDVxF0Jtdkk5QR2VfjcRUv9ECPEQLzE3i38+bB9vsP
 uAJxoElWWhH2E8U/zhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133
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
	TAGGED_FROM(0.00)[bounces-113416-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D0A468FBCE

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 37 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3c5983bff00c..e9a21c83001c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -73,6 +73,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
 
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..cb2566ac6923
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+        vreg_s2s: regulator-vreg-s2s {
+                compatible = "regulator-fixed";
+                regulator-name = "regulator-s2s";
+
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1


