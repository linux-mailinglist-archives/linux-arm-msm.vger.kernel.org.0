Return-Path: <linux-arm-msm+bounces-87048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E195CEB417
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6619A30422AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A2030F95C;
	Wed, 31 Dec 2025 04:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CheNtjhi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WU+tFXvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693017E105
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767156990; cv=none; b=jp1SCnIV+Ne4xZkuq9/oHfmtTrhRTMygPMSgbesHTmGbbNhiTuYxsESqlLQ89satPtnFpSYfTs/0hprgIlaGfZid2hG7AxMAFgJZK1sPDdfTc/b2+nV2dkhYJjzsjKnGyPxibGuwdZGg57YDl1NQ69ARZkUuB53e9ujureG9Gh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767156990; c=relaxed/simple;
	bh=RZhUJsCsLQ8did8MwMm1CGALj2u+dMNRhc+pjjIQnsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TlIqBbHg1sr2n8kTqGsF9WA34Fs2e4H8TLHcYPUuGwLG95pCbvHVa3eCqgjQY6l0x38w9eMloffjmcyA97LLMBEfxljZw5Mn5sIuQmLiFXc4FZi9rebqIUeGdAh8zsea8SweMTiwkOEso+DCWMUsvRZPrFTxFeZNOpZcvYX4d0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CheNtjhi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WU+tFXvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV3d3DP714850
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DJ6ywmffk/NvVfS6DMQL/6EhTDM6B1Ko//XWCitums=; b=CheNtjhiz8hn4Ugo
	Qrv5Fo1H4M8RgRg/F1j+WozE9PPv4LGEXIbJC1Gn6Dkb3my9rbMrd1xhwfV1+dUd
	C3TStYk43N0dRPUfT3b8/Q8CnInTmBOFdD2bXvnI+Px5YNU5HBV7b4bIta25OItZ
	zBWTaIKGzprTVpmL20VqHDwEMj92M0OijeI4uhofNkBq4JZU0UNQmqhIKUrDNG/e
	r5TucjXq2Mr3ol+Z7hyh9L5bFp54wnsf81yEO4MrgqKPR9ZqhvCGGC7FyTmt8/xt
	LkFYUZta/cGtOqnn98RYRSreuwSVCC1bjlr1JXJS+H50qppv9YNSdwetspwX+BMW
	qFimgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5ysnwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso14578634a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 20:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767156986; x=1767761786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DJ6ywmffk/NvVfS6DMQL/6EhTDM6B1Ko//XWCitums=;
        b=WU+tFXvf0mJnirdCR1i3W+s7aRCJLZGjCrBQCgV+08S5BAknS3UY4LGgniu9+dHkuk
         DRRQOdZtc/nWYiAtqS95kD20Vo+En4yzJXsM7AaH3YCoRYmsPLmBtHVQ5PhneCwzhPxr
         HXSN1bvv6jGAh9iVhk2jrobZbRbKT/wGsNTNMM9gdtMdxPuliCfiyrwAgKeAHPZclFCe
         nbYPwimrguUgIC1cBIGsr+E62qsGkGB8IHuarsDxMhAv8QBf1iQX33/8zOrApKAs4gX4
         NeWfsFSFzdyjL3FOYe5bYZiTc1DlLPIAbel6/Dfyh4ajNrl9Vmu8gMpjqgMfG1Q+7epB
         co9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767156986; x=1767761786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DJ6ywmffk/NvVfS6DMQL/6EhTDM6B1Ko//XWCitums=;
        b=jy/LVvo2mMO2ewqotSlWxoyg78BFO4IYwlko8ctS7Y3VdMBNvjiehfJ1kK7gpSOrPE
         j9sJN50EaZ/SxrdS/UH873siwLvZZtjXQY6PwLZKbCwtrdCoGtOgcJ7Dt213kGMgfDf7
         c5lva4hIcObwu4Qv2GvDxAE+I1clLnYico5vuib+wjF+7UlL9fyDuCAGJGeb5Vvgw9hL
         gN2G6KyzIfwKyc1cvhtzfxZxZyFr4UpRQfpa3Phaw6/mgHoG1MYu0AYgq/UB0Gq3+NWp
         OJluZAISm3SZypZUzjzESgAgjMtKOQrw1fL2+o5HO77+Lvg+nNBEhCgTspgg1NDd4lsk
         9naw==
