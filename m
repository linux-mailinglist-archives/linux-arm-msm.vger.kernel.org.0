Return-Path: <linux-arm-msm+bounces-76251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B39BC2307
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 396C44E2D5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886DC2EAD0B;
	Tue,  7 Oct 2025 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5G9uckc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC652E8E0E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855803; cv=none; b=d0IhUjhBe256WAhZLHQRhAWlIbHlHr8Pa+zTnnN3jZ6FKz4xsdP+djjrwL44hbN04bQCZTXnSNGjvCcKZUxoJaRx3eonYzsFi23ZhtsMfnM8LJU21APOOwHQkP6EDTcXrHdJP5/qarYD6Bp4cZzz0SHAyOHEXE7PXUNffGIgODg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855803; c=relaxed/simple;
	bh=F3NWSBYzpCkjgyaRvqE1+rv4nyzrirHjZJXt87AtH/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StK+EI18p5wumzSquP0AjV1AD6hTBSA5jnVeEduta6/2eji4OMv8zFSHZ1uYtGRTAmN039O7sv5jrkVoVDP4YafFn2RoDAX8yC/JttH1otdosBVrYFhxcRGX7F+0OH64fvgZxhbpfbbJiNZPpSTC5WBcPDYlapKuT5QwvtX4kHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5G9uckc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET2P2029259
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25H4FuSYBPF18o2Cn+NmxkJ4j3R4BT0xsk49N2ga+sM=; b=R5G9uckcBRl0Byi3
	ZF60r4LPFlKZWB6RDtH+YZ2sftEXqkeEFhXAL58MVS6MRoI7N4e45lajsgmwvdqd
	y0SZqlwLNEIjSGK1wGP4Hkhhl2UB9oDcfLyODNg7DAYJOYIWSiI1Uwy0ubZ17Wlh
	1hJ5cVILmiz1gx4KvhZBStpMaSWm9PS+AqoX61V+r10cpPke6blU5en4RfRz8wKa
	D4hLUL8OZTyoKRQzNE8ckDZ0w/xzhXxThvpV05ovmlaTr9CkHfL7oBn6jH0P+CTi
	cMR2H60tfaIrPBVgA10fH/0PKRfeKIGNB+ttC7k7A5DMj0LjGH0rfOsT50bylOvN
	Kne1BA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkptsyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:50:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27ee41e062cso79681015ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855800; x=1760460600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25H4FuSYBPF18o2Cn+NmxkJ4j3R4BT0xsk49N2ga+sM=;
        b=SZGd24sI1JhwOCcgi5xk+C/e/SljfzGD9WRvmKbkhFwNIpZVVNPrjImJ/6WG8+nqOW
         K9lEXWEAXK1fXZ9g4vA5rLzWSTA7zsmYanq7QfPQHybGEQipPaL3ipsOV/1rrHDxOfNy
         BCiAdRu4Pt1lhKj8sdEDL0L2Y4TfEje+2D1WRDwucw8wYpg38MnH9hyIedLhPPU86EqJ
         ABmgz5DM926kp0W875LT0x/N2P927nzfWpicWYtpKkdJLZxYPDf69s/D/EqGxEB55h9z
         arwcL2hJ6BS7YY+5DTN9TzRaB7P2z9FiH9II/tP0moF9+NJGhUmjBZUnt4NNjqvr2HIJ
         jdPw==
X-Gm-Message-State: AOJu0YyM1HXNZtS85gWRmm+GuEqvquMg8GYjeePXVaC5G4hk61uOAKqv
	No4bM+JcMt8rHdP9Pl87Yiu6C4dsVieOEPzgLALUH6ghWkcyty3c4Rjn00vvVA4TmVSFIX5IsYy
	otQNSLZG4zzuDXI0naXA+P32FZoU9b+zKt1M3SGmQ7x7hrE5/nIEoiG1F/Hxaj6uAeoo4
X-Gm-Gg: ASbGnct2B6hHC/WwR5hBSAmIliY7DsTs8xNZSiiSRe3mJIQHAcThIOzijXM46kvd31J
	syPlCsZr7lwg3DDGH3fVRsSxzfzoBDp8X9ApeEbouryqaonxhOcREzkiqy5yooLTWwbTjN0WEq9
	asl1hG7pR1Wx2Ek17oCgKPcNOrE2iUDcwSXMYS21kwZbFaqsVB1yArGZE7RHn1HlLOnEaxaxPiq
	W7eA2+vv/j/jNPB9it+R7xtJ0zNCeNrq9TGUAS+jPimaw9MrgfZ87TYrTwx8MFM4uwkrSVmxW+e
	TIap5lrquM60tUqIyewhlg7hVZ55ltqT09pooNOrdbVHcX6qr+bTT1nctSgvFoRvFCYW5K+C
X-Received: by 2002:a17:902:ea0d:b0:267:44e6:11b3 with SMTP id d9443c01a7336-2902737494amr5222795ad.45.1759855799552;
        Tue, 07 Oct 2025 09:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIi1+jMvYM3hfkSwfZPoQPAWtPLhTQvtT8StZu5DngvXCi1e8+FlEYG1a5D0B5GmJw7emrfw==
X-Received: by 2002:a17:902:ea0d:b0:267:44e6:11b3 with SMTP id d9443c01a7336-2902737494amr5222335ad.45.1759855798963;
        Tue, 07 Oct 2025 09:49:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:57 +0530
Subject: [PATCH v4 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-12-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=3459;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=F3NWSBYzpCkjgyaRvqE1+rv4nyzrirHjZJXt87AtH/U=;
 b=uwqnx7wZmY7J482R8H4+UHEnKcuS9Z5RTeTM7ihPD4/cn8vP1pcCis9ZCl7y7vpeHg8IHiOY0
 tLrdJv2T62uBOHMcq8DBGoR0DJpNfp5EUkG0GCA+NMoccnyGWRVKyiK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: Kfe3MHIYl7X0679Jb2zzH5NOOky0KitT
X-Proofpoint-ORIG-GUID: Kfe3MHIYl7X0679Jb2zzH5NOOky0KitT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXwWdF42VenyLu
 x0FD/FWBMDwnKL5xZNMZ0L73zjRxGjNHBXuqvo4yPIX65V175gwulps8uNMEHOUu2oYhx18T/Pk
 KS0LaQwy2F9iCedgmUgV0FdwiEIYpjK0dfGazj78ww3myK95R2AFYTGH7pDhiaff0osEeQ6UjGa
 w7jn7z6X5EN9M+CyVVc8+zUk6EGCmtwkQdreF9PORiJ8jzXkvBRnsEnRBOzI+gL12g89n3iFO/O
 +HgMaNcWHuHmgpKIZYRE2sUkh/c9z9ze++DBRIRY82lZmQhtmlvQuo+eC29dT0QYCIk8LgsiRpS
 vkORCryPEtj1w92lYNsfFTcTYq1XvePkI8Ab7o04OhdV6HyYUZyTG7HieqTXNu24bBeE9P6A+ME
 grhwAvw3QxrtYy++BOB9RLI2pIi0Wg==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e544b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=YVouBxmdtFDgX_swM-UA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

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
 arch/arm64/boot/dts/qcom/Makefile        |  7 +++++-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

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
index 000000000000..582b0a3a291a
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
+	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
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


