Return-Path: <linux-arm-msm+bounces-74706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4724B9C75E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D7294A2FBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3013F29D289;
	Wed, 24 Sep 2025 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPcf4PHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9D2980C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755760; cv=none; b=cfd885fXMJKHf93gLmnyPqvKdE4vF0D3Mccv6hq3CscNu/2UrRNSZnT18Fw3FreATS3US/fDN5T0zi8oFVKrSVspRlkTT+uv0ECVc8VVQa6+E/y2UFPun3LMLCGSEWUwjxm2h0Wm67/MCU8qA7bl2sU4eZIPSuA1uUfFqz74uh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755760; c=relaxed/simple;
	bh=bZ8IXC8HOPRDISp71VZbKUSd6HvUGLdGqWJR5y6wMnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2n2GNmZc5WPWp36cHAEtQWTjQi8xQFG6zSxrH2MSXSfPRrRv0N9mKNQlapIvgSmx2KWGm+ZWcd8LLA7hhL1FULu/hyjq9uqQKhiUPI0apkZRLaN+bvphXajimyWVdCPpXWMOssaAVY5LDBfNJw0oOy+Pgjz/+Aay3OJ5WXOK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPcf4PHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD7x34018785
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiYmKArQ14egR6ieHES2fd3hg2YJQcPxVzX4FN/0Hgo=; b=pPcf4PHQxLgpRRJS
	86GzhtCB5EpaoNz0rPaoSjXmTBviT9BqhHIr8AWVwUoOknwGRiJVGRWkua1gANm6
	Fzk1NSZd79tMUXTN9Tvrnm/ofV5X0uuqt36zllx4r7Al7yJsuqraIJfEPREXv7CZ
	TsFt3MziWjCwyDP8cjrNKlk+U70hw0JPIsqDhP7DE3rkVuYBk/uVMJs2tGSj+V+c
	pnpUDhE+Pu3CfoUxkLrTkKTNLhJaRd+7yCyQa4Ppe+B9aGIkWMAXmAQ1r8COYkuH
	8w8PPI8A+AUyuRaR20X03M+bXm0WKgDbyVanEW9iuiccMnYh0t8pCLigkkAWocFC
	oKb6Yw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk9y65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:15:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2699ebc0319so3026085ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755756; x=1759360556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiYmKArQ14egR6ieHES2fd3hg2YJQcPxVzX4FN/0Hgo=;
        b=XoLpkbD8HKeXQrrLyG3fBzSHBHFP5SQMVNE5hWu8oIzFiskKP2Dk/Ej+S6CSpqIWiV
         i6dLg7asrn8Fm6qRCMEGyQSJ7RZnryRQ+Vli3m2cVbAKS0NT8Kwqu3s/pu6ewzRwB+Sm
         iXpCGYbwGyPA2So6Y4QHqmkIkfqBHsskk9AZ7E84h0JzvyxGPhajnVKQjSHUOvGFkuqy
         177HgaaXYwS1dMcBqWuYKtphT5drZ2+OFSRCdaJDHCXVebenJyLiReHwwAJiVDQ6ISew
         GV89wOY72gqozLLvTqWoZgptKatCd6v86j1MEXoPYrXTxzzD2X+TLC44gviLO1v0oDCz
         Mzcw==
X-Gm-Message-State: AOJu0YxX11gLcLujjwGBheIWoVBYx+PC5Ecb+8BFlLSedwniOtyYOq3p
	ihRISN51PW6HILb3h0SMgQG1rr9eb/G9hoKFVqLaFAkpZGz6OVKJp0oVpp9QM37Sk5ExR0JLOs1
	q4gvHl7P6g+h4DiEDJG8CbOwllLBflW+H03Zc2on7skAkzLmEEYhZqn51+sCE9I0hq284
