Return-Path: <linux-arm-msm+bounces-88494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9DD1164E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 189643074473
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC94347BC3;
	Mon, 12 Jan 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAiBf9Xb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkUSigHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC0346AE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208564; cv=none; b=TI6iAAquv1baQkR3ZwRgxlUmkdQ8AzJpKWZo2HXrMaFUXzJC4mxoQI8s4kgld+GOBK1OdIfwWIJ4cQohF1fCOINQqj2zKmHlUoD9+DKHRNRotYu5LTUYeDAyOZz8Phvj3hUBHGI9qeaK7eUT5TGPAtqf1HM4u4LadCyB8q18yfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208564; c=relaxed/simple;
	bh=3vqQq2w28MIgXEnXZqusZI+1YcBuCkY93K3m3bB0xrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jt3znYyjOTvKZt7xkJLLGLRJDz0UCH64FDC2lUds4peGnU5hRle6++dPcJvNLoS9gsR4ebF55Y4flvzaU59P3tj3g14PXLe+U6Jd6pXa9z5Cso+Jtr0p4u2HbATyyGNWIH3n3XWhIiDoMuFkwEg+T5kq3ciIZ9JckYNw4En0zDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAiBf9Xb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkUSigHg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83kEv3139578
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+vQ93PIsR1eb2AEe4cTvxYcAMBeLMJBPOKXVVklj8w=; b=NAiBf9Xb73rQ3ZCw
	bwyQbp4FHTQDK3BGQqgajvkuDH8sCoNrSdqnTccE44W4gpg9bZZ950KsUlU1tCpF
	976p/i4j7TA1W00sILLn40frMWF2zrz2o4KwGv02o9YMbZXv0aNaNqXaKFIXKFB+
	uAiPp9xMjW3i8z0JPIY6CmQe6hzu15thPT6pjpZxazN5X1PycTfjggN05pLuUW+i
	wDlOO7EfvYSVt0NkcGu3B4zvCiffxv5F6F/PYtfRSnQwqF2R1sQUS/ZHxVLDgFBX
	QuPFeuz0ULyhGcKl7aD/77rdTDoVfbQFAief6C/pJKa2PiJ4y0dlHOR7Gf4GHGux
	ZXHHvw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57c9fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:02:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11dd10b03c6so8876475c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768208560; x=1768813360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+vQ93PIsR1eb2AEe4cTvxYcAMBeLMJBPOKXVVklj8w=;
        b=NkUSigHg1ZnkvYcsKgHL8PF67U3EZbcSp0+HZX4QbNrZB/FNWaHMMFpsRFSJVBj4WX
         g2T18GT1qDPp9AJeEiyEpBjTczgO+i8fRYrCHRAJp2HfxfFv92tdbkDXuJhw6YAgsWcP
         gG6lf6AVTOTGmkLd7zscGhDguh83vkNoO4536XmuuSNBO7ZwAxXTvu9Vu4J9c0J1HM1t
         75H+50hOva4TR6arwiwlWwhmb4BjGD8XwUq6Fxj4xTamBGsCY/Gn+064kLaX3XGynEzo
         fCmh7omBRZ/yZYoKstdBxAYU6t38A/moXSA005JZadP4/brceAfhkRWbDNE395O9giRT
         P5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208560; x=1768813360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1+vQ93PIsR1eb2AEe4cTvxYcAMBeLMJBPOKXVVklj8w=;
        b=hYdYjGTO1eqI7LY0ylFQcp1voCmniEiPLvC5o8N+WTADfS5mAVV9s0dr34gA/qG6te
         17W+aDuzETScmAcdbxGN2M4gTFgrMKHaHvy8LpJc/0Vodmk2sXJxzZLHrraLS0E5SrBO
         pzCJGdaMIAkF31/nwM94Igbq0J9w54gmRb2DzArBr8P4eriqj08699neUNNaFXhq3ffg
         CSIByoIH2cJ5t3JppFUe85EYzwVJ+M0s6GHMCPdjnO32kx39iKNBUjXFt23cpqKdgLUm
         vkZ/2Wzoz9EPfx5DdI9OVYzJoTHF7+FuMWTnWOmT1CjTDXSr1EesWXS7QM8J6qvr0phb
         j+3g==
X-Forwarded-Encrypted: i=1; AJvYcCUWH8qtMhONqhfRbXW6cIOqgYreewXjFA8DLvcyaaqgXOyP2wajtXZxiogtITepeyQlAYuEOfJ9PHTE7t9p@vger.kernel.org
X-Gm-Message-State: AOJu0YwbofG+H6wIfMtVRFnDhfYwl8eTUZmpbchsg2/8dg8VzvRYi/Ry
	J9hBpw2qaqj9IAr3B4kG8wSdN1yDbCFeWNZ786OsNSIicPkuM9hvdNjQ3ZPahRGIupENsbuT0Ou
	KpQQlTUJEtlaj1iP9xfRdffk0i6HhRUCjXFLDf2ZEJ7l6YuEaSIxCrB442ZOi+2I9Obz7L4aIg5
	x8QkU=
