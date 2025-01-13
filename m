Return-Path: <linux-arm-msm+bounces-44882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8EA0B67B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12CB164CA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D875022A4D2;
	Mon, 13 Jan 2025 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DJpnVUxG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341220459B;
	Mon, 13 Jan 2025 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770412; cv=none; b=bmVEywqyRnza7lG7AcXjDUJRO1fep0NMr8lHo60y8O9jfKrbbhR4Ab7wuIxbRnBMqN8w6MkRGi6Tit6ekMSaWBOBRzHZ9G7Cw6ESX7ryb2T3US8Ji/ydo/3woRDWhhUwLYLn8Ifmc37C4vXHU/mMjnNaCOTjiTBTOqkjDiengzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770412; c=relaxed/simple;
	bh=aeU7dSDhKpxycdZNdoYxHNT+NLLOHb3vf02M6Oa4K1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qfjgesQI3MyQb3An+7M+o/nXVBcKw+pVClGyAQe366GgGYfRWm3TAkPIlNzntgeglU9tHIjJzDvzTYw+lksBf/eVpbhHRpXGhiThl0E17dpPKrPrk8RcXSwcpemdvrgaKMd3DLAtdsiJ+2b6fNPLXpsTQUuIHBs7x3Boer0+73g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DJpnVUxG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DAonZI012140;
	Mon, 13 Jan 2025 12:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	am950/ilpDBOKKDZWasYO8CnLjZhmhKlIATEznPxORo=; b=DJpnVUxGx2uRP12K
	ki6k3pOwxz3EOnZ+3ww9BeFVGhn2XwhSTICAno6LlEqx1JQoK5X0P5wB/bRSIqFs
	17fAhc7Ldr0Uz7gskLONQ+fDNRkHv81kknQcUr/gIHZIL+1YSsFu8v3R3tFqr4Gy
	HkXOlMVKtkfKS69H31VOPdArUkwTE50f9K/ggt3LvaftfxHnlyFzLdMt3QVRHdra
	5TfSG3AT6o/+sQITUGk9vhFuwchPMgJ3xrzqTXkslEehmd2BxFndaX9b8p/SOEkx
	M7/+F76nSzhgl/Eozp/vWcprA59/mNLIYn4EmlSAJ+9tkCZ8+U7TSiBaQA4NY8HW
	F3JZbQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444shqhnqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DCDQCb000951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:26 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 04:13:23 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Mon, 13 Jan 2025 17:43:06 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: sa8775p-iot: Introduce new memory
 map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sa8775p-iot-memory-map-v2-1-aa2bb544706e@quicinc.com>
References: <20250113-sa8775p-iot-memory-map-v2-0-aa2bb544706e@quicinc.com>
In-Reply-To: <20250113-sa8775p-iot-memory-map-v2-0-aa2bb544706e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736770400; l=3527;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=aeU7dSDhKpxycdZNdoYxHNT+NLLOHb3vf02M6Oa4K1U=;
 b=voZrkp8EF1cmTFx9nEs+Dmj3xAZccp5OL7/6cnCDPJbHU+Vn/qJE7iIuv+zyrPeRzjdTIlEBU
 C3IqwQW7iaNDL5OnIsjZ82zT8vDnvvFKw4RWYwkpElgloMJDdIgQka3
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o8e5ErssszaRikQpR6GunjGfPveXUfVj
X-Proofpoint-GUID: o8e5ErssszaRikQpR6GunjGfPveXUfVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=704 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130103

SA8775P has a memory map which caters to the auto specific requirements.
IOT boards (viz. QCS9100*, QCS9075*) which inherit the memory map of
SA8775P require a slightly different memory map as compared to
SA8775P auto parts. This dtsi describes the updated memory map
applicable for all the IOT boards which inherit the initial SA8775P
memory map. This is not applicable for non-IOT boards.

Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
introduced and the size and base addresses have been updated for
a few of existing carveouts compared to SA8775P. Also, tz_ffi_mem carveout
and its corresponding scm reference has been removed as it is not required
for these boards. Incorporate these changes in the updated memory map.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-iot.dtsi | 105 ++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-iot.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-iot.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6252294ff7c32be1a0a9c4f7ed3d4422e99f98df
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-iot.dtsi
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/delete-node/ &pil_adsp_mem;
+/delete-node/ &pil_gdsp0_mem;
+/delete-node/ &pil_gdsp1_mem;
+/delete-node/ &pil_cdsp0_mem;
+/delete-node/ &pil_gpu_mem;
+/delete-node/ &pil_cdsp1_mem;
+/delete-node/ &pil_cvp_mem;
+/delete-node/ &pil_video_mem;
+/delete-node/ &audio_mdf_mem;
+/delete-node/ &hyptz_reserved_mem;
+/delete-node/ &trusted_apps_mem;
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gunyah_md_mem: gunyah-md@91a80000 {
+			reg = <0x0 0x91a80000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_adsp_mem: pil-adsp@95900000 {
+			reg = <0x0 0x95900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		q6_adsp_dtb_mem: q6-adsp-dtb@97700000 {
+			reg = <0x0 0x97700000 0x0 0x80000>;
+			no-map;
+		};
+
+		q6_gdsp0_dtb_mem: q6-gdsp0-dtb@97780000 {
+			reg = <0x0 0x97780000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_gdsp0_mem: pil-gdsp0@97800000 {
+			reg = <0x0 0x97800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp1_mem: pil-gdsp1@99600000 {
+			reg = <0x0 0x99600000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		q6_gdsp1_dtb_mem: q6-gdsp1-dtb@9b400000 {
+			reg = <0x0 0x9b400000 0x0 0x80000>;
+			no-map;
+		};
+
+		q6_cdsp0_dtb_mem: q6-cdsp0-dtb@9b480000 {
+			reg = <0x0 0x9b480000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_cdsp0_mem: pil-cdsp0@9b500000 {
+			reg = <0x0 0x9b500000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gpu_mem: pil-gpu@9d300000 {
+			reg = <0x0 0x9d300000 0x0 0x2000>;
+			no-map;
+		};
+
+		q6_cdsp1_dtb_mem: q6-cdsp1-dtb@9d380000 {
+			reg = <0x0 0x9d380000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_cdsp1_mem: pil-cdsp1@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_cvp_mem: pil-cvp@9f200000 {
+			reg = <0x0 0x9f200000 0x0 0x700000>;
+			no-map;
+		};
+
+		pil_video_mem: pil-video@9f900000 {
+			reg = <0x0 0x9f900000 0x0 0x1000000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@d1900000 {
+			reg = <0x0 0xd1900000 0x0 0x1c00000>;
+			no-map;
+		};
+	};
+
+	firmware {
+		scm {
+			/delete-property/ memory-region;
+		};
+	};
+};

-- 
2.22.0


