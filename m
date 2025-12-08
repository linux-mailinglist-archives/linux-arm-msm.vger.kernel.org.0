Return-Path: <linux-arm-msm+bounces-84671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C67CAD2CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2AFE3061A4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ABE313E01;
	Mon,  8 Dec 2025 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyo/vevi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RVQxOb4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA9A30F80B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197604; cv=none; b=k3ZvxL27jMnGJeSOhshpQQiPSjOSEXdANfSyCRUTNYOyMByg3JZPoedl9DQSGnelohSy2Z0slDaz9LoVf/XuONaJzzmsNpNgbaphQu2JDMg12xGN8FOHWgtdMslsjD58q2LpfJDMeNLCLvACTC6Z01l768FSGK7AUbgcxAwaje4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197604; c=relaxed/simple;
	bh=yXKuRfyINyn+cWTWAhYgO/q41wqYc6To8ywxe3g3Bl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cTiagziYghScQt/L3e+lXS4z/wxz3EN+uWNkt2Fxyha2pce5hYS8DBq+5rU5NWyxGTmeCExsdawPJjHaFV8DhInj/JAvt3aGhipmGr9JOAsOO/aqRk+WvUePzmd0MYT13vBxXyldITc096vrEzDrFIDolcfbE9HXWDaq+pjowPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyo/vevi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVQxOb4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8A3mBm008718
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 12:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNtFm4UzpfbY5CckCVTRu1DjFskSjTZzVOEwn2NYlnY=; b=dyo/veviq09aR6fp
	zHqMp3TySN+a1pGHhJfGB/C+fTn3RtOp+Uvibm/wNaZfzcvrIssYClmrKc2Fsejy
	4sPApBZLWo90mbjN7HlNKXE6LuJdvfgojeSuS5qwD6+ALXtWtk2aXTEFxXry05P4
	J8D69gDVwL6lRhfXzEwGjb8Vn3mLc1BoJPXz0Lk0UFQHB3JN1r85fBcNGVsOfLh1
	UcjfuljrF5P/tX+RuJPdUy3oS3a55WXF0Ol1vF51bBNcrmCv4Xgt2SOcaYuUDAUA
	Uth0hMcdlVoDdvaP+WEwZOwOGqN/6oJMzyYN/uupfq6D8p0H4N2mTBPquFlVlNwK
	YcGCqA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awvke0e3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 12:40:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba265ee0e34so4440010a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 04:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765197600; x=1765802400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNtFm4UzpfbY5CckCVTRu1DjFskSjTZzVOEwn2NYlnY=;
        b=RVQxOb4boSnoGMzxvOZwfUUvS1atGxgikbzac9E6K3Qtg2wrqE6t0hcG5OyfQvwG8u
         VqELd0Zdkw26mbJhRNhN+4l6isfPzq4o56XU3z1t1hC4bscJgw3kBnqTcbiGdd4MJQpO
         wFJVQTZ2qi+E8/T7BfVAatp9ncZHO2VaeMtOv2Ure/Vuwjod5G97ZZq9LE60ZrsRAZTA
         ZGwmJOBqxNLV2/Kv2ATQeL+aJU7VlewxzMedg9+MwSBq32icHn9b5OmqR5EmGaKZc2iK
         VJTNk781NsSP++bqPOh+Sfm1ZuRKn4hkEoaUrbSlOt/7PLP/vjm4IYQqPN+antEivdzD
         wJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765197600; x=1765802400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NNtFm4UzpfbY5CckCVTRu1DjFskSjTZzVOEwn2NYlnY=;
        b=Tbx2DFL9bT+CfPAB/Tb8mtINETf2Iv9x6lQJIr4CjLCZ2R6vLvm3DVW9OyTC2wA7AT
         KwgoL7TcYlaLrXJzkJvVr3SVH+pj3tL73mE8w/lSc4SdkAyZfFvZIxXNWA3tbpZp2iqc
         0uhpU9d+cSpJ2YgM9XjbhkFL3heSPgt76ZhC4oxPTA/+m2hqVeXqfBi09vMnSrXMjmS4
         zf6v01dAz8hANLnBfIu97ro5pYchpcv/mhehzWjNsZUeUv+8B9G8zzm5+uuUjZyktBW/
         nsrBPhkxwMS6d3yKhVPBuY2zHk1EwsY/2NpJYxMi/F1YKuOOpYPUixmKfqZsGcu+smmi
         d0GQ==