X-Gm-Gg: AY/fxX5K9/SgsOGizBOUNj9JKpEB6GPraVIyaV5pAnBbPOTUVQMJz+80NIBVO68qwn7
	AI5Wlp72s7IVTlJMOOufwYQ7kj9opr8GQwJhEMRCb53VJm7PMMUYzvFW9CyTo2XmcX+Zus7n0Ow
	Vd5FWLuif4+LCGXfDWkm+vTn1WrFCOgpdQTIgCfds5FyCQ7RhKqhB7WpIysBRoz+iAwa8By4qw3
	yvU7p08YzSDZ2RYIMTh9KeNEJOUKw6OFuu+O01XNpOUdyZvnFr8R2qflTrdrHFE64V5CUU7e983
	hnWfMGsFp6DxrrGY+IbbjTfSvhjW0GnNN5DY6Nlhijwqn+vjAHrg39ropXig7cX+B45RyAOS05U
	y202/BTxHgoSXEcQHF6pjhIYt8BcJ+FKLXRGlCvWfuilZI3Y30m1WTAF+CYABaGUU
X-Received: by 2002:a05:7022:511:b0:11b:9386:8265 with SMTP id a92af1059eb24-121f8b8e182mr17149627c88.42.1768208559674;
        Mon, 12 Jan 2026 01:02:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSq5HnIotYSHU7gtYklM8jwrp+KvMU7vL1ZFwPVhWN7bBucJ3TauHO5N7MB658kLu85MHQtA==
X-Received: by 2002:a05:7022:511:b0:11b:9386:8265 with SMTP id a92af1059eb24-121f8b8e182mr17149602c88.42.1768208558861;
        Mon, 12 Jan 2026 01:02:38 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm18888500c88.0.2026.01.12.01.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:02:38 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 01:02:26 -0800
Subject: [PATCH v11 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-kaanapali-camss-v11-1-81e4f59a5d08@oss.qualcomm.com>
References: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
In-Reply-To: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6964b8b0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=78032wgmgAfrEkmTq9UA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MCBTYWx0ZWRfXwwUkTtwFgOEW
 3oGfMYMrLUo/JgqD05oFAvbAKeAq/iDhALxYMoFWJXJCjgeUsCVFTA28skc2NGnK4Lk7kwc1ZJf
 GxV/FJerk4E/KsLs7d4+mfRxoX8JsrADH8aPQOh9ZcaLFdq8Qnan8x95JRCLp0mxlInZfkY04pm
 Bo55+Ma/r7LaEgHQHILQ2kirT61YL/RxZxRep4A/JignAppUD1l9t7WkxZDc9+Xq2TN+TTplSKu
 FSvfMA5Y6SnNqVeaqCG9dv+vZ9vp8lP1oYpY2YMA42zcYaRYRulPd3drI8SejA42akyP36SmmBs
 t+L+ocaOIMmjsIH3f95nF/UpgiKffw3dTrYH7tb+G/BLcAsV9ucoYOTtfanulTW8IxvGXX7xfNM
 yOmJORWodUWTuNvJZWNO0LNBX+p0nHdB1BLcxQuvJLcF4pnhfRs9d0Mv3hq/dTS0Ftd+GZcdXSs
 orG9farpMC6c/OcBqmQ==
X-Proofpoint-GUID: NVJLrwozt8ZpKCkdRvRVcd_Mp_eIg-ga
X-Proofpoint-ORIG-GUID: NVJLrwozt8ZpKCkdRvRVcd_Mp_eIg-ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120070

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

The Kaanapali platform provides:

- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 6 x CSIPHY (CSI Physical Layer)
- 2 x ICP (Image Control Processor)
- 1 x IPE (Image Processing Engine)
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE (Offline Front End)
- 5 x RT CDM (Camera Data Mover)
- 3 x TPG (Test Pattern Generator)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 646 +++++++++++++++++++++
 1 file changed, 646 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..7108a4f12f58
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
+  Kaanapali camera subsystem includes submodules such as CSIPHY (CSI Physical Layer)
+  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
+
+  The subsystem also integrates a set of real-time image processing engines and
+  their associated configuration modules, as well as non-real-time engines.
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
+      - const: cam_ahb
+      - const: cam_hf_mnoc
+      - const: cam_sf_icp_mnoc
+      - const: cam_sf_mnoc
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
+          IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description:
+          IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description:
+          IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description:
+          Titan GDSC - Global Distributed Switch Controller for the entire camss.
+      - description:
+          IPE GDSC - Global Distributed Switch Controller for IPE.
+      - description:
+          OFE GDSC - Block Global Distributed Switch Controller for OFE.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
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
+            interconnect-names = "cam_ahb",
+                                 "cam_hf_mnoc",
+                                 "cam_sf_icp_mnoc",
+                                 "cam_sf_mnoc";
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
+            power-domains = <&camcc_cam_cc_ife_0_gdsc>,
+                            <&camcc_cam_cc_ife_1_gdsc>,
+                            <&camcc_cam_cc_ife_2_gdsc>,
+                            <&camcc_cam_cc_titan_top_gdsc>,
+                            <&camcc_cam_cc_ipe_gdsc>,
+                            <&camcc_cam_cc_ofe_gdsc>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
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


