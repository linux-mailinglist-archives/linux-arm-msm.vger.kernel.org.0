Return-Path: <linux-arm-msm+bounces-87695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA9CF8A33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2453130223CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE033370F3;
	Tue,  6 Jan 2026 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPVWS15s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="io3NBKX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB73370EB
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706834; cv=none; b=M6PY4201FT6bXsR6d59J5zOnjIQHc587+2kfe7E4rNLBMhgbI+Amg7oUeh9Kj5AavErTuengcfyYH0cDM/3KsXNSoELAFdNEkBxv63LnWT90UvQVcwpiSIqiJP5HQkdJ+iwvm724w1Pp+0wMAHChhppLLA9Kimz9v5HwfkPbjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706834; c=relaxed/simple;
	bh=5uw6gWRydAXjW+ZAsJv4BZ7YGg1H6uOcEj2DTq7IL9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=scLCR99kaKlA8iwV/MHJiyqg2IOnkYbVKwmgqlJrc3tw9WYs9JhEWL+mZtMlxAHLvrBIdpk1N279JEcBfZiEuDnM3GvIL/EdUWuwoYXYd/8eQR7KNkN2BcjOV/UPVuX5JM+hpTSCnDOBRNSVWtKxtKOxOH4f9Q+8obRx8f3NPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPVWS15s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=io3NBKX8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606BfZ5e308609
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YT1+WRBEePyTEwhJQOOMgnw0dcH2eAv+88f4K6Zdi1E=; b=bPVWS15s9aAQmmvS
	2bLyP2pgPDaXY4ZMJx7U5hvvGOEnY1OLm2lQZPRdIp76boCooe30LyqZys7tXqd/
	PalEdR13dVPMqG3SeSPNOXNblBNpsihkvnFNmMklEOjVt411iVh7jCUp4wfeReaT
	tG2YxH7JHQR1o3u+OiAZ3JGgXbn9azX+Wfv6r3JkOKKfey1TX4hKhGcsKLaNXwF+
	zVOQAdJDuER7ZRaCV8I4ctJMwvx6XyEi2F7oM1sf58Y5kTjSSI4GKq8LR6BSrXrb
	dT+s2UqFn/UITtGCOaqAXThXoZUblFEioDVlq9yx3SU4gLixAeKKxLQ8i8RNtvLe
	an3fTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh1r6gahb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 13:40:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso2088140b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706830; x=1768311630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT1+WRBEePyTEwhJQOOMgnw0dcH2eAv+88f4K6Zdi1E=;
        b=io3NBKX8jrpDcljLXlJteREOwsLnNKjvs6AgMPzr4nlLYoJ+tIEAo0frzAN9t1IdWN
         fdK1ikhBY9aAALNuoyEptE5f13Hu7i3ZfbxxTB1A4deJfzqPtPmx2koLTusft5Kc+K9C
         F5JhiSxvWzenIUDwL7gXSjutjzvEFVXAsw5LCy0MSYAOYxn1AKBKfGxYBxeicEg/sDEc
         Iv6xVIZHT9XHNkRUaxMEfUoSMq/RwzhOfjq8uB5EUE1isyxXJI80CGCZzC+yUbP6D9hM
         LCIlLI6Z8nJroOkyrnlIjeO8OtyLIgcvJEnDWQjTK4luz/O4KmeahNd4reI0auMuT3wi
         yaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706830; x=1768311630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YT1+WRBEePyTEwhJQOOMgnw0dcH2eAv+88f4K6Zdi1E=;
        b=TL60rFzCt5T53rIv4UMpYwF6KFIitSlSgDQVg8IanMK8p+xFT2OyZs5Bna3UQRL/Ds
         Clsf0IRHcCojoFMPPVcVaRwxu0WChSGQMGis0aCKkkxfRstXv2Vlnn1cs7kdn8xLGtSo
         8A8/AsEUNY/82r73XFsXGigbNx212tK5qedrsrYM+1pWl1yHy4DOSWOOnRCC4T1NGwv5
         g77AlD7UMOCBjKs2jNYNGHoFvHHy+k8hbP7TDjUlPFLi3dqOpS606ZvqN1v8AZ0H5ckS
         WUE9+VtQiM2sK6ZxE0eEL6Dea9ZRpNN9HbA1Dmr4Q3x3w+4OOqu+IrsIseqIaXloe9U2
         +QVw==
X-Gm-Message-State: AOJu0YyJ6A03P+P86mKqTbCmNRESeMynJdBY4O+NNtcKUuXc8AtxtjWP
	0Z6JLOgXM5E9raNjs25Qwwzap63zX2CVOcsLuGyDQjAm5myKklaQVDzL4hkE1pawAxiVu3u40xN
	zl1420vi8re9o+3llfTXhnywcLkFJj+XOySN0PPHFLA6t7imFyyXM/C5nZFwradJG1iPj
