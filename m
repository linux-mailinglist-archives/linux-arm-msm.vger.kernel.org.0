Return-Path: <linux-arm-msm+bounces-76977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEDABD277D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F9273C4E04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10ED2FF643;
	Mon, 13 Oct 2025 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxnGv5Bo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0822FF652
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349878; cv=none; b=lqF74e7lDRt8DQtK7+OQSgZfqSDDGoyrZAhqCQv4u443HQXuttJBFaJBAibRVQlKWWpG1nYIWy/B+OEbbo3GEiV1DT0595BTdlbSbynDpzVtdgwuTXZmWfUpRYEjuP9/gmM97djuwRb/L+0WMi8JoPvAwnhLN+jsYEuwm5QQddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349878; c=relaxed/simple;
	bh=X8H9fFaRsPhpz9P3HuFYkIi/c1/WMaKEL12Al2lLqn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAbkVInjIQEE7TQl91NShM4DlsEHdksdxcKTCwosBBOm1txC8NPHaZWEva2URS3kpp7e4SvFTS0r/jDq5FRvVkN5B3FBc9BrZor7D6dPUCZJxd6qjy8aVZyodbPAJHc6q7Ip4/FLxTA1aHBQXjrRPrsb0jN4BTD3/r4g3yLFIQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxnGv5Bo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n88r016574
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXyFql7Vsf8w6NStbJ4fPVmykU+7LPFNxNyrVzYIRqU=; b=gxnGv5BoU4nyZamk
	hHjL3XJxuX6rXEobBVD74aDBixIIX9IEyjiip5Iq5JWx0k/UZake+/BStgExdVNO
	9+ccpt+L8m1V/6doE02aoEjaFhAYn/HMiU8u1+hxdFmVNQcT9RH1ieYWfLPBmVo8
	6YQXi7iSYiQ7WXbbaI/dTLOPqDVw8PzNeqrcEb2VeSUa89q9pNN1y6rkivmoEDls
	uXASL4vMjzkWQ/5Tj5eA3STPhOPrQP6UnANpVcCt2e0YFbmR4AJLLMsO5stFMPAA
	hDUWqqVzbyDq/YaSi5aN2DH50+Ya1mNXDqsCTWyB2fv85w8+wSE6aAv4n+XM0e2l
	gm3Qkg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhv68u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso6396908b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349874; x=1760954674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXyFql7Vsf8w6NStbJ4fPVmykU+7LPFNxNyrVzYIRqU=;
        b=wu20DPxf8NuXFwNWhN4I3jNDbQeFnBsM4CjWVQmdUUirbpdgX2/Z+6RZIhqSHD/atL
         YgzzRr3PfuXy5kYwltg5i2yFyDhxbRh0Qy3Zks4lw2IcET+KRORZJDxvVr7gDqLl4Ryj
         Rk5CaGZZqH769qmzIVa110qhTg9IO7fSa8DU2ugq3SbXwSRwLln1qzC3Ao/wpq7JEblp
         VyU1NkqdMloJkzU/NoGW+gRn2Zgp1shFDCoiFUCrxQlLEuf2Rpgx6dkYhgFLYFsMRy2V
         vWo/i177fVxOpo3bpb8AMtqaJp0Uuhx96aIlZ3dxxf9cyfICaSzdZSbEflxm9vdGfVED
         mYWg==
X-Gm-Message-State: AOJu0Yw1olto33CY4Hhi20T4m3jIc6UtOKtB6cKjaVUdnz7lR/At9w7m
	Ex5hX6Ybcbuq4TtYeED8QjeEZrhOmUGjgfTQbHNtt3IK0IFSBS5EVsgmrqMYYMLsR6bdYLUl1fD
	jIzmeB2qqq78CxniZdHP2B+mvdTMbRm4xQF70HeX+GE+YRGU7Nkw2bu7rIRCmNXwa4uZL
