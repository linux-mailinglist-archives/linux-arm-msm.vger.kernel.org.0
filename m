Return-Path: <linux-arm-msm+bounces-80671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51FC3D6A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A54EF4E7E11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AFF2F83C4;
	Thu,  6 Nov 2025 20:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMojgMSI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evaZc9Z5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10202F659C
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762462249; cv=none; b=GupoMlaBNw3gUsbYXS8ZNTYxll8sfGrXGtV66e6aoAAuF9aakTgefcHZ3S1M29nym+lpTXWkx0l5OXIOIKAwHO716FQ7PfwqAbD89Y1VrAJP+g/qOk4evfKtqLGrYGUXxw9XhuZEUz69oN3nBr6rcfIZYjTtPHKelNh14utoEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762462249; c=relaxed/simple;
	bh=DupNyaWJA9+HLI5bwtZHkh1PCWU9xKmUjmv+tAo+6jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9fiw0folu9R9MYwI9NOPdSk4980SFoPLKT/496rjlINV9vdWJ7UsF6jszkTheSi39Sz6lv2xZSEmPv5lc5ASLlDeKwFv7IY5X+rm4IOlVPL64O/UWTfazxNrv/Zh5qdwXHbuYhQ6PozLZURI5P1j2LGJynE+K5E6xlTjovUhxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMojgMSI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evaZc9Z5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HWZj1568016
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 20:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=; b=lMojgMSIYhwCkbag
	bkpiqXrCiXqAAy2V3QKzyPug2H27bqhMWag5eJxEOfJ+HN5oPcx8Vt6vu6m5dEYd
	Hkp+DFLucHwzjGmGB6BXHvfn4yLpOYJFmIe69oRw/NBr5fVZycdIye7fh7eVSzDJ
	UUvdMfoxpBrUlOhSsPmRMQ+5GDLmYHs5uhrPzvq6N/Po8IHtlgg7+t5uXGfWpBeo
	lGIZCJDINU2Nwn3gBf0cYQCjKKinZhsdPwbc4NuZsfdvGIwc4ApVNH62Exw3adj4
	SaS3ZuIiIRugxZrVUDgnLrUhe3ZNrscHXi/IXdNz3H4b7c9Jfq9aFEXHW8nj9SuE
	wwIY0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905qgjkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 20:50:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2930e2e8e7fso627915ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762462246; x=1763067046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=;
        b=evaZc9Z5pvOOEuK2zxP6UxnJOpXeJRKh0Jlopp3Gv3AE5zkmwWjuWl26/dgzoGpL9K
         Vkqt7pnPB7RvZ93jTbLx8DY1mEj6vCUcGoCLfSTT+ejKI59hhrHuAX6HxsUOitvTRK2B
         SqQak7W3fL0VuZBfyjrVKXw6arHd/LXWNGGG1kBdyAMLZ5/PQMMv1Kybr2SwOas7J5GR
         CZny86BozP9eQ1xjddLTR6N1ayDVuNWATLSl8ykm1l5rokUTzGX8dbZF76rLfhM7qOit
         K9kK+fUzkQ2qpqmB73+2T9R5bOJUBSp782kOJfR8uWXXFkjnPJm1yBrFWIWYoJogd0o/
         Dvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462246; x=1763067046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=;
        b=vN5VwVpNr9tmK1xd1laIU2YtdNtLbOSx7OWBd6aHdqUAo8r75zatqIoQBBbLzqPoD/
         sdCBcUPt2+alFfUcrv+blLjhy7XdNvWbcQ0sZVGEm8JsEJB10AZp+8FLVINw3MOCghF3
         V4dq4OObIR3hyaabncfqAxUcvVNg9se7BuZayTynUHTbSPFsXdQHQj9AcAzNrECRci2H
         lM0XjspFRFTn+cy3ScIVlOae/JYUbkixEligaYY9oheOghrePUO3WNJUPcQc21GZrsxB
         3LSl5hcBVfbeUUpE8ZdIge9qR2v++NSkSWUZzLgR55JKWFXoBRT4zMpguPx1S62loKYt
         VDGg==
X-Forwarded-Encrypted: i=1; AJvYcCUCoyOeAeyGenKkoueg+5ukphPKFNsXIvTUFPbn7oEkSyHdoFaUtTtbBM1UYaiUVTwSe9hez/30OvuxLWqF@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjE2u1VRz5ROzPpIeMYzF6vg0/tJuK0I27+4FMwKYjOldDhmo
	2x1i+lavkrL011LjyAFdOqEiAVsysDiN1aIiZR9DMxEKG4NRsICnf49+ju/ZouW7X/1yNAJ0ugI
	ATB9urP4QqCQ2jaoNsCIlENKRHV7ai7xtQsEQt3OSVritaLVDUrGwzmGC8k1/ABjZ9cxg
