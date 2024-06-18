Return-Path: <linux-arm-msm+bounces-22968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9990C4F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 10:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C841C20DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 08:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6610C152791;
	Tue, 18 Jun 2024 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aZ1P8Rzp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5615253B;
	Tue, 18 Jun 2024 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695361; cv=none; b=uU2QP/tEs4BkMdLBcd4r3+NvRimRRdUMDVJHPXNJqQYjNNl+RPNE05BPq+k88d4t+wVvvHKk8duY38MRAavkum59tJeMb9SoWadQe6MjoDGZeZruDgVES8UApqTSujnlLBHCOijafMY2qjr/foCxio6jM2Cc4VrJzpW08KzGNjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695361; c=relaxed/simple;
	bh=Cb3xj3ADLLflU6qrmp8z/6mrZ4WC0746Iok5eATOVms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jlJK5K5RZ8q4isKiLcxuryWnjF7O10+poMVeBdHXpEuUGJjLW10IH77fYGKFBaTrtIF6E287QdttAxmib9q38mcKKBDFXeAASE50yP5TMUuzc/6CEeqqKnSR/flobj9YjUlrUGbTNCe2EkVQ391HS3QW4L46sxQxxMYqYPpVuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aZ1P8Rzp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HLhCpK030550;
	Tue, 18 Jun 2024 07:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YNVqygSB8uPPVAYXLOOiFDnB56+O/XDV5BHuj6YO7RA=; b=aZ1P8RzpV3/QYBnY
	87Iif8YdtJFnNI+/3wZE06N62nsHHtCMrCtlqaOnvKtyM9D+mPO7R96QUmPVOsah
	WMU8/vCGG4tZDfLDKUIkL+gBA22Co/rb3JCHJKeL7HvaIW/lUjgxbwQptLN1ucyb
	Ws1gnYRt0glLfkYdaNGYt/Cyj0m/ZoVuVEiwB1Ik7AWlsqFZkWShR/RjPxAlpkXo
	v6pNSFVaGO6s/JMrjyoOtT07wWGXPkKoDw2PMoeINBry5UIcTmqCfWyC+on7gvdu
	1tRDMEnMsliu5u55RBobW4yeI4X/JZNQwick7t5p4mcHwugR6sOdvcPD7161SLx+
	Qq48xA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytwa2gvd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:22:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I7MX9g018608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:22:33 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 00:22:26 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v10 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
Date: Tue, 18 Jun 2024 15:22:00 +0800
Message-ID: <20240618072202.2516025-3-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KGn7NJ0KDcobFINzW8tGZhWIch9GgNzC
X-Proofpoint-ORIG-GUID: KGn7NJ0KDcobFINzW8tGZhWIch9GgNzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180051

QCS8550 is derived from SM8550. The difference between SM8550 and
QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
in IoT products.
QCS8550 firmware has different memory map compared to SM8550.
The memory map will be runtime added through bootloader.
There are 3 types of reserved memory regions here:
1. Firmware related regions which aren't shared with kernel.
    The device tree source in kernel doesn't need to have node to indicate
the firmware related reserved information. Bootloader converys the
information by updating devicetree at runtime.
    This will be described as: UEFI saves the physical address of the
UEFI System Table to dts file's chosen node. Kernel read this table and
add reserved memory regions to efi config table. Current reserved memory
region may have reserved region which was not yet used, release note of
the firmware have such kind of information.
2. Firmware related memory regions which are shared with Kernel
    The device tree source in the kernel needs to include nodes that
indicate fimware-related shared information. A label name is suggested
because this type of shared information needs to be referenced by
specific drivers for handling purposes.
    Unlike previous platforms, QCS8550 boots using EFI and describes
most reserved regions in the ESRT memory map. As a result, reserved
memory regions which aren't relevant to the kernel(like the hypervisor
region) don't need to be described in DT.
3. Remoteproc regions.
    Remoteproc regions will be reserved and then assigned to subsystem
firmware later.
Here is a reserved memory map for this platform:
 0x80000000 +-------------------+
            |                   |
            | Firmware Related  |
            |                   |
 0x8a800000 +-------------------+
            |                   |
            | Remoteproc Region |
            |                   |
 0xa7000000 +-------------------+
            |                   |
            | Kernel Available  |
            |                   |
 0xd4d00000 +-------------------+
            |                   |
            | Firmware Related  |
            |                   |