X-Gm-Gg: ASbGnctBEDTDMc6HC/DkYahHyUAUOViRhvTYvDksHIewrLx4EbwkWUD+V/870UzlU2m
	8SotMaqHjxy7A7ICMa2Vk20SQUl7CaRY3ekkd4M2fDlumyIWT01vSYr+lb1HL7RLMn6JE6c7ezB
	vQ3U9WNkQLOcWnDSXN3SZodlqGPw5LDUWO7uctyHZgQwR6Xt17kqFhV+s3GkWFTFd5OWBMgGDm3
	9uxUAhnUkHIjK5HeCofjJfJy8WogBxzzg6RvdTtxQCCzEt2SX1NJlS4JRLE89Jjl+bYSPEa+0sv
	PmWYPUnfsQ3X+j5KDNJUx7X0YUza6MkqWZpORWfQ7VdbMRUgunUgSz8Ex8EUtVLQyCk=
X-Received: by 2002:a05:6a00:9a6:b0:777:797b:7318 with SMTP id d2e1a72fcca58-79385709525mr23185196b3a.7.1760349873718;
        Mon, 13 Oct 2025 03:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk14qu64ftjSRMW+hpD91y5/GM/5pJJ4AVMwHSK60e/YUg3Ls1E/Mz/JkNwC+/KshyXuyWzg==
X-Received: by 2002:a05:6a00:9a6:b0:777:797b:7318 with SMTP id d2e1a72fcca58-79385709525mr23185146b3a.7.1760349873112;
        Mon, 13 Oct 2025 03:04:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:04:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:17 +0530
Subject: [PATCH v5 13/13] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-13-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=3372;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=X8H9fFaRsPhpz9P3HuFYkIi/c1/WMaKEL12Al2lLqn0=;
 b=gqjKdu3xbu3Gwv9MRIlItaFj4syW7otVyVQw46zSjsI7ZKvZQWxvTq3xDQ+kp7vyMpg35pQ6f
 Pu6W1eaoS4QBjoRd3rQQhGE1nB14ZwmvyVKxhWXN6SRk23d0jsoPv2q
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxFOo2reORvcA
 UW9DOmfH6KRcBNHDsh6724IOOoWYHaPeosWeQS8ixvGUDEzHh9Naa/pPnJ/fW4E75N7HrxQZ4fc
 Gpx539r27vtvtlf8VvsXdWob6F+UFy8ECfDqsauZRMQEZrrqyyJDfSNHtQRQ0gnzDP5t0trk+XB
 qESP6fG9fI9+dlp+dlTLSRSKbeXKEhWB0L2h3vyZLis8hmm3bjxorTXmmD5NpmbiP0DHHlH7Z6+
 0ptOU2voYzyYyhVyaEON8zdhUeDNagecJmgLCMisXcRd1m7XU4XW1TPPO+uiMRHO3iMW9fHO4Nr
 /heU1uOiwmvoahURmIVtkd1F3nUyZXlGERO+hJyO5rKOwrBj+WfrU1dazkuPWMfb59WR0y+2IMl
 9Hpi6DdUBlxmoWyeCElL7giClixt8Q==
X-Proofpoint-ORIG-GUID: -CHX_nxIcAyEUIGHIUB6t_r7t37311HC
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ecceb3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: -CHX_nxIcAyEUIGHIUB6t_r7t37311HC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

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
 arch/arm64/boot/dts/qcom/Makefile        |  8 +++++++
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..e0791f987ff9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -33,8 +33,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
+lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
@@ -137,6 +139,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
+
+qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
+qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
new file mode 100644
index 000000000000..af35039946e3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -0,0 +1,41 @@
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
+&iris {
+	/* More driver work is needed */
+	status = "disabled";
+};
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
+
+&remoteproc_gpdsp0 {
+       iommus = <&apps_smmu 0x38a0 0x0>;
+};
+
+&remoteproc_gpdsp1 {
+       iommus = <&apps_smmu 0x38c0 0x0>;
+};

-- 
2.50.1