X-Gm-Gg: ASbGncvIh0OzbHkmqdw+WH1Y//vBpmfrydhQgy4DMLPvaITiMABN7nFQ/4wysEIJV+g
	I7M7hrAfIuQcRSIcYqWDMQXp6/sITVJAUZEzclr+CrpvfhlSJ16xmzAPqmXfMvA2yZWDjGGsYKG
	0mDtPqOtKKd3D0qODISU77N+eJ7viFkfW/7WE+5xj6ncQH74364HqaWee/Lr7Q7BZnkwIUABWkX
	Hs2T9K6+uVx+mQo5XEFSc/X5ikyXc/6/T6lKp0dnazECRMqB6Ocq46HIWU8pPJLcQMA2+NOTupi
	3bEF1uIu/wkDV5poutDC+DHLquuF+RozYB/ZRMVuntbgS4S69noyDyaLTFQeSZWpcEScx6ydvkG
	Kgr5QYL+41PXpWiEgFyxQr+4=
X-Received: by 2002:a17:902:d507:b0:295:9b9a:6a7f with SMTP id d9443c01a7336-297c0464c66mr11018175ad.49.1762462246167;
        Thu, 06 Nov 2025 12:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFubHR3w/yTqZCuf0JtG12YJeLfTf4xJsZoeb7KhSgpPBRkU+4WeMkGH76/FL8a4LRS9tl3ig==
X-Received: by 2002:a17:902:d507:b0:295:9b9a:6a7f with SMTP id d9443c01a7336-297c0464c66mr11017735ad.49.1762462245600;
        Thu, 06 Nov 2025 12:50:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:50:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:08 +0530
Subject: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=5000;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ciBeeGMfjWiHGzfaxmV6OYY2C96eUNUrGxpBOVfvQWI=;
 b=7umI2JFcr4UFcqzwuX/k/CjT3oVEfYmWA0rzoO4MrN7FcQ+DVggGGUff2nWNC75JHzeP6/uDx
 rhKEprxp0qFDVZ7CTAT6TnX2Mz8Ga0VP9hRFa4H+nrKPan8lOVnck+J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: t8IEjGsC4bz0k7Az7B1nKo9tfJA_UENn
X-Proofpoint-GUID: t8IEjGsC4bz0k7Az7B1nKo9tfJA_UENn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX8DRCYf3Az6dr
 xhwHrYeL9d6oifNLKLc4uE5pduQVMZ4/xh7bMekk36qRlMk47wh70Sch6V7oZNCnkp0XHUrnYYu
 d06okiQgQxKgvYErCl2hYxHzbA1UaaZI/snvE9tbz4hDx+00bQI4XZMYdugoV9YXPPzv8Spmjgy
 3Guvadrxxz11RSB6sV/8D9eeISb5m/wmX4xBmGMzilqXJ1v/zGWYa364GufKlq9smCe7KHwRreB
 ZisduvKMMeuHXbmMy7kvXbfEo4OMZ1L3BDg14i2OqEtcBHeKlS2qjbpvkqB5/jcvr08XD2azcNf
 +Rm0qpL0eB+4PvWb5QA4OqzRZRpQajkr72FxjVraGjS3AB1MwOm8BRrFJpue6f2vBoY+JTIX/IL
 /iMJ0WqM+HA+biv8U4d02j+NydQjoA==
X-Authority-Analysis: v=2.4 cv=D6lK6/Rj c=1 sm=1 tr=0 ts=690d0a26 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060169

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

RGMU a.k.a Reduced Graphics Management Unit is a small state machine
with the sole purpose of providing IFPC (Inter Frame Power Collapse)
support. Compared to GMU, it doesn't manage GPU clock, voltage
scaling, bw voting or any other functionalities. All it does is detect
an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
it doesn't require iommu.

So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
schema.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
new file mode 100644
index 000000000000..7621556477d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RGMU attached to certain Adreno GPUs
+
+maintainers:
+  - Rob Clark <robin.clark@oss.qualcomm.com>
+
+description: |
+  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
+  belong to Adreno A6xx family. It is a small state machine that helps to
+  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
+  power.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,adreno-rgmu-612.0
+      - const: qcom,adreno-rgmu
+
+  reg:
+    items:
+      - description: Core RGMU registers
+
+  reg-names:
+    items:
+      - const: gmu
+
+  clocks:
+    items:
+      - description: GMU clock
+      - description: GPU CX clock
+      - description: GPU AXI clock
+      - description: GPU MEMNOC clock
+      - description: GPU SMMU vote clock
+
+  clock-names:
+    items:
+      - const: gmu
+      - const: cxo
+      - const: axi
+      - const: memnoc
+      - const: smmu_vote
+
+  power-domains:
+    items:
+      - description: CX GDSC power domain
+      - description: GX GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: gx
+
+  interrupts:
+    items:
+      - description: GMU OOB interrupt
+      - description: GMU interrupt
+
+  interrupt-names:
+    items:
+      - const: oob
+      - const: gmu
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - interrupts
+  - interrupt-names
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    rgmu: rgmu@506a000 {
+        compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+
+        reg = <0x05000000 0x90000>;
+        reg-names = "gmu";
+
+        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+                 <&gpucc GPU_CC_CXO_CLK>,
+                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+        clock-names = "gmu",
+                      "cxo",
+                      "axi",
+                      "memnoc",
+                      "smmu_vote";
+
+        power-domains = <&gpucc CX_GDSC>,
+                        <&gpucc GX_GDSC>;
+        power-domain-names = "cx",
+                           "gx";
+
+        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "oob",
+                          "gmu";
+
+        operating-points-v2 = <&rgmu_opp_table>;
+
+        rgmu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ea854fa44b20..c75911e70c82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7895,6 +7895,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0