X-Gm-Message-State: AOJu0YyIihTAiUkIfW5gJw+FdAvFpQRtvHzUti/Cgudi5NLvjOJoe1Vx
	ixcS4CoMkXQXMcXatDoG9arteXX6wyRvrsc3U+rgqbMLVoRbYd4mH2rAbjVW+rMv7gSBW1TN92l
	SQJYVyfpY6OfUxclMRYJ8ysyVhy59qaQ+qEiy9c5WR7k1DfldggRfl6GYQkEpI8vWZN2Z
X-Gm-Gg: AY/fxX41FBN9sbdeop57TBvBI8/GUKljb1/ur6p+dOQyHBfnkyOd9WSqhnY0qsq/NJF
	ik12DTlkXWYvbgerVY/Oj9ICzyw/aG8dS7DfHABuJPAmbo8G27LT/oHcIm/QyEVQkrFsMekZB7J
	oEyU6SVcq7u21f8gK/WFW5LNb1L7dQIt9V54vSbYVgeUGAmy5ZyQt19GpitEzXR0v7rF27+BwFC
	+kcRiZjNRjvOlzZCney/J7Z9LBQwdKbbqY5q+VvK5h2x/TWEj/EsZomJ52XsAJRhI4LYcL471qf
	vqsz+znxQDSJM1KsuObSO/LQsra8CbPVTqUJqwhs93+ZI1T9LYQfHlUIcmZfZ4LNLiXZ7YAKYxc
	OvQbp1uYXQQxCwbjhb+GLZ8EMigvnw2KS854NUL0d
X-Received: by 2002:a17:90b:1d49:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-34e921353ffmr31607803a91.14.1767156986103;
        Tue, 30 Dec 2025 20:56:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJesyqrxp1GrNh6zATDoRhTiZKRBfA4mQENsxcdqx6gV8UJULOCvVOHwhRLwzkEnp6dYxCsg==
X-Received: by 2002:a17:90b:1d49:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-34e921353ffmr31607785a91.14.1767156985652;
        Tue, 30 Dec 2025 20:56:25 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7d3sm34547697a91.4.2025.12.30.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 20:56:25 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        anjana.hari@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/4] dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
Date: Wed, 31 Dec 2025 10:25:51 +0530
Message-Id: <20251231045553.622611-3-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
References: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAzOSBTYWx0ZWRfX2RbGnJkZQEjd
 Na1Wf64awCBdevG9QvL/MGNU7CRlrB/5tFt5MetVc//SDItfOdiWYFVipUzCoXM4QiApEtzKZsx
 9Z0ZZ7PwyyvG8UFj8kELvYdPJRcGNpoC9aDGvDA5ekEST73t7AWCwr651FGNKzNrjYlEauVDxRJ
 6ZaFKxlFglHnBrxmmfHN6/OMJ3Nd+LxWRLMt05GtiyoeRUPFr2w69xLf/1sb5zvVLHEvCgoCU8V
 AJMn3g6afc2jPylk1Lm0QUkHYbH6TPovQ2WBt7Zj8wz+ydr78jW9Th+88TrwujC1EgMYprL1cTT
 4aI5geIZDVMw4ejIL4do9KckfQK4/upkZGnJ6VGKh09oRdqPPEeBiyAvsp3is9Eqg1eybcAnevl
 g6Uxa7oVwufAmRhuAvmUMU9snLIn+X6TVWRefZMEn+kb2BTjZYrcGjRXjdom7l4Pq+Kc9OOmY4s
 q9jCeGCMguw5MrfgHgQ==
X-Proofpoint-ORIG-GUID: 0EXPdbaTUsynD7DZTXhHTjKfrnZ_yRvl
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=6954acfb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VcM-S10TGioI4za7RKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 0EXPdbaTUsynD7DZTXhHTjKfrnZ_yRvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310039

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
 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
new file mode 100644
index 000000000000..846a3552a9e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -0,0 +1,62 @@
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
+  - Anjana Hari <anjana.hari@oss.qualcomm.com>
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
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
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
+    };
-- 
2.34.1


