Return-Path: <linux-arm-msm+bounces-79105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547FC1324F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C8434F55D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216FE2BE646;
	Tue, 28 Oct 2025 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FM4dVzLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA182BDC01
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632898; cv=none; b=SLyixpBHzdAdYat0HQX7R2lnQgZv2Awi3+CvVPQcbvHWC/gRvy2HE/JZEHjpxQTbUfR0cnkHmHuSUXl3gMfCjQcTBk+i6DJPAVVdV56QlHP7xK4eN8L+tmwfWPTotbUZSP1qu2axZyLSvpwQhMzqtTJQTxSjVnIRsRVkNaVdqGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632898; c=relaxed/simple;
	bh=PPtBIz8qEFvPp66GNhz5hdu3RpRfVBfYsLuidxR205M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMLetAJDTOhkWSuUoeGsWCVo2+qzG9liOZvH8TvyIkNb62FQxszEm+oTEGH0enF/GLxOGKjY46tRhGwSNxeVzTrb6zJy6fJYrs2uJ0GB+V3vreeWmmvINJWMZc9U/IK6AGk1tVu+/IyUQpWQRxBfpMRsnHadDaMQ8NyaEBkwRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FM4dVzLG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RMrBQk2752102
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfzo+zhajCDy5YoRs8Kez4QqmFzyjmbKPNgTAWkNhwg=; b=FM4dVzLGC7j99Mox
	3ZyFb8DhfHrblRfE49VgmXsWH7fS1hh5ezbI5Q/+l7oHyMwQSAOtcEKD2hq2nS+3
	5kMe1mlpT+s3EiPtHNoXhz2PR13wbfB6nq0BdN3BdODxjUfjc57r428SKmgFPcr3
	TxWsB2c+8lHYLXkyZWlUXUvy6yJ2/KOJT2ys2ytDpnf5zt5tZvTcsojtg6KWBcJf
	DVZLx+r31e4RYMs7w0gB6YJw6IXQ0A0zesP+L6tFMGBBc8Tq1NCtQAHjKgvZ7MJX
	BvPmhl0SiCnJEXYcDTQhe2sA4zBnDmCOARcWlLIfwAoz23c9YBdmeSLX4jEvg7E+
	xiksTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swjw2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so35430625ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632894; x=1762237694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfzo+zhajCDy5YoRs8Kez4QqmFzyjmbKPNgTAWkNhwg=;
        b=tgrAHdaViz1agK+0bHCozXtjwqPFrCkut8fmRYSIcy+2z6Z+hIPG3732zteE1bD1BS
         02ECrPEmGY+Ag5QOXDMg0OEw00iXKj8IOT/bkHjyQ0RYWucUHNiN2lNz8RDkCXNpNUx6
         kEyw1xhBwJEBIO02T4TP1LTjkfVD3ftWPXsQzoLwPIaHGjiAUZqwiW/NgiwCHRe03AAM
         oM4SWWQPazte1ATAW66wJ7Nvq31ZhBzWQ6QBxvTAQG9uBZV/tohiO6+0VNXxILQ4qnT0
         6WT/ZnMNvq/jk1YjnjHNn0xwHW4J7D+6UY+e/vuLCBFS/QfobGx8ltiYWZenrJ606i80
         6Tzw==
X-Forwarded-Encrypted: i=1; AJvYcCVlQJmRAiI22u2aAdVeYe/G4kq5xen5T/mG24kxaCf6VxTWCs/ISRMCu+gx8WoZpODLNtj+mvi8eajpToBR@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxG1Z41ArlknRwWzx5ztWOa46G59gMo+99Joz257hihC3WppQ
	27eCgAWAsLZ1POUvuzvHqBcUrgRMw49FvL4D00hXYDVLmZ9QGJagdzYjbh1RtQP5Byef/lm82/u
	cl7FY2bphEhERg63mAa0jiO3p43sBDYdVwFnP/dkDaOfFfdzSzHmB2ljOHI9spsyHASiD6jl4iS
	STqzU=
X-Gm-Gg: ASbGncuGumd4+PN0RrgH1W4KyvC7misok8nmu1N9szmFuPn9FK44FzZt2HLSo71GyVV
	C+Oe8SPHleuHC3mNdgwwvZZYTLgQbmDHFIYNhJ50eVQ9kivBSbcRg9v1kzsYfDtiVoGWP+f10xI
	JEbvrDt1sKV40k0xAMizAXKJixDZcXBEgZxp3a2IdzuGAoLTTr/S6pBDrvh4L6RdFfY7JM/AF6z
	4gFwzhaM11b1BF1aA126zFvRFJdUJbM07b/NDB5h0ECqk83D/1+j+A71KMXj0jUXE3sXl/EQi2P
	7NaWBlZKyl8IIwsfE7qeIL2xeqg7MNNbZHGTP7AjJ1MkC8VGIFprgYE39y3NqVsaCLOhqt3mzzt
	1Y1OtjljufWXiJW7ByXOLvv1OF1cOGwrPR+hep8A7aDiQoR2opw6pW4Q1
