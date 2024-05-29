Return-Path: <linux-arm-msm+bounces-20915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6288D3413
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 110961F23409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A243317DE07;
	Wed, 29 May 2024 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g1kkMEtu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E372017BB05;
	Wed, 29 May 2024 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977408; cv=none; b=BHXANesenn9vFGh5wazvCcf6pZfHUO9yFQ9X/6yCE/0DM9OIq8PTePmLh6i/jzvyoHFp4ojrhRt1qH2Y0mc71LdR58ZBPPnfMgKiiXgqHVRSxpEfqgw5j3yQRHE+8WDcCGuER62QU2kXBtIyFlVBcqp/kFTJDea1Vr2thzI5F5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977408; c=relaxed/simple;
	bh=JwqRFLe8BOa7q5qGqGK+W8BkvqREfzzgBcXbaEzxWto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJsztdrIBy5uVH/dHYAaG+/OPbTD6K1gAu0+B32CapGcFUQFbu8Wf6cA6T0RiCHu0z1toBNHEnXIxgvUYU335G3dnzM7WhjSCBxs0kpaFH/Or/EF+OxP25+SVZJ49WodDDPeHX0nQApHqfxCWkVhcHRuPvkhRfhM8nqDNrr6jFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g1kkMEtu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SLqL3N016985;
	Wed, 29 May 2024 10:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSyqwd5FqitnfhfF+bryLqLUIIzdMtDPWKZbE/u0aGQ=; b=g1kkMEtuaXCTFZ1D
	sogQAO+v52n9XxAvJSAYr3TTbN8y7PtwQ/J6sn+mCBUrX61ZI2sAhjYYbPEahuAj
	WMWrcVYDnTZ/WSQzQqcffL/6+TVPjqxLDn/Lu2HnrJKvcYef1nPnxq04LA9h7UGf
	yttXadeoNlou77vKl+HcdhwWo3G2+y/RDaAsbru953d/EZ3yAMs6xrSM12h1cgKK
	VDiTbMMgl5WRmtC5qallDKlWPbnYR1dcECsGSt3Qb2Z/3pOeGlaZnjBW0OVBtqIW
	vL/zYLbb8hw5m2r7/xiRchwoPRPbcHcbAClMD4AowdR4R0WUW72y0HSuLe5DhHSr
	JN4FcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj8pph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAA1TI031095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:10:01 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:09:56 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v9 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
Date: Wed, 29 May 2024 18:09:24 +0800
Message-ID: <20240529100926.3166325-3-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 78uIiDozP3VtbjEfqaTcDVNG8ex8rfHC
X-Proofpoint-ORIG-GUID: 78uIiDozP3VtbjEfqaTcDVNG8ex8rfHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290068

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
3. Remoteproc regions.
    Remoteproc regions will be reserved and then assigned to subsystem
firmware later.
Here is a reserved memory map for this platform:
0x100000000 +-------------------+
            |                   |
            | Firmware Related  |
            |                   |
 0xd4d00000 +-------------------+
            |                   |
            | Kernel Available  |
            |                   |
 0xa7000000 +-------------------+
            |                   |
            | Remoteproc Region |
            |                   |
 0x8a800000 +-------------------+
            |                   |
            | Firmware Related  |
            |                   |
 0x80000000 +-------------------+

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8550.dtsi | 167 ++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
new file mode 100644
index 000000000000..685668c6ad14
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -0,0 +1,167 @@
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
+		 * 3. Remoteproc regions.
+		 *     Remoteproc regions will be reserved and then assigned to
+		 * subsystem firmware later.
+		 * Here is a reserved memory map for this platform:
+		 * 0x100000000 +-------------------+
+		 *             |                   |
+		 *             | Firmware Related  |
+		 *             |                   |
+		 *  0xd4d00000 +-------------------+
+		 *             |                   |
+		 *             | Kernel Available  |
+		 *             |                   |
+		 *  0xa7000000 +-------------------+
+		 *             |                   |
+		 *             | Remoteproc Region |
+		 *             |                   |
+		 *  0x8a800000 +-------------------+
+		 *             |                   |
+		 *             | Firmware Related  |
+		 *             |                   |
+		 *  0x80000000 +-------------------+
+		 */
+
+		/*
+		 * Firmware related regions, bootloader will possible reserve parts of
+		 * region from 0x80000000..0x8a800000.
+		 */
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
+		/* PIL region */
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
+		/*
+		 * Firmware related regions, bootloader will possible reserve parts of
+		 * region from 0xd8000000..0x100000000.
+		 */
+		mpss_dsm_mem: mpss_dsm_region@d4d00000 {
+			reg = <0x0 0xd4d00000 0x0 0x3300000>;
+			no-map;
+		};
+	};
+};
-- 
2.25.1


