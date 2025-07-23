Return-Path: <linux-arm-msm+bounces-66388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A7B0FCDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 922A87AE8B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358027CCE7;
	Wed, 23 Jul 2025 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWbQYUu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E0278E7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309695; cv=none; b=QX+R1xDcsCozv9RCqwDtEFPeu8p6JnwfGESI+IrnrWqXGUn1QhHLdRV7h9zL2IP5HAsHMiymzVukWV2gckLrqIOB273Nzb/by4QgG+X/uREGwGYCGLbbHEj85lBcZDlC+tA0LqGnfxkbXTfGnJ7H5pcp7KtMsM+oN8mZhc0y3ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309695; c=relaxed/simple;
	bh=uf2SvxSFUgilzw3JCPr59lPmRFUsX2OQLD1FLo+rWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9qdZRBE36y6ML/3y30EA2Ab9nt3EBBeuETBJn/c42v+ogdvxvuSrtgUvRML4Pg1iVsAykEgPup9SFXWBhl9cy93OCFlkgOxZglJD89k1PkQ+Rej9m4yL1n9Qnn20dK5KPWZOTjT/4EZ8nIH39VNQa5qsIuZmTbo4Bj/NLhFjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWbQYUu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH8TL5016083
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fb/YneAeDUu
	jai2oooeBHtgRqfio7LaYKhqkQgq7Gsc=; b=PWbQYUu9HYdmT2GTg+nK8n25EhP
	ZhNRT3I80kbQaXA+M4jNkdXB6cZW47Fd7MBpx5j8sCm67M5aY5m7cz4C64bjbCTz
	n3fXdbRsVBt3Cc++04Ta3FvBoF29+iuBqUbMGXpkvdYWP1nwf09tngnsEmbinMZC
	ZU4GkbSY7B3Yi3KGkvdvFq7L/AQoKooQ60aeLVeFrLlTRRfD/qzFgDTCw+l3AiBJ
	jRE3Nu9lFjFCKoVnesElomrXnPHE0mhGE1cqPtqXCzg4cWpSYoBiLnew+6P+RmEc
	oN6gYbVA+xR8jNkIpG4eQX86OH6YAKFvDu/t4O9Do9NDHNVumh/+dzdsVtQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd233-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-706efc88653so7622156d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309691; x=1753914491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fb/YneAeDUujai2oooeBHtgRqfio7LaYKhqkQgq7Gsc=;
        b=ltC33OtAGIUIkYXEdxAIFRIo4Lvx298nMTtfrmgW+8IbqVqIrOv6Aw8yvVlflzRLH5
         s2RzSlgFWrzjtpdRcLmP/K43B577ypz7WuS7uMbtvbQIvgOXWJvmqS22hooSACTjmg1M
         9eoJpdHctDqp3yxvYZEiflR+pAjVHAmsyRQjU6vHQIz7bsDPfIJATqgA3CXS3MFH/feV
         kme9RFeeBPxG9sMxvJ3/ZAeAIJ2/Ak/0L33IklswVkiN83bQ7LBqOw7fK5vOAXOKWDbG
         i1KZPJk6R/XiuyH3CQHDu4j3RgwCQEwcP9M4cbrI/YF/Zz/l76GdUINbUlO5MCehvQ0q
         jjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtMQWzG7lOczbwKcJTQQvw4m6WxK39Qpd86bvqZrvye3JTNAvN2NERePKuLYmzJtGH8xJPoKiMuHKcN7H9@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzaPhbdAId/BUKGUUyVUCjqHKG6xrJm+FzmweCLDoEa003cjl
	QqAliOh/Htc7UX18al79NCLchGv68W3n5a6RleJUcv7pLeALP44DGzGpmdYXQ4WRBTrcF+rZ5sD
	iznH5jhuTF78/gOcrjZTMd9KR7RqIMJWAb0s5GpiB4yLucxEKFH1gSMBLPpWDNWtIQsJMEyreLz
	er
X-Gm-Gg: ASbGnct1DjD+GhJ34PYf/krl67peYbYwGI+iMqcWSjPNeQOPoScnXxGQB8jaomitlwZ
	/61oVLTEMqmyBdtyW7U6zYvnA5LQZ870PcN6sjPkYlEvV9mu3ULagQZf28el0g0bWEkZgnz40OB
	GUvyysSFp0e4G2Pg34jR9pEoBVTmqHzRQrYwKBKIildJ0P13CFsT+XH1B3VjSUWCJaXpBsEnIaE
	VHIUU3IOywpjmAwCPgWfcOe/8K7HAocS/lMdZNLOn4bIc4dJ9akA2lfgaFq9hLn9z4bQ2KH3lZ8
	nBiSPLM2gpwuSgWNlTGITHYFMhWtNJj/a9UDrJAtTafthBI2MGhE+A==
