Return-Path: <linux-arm-msm+bounces-74305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E8B8CFCD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ED8F1B20E56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB6D2641F9;
	Sat, 20 Sep 2025 19:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8pJ0Uzb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3CE261B8F
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397354; cv=none; b=F0QQPfZ/tEYGEQllYwKqRa0KExwYaEzAjltDLjgvxR43xuViwB/AEK4E7WKIzuxeFgoHW805/0cScpMEHreLKalR4M7qJNhkrse7Y5XxPnQtFjMo+Djoox+XN5Nlmi0Qlnaz/jz0v323tG9HMrikubYwXhJ2YTnrkqqrfVQ/JdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397354; c=relaxed/simple;
	bh=ZycLhV5tErLhQ32gJ68Mur50NbqMEy7wcBh0pdcOdtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J07oG5yZNtA6CWWjGWWVMTC8ecy34PVWl0sdP8FQjll+lXfKc38gmvYNGY8h5uInExnjtulubzmZzwhHiIvrywokgCUiuJSuJU1NsGR2Yjrkrs/ZiAOxdPtbCzzTLb9ThlLOXiurO7WbAW5uZ8tyJ+C4ry0h9SuCBMPtraujNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8pJ0Uzb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KFtWgP025816
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58pRQiJcSba/tgVR2ogEmEru+uxFbsFs6GsRV0vnQ7A=; b=J8pJ0UzbGhefgs20
	crcKVsTsTS8qUx1ySgCjX0P/FjI0GlI/2C+dN9XIvJKntJiTB0S6XoEAKK0/mRZt
	+fvDJwwBs74chHSppGM4isAZn60qkxQXRBbTI67e9lUSNhVbwxyaiaCb/BZrArpz
	hSriMx7tdrVamzmbmOViERZCl4oxUsFKI6Z1/R9c/mTdD62J2a4v5iLlMxvKWOeT
	pVN4EQ8W3ElekLZvvDQJ+VIcBF3b5HyYDYZMsQOvcAdt61QDsc5L2pdT8yO2pGJH
	LthxLWkg42qqKRNqYLLKVTN0h0EiNhv9MDT+38lx/erR7gt1DtNpLtWSTo8GvjZu
	mP4B5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k9899yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e13772b37so1591274b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397350; x=1759002150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58pRQiJcSba/tgVR2ogEmEru+uxFbsFs6GsRV0vnQ7A=;
        b=t3PyVntimd3J5whHoWZmE+fzfWlwRUq5/4LF8sXWCDDWOR9Zf+i0XXuK8a36UQtnpJ
         5Qn87/09/0itwb3fxZw+oyV4/aH/8gxg2tDZfJii/Ii+PLaZUDJ21B+XJZLcuh3bPDre
         v8hoMUGUgX+oTrf5nW/P2D8ZDnVSyNS+y4CwHskgx54Bs07kWvK0DQoeJCQM4Invwlb1
         8C36PdA0CcsFkADDuHJNUtaB8qoDsKoX9BpRQXT9PoaDBrPt1j0Y283cV/x28KixjbOh
         VBMPbpVJZIrvtxXI9GbK3r2f+aVpZ8DPUHzcUsHbxwaFL1/j3ePBBpCI6cNYx8OhE7Vw
         Xrcg==
X-Gm-Message-State: AOJu0Yx9VHFQy21g8mL2UjGWbPYiXChOE9Tg4oU0PRJGzuJnucBVMgbH
	wKvn7OAdaOvryxRN4jN7trUWf6vj/TGECVzbiTJC2YmnB+HsC803zqU7jKYqRyAffjN7S85UpsI
	xg8ehBXq/S5NheOMBcr8LZSA8DrT3KmKNc3NeUQ8KC6+MNygEfdbq81aHV/vikXzG9frjLbnGP/
	vb