X-Received: by 2002:a17:902:e5c6:b0:290:b53b:745b with SMTP id d9443c01a7336-294cb5232d3mr38383805ad.39.1761632893874;
        Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLMay05a+vAXuQxOkbTQFiIgxcmfZljtBPlP7Po1PvPoXnE7k7Y6n0QTmLswWPRio4+BUB6A==
X-Received: by 2002:a17:902:e5c6:b0:290:b53b:745b with SMTP id d9443c01a7336-294cb5232d3mr38383555ad.39.1761632893438;
        Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:03 -0700
Subject: [PATCH 01/12] dt-bindings: arm: coresight: Add cpu cluster
 tmc/funnel/replicator support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4225;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=PPtBIz8qEFvPp66GNhz5hdu3RpRfVBfYsLuidxR205M=;
 b=xr2MpTWnfc1z9/DYs0lmEaPgzO67s3OtRkMFlUDMRC0QKViHGXoLtClSlhp7erTCm29OL1zn3
 8IE3NPo0bKqDB+lxtdSRdV7bNd5lvpqfA9voMhVZAzwas3ZA4x0zJFk
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: 5W6diAvsFcg9hjZpmgIzGYrzf04-7kaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX/HQWc46wl6d4
 0sL/1zocjvt5BFZeqYrod0Xs4DRgJyj3S3s9P3VqkbuXKZkQ5YKMKMz/ZxhEMdKzJXEFunhONW4
 V+c2LWtZUuw5cVyEV7V/HNrzok0lOnEA57KmkC0N+r/tDdoCRyRh77/EWDr0kK6KbuWl1lyXLFN
 ZCRWAGS4NPRSC1nbEtTZDWg4rMRmeTzA/YtVpRNlINocIxn3LrZPRuA+Vh3RWf/j2U/iBmPeMyw
 qZixIDuBoCFDieqtNNNKx7106iiC5/86WqbFeBlaT6NJy8nTkKSxet7aCvU7JZ96+IV8wOj/69E
 UKVLgPUuETq6n1hEJojEfjv7lhL/I1J+tFH2hoJnlFOoqwx7Jha+8Nr/A5jrpE3ZEiZGvfMBgmu
 4V9MccYI0GhTAbfSRp3soSfV0YVDdw==
X-Proofpoint-GUID: 5W6diAvsFcg9hjZpmgIzGYrzf04-7kaU
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=6900627f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=G4amIDmpmRGM4OpAro8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054

Add the following compatible strings to the bindings:
- arm,coresight-cpu-funnel
- arm,coresight-cpu-replicator
- arm,coresight-cpu-tmc

Each requires 'power-domains' when used.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml | 23 +++++++++++++++++-----
 .../arm/arm,coresight-dynamic-replicator.yaml      | 22 +++++++++++++++++----
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml | 22 +++++++++++++++++----
 3 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8af2226b817f6af5f533b1bfc74736..8f32d4e3bbb750f5a6262db0032318875739cf81 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -28,19 +28,32 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,coresight-dynamic-funnel
+        enum:
+          - arm,coresight-dynamic-funnel
+          - arm,coresight-cpu-funnel
   required:
     - compatible
 
 allOf:
   - $ref: /schemas/arm/primecell.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,coresight-cpu-funnel
+    then:
+      required:
+        - power-domains
+
 properties:
   compatible:
-    items:
-      - const: arm,coresight-dynamic-funnel
-      - const: arm,primecell
-
+    oneOf:
+      - items:
+          - const: arm,coresight-dynamic-funnel
+          - const: arm,primecell
+      - items:
+          - const: arm,coresight-cpu-funnel
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 17ea936b796fd42bb885e539201276a11e91028c..5ce30c4e9c415f487ee61dceaf5b8ad12c78e671 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -28,18 +28,32 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,coresight-dynamic-replicator
+        enum:
+          - arm,coresight-dynamic-replicator
+          - arm,coresight-cpu-replicator
   required:
     - compatible
 
 allOf:
   - $ref: /schemas/arm/primecell.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,coresight-cpu-replicator
+    then:
+      required:
+        - power-domains
+
 properties:
   compatible:
-    items:
-      - const: arm,coresight-dynamic-replicator
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,coresight-dynamic-replicator
+          - const: arm,primecell
+      - items:
+          - const: arm,coresight-cpu-replicator
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a39138df9adde0c9c9a6f5583d9da..d7c0b618fe98a3ca584041947fb5c0f80f1ade6e 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -29,18 +29,32 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,coresight-tmc
+        enum:
+          - arm,coresight-tmc
+          - arm,coresight-cpu-tmc
   required:
     - compatible
 
 allOf:
   - $ref: /schemas/arm/primecell.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,coresight-cpu-tmc
+    then:
+      required:
+        - power-domains
+
 properties:
   compatible:
-    items:
-      - const: arm,coresight-tmc
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,coresight-tmc
+          - const: arm,primecell
+      - items:
+          - const: arm,coresight-cpu-tmc
 
   reg:
     maxItems: 1

-- 
2.34.1