X-Gm-Gg: ASbGncvmo4vyCZ/oxM/TF80/VBUP/prHx8J8I4Ucj5y9npyt9E8lJEOA6RCjc37rqab
	dMGHtOE67zHn1dISyUhMZmJzqDf34ykGgabOYD2M6KUa4BCd/ET7F8jzU5YfhuNz/vi+1VfobM2
	a588jx9BGPFBAa1tbMo8VLcmTCYgOpXd2euoZwE4U6a5P+Lo74FdGpOeXvJfRTjxEC/I+rqJBqv
	YbGDteUUvVgVb5MXX+qFt3OLh+0v5D4MvvxMIjSMu9KQ/RDRkKk0BWeps37TP3bCjn0tCkSppe0
	Ap1N1GggRtYWVvLtV031Ncbr75nTs3bTqvnzf/bk6fQ4SngN8vo5DBY1r1tIP0IdPHC86vkuy2k
	=
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15275265ad.28.1758755755812;
        Wed, 24 Sep 2025 16:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgGWOViJ8RAy0ieA7IsLV2TbuFbHtQ4ag8Fyq/6SFVqKmRAnliF89FyYWYsyONu3dCaDt+/A==
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15274885ad.28.1758755755171;
        Wed, 24 Sep 2025 16:15:55 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671c156sm3964175ad.50.2025.09.24.16.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:15:54 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 04:44:39 +0530
Subject: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add kaanapali
 video codec binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755747; l=8390;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bZ8IXC8HOPRDISp71VZbKUSd6HvUGLdGqWJR5y6wMnI=;
 b=sjbSrsyTtT6RjZQKf1bQIyCglBBQHInaH4TgZktj3GlaNGaoAuirg6lO1phV5qsd03JZEwEqv
 7Amz88t1QZLBEOsUirDLgXTQHTlTkbRbe0XNSbIgUzH2kBNNrA1Uc0r
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: jh7fY3zK3Noxpa52flAVJWECBsMF8SNz
X-Proofpoint-ORIG-GUID: jh7fY3zK3Noxpa52flAVJWECBsMF8SNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9pvVkp/BkoYv
 iU6693lzc4Fip0bbEa7tlKikScKKAM4Ff5t0jTIYy8Uve6uuacd33gj5i6j68hUQiMMJpamgOAm
 tWWkUHEyrnQAzdRgPn/6n75wbSV/k1Mv9zT+RFDfWgSMUf+7NuaN68hkLc4WO7dVISJb7HGFX4K
 FssCYUX7itGime1GTjSXuVPPfvmQ2ts2d+3huhL6aVSnLRLssqok6hlPsJuEzXNOljngzqpCdkD
 gwga7VbKbW8efzXFLemtesCBDX5S/ihY+lHqbhuwhZqIGTH6n9Dv2AUADXo7ViL/ZPfoLRFezq4
 XVSxCR3ae+s8JnTbo0BTlH/Lm17cf0QnDhvL6DCuttCml0sUo6V+YZx0oPGWeeJG1PIFdV5/pK9
 e1RnO8nM
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d47bad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gEfo2CItAAAA:8 a=cBXGFdOeIAUf6sKWTu0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

Kaanapali SOC brings in the new generation of video IP i.e iris4. When
compared to previous generation, iris3x, it has,
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- additional power domain for apv codec.
- power domains for individual pipes (VPPx).
- different clocks and reset lines.

There are variants of this hardware, where only a single VPP pipe would
be functional (VPP0), and APV may not be present. In such case, the
hardware can be enabled without those 2 related power doamins, and
corresponding clocks. This explains the min entries for power domains
and clocks.
Iommus include all the different stream-ids which can be possibly
generated by vpu4 video hardware in both secure and non secure
execution mode.