X-Gm-Message-State: AOJu0Yzz8y365qZCsS9zgCaVdzW4WvPoxYNnvKvFFrdfiJmdwWYaYb6g
	UMg5LOBedDvl5+Gevtrh1iJQ8ZW0NIhQspYPIIctiHtRhrPuumIEKCr6VTKipARdQsLovLvkNEK
	CG6OgmHyfPHkJY2S+9414pab2n+ezuHWmBkjCixg/1BBuR5xsxqhrcIeaKc3EVHG+4/jl
X-Gm-Gg: ASbGncu4SAKDPDJVh5yuyeZzbzrBgEMBbEfEZWDkpSAp4zNMr6XIl6h+PYCB7VOb3t4
	rCr8D8NkyJwcE8S6JK4bhuC/pVQ7CQAMBABeesGbRWWQ4Qn21CJZ0rCpuNR+42cv2mmu3+is7nb
	zWQmOVWLOaqBZ9+d73VmU/W2WxPGhVJeRSiu07BBKgVHvwaZ8FNCqG+E0sfiKORas/CrLzQUyWI
	ubRpRLeMdPDNPoLv+fQ1P50gPm4i11iAE0ulP8jco3nyHZW8dSYzIQug7YruRJpxMkiiRrwwhWh
	dfzb4RbdyFAKFoF+6Jd0EvA53A33URCm78LHt7Ame9StdU+psaSDp53KQ4v4Uh3u73JaX99YO1c
	dXqmY33eR0K5jBF7a7L9+KzmvH5IAjjT7PAhplyeMPMcl6QWYp0rrmfqOWRzOV7TN
X-Received: by 2002:a05:7301:4286:b0:2a7:1232:f3a2 with SMTP id 5a478bee46e88-2abc6f397acmr3375490eec.0.1765197599466;
        Mon, 08 Dec 2025 04:39:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLyA7zy1PjmCDrP/skHomfGzzSJun+5HoYqxmwkMo80Iegc6ywwDSm397Xd5EltkXIPAM9LA==
X-Received: by 2002:a05:7301:4286:b0:2a7:1232:f3a2 with SMTP id 5a478bee46e88-2abc6f397acmr3375468eec.0.1765197598758;
        Mon, 08 Dec 2025 04:39:58 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm34902515eec.3.2025.12.08.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 04:39:58 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 08 Dec 2025 04:39:47 -0800
Subject: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
In-Reply-To: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: JIpBsl6r8INSC0TOzfNNXaqPV9CJryPS
X-Proofpoint-ORIG-GUID: JIpBsl6r8INSC0TOzfNNXaqPV9CJryPS
X-Authority-Analysis: v=2.4 cv=UvBu9uwB c=1 sm=1 tr=0 ts=6936c720 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=78032wgmgAfrEkmTq9UA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEwNiBTYWx0ZWRfX+r/Kmcd/x1a7
 srZ2C9AHLaL989exszr2Mw/dnlu3O4QDpap5G+4l0+dbhGaATZ6eIWae85Dsv81Id7ZsLR3uQPz
 Ws/PNqoh/OpZvzoxWsdKQNbeUWd2VGNlD2r20JM+kJbN/DR3tmbwsTj3crSQ+ErRWcBmeQDYWT/
 xfjBnG8C5m5PUrIPtz0/8y8ZZytugc0XTWlgGcQfSCE8JLSSXPlv5Cb5AMe++K2YAYl96PRxKBk
 f3lWKx3xPjfaWkhw7Evb1w3JuWbIb5jHaTQwoSHzqUJqU/Jc1TDuwNwOUYVs6ek8Koz7IX1KHud
 UvZarXK+gDfvXy1WrQH624fkmgZP4VoOwJ53ab2eEJQPr829TP4zo60Dk+L2tD4jY1z9tNEmhew
 LyhvDGIlMBiileBlyQX+giB2vEmTcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080106

Add bindings for qcom,kaanapali-camss to support the Camera Subsystem
(CAMSS) on the Qualcomm Kaanapali platform.

The Kaanapali platform provides:

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSIPHY
- 2 x ICP
- 1 x IPE
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE
- 5 x RT CDM
- 3 x TPG

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 646 +++++++++++++++++++++
 1 file changed, 646 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..3b54620e14c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,646 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  Kaanapali camera subsystem includes submodules such as CSIPHY (CSI Physical layer)
