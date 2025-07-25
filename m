Return-Path: <linux-arm-msm+bounces-66679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0CBB11BE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36545A4885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3486D2EAB86;
	Fri, 25 Jul 2025 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCoNpFp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52F62EA729
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438124; cv=none; b=Wmx5/YJxc3X39faxCzFeBkCF/jkqmZGjBWQyQGNX6OQfOYz5iGZryk5yLqPQzqrtChA4TLOjyF2pWkRknV4K/jBoC1e6Negel6Z1CzVN1ApXy6AxuIeZy/U9eWjGJCrgq1zhnhsy722cdsfDfUVgOWfn5umwfiExF7WPaEmIIVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438124; c=relaxed/simple;
	bh=/g0/ZP4wHtHkgn87d1qyuSHaHZRS6iAOtiw3E5bQBKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XaBUlz0J2kzwjbKh2LSPWd9cbFjk0PPV0MoMFzb4IHWtMdDYJO50IXqvOvLQEGIP9lhHW8nzaq13zhswZSw8666Q/nyWFsi5TrcJA34ffKJHCbMBzb+gQdNYZtrNAea+Fp+oUi1+d4oGAzIGPttxcxDGN1D7tdGNf11ahLB6Lo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCoNpFp+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8x0wJ026719
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=KCoNpFp+ntjOinka8/ykKwlqxo5
	eoWqWTAXhw/GyATRod1St33CuLKOTmsNOsWA00Y4rDkvOzSQIxesWwK/+kCH6OWm
	5mNJIzQhWfZaRf1jJGotTGU4sd0pqqEjOSlwtGrCgV8AiPaRycRQXVSsnRkPzuOM
	KF6kunFyKrzuDgzRcCXMingcKGtlWbq8QYdtL1LdGWxoqv2+r/pghS2K2z0im/vX
	asxBACcLDR2/qgj/vk8Jrtxzzczj0XtVzeVjxbmv5WmgAtn49r5Oiw2l7t4+VebF
	EOZYvWGtLq3p/SZ5SoSpQn/X/a8y35QLAqZL7yFXbvajI6JDPa63+Wa1qFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u1p01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23536f7c2d7so33632305ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438121; x=1754042921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=jnwcxIptmDDxMDeTa6OPve3ou4R397R4aJY1+pXl67Lqci1P6AsJ04/nMPTB8OtxHq
         nwq15loARnAFSdeCTcKONlzTKcfNGHKaWTUdKPmkde9ikpdsf3p8RFdxORXtODtCjdxl
         hTX4XHI616O0PRVdpS0KTG1jsPbm9GvEwSqYoMbtsxTfPtuKrjxW0/ge7HKSP4x7NWe5
         V8HZXJ1He6V4BW2732Bi4sS7Bjf2uJZXAzVfxaPPFqjpx9ehZwvOloo0UMFJpcoI0rxN
         Ot44mw3vt9RIov9EYP+lZKzyOvmr1VGbPWNA5QK2fgn27nH5420SHd/MkitMwnCw0P91
         Cw4g==
X-Forwarded-Encrypted: i=1; AJvYcCXA1oBZnW6GriYJEM179Fgu1p4G7MlABnDPAA41hvLbXMgRczHJCFkdRI72qwYhqzx6FnA+j4rBzKP7Isbn@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKzi2iCVB21ykI1Wcbyo4sOODFCbsmqmLTJiaQFqk7PRF6j1l
	x8JeMG/vwdJRn/dki5cDkc13c4EEpVj6aH0zkV4Jw3fRTpHlBAkQLhVOpGem1pcX5Z5HXb/MoPt
	GXxUa7Nnf708JHtMlatYCFBznljrXPYrug6z4EnZOz+G1vGnsX/sm0p7iNblT+KGzjxTY
X-Gm-Gg: ASbGncs6k2v3zDilmJHcfhZjOwEer8B4qvL76rpWRDha8EGhHXxUMYiixcdlCkxsMWd
	h1P7QPNMYmb41NBHR9ln2GYN27mkfNvGFjnyQ7vPTz9GpjBmKONkKkgkGJ0UD7aCnRiUsQom1gR
	X+HuOkjGM4X/DmkkiB+MjG/gT0VuLqZQdg64G+GHBBPROuJl2JWlNgrqgLfufkYJq63cQHmhAm+
	8b14lhoUDYyrM7/9Ps7zl0B/Pdgc3gJJkNY5yTXiQeITiUDybT5mejpd01bTbgHp93WeyK2ALa/
	MF2aJgdMufNEfMkb/g1WSEYybuxqdtEkhV7QM8/s+H+N+/+rAhvmSh1peep22SigGyl82ndU34X
	3sJ6pun6VkBvT3T9OIzA=
X-Received: by 2002:a17:903:234d:b0:234:b123:b4ff with SMTP id d9443c01a7336-23fb30cc681mr25581035ad.21.1753438120976;
        Fri, 25 Jul 2025 03:08:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDcweS3brtm1EcH87xGsGwFbz42CYAlihlVwybMembexKMc5w9Vl7jZLv3ap78usO5Oa+23A==
X-Received: by 2002:a17:903:234d:b0:234:b123:b4ff with SMTP id d9443c01a7336-23fb30cc681mr25580555ad.21.1753438120566;
        Fri, 25 Jul 2025 03:08:40 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 06/10] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Fri, 25 Jul 2025 18:08:02 +0800
Message-Id: <20250725100806.1157-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfXwcSrkRSm1r7/
 q3682FXectL8+X6AmU+ZfzNe/T9ocbC5UmQwM+6ycJoh8x7TtBSJcwMG79IVtSs3aZ3ORDtg5Hk
 GAxlJ2RASr0f4So2Pg1TZ5XX3pww/V5HXyNL0DHBJ9o8rjurAfGgw9YPVZjQj0MSXyeMo65xhGV
 Qf97oSIcFS2urPLgI0cm8+oYHuNRd21WeM08RvMnKVb54gwybExK0GA/pGIF3EM0lXtnQM/9I5Y
 gJvogKAh9hIV2FxeRswXjAA1bUQRWoOtbdp8bILTm1kZIj1IBG/5vCuCl+6g630M3FN91CNrb20
 C7ITS/anpaCjmQCaZMpJInZA0xifjE0n390Ah+50fUbccl1m08AL6BiAKnpeqeuZdYzcKarJKm5
 YJL2lJxK/E6EkQnS5hGAQBSSW4rzwgPsbgRMG//2bP2PvUrO2eaqYkbpSL3YnHyjcAdFZixt
X-Proofpoint-ORIG-GUID: wQ9Lsjm8DrNtJVMvmmbQ7B-LkJVTRYA5
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=688357a9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wQ9Lsjm8DrNtJVMvmmbQ7B-LkJVTRYA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250085

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.34.1