X-Gm-Gg: AY/fxX7GtpSMeL5lhIDmwRIg4SmzEMEEocGic4WInqhNNxxJ/x4KO4aXXgwvY682ncU
	e0T/AgTXEMecDEXj0nB6pMi/K2pVyRrVFGzEEWP64k4m5LMquWwDSBBVto0OY8SwWzlEtGHAk4X
	A+f92HV5KcK1HlP9X96QUtASVvUKUnQgWPFgjDi0VercCLQseigY8vIyXbkGh7nvUEsAfHymaZV
	xppDwo7E0zYU4SQs+68Z7oIxV31Qj+Z49GPDyzaVhqUZMkqQrUvIxFiaMp1AjJAIEXAnvh4sNKN
	kLeCWXO9APT9GT5S2xTdoIGC0Y53satJtMVHVyEkghX0GhzAau1A6sekVmqMSEvg4WQ7//oSj8k
	HRe21tZeb2DpgsVIs8bWRugHgJMkEGhYk4A+p4XNU
X-Received: by 2002:a05:6a21:33a0:b0:366:584c:62fa with SMTP id adf61e73a8af0-389822d7804mr3034082637.21.1767706830015;
        Tue, 06 Jan 2026 05:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3qC8z4lbOJuLoKb4xvZmoxJozhpdKAHzzoCTTcC1R2/MyomtFOJUnUIzLP+epfD7hFVvbsQ==
X-Received: by 2002:a05:6a21:33a0:b0:366:584c:62fa with SMTP id adf61e73a8af0-389822d7804mr3034062637.21.1767706829549;
        Tue, 06 Jan 2026 05:40:29 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7856sm24112515ad.68.2026.01.06.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:40:29 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Subject: [PATCH V4 2/4] dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
Date: Tue,  6 Jan 2026 19:10:06 +0530
Message-Id: <20260106134008.1969090-3-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J9tGZSF8fpZg85mKg4O8xFJNpQxbwd1F
X-Proofpoint-ORIG-GUID: J9tGZSF8fpZg85mKg4O8xFJNpQxbwd1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExOCBTYWx0ZWRfX0KyfgLPjspeE
 FCouTGaCgwA+kdPkZSibZ0Qyvft5UUZjGrq/J/Rld2BV5tDgKuMJ0iYUATtxgl6GT+9Scv6Pq4f
 0nQi6cAtWpZ+RYy+nu1v6GzfzN1SnakZyICdmE/B1qoxhKWwfhqX2t7I9u9TsIBtZXz/QoyzgaS
 YBi8BHGkj+gSkBWSRebL7EeGpc2ASkY2OnivMQE1iA6LUtTP9fyqeUVOqZtBELB1rpWKmgJsvtq
 3c6GtwCk6B2ZyGlZFaKoF4J3cLOo8e3/weUT4FTpFA10Ke6gds3ippe82AhNcNqb6R9t52FI7hC
 nzZ2z3J1LdQP3to4LzhtNVoXBlMrAyOz6kLvslKS7omniwpiL90nwOpXpJPHHE9v2+DN27n6/x1
 IEFU2UhJh1iDazChXiq/pfSGq7osZddQbkf82KG1iO9+V5Az0NMRaCjvYC67bgBZKCKAxx9lGLa
 wmrtE10DSnzj8pyNU8w==
X-Authority-Analysis: v=2.4 cv=Ctuys34D c=1 sm=1 tr=0 ts=695d10cf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VcM-S10TGioI4za7RKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060118

Document the device tree bindings for UFS host controller on
Qualcomm SA8255P platform which integrates firmware-managed
resources.

The platform firmware implements the SCMI server and manages
resources such as the PHY, clocks, regulators and resets via the
SCMI power protocol. As a result, the OS-visible DT only describes
the controller’s MMIO, interrupt, IOMMU and power-domain interfaces.

The generic "qcom,ufshc" and "jedec,ufs-2.0" compatible strings are
removed from the binding, since this firmware managed design won't
be compatible with the drivers doing full resource management.

Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
new file mode 100644
index 000000000000..ea2f746117e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/qcom,sa8255p-ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P UFS Host Controller
+
+maintainers:
+  - Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ufshc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - iommus
+  - dma-coherent
+
+allOf:
+  - $ref: ufs-common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+        ufshc@1d84000 {
+            compatible = "qcom,sa8255p-ufshc";
+            reg = <0x01d84000 0x3000>;
+            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+            lanes-per-direction = <2>;
+
+            iommus = <&apps_smmu 0x100 0x0>;
+            power-domains = <&scmi3_pd 0>;
+            dma-coherent;
+        };
-- 
2.34.1