+  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
+
+  The subsystem also integrates a set of real-time image processing engines and their
+  associated configuration modules, as well as non-real-time engines.
+
+  Additionally, it encompasses a test pattern generator (TPG) submodule.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    items:
+      - description: Registers for CSID 0
+      - description: Registers for CSID 1
+      - description: Registers for CSID 2
+      - description: Registers for CSID Lite 0
+      - description: Registers for CSID Lite 1
+      - description: Registers for CSIPHY 0
+      - description: Registers for CSIPHY 1
+      - description: Registers for CSIPHY 2
+      - description: Registers for CSIPHY 3
+      - description: Registers for CSIPHY 4
+      - description: Registers for CSIPHY 5
+      - description: Registers for VFE (Video Front End) 0
+      - description: Registers for VFE 1
+      - description: Registers for VFE 2
+      - description: Registers for VFE Lite 0
+      - description: Registers for VFE Lite 1
+      - description: Registers for ICP (Imaging Control Processor) 0
+      - description: Registers for ICP 0 SYS
+      - description: Registers for ICP 1
+      - description: Registers for ICP 1 SYS
+      - description: Registers for IPE (Image Processing Engine)
+      - description: Registers for JPEG DMA & Downscaler
+      - description: Registers for JPEG Encoder
+      - description: Registers for OFE (Offline Front End)
+      - description: Registers for RT CDM (Camera Data Mover) 0
+      - description: Registers for RT CDM 1
+      - description: Registers for RT CDM 2
+      - description: Registers for RT CDM 3
+      - description: Registers for RT CDM 4
+      - description: Registers for TPG 0
+      - description: Registers for TPG 1
+      - description: Registers for TPG 2
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: icp0
+      - const: icp0_sys
+      - const: icp1
+      - const: icp1_sys
+      - const: ipe
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: ofe
+      - const: rt_cdm0
+      - const: rt_cdm1
+      - const: rt_cdm2
+      - const: rt_cdm3
+      - const: rt_cdm4
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+
+  clocks:
+    maxItems: 60
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_rt_vfe0
+      - const: camnoc_rt_vfe1
+      - const: camnoc_rt_vfe2
+      - const: camnoc_rt_vfe_lite
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+      - const: camnoc_ipe_nps
+      - const: camnoc_ofe
+      - const: gcc_axi_sf
+      - const: icp0
+      - const: icp0_ahb
+      - const: icp1
+      - const: icp1_ahb
+      - const: ipe_nps
+      - const: ipe_nps_ahb
+      - const: ipe_nps_fast_ahb
+      - const: ipe_pps
+      - const: ipe_pps_fast_ahb
+      - const: jpeg
+      - const: ofe_ahb
+      - const: ofe_anchor
+      - const: ofe_anchor_fast_ahb
+      - const: ofe_hdr
+      - const: ofe_hdr_fast_ahb
+      - const: ofe_main
+      - const: ofe_main_fast_ahb
+      - const: vfe0_bayer
+      - const: vfe0_bayer_fast_ahb
+      - const: vfe1_bayer
+      - const: vfe1_bayer_fast_ahb
+      - const: vfe2_bayer
+      - const: vfe2_bayer_fast_ahb
+
+  interrupts:
+    maxItems: 30
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: camnoc_nrt
+      - const: camnoc_rt
+      - const: icp0
+      - const: icp1
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: rt_cdm0
+      - const: rt_cdm1
+      - const: rt_cdm2
+      - const: rt_cdm3
+      - const: rt_cdm4
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_icp_mnoc
+      - const: sf_mnoc
+
+  iommus:
+    items:
+      - description: VFE non-protected stream
+      - description: ICP0 shared stream
+      - description: ICP1 shared stream
+      - description: IPE CDM non-protected stream
+      - description: IPE non-protected stream
+      - description: JPEG non-protected stream
+      - description: OFE CDM non-protected stream
+      - description: OFE non-protected stream
+      - description: VFE / VFE Lite CDM non-protected stream
+
+  power-domains:
+    items:
+      - description:
+          VFE0 GDSC - Global Distributed Switch Controller for VFE0.
+      - description:
+          VFE1 GDSC - Global Distributed Switch Controller for VFE1.
+      - description:
+          VFE2 GDSC - Global Distributed Switch Controller for VFE2.
+      - description:
+          Titan GDSC - Global Distributed Switch Controller for the entire camss.
+      - description:
+          IPE GDSC - Global Distributed Switch Controller for IPE.
+      - description:
+          OFE GDSC - Block Global Distributed Switch Controller for OFE.
+
+  power-domain-names:
+    items:
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: top
+      - const: ipe
+      - const: ofe
+
+  vdd-csiphy0-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY0 core block.
+
+  vdd-csiphy0-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
+
+  vdd-csiphy1-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY1 core block.
+
+  vdd-csiphy1-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY1 pll block.
+
+  vdd-csiphy2-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY2 core block.
+
+  vdd-csiphy2-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY2 pll block.
+
+  vdd-csiphy3-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY3 core block.
+
+  vdd-csiphy3-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY3 pll block.
+
+  vdd-csiphy4-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY4 core block.
+
+  vdd-csiphy4-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY4 pll block.
+
+  vdd-csiphy5-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY5 core block.
+
+  vdd-csiphy5-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY5 pll block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+patternProperties:
+  "^port@[0-5]$":
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      Input ports for receiving CSI data on CSIPHY 0-5.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
+        required:
+          - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@9253000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x09523000 0x0 0x2000>,
+                  <0x0 0x09525000 0x0 0x2000>,
+                  <0x0 0x09527000 0x0 0x2000>,
+                  <0x0 0x09529000 0x0 0x2000>,
+                  <0x0 0x0952b000 0x0 0x2000>,
+                  <0x0 0x0952d000 0x0 0x2000>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>,
+                  <0x0 0x0900e000 0x0 0x1000>,
+                  <0x0 0x0900d000 0x0 0x1000>,
+                  <0x0 0x0902e000 0x0 0x1000>,
+                  <0x0 0x0902d000 0x0 0x1000>,
+                  <0x0 0x090d7000 0x0 0x20000>,
+                  <0x0 0x0904e000 0x0 0x1000>,
+                  <0x0 0x0904d000 0x0 0x1000>,
+                  <0x0 0x09057000 0x0 0x40000>,
+                  <0x0 0x09147000 0x0 0x580>,
+                  <0x0 0x09148000 0x0 0x580>,
+                  <0x0 0x09149000 0x0 0x580>,
+                  <0x0 0x0914a000 0x0 0x580>,
+                  <0x0 0x0914b000 0x0 0x580>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1",
+                        "icp0",
+                        "icp0_sys",
+                        "icp1",
+                        "icp1_sys",
+                        "ipe",
+                        "jpeg_dma",
+                        "jpeg_enc",
+                        "ofe",
+                        "rt_cdm0",
+                        "rt_cdm1",
+                        "rt_cdm2",
+                        "rt_cdm3",
+                        "rt_cdm4",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2";
+
+            clocks = <&camcc_cam_cc_camnoc_nrt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_0_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_1_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_2_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_lite_clk>,
+                     <&camcc_cam_cc_cam_top_ahb_clk>,
+                     <&camcc_cam_cc_cam_top_fast_ahb_clk>,
+                     <&camcc_cam_cc_csid_clk>,
+                     <&camcc_cam_cc_csid_csiphy_rx_clk>,
+                     <&camcc_cam_cc_csiphy0_clk>,
+                     <&camcc_cam_cc_csi0phytimer_clk>,
+                     <&camcc_cam_cc_csiphy1_clk>,
+                     <&camcc_cam_cc_csi1phytimer_clk>,
+                     <&camcc_cam_cc_csiphy2_clk>,
+                     <&camcc_cam_cc_csi2phytimer_clk>,
+                     <&camcc_cam_cc_csiphy3_clk>,
+                     <&camcc_cam_cc_csi3phytimer_clk>,
+                     <&camcc_cam_cc_csiphy4_clk>,
+                     <&camcc_cam_cc_csi4phytimer_clk>,
+                     <&camcc_cam_cc_csiphy5_clk>,
+                     <&camcc_cam_cc_csi5phytimer_clk>,
+                     <&gcc_gcc_camera_hf_axi_clk>,
+                     <&camcc_cam_cc_vfe_0_main_clk>,
+                     <&camcc_cam_cc_vfe_0_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_1_main_clk>,
+                     <&camcc_cam_cc_vfe_1_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_2_main_clk>,
+                     <&camcc_cam_cc_vfe_2_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_lite_clk>,
+                     <&camcc_cam_cc_vfe_lite_ahb_clk>,
+                     <&camcc_cam_cc_vfe_lite_cphy_rx_clk>,
+                     <&camcc_cam_cc_vfe_lite_csid_clk>,
+                     <&camcc_cam_cc_qdss_debug_xo_clk>,
+                     <&camcc_cam_cc_camnoc_nrt_ipe_nps_clk>,
+                     <&camcc_cam_cc_camnoc_nrt_ofe_main_clk>,
+                     <&gcc_gcc_camera_sf_axi_clk>,
+                     <&camcc_cam_cc_icp_0_clk>,
+                     <&camcc_cam_cc_icp_0_ahb_clk>,
+                     <&camcc_cam_cc_icp_1_clk>,
+                     <&camcc_cam_cc_icp_1_ahb_clk>,
+                     <&camcc_cam_cc_ipe_nps_clk>,
+                     <&camcc_cam_cc_ipe_nps_ahb_clk>,
+                     <&camcc_cam_cc_ipe_nps_fast_ahb_clk>,
+                     <&camcc_cam_cc_ipe_pps_clk>,
+                     <&camcc_cam_cc_ipe_pps_fast_ahb_clk>,
+                     <&camcc_cam_cc_jpeg_clk>,
+                     <&camcc_cam_cc_ofe_ahb_clk>,
+                     <&camcc_cam_cc_ofe_anchor_clk>,
+                     <&camcc_cam_cc_ofe_anchor_fast_ahb_clk>,
+                     <&camcc_cam_cc_ofe_hdr_clk>,
+                     <&camcc_cam_cc_ofe_hdr_fast_ahb_clk>,
+                     <&camcc_cam_cc_ofe_main_clk>,
+                     <&camcc_cam_cc_ofe_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_0_bayer_clk>,
+                     <&camcc_cam_cc_vfe_0_bayer_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_1_bayer_clk>,
+                     <&camcc_cam_cc_vfe_1_bayer_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_2_bayer_clk>,
+                     <&camcc_cam_cc_vfe_2_bayer_fast_ahb_clk>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "camnoc_rt_vfe0",
+                          "camnoc_rt_vfe1",
+                          "camnoc_rt_vfe2",
+                          "camnoc_rt_vfe_lite",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "csiphy5",
+                          "csiphy5_timer",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo",
+                          "camnoc_ipe_nps",
+                          "camnoc_ofe",
+                          "gcc_axi_sf",
+                          "icp0",
+                          "icp0_ahb",
+                          "icp1",
+                          "icp1_ahb",
+                          "ipe_nps",
+                          "ipe_nps_ahb",
+                          "ipe_nps_fast_ahb",
+                          "ipe_pps",
+                          "ipe_pps_fast_ahb",
+                          "jpeg",
+                          "ofe_ahb",
+                          "ofe_anchor",
+                          "ofe_anchor_fast_ahb",
+                          "ofe_hdr",
+                          "ofe_hdr_fast_ahb",
+                          "ofe_main",
+                          "ofe_main_fast_ahb",
+                          "vfe0_bayer",
+                          "vfe0_bayer_fast_ahb",
+                          "vfe1_bayer",
+                          "vfe1_bayer_fast_ahb",
+                          "vfe2_bayer",
+                          "vfe2_bayer_fast_ahb";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 702 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "csiphy5",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1",
+                              "camnoc_nrt",
+                              "camnoc_rt",
+                              "icp0",
+                              "icp1",
+                              "jpeg_dma",
+                              "jpeg_enc",
+                              "rt_cdm0",
+                              "rt_cdm1",
+                              "rt_cdm2",
+                              "rt_cdm3",
+                              "rt_cdm4",
+                              "tpg0",
+                              "tpg1",
+                              "tpg2";
+
+            interconnects = <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc_slave_camera_cfg QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc_master_camnoc_hf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc_master_camnoc_sf_icp QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc_master_camnoc_sf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_icp_mnoc",
+                                 "sf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>,
+                     <&apps_smmu 0x18c0 0x00>,
+                     <&apps_smmu 0x1980 0x00>,
+                     <&apps_smmu 0x1840 0x00>,
+                     <&apps_smmu 0x1800 0x00>,
+                     <&apps_smmu 0x18a0 0x00>,
+                     <&apps_smmu 0x1880 0x00>,
+                     <&apps_smmu 0x1820 0x00>,
+                     <&apps_smmu 0x1860 0x00>;
+
+            power-domains = <&camcc_cam_cc_vfe_0_gdsc>,
+                            <&camcc_cam_cc_vfe_1_gdsc>,
+                            <&camcc_cam_cc_vfe_2_gdsc>,
+                            <&camcc_cam_cc_titan_top_gdsc>,
+                            <&camcc_cam_cc_ipe_gdsc>,
+                            <&camcc_cam_cc_ofe_gdsc>;
+            power-domain-names = "vfe0",
+                                 "vfe1",
+                                 "vfe2",
+                                 "top",
+                                 "ipe",
+                                 "ofe";
+
+            vdd-csiphy0-0p8-supply = <&vreg_0p8_supply>;
+            vdd-csiphy0-1p2-supply = <&vreg_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy_ep0: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


