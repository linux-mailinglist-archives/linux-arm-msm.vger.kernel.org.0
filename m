Return-Path: <linux-arm-msm+bounces-62648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A85AE9FAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4861217EF9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315142E88A5;
	Thu, 26 Jun 2025 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSMfIxc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF82E762A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946383; cv=none; b=hZbrXj+Pg3MpkPq2bT02c+6Iw0TPhPk5zuw6AeTKvgfY3sIZhR9M9UC9vsjq9xK/Kkx5LEYcR64Q5w0NM5PeFyKwsjlQfK3dwChgfVJOUS4r8bWTgz7hESE/tl6V3CaDwjfCa18FH13twwxDbqUyhzRSGKgq3TX7TiqmKJGgmHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946383; c=relaxed/simple;
	bh=3llpCeYPwVEU1Ua4dK/n1ltSBvl3qua0O7k/UjK9Xkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PkQVND14I3KhjtmyIitGV4hN8VkhrKCModQZVZR7YBtkELdi80xdfYk1TIv6gUv3/q/jf5uBWXT5CrfzUhEc4m59uuGeuZh2FhTj39+wic862NQWmAdZ59tbL4JCSI2hAB3oYpzHq/mqr2ZTELVpVP/8ExM6cWic+v+gNbWlOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSMfIxc8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9TYiU021525
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w5ukSaT42Hf
	S9Tp9K7F/V858WfIpO/bmJmKWflR8t2k=; b=hSMfIxc8vlzAtk8XUank+7JpwsF
	iY+BhNiM2ppLzKTKqY7EKCft6WXbvmLrf+w8z9Y/KMaK08B1pRWuBAcPLy6L+VLe
	dSgVWFVdZCZfuZGeshDk5DuUZvxEMd3uEcZtxYANH4R/P/aBMFc9DPQ6vYkV6MSj
	Z4XFyoH4my1uXTk2l7gBRuduYGesXe0oLaASyuLBjcFmB7+N4GFvlF69lHFeoizf
	xMUDJ99FfLY2mLLUOr4HJF0PoqUdQKAtdnZ2Qq9tCcK3KaEkiZ7Z57lCxuk3+hAB
	Uy5+rA/plvDxMF3zUdgOAXO0eeEftdODMthZiDTCqTBNvx78wTpt4Qx4eog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx1tx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:59:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f71813so151741085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 06:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946378; x=1751551178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5ukSaT42HfS9Tp9K7F/V858WfIpO/bmJmKWflR8t2k=;
        b=P2DXtjZDce6U6Q5TtnbckdQNYo0a2JFEocCtPHnSASLopNdmN6HPiAGfnqvQx+2mIc
         T89cPFXwC36MHVEhjGer5Z0Zi7wkmrY0zHlTChnb58uDYcrMROpmgRD592wm6aBqXgCR
         3wUWzu/LFIal2AI6eBqyTuZ3nzQvCxONOL0hJUqbBVJgatYSOM5SbgNmNeapH5DMtqhp
         yLj9fNGGIzdyBF5Q7GBfl34ajSvv1kqd2N0xz5whPHNWSPLjdayOGUx964V8rEfXplRe
         zCYoAsM39Z6VudtD9UQeKvoZPvYjMYESnX8+PQz5M2ThvayvoHRn9RrgE6qOJb6GIibz
         AyIw==
X-Gm-Message-State: AOJu0YxFDpqsWVLS32iiGGtYKG6pTV8KBKfaGizwziEcp9ePTHj7b1Gw
	rK/EftmFhfixLU9DYQDzs4fQvcjT6Fu+5SXwNBKMqoryhRGaPZOAAEHhpr0vZrmJ9vhrNgw0FLr
	c4ATZFPmsKwh9g6nawEqkNnSfto1OQgjuE3YGikC8NEnHK7xZjkT3i0Y/D5iHRLonlAfz
X-Gm-Gg: ASbGncts8W8OfmvXwXNvCifYnjwWb/5HrgkeGtKfZNUx6rVTHh2oWMhxBM8uKz4Z+I6
	QdhkcljmZIiNff0yFRqDOhwxpIbbiPA3RV55ScwzvyEvsuybCphYtqfdZtkKbk8o85g+DeEnHhB
	ZPtplJJFeGXlECiHYAKuTsETLCFf9vlHKXBWYfOIuFvvMRJq1jfN8VLJ1PBCfnEIX2Jxvp9eW7Q
	NmXphuB5W/3SpAlIsRtbjsT3XB6vGZ73HgVukpEcW97kuLbw7AIhhtXW+QKdtOlp+vE+YzHhVYl
	HXIXcYRrhWXIHaqfJeNueTeuyE6zyuqhtAhw1pgFQpg0dpMl3dM/LY/htUnx6Jvuw0ZYKYJ3Eh1
	b
X-Received: by 2002:a05:620a:430c:b0:7ce:c47e:7877 with SMTP id af79cd13be357-7d42973f693mr819025985a.39.1750946378166;
        Thu, 26 Jun 2025 06:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQVjfLIW4yZd8IXs/lRogGtYBSNMwPGRxW0UqFNcWPzl2N+Q5ZCuRIYwpWPGBtAxJOqYBulg==
X-Received: by 2002:a05:620a:430c:b0:7ce:c47e:7877 with SMTP id af79cd13be357-7d42973f693mr819020985a.39.1750946377582;
        Thu, 26 Jun 2025 06:59:37 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:37 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Thu, 26 Jun 2025 15:59:27 +0200
Message-Id: <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CrEia9ja4VHmhl53tcs0Dox_p9NQzoDJ
X-Proofpoint-ORIG-GUID: CrEia9ja4VHmhl53tcs0Dox_p9NQzoDJ
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d524b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=1mX_ai67dwKzVtmm1w4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX32gSKDAhN4Qp
 UvF0Mj99lxj8R+d7pW8jZjePRvKqMmII09r3Zk949eA6No9T4RbN4gAbSOCjJjPHnev67zYcccp
 PyiZwcKNG3lW1y51Y41nUNBwABybi+SN3XzBievkUVCvrAHk0xf7Ly4JxcnEAMnQdc3NYd+CdT6
 3J5lSGauCCGeCwNsXPhPDIwkBzvY1a19wONmYn8JzKDvw2nr5KvgvWcMnwmbsRL6AhKo4m1KCRV
 +Sxo01m9yGHtDiorzHI8KryiZdeXVxIwiVoFcHyz57dg/cCvAtnbPPr7Mv3VhedSHSh3I317YCN
 xJFxe5l4iDWM4O0zfUqAUUIZi1+e0X9Yn5czoGwcRCC3by70Xe/wESh5083CPxkZI2d1T8n9EkC
 6L2WxWyLxuWlUivKaFQ/2hLBTy8PWjSHwCAcwxBiynE1oJffsGO0VBT+yOjfLTVQGhs2DXoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..a9f89b545334
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
+
+description:
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xf0000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core",
+                       "iface",
+                       "bus",
+                       "throttle",
+                       "vcodec0_core",
+                       "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+        interconnect-names = "video-mem",
+                             "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+    };
-- 
2.34.1