This patch depends on following patches
https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm kaanapali iris video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The iris video processing unit is a video encode and decode accelerator
+  present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    minItems: 5
+    maxItems: 7
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+      - const: mxc
+      - const: mmcx
+
+  clocks:
+    minItems: 8
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_apv
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core_freerun_reset
+      - const: vcodec0_core_freerun_reset
+
+  iommus:
+    minItems: 3
+    maxItems: 8
+
+  memory-region:
+    maxItems: 1
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - interconnects
+  - interconnect-names
+  - resets
+  - reset-names
+  - iommus
+  - dma-coherent
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+      compatible = "qcom,kaanapali-iris";
+
+      reg = <0x02000000 0xf0000>;
+
+      interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+      power-domains = <&video_cc_mvs0c_gdsc>,
+                      <&video_cc_mvs0_gdsc>,
+                      <&video_cc_mvs0_vpp0_gdsc>,
+                      <&video_cc_mvs0_vpp1_gdsc>,
+                      <&video_cc_mvs0a_gdsc>,
+                      <&rpmhpd RPMHPD_MXC>,
+                      <&rpmhpd RPMHPD_MMCX>;
+      power-domain-names = "venus",
+                           "vcodec0",
+                           "vpp0",
+                           "vpp1",
+                           "apv",
+                           "mxc",
+                           "mmcx";
+
+      operating-points-v2 = <&iris_opp_table>;
+
+      clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+               <&video_cc_mvs0c_clk>,
+               <&video_cc_mvs0_clk>,
+               <&gcc GCC_VIDEO_AXI1_CLK>,
+               <&video_cc_mvs0c_freerun_clk>,
+               <&video_cc_mvs0_freerun_clk>,
+               <&video_cc_mvs0b_clk>,
+               <&video_cc_mvs0_vpp0_clk>,
+               <&video_cc_mvs0_vpp1_clk>,
+               <&video_cc_mvs0a_clk>;
+      clock-names = "iface",
+                    "core",
+                    "vcodec0_core",
+                    "iface1",
+                    "core_freerun",
+                    "vcodec0_core_freerun",
+                    "vcodec_bse",
+                    "vcodec_vpp0",
+                    "vcodec_vpp1",
+                    "vcodec_apv";
+
+      interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                       &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                      <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                       &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+      interconnect-names = "cpu-cfg",
+                           "video-mem";
+
+      memory-region = <&video_mem>;
+
+      resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+               <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+               <&video_cc_mvs0c_freerun_clk_ares>,
+               <&video_cc_mvs0_freerun_clk_ares>;
+      reset-names = "bus0",
+                    "bus1",
+                    "core_freerun_reset",
+                    "vcodec0_core_freerun_reset";
+
+      iommus = <&apps_smmu 0x1940 0x0>,
+               <&apps_smmu 0x1943 0x0>,
+               <&apps_smmu 0x1944 0x0>,
+               <&apps_smmu 0x1a20 0x0>;
+
+      dma-coherent;
+
+      iris_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        opp-240000000 {
+          opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
+          required-opps = <&rpmhpd_opp_low_svs>,
+                          <&rpmhpd_opp_low_svs>;
+        };
+
+        opp-338000000 {
+          opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
+          required-opps = <&rpmhpd_opp_low_svs>,
+                          <&rpmhpd_opp_low_svs>;
+        };
+
+        opp-420000000 {
+          opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
+          required-opps = <&rpmhpd_opp_svs>,
+                          <&rpmhpd_opp_svs>;
+        };
+
+        opp-444000000 {
+          opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
+          required-opps = <&rpmhpd_opp_svs_l1>,
+                          <&rpmhpd_opp_svs_l1>;
+        };
+
+        opp-533000000 {
+          opp-hz = /bits/ 64 <533000000 533000000 533000000 800000000>;
+          required-opps = <&rpmhpd_opp_nom>,
+                          <&rpmhpd_opp_nom>;
+        };
+
+        opp-630000000 {
+          opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
+          required-opps = <&rpmhpd_opp_turbo>,
+                          <&rpmhpd_opp_turbo>;
+        };
+
+        opp-800000000 {
+          opp-hz = /bits/ 64 <800000000 630000000 630000000 1260000000>;
+          required-opps = <&rpmhpd_opp_turbo_l0>,
+                          <&rpmhpd_opp_turbo_l0>;
+        };
+
+        opp-1000000000 {
+          opp-hz = /bits/ 64 <1000000000 630000000 850000000 1260000000>;
+          required-opps = <&rpmhpd_opp_turbo_l1>,
+                          <&rpmhpd_opp_turbo_l1>;
+        };
+      };
+    };

-- 
2.34.1