0x100000000 +-------------------+

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8550.dtsi | 162 ++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
new file mode 100644
index 000000000000..07b314834d88
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "sm8550.dtsi"
+
+/delete-node/ &reserved_memory;
+
+/ {
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+
+		/* These are 3 types of reserved memory regions here:
+		 * 1. Firmware related regions which aren't shared with kernel.
+		 *     The device tree source in kernel doesn't need to have node to
+		 * indicate the firmware related reserved information. Bootloader
+		 * conveys the information by updating devicetree at runtime.
+		 *     This will be described as: UEFI saves the physical address of
+		 * the UEFI System Table to dts file's chosen node. Kernel read this
+		 * table and add reserved memory regions to efi config table. Current
+		 * reserved memory region may have reserved region which was not yet
+		 * used, release note of the firmware have such kind of information.
+		 * 2. Firmware related memory regions which are shared with Kernel
+		 *     The device tree source in the kernel needs to include nodes
+		 * that indicate fimware-related shared information. A label name
+		 * is suggested because this type of shared information needs to
+		 * be referenced by specific drivers for handling purposes.
+		 *     Unlike previous platforms, QCS8550 boots using EFI and describes
+		 * most reserved regions in the ESRT memory map. As a result, reserved
+		 * memory regions which aren't relevant to the kernel(like the hypervisor
+		 ( region) don't need to be described in DT.
+		 * 3. Remoteproc regions.
+		 *     Remoteproc regions will be reserved and then assigned to
+		 * subsystem firmware later.
+		 * Here is a reserved memory map for this platform:
+		 *  0x80000000 +-------------------+
+		 *             |                   |
+		 *             | Firmware Related  |
+		 *             |                   |
+		 *  0x8a800000 +-------------------+
+		 *             |                   |
+		 *             | Remoteproc Region |
+		 *             |                   |
+		 *  0xa7000000 +-------------------+
+		 *             |                   |
+		 *             | Kernel Available  |
+		 *             |                   |
+		 *  0xd4d00000 +-------------------+
+		 *             |                   |
+		 *             | Firmware Related  |
+		 *             |                   |
+		 * 0x100000000 +-------------------+
+		 */
+
+		aop_image_mem: aop-image-region@81c00000 {
+			reg = <0x0 0x81c00000 0x0 0x60000>;
+			no-map;
+		};
+
+		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x81c60000 0x0 0x20000>;
+			no-map;
+		};
+
+		aop_config_mem: aop-config-region@81c80000 {
+			no-map;
+			reg = <0x0 0x81c80000 0x0 0x20000>;
+		};
+
+		smem_mem: smem-region@81d00000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x81d00000 0x0 0x200000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		adsp_mhi_mem: adsp-mhi-region@81f00000 {
+			reg = <0x0 0x81f00000 0x0 0x20000>;
+			no-map;
+		};
+
+		mpss_mem: mpss-region@8a800000 {
+			reg = <0x0 0x8a800000 0x0 0x10800000>;
+			no-map;
+		};
+
+		q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
+			reg = <0x0 0x9b000000 0x0 0x80000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw-region@9b080000 {
+			reg = <0x0 0x9b080000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi-region@9b090000 {
+			reg = <0x0 0x9b090000 0x0 0xa000>;
+			no-map;
+		};
+
+		gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
+			reg = <0x0 0x9b09a000 0x0 0x2000>;
+			no-map;
+		};
+
+		spss_region_mem: spss-region@9b100000 {
+			reg = <0x0 0x9b100000 0x0 0x180000>;
+			no-map;
+		};
+
+		spu_secure_shared_memory_mem: spu-secure-shared-memory-region@9b280000 {
+			reg = <0x0 0x9b280000 0x0 0x80000>;
+			no-map;
+		};
+
+		camera_mem: camera-region@9b300000 {
+			reg = <0x0 0x9b300000 0x0 0x800000>;
+			no-map;
+		};
+
+		video_mem: video-region@9bb00000 {
+			reg = <0x0 0x9bb00000 0x0 0x700000>;
+			no-map;
+		};
+
+		cvp_mem: cvp-region@9c200000 {
+			reg = <0x0 0x9c200000 0x0 0x700000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp-region@9c900000 {
+			reg = <0x0 0x9c900000 0x0 0x2000000>;
+			no-map;
+		};
+
+		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
+			reg = <0x0 0x9e900000 0x0 0x80000>;
+			no-map;
+		};
+
+		q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
+			reg = <0x0 0x9e980000 0x0 0x80000>;
+			no-map;
+		};
+
+		adspslpi_mem: adspslpi-region@9ea00000 {
+			reg = <0x0 0x9ea00000 0x0 0x4080000>;
+			no-map;
+		};
+
+		mpss_dsm_mem: mpss_dsm_region@d4d00000 {
+			reg = <0x0 0xd4d00000 0x0 0x3300000>;
+			no-map;
+		};
+	};
+};
-- 
2.25.1