X-Gm-Gg: ASbGnctZRzjq5kzV51nZ1pL2vW9URxbYPG4p5wvFTSrG7b2lgpitrDwSwdpIMQHNa+F
	JeDTcJ9r9ln+7cRYCsglzUHvXtfz0vghBhd5AajlImljsm4FvQsG6k0jQbmnfdDR98Yq+MLsliX
	s5JavE7pa0jGnxmBbpSWf+hE/7i/WyFUrQsUcxSSyeF/x09QLTbWGYuMn4ZfL+Bn7ib6pxGdjBP
	oZav/woSMlsaihXDiyomzUPZcJMkd6hy1dGv4NGBRLwkHDEwUwHKnkAoDwF9HMAt0dzkWwO+8uo
	o137UI4COMwdAJiCKXR59bBaQCUVHuOLkRbjwQudUdWTCx6sugCiCvKfLev8E4evTi0=
X-Received: by 2002:a05:6a00:244c:b0:77e:4201:e83d with SMTP id d2e1a72fcca58-77e4eab7826mr10208913b3a.17.1758397350057;
        Sat, 20 Sep 2025 12:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE9+XwZ8OdVh9EO/pkFHZ7iGqyUeLqIAGmjwG+nJP64mZjXNANFvfsyav4+0t96IJ5LSICDg==
X-Received: by 2002:a05:6a00:244c:b0:77e:4201:e83d with SMTP id d2e1a72fcca58-77e4eab7826mr10208896b3a.17.1758397349614;
        Sat, 20 Sep 2025 12:42:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:10 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-12-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=3202;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZycLhV5tErLhQ32gJ68Mur50NbqMEy7wcBh0pdcOdtg=;
 b=sCesAX11et4fhB1Dg4DaWQjn5hJ8sdu/gGp0f3UooD+gfBT4qU/EoNSbJwUyZIV0ibJblSwp7
 DJyKzhkN2VKB/NUYIOaxbclguVpOttNtBnr8gr2l9hvD++qEro0clCp
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: vqY5YwSm9ARr2rpYf21R8E5sGoCt9IFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+xYoUVdIYi4P
 T57q2s3i7V7yIn5HBr3JVg92xId+8x9OpGOD6xd+Ba2myX+TkLjDEqgGuHpHdRY1lIxo78OSDI+
 V+wUoL7De/DZYp1kfal5zxlt6YU04Gi2KxpotxrV5jG27WwVObED+UxoMCom3Xab6ihSzyrT4SF
 NdRC0USmDVcEwhVtvQhn0rux871P5xNPBiJwU8BAU0o4JTwxt6kZciOGfZS8SuaBVBDPwvMsH5D
 LnsB9LkYfk3+bfOsEhZFy0QtE9xp14HhWKZLTG9AUVByPPaEeu6CDKF1UMJ94+tJWPhOQ2PcKM7
 xYo9WWPGA6ljsYHHv6I9wPIU522pvrn1xb5aJjPKhn7xcOHOhbA0lNBItetF+/7jZhwCTgSENPs
 Moxdquw3
X-Proofpoint-ORIG-GUID: vqY5YwSm9ARr2rpYf21R8E5sGoCt9IFN
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68cf03a7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

All the Lemans IOT variants boards are using Gunyah hypervisor which
means that, so far, Linux-based OS could only boot in EL1 on those
devices.  However, it is possible for us to boot Linux at EL2 on these
devices [1].

When running under Gunyah, remote processor firmware IOMMU streams is
controlled by the Gunyah however when Linux take ownership of it in EL2,
It need to configure it properly to use remote processor.

Add a EL2-specific DT overlay and apply it to Lemans IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  7 ++++++-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..e2eb6c4f8e25 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -35,6 +35,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
+lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
@@ -136,7 +138,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
+qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb qcs9100-ride-el2.dtb
+qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
new file mode 100644
index 000000000000..55a2a9e2b10d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Lemans specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * When running under Gunyah, remote processor firmware IOMMU streams is
+ * controlled by the Gunyah however when we take ownership of it in EL2,
+ * we need to configure it properly to use remote processor.
+ */
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x3000 0x0>;
+};
+
+&remoteproc_cdsp0 {
+	iommus = <&apps_smmu 0x21c0 0x0400>;
+};
+
+&remoteproc_cdsp1 {
+	iommus = <&apps_smmu 0x29c0 0x0400>;
+};

-- 
2.50.1


