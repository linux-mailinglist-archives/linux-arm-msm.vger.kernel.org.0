Return-Path: <linux-arm-msm+bounces-85585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958FCC8E7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809553144BAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A260B35A95B;
	Wed, 17 Dec 2025 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTIwJaTe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jubgqE4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302D35B138
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989364; cv=none; b=dPy6dKOuhtainENtxHa6IB+HgkIf7uubAOUOozq6tbPx/tnpNMT0RqvV9+ntcZ8JODm9AQeEMDcm2dqLROZlqnNaMPhTyUPRVGZjHoDGC9Gt+93G8cIcpPSVei1POHAa37bouLAiTLpcaywVBuZDAgFlFPUmGo/eF6kx604ICBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989364; c=relaxed/simple;
	bh=oMFWc89WIASqM59WBMQ2RsVx7eJrG2bM4u0S9JbFV4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzvZAbkqpzfZqzHlqla0XbkLvFTsKLepqCfH8eShMSlp2gBUmFZEGfhC9ficwRBqFdjUModrjKQbODyzZysGeZCte6paUOrklMdcZ93egwx44zxcgk1jvrl7Vjpw5N3bBPBT68u7UQBf8DHNkrEdAdSvuzjRagXZDM/l5VuNK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTIwJaTe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jubgqE4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKv9H330794
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gx0QhRDnwqi1ort9qNuTBOl27xLf7KTnbpcuanPlW+M=; b=WTIwJaTeBn8pVRPY
	CSaoU7hZB/pF7UmHHET8gUnhRW/szNFzjSt+Gop8WYtJrNPw+0OfxlPQndcwZrmA
	AhIx/gvaCE4iOfbvAXEDFg3CHAZcQk8M0Sc5BQIbFjSPVepwJ9QMuBtA/SKvl7y9
	Ol/RRkrA/MKS8aN14Koe7INmt1h+zXu9dtQZETBfeQru/3tNL5XxOIv6QyjoIPR+
	UWjSOyarcXYhA63w//ke/I+ZSBJr+47Cy7bxMOe9IlwVcHyA/AgnI6MwIlDUrVup
	Rq1oTb7CAZs8B0WyakGLpVFEAgEWaSmRTKuTGsE3qGgLJCnBeK/TeK4qXVMTflBo
	UhOItw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e18vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:36:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f4822f77so89626055ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989360; x=1766594160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx0QhRDnwqi1ort9qNuTBOl27xLf7KTnbpcuanPlW+M=;
        b=jubgqE4MkJX0yJd2aNavIr+Ad6ALG1Zkh0glh0yYkLymPDH8n49y4a577GlibuwAMG
         Pvbg5YSXkdz5wlBvg1iiemFd7oLUPME9DwAebEM8sSGG5nNJg3Nqj2G0MBhPe38pLQsY
         WyRgAZosifWxhNm+iEJ9aAd3wxWeLiUk5AadfPzR4QmCgfcnasTOC0sn3D2Uf3jpxX2s
         iFS1GNlQCjcmlXRFABUSoNFXDtCwj3yUeD2xzRFecpE1ce72Uxix8QH99e2pnh5B0vO8
         5dO50iDFZCfML31kMqPOQlsTcPsY44EY+vSBB28fiMGJXfZvReub541COo7iO3FElSFf
         R5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989360; x=1766594160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gx0QhRDnwqi1ort9qNuTBOl27xLf7KTnbpcuanPlW+M=;
        b=oz8vRGF65MT8QizS/8CftVF+Dl4D+MXrHiLHFkte0GYpuI0wxO8BtJXMLlcne32vGE
         eKrCRkdzfDvMuJtXyKZO9ImBwPpTB5ups+UF6erGC8k9QOtPD5TOS6fOYXOcncr2yii0
         iXnW3yKrxFM+ZFd40yzcPUW7TBYUBr8PoPohtbiJJ0kuRE0kbx+GP71BIy0gPmmRsOrg
         rgLcbV0ku6rUgjgG45cjiOwnJTcA1rXez8mye4ZOmrPkYk/bYRTrTn4ht+gU4Bc2EY/8
         ofNVWyV7gxJSnOoBke0Cpa3Wu7jaGkRck+x2KsbsNUowGsD94TKUNCXUYRZoSHs/UxX1
         Sugw==