X-Received: by 2002:a05:6214:2022:b0:705:227d:a511 with SMTP id 6a1803df08f44-707006663edmr60475236d6.32.1753309691243;
        Wed, 23 Jul 2025 15:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLdeYPeiv/7I5VkqxxCHuku7Mvhd3JyalBaOqeJ6jwBLivMIUNE9FcPwVnIQcM+ygGsLnWtw==
X-Received: by 2002:a05:6214:2022:b0:705:227d:a511 with SMTP id 6a1803df08f44-707006663edmr60474966d6.32.1753309690706;
        Wed, 23 Jul 2025 15:28:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:10 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 18/23] arm64: dts: qcom: sm6350: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:32 +0100
Message-ID: <20250723222737.35561-19-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fcOYA1kiGePT4TjOXNB3mlnFJ_vHcYy7
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688161fc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=R7b-5tlmrD_1Gdgo1VcA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX9Casft7BQwRP
 gJFjybens9R2xT+YkiWk3VWAmKywJderMzox/+N2t+tOIMd18KAewEvdBGBlVFBy2CFhGyDkNsl
 O1sFtye5DFZ3aKUWzQZKptUIDfjhaCj8J8uuFfcgyYFZCJ4EFp3dv8tPafM2c05bLTVGLUHCnH2
 HGZn1mRjjuxBb15R/CW4J4ANdfiZq9hNdQvAXERPExot98wjDxWCi2XO+fsvYJSlIqi8KJioxFt
 mNd4ihbKZws2IuUAaWm4EnOJGU/tOi8bPs1p8d1cz7wmbSFERS3LXeJByCA+g2HlJna/2Zt8Ckm
 aDqzn5JGZ0fzntE+QoFDmLTRi6vLDO02CttdCMiZZfb8yHdCp535gbG6ERdDa2kpd2RxSd6QEZn
 VYvULLqznqtz71lIwryrYPdHGoYfn9E2Utuayq9B+/mGfJm8MQfN+BuOK964tI/ccE/1dAF1
X-Proofpoint-ORIG-GUID: fcOYA1kiGePT4TjOXNB3mlnFJ_vHcYy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=764
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350-audio.dtsi    | 17 +++++
 .../qcom/sm6350-sony-xperia-lena-pdx213.dts   |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 62 +------------------
 arch/arm64/boot/dts/qcom/sm7225.dtsi          |  1 +
 4 files changed, 20 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm6350-audio.dtsi b/arch/arm64/boot/dts/qcom/sm6350-audio.dtsi
new file mode 100644
index 000000000000..2ca406763e80
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6350-audio.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&apps_smmu 0x1001 0x0>;
+};
+
+&q6afe{
+	q6usbdai: usbd {
+		compatible = "qcom,q6usb";
+		#sound-dai-cells = <1>;
+		iommus = <&apps_smmu 0x100f 0x0>;
+		qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 8848043f95f2..224f769ee5c2 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm6350.dtsi"
+#include "sm6350-audio.dtsi"
 #include "pm6350.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 2d891a5640de..94db1dbceace 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1322,68 +1322,8 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
-				apr {
-					compatible = "qcom,apr-v2";
+				apr: apr{
 					qcom,glink-channels = "apr_audio_svc";
-					qcom,domain = <APR_DOMAIN_ADSP>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					service@3 {
-						reg = <APR_SVC_ADSP_CORE>;
-						compatible = "qcom,q6core";
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6afedai: dais {
-							compatible = "qcom,q6afe-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-						};
-
-						q6afecc: clock-controller {
-							compatible = "qcom,q6afe-clocks";
-							#clock-cells = <2>;
-						};
-
-						q6usbdai: usbd {
-							compatible = "qcom,q6usb";
-							iommus = <&apps_smmu 0x100f 0x0>;
-							#sound-dai-cells = <1>;
-							qcom,usb-audio-intr-idx = /bits/ 16 <2>;
-						};
-					};
-
-					q6asm: service@7 {
-						compatible = "qcom,q6asm";
-						reg = <APR_SVC_ASM>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-							iommus = <&apps_smmu 0x1001 0x0>;
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 
 				fastrpc {
diff --git a/arch/arm64/boot/dts/qcom/sm7225.dtsi b/arch/arm64/boot/dts/qcom/sm7225.dtsi
index a8ffdfb254fe..860b19440c54 100644
--- a/arch/arm64/boot/dts/qcom/sm7225.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7225.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "sm6350.dtsi"
+#include "sm6350-audio.dtsi"
 
 /* SM7225 uses Kryo 570 instead of Kryo 560 */
 &cpu0 { compatible = "qcom,kryo570"; };
-- 
2.50.0