X-Gm-Message-State: AOJu0YwxRZpq0mySk4Tk9Q4UGf86R9UydOrSTCtX0Z6XvbyPP1CbuLVs
	818GG4VrAjQZ73vjVHfcIu3V81QtCF1LZwf7k7F655bLtId28+WIrrwTKSVcqXHSFaAdoyzLrxd
	HYpa8TpPHW19L7p/mgM7DPwapT74uSOlvOgwU7XKnxbm+C3634Mtjw0pfueUP37ZdryMq
X-Gm-Gg: AY/fxX6gdqFD8JUhLZQfRUhMvprVEIuADsDmSHIvtYkxZUmtfLmU1TXTnau1glFHiCY
	Wx5sCwhkeBfPaVQ98NvZ6CEcH96+sfnoBXARojtOG+o1mL4klTHU93VmkAA3ufSaYILsVpCfmol
	lBdW7XOC4sSDK6M7Rn2uF/zTXRbGfqidRmznt+9EOeoIqRLdp66RHqxyQax2RbxgjKgZ5u8lKIw
	h4L7vmir673ksKfTr/IHe6dtTB/6UbTv4tzkKXx7I4eKUkjDlL/TC2h6R9gH17ffW1i0s7oFUG8
	ALLg0CGymgLEJLv/Tx1cav2uoG7Y9az2bf/9kb3g4hJ0DLc9W04h5CbRvgjXxAbVMzSv/CPzoMB
	WriBr3onVcsLOnztXP+8sSXwqGFh3seypY1Xj
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr174784795ad.46.1765989359722;
        Wed, 17 Dec 2025 08:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG3bqmPen8SfWu/pJLgwKJVKvOOzrx3fGPUoVvQvlNHv4u/J5M0woh4PIxPQ+d1WeG3AFG1Q==
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr174784345ad.46.1765989359196;
        Wed, 17 Dec 2025 08:35:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:58 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:50 +0530
Subject: [PATCH v9 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-14-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=3099;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=oMFWc89WIASqM59WBMQ2RsVx7eJrG2bM4u0S9JbFV4A=;
 b=b1omB5nlGXFZeqPLXbplsqhp+iQi8Y4AqyisQpVmktiuGRaLGmwzbTge5OPUOzjh2GlPhMLNg
 TTRtis2IU+7CUubjCn0aUsAR2x83uYxcPKOvj1wReiIipaZ6bf2eLD2
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfXxVcQ3EPZx90+
 /HQTP04cKVWyIRqfrZdAYEtUeja/evQHfmDuBObIpDwfQ6LAiJWsFuFvCirSOCoNKXXNrylaXq3
 2mSfts202VxibHnuBCp30rZLxgECDxjrZ7sTHU98xOcY+Ef/qD2ZP41FkehdIjgsPakTAWsfrbw
 74XONdSR+LW0xruU+0Ngc2J6pxLTC85lUdLK3zgJbKPqI4GvOdyETTDYpbMZlEpWzxTqWiBylQb
 lbNNK5aorklHgEiD1cxNueYJrp2/Syc6+iPeffsg3EC7ruNMkLU8unn7LaM0iOy2wPve+7nufx/
 CaninN9y72jo/8iV8MV0lMkrJLx32cSvCt0WxWVz3e0VMdKYsgbZkdEUF8VkFtrNpeizNqIGME5
 mxD8ugI+xrICRH63yB5331l00HMTyg==
X-Proofpoint-GUID: oC1CAKZdY2RIfacuvzfvuS2FI1Y2vd7M
X-Proofpoint-ORIG-GUID: oC1CAKZdY2RIfacuvzfvuS2FI1Y2vd7M
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942dbf0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

All the Lemans IOT variants boards are using Gunyah hypervisor which
means that, so far, Linux-based OS could only boot in EL1 on those
devices.  However, it is possible for us to boot Linux at EL2 on these
devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add a EL2-specific DT overlay and apply it to Lemans IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 10 +++++++++
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..56efd90b7a5e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -37,6 +37,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
+
+lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
@@ -142,6 +146,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
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
index 000000000000..ed615dce6c78
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -0,0 +1,35 @@
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
+	status = "disabled";
+};
+
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


