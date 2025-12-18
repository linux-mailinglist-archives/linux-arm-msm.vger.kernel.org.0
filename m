Return-Path: <linux-arm-msm+bounces-85647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A8CCAD15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15F42305D424
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78732ECE9E;
	Thu, 18 Dec 2025 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpWH7FEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i26+xcMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3772EBB98
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045445; cv=none; b=e3J/yCnJNlB0+L7u/A2kczHTWuyeyqVwYE//opSZqOvbqhRTAE5/2FViMZxP/cHHwvA/FIkbaZzi2xb2lUBCXgr2wM5aXb5wHmzJHMM1fGeZFndsHJw6Crd5w+601AOPVVOfb9nmG4acnry4n21XtQ0mPBjM7YtDpjYx6uBT0Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045445; c=relaxed/simple;
	bh=+Jqa7JFXnLG9afqUMCpYAS5qCe7jJ7CCqJKnko2EM/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZMqMewVG+8X1qvG0Znix9M/TNX8WuJizpOzjT2eBFbjaVZM5eb20WBFwB7BSXvPU0WA+tshQp+Mts5brAeaw/BnjPN+Ea2eoOc4cnEcXkebkLotVItayjAiNjn2D/xmcJlTmFPDrq7PSG5a02PjcrnDNYJGjc9HaYV4RftH65U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpWH7FEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i26+xcMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Yb7m813789
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkTiNz3pyA9itoti44UzYuHhlxPS+xvrEI3POr+5XlQ=; b=jpWH7FEkZBBKoSVU
	rfj6cF9mfGDEP4D4j92omH7mz4SN688Vi+LkzPALhwHqiLIrnMpFZtMpM6loJogb
	52g6n+J1ZRuvsbO7d6/NNPqBjybATO5A4EqLq1+aYZNq4mHkNXmaMq+l/CX1XEXo
	hZ16pvxBOrHtfBajbBG2GMhgtFNkJ4BQj2k4pzqMzpviAePxv5i8tN4ZKQj/jCVk
	0QLwHRJWjSF078F7WLMG7siFhqKqzgVX2p3OQfAXdTm+Ztn+sL9FgaKAmeeM9XrI
	I6Fd6oOrK1vduAiPPBtIdOrEgj/1Y2kQN1yXupyFqki6/+8QK/rIq1xfo/jqEdo+
	ai+MIg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v7a5td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bc240cdb249so401540a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045442; x=1766650242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkTiNz3pyA9itoti44UzYuHhlxPS+xvrEI3POr+5XlQ=;
        b=i26+xcMdGNeqDR0sQjlMbSVpIIEcAZYa2o75pgCvteynW/9Sw89Ocu97Q90IB9o+QU
         /7PBsPGG6aCqf3PqaMYoyIi6sBE2RUplLqRqMEy9veFxS8DJzzg5eNYUUk6ipP7vWys9
         SkwpPFl4TIyWEeRoRktU9RioOL8opZXInAyTwhFliLGIiWLp/u2RDvd9Dv194Zfh94pn
         MqmAexlWkljIeBtT8OUIx9gRq/pwuLyj4sRb+EStLw3agSBH9rN7fWEFzpgle53PTzEk
         ONwXLtLjksiPf1wJ4EVfnB8I6atDdpUEP68snNlDnwRPWInkMF1S1qONeA6KTqeetZ1s
         volw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045442; x=1766650242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkTiNz3pyA9itoti44UzYuHhlxPS+xvrEI3POr+5XlQ=;
        b=AmMmVyHfTTHar5x3efzLsge3x0Rgg7P3K+hD2FJ1ufHCD2mCLMGFHyouKQ45mW/YEP
         GXGbk4HbXuhOyOjKhIT/1p+NtkRZ2ADNwadjYW3Q5zNuJULedI74e2gtMD5K77Ddz2mm
         cGPZHlTfWbcNPDLMGtD+pN+FlZpqHoPLfGWVndy6QvU6eMTVpLr32BFe3rwYhwpCVmU8
         QmKrFCXJlvEPxPEOxYULV5HlOZYHP4+2oxJbHD01G5udw4p8/K+KeVX29s0YtI9R5g6r
         OryBlQV/Z3raorCz16SnDsDZeKj4gKoksCopCD3E+nx8VYM9WPgI6l/DbJrgDSEmhpO/
         IuJw==
X-Forwarded-Encrypted: i=1; AJvYcCUr2D0OXLIKpEuPmUyRt12jFp+5bMbStF7dqmGSJfa3j5HC2NYLlCu0Jok34dwwPibPNfZ/gRRLCdBUMGVB@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVPVigQ2rMPvrG11MLmQ6H6qS7GDCIU117Mbf0jTlLaLwaMo3
	FVRSuy373SETR2oLV/zaXiMl8M/qvtaZ5clZbq4hY7rHzz5xginwq1uJlCXBKwLDrL6TL9wtgY2
	y/xZeBucYyt+QNfUaOIsIVQhpe6LPNVBjpIBLVSTTXyY9LxUPthZVo+uMnpaERJMsFPvw
X-Gm-Gg: AY/fxX43rQ/WlSWBgTDqAFRyzskUX8fuXp1LSQFaAhZhO7A/68dTGnEvsOX9Xp7GhHz
	5tMi875OAPCZAAiraC8FTJVSU5vF1jWkJg8zbRlwLQiGicWu/n1lLxzChl7XJoC6+u2VyZlb1bt
	OHcWiFepxH59GXDWVTOXDq2uriBx+2pkLaEI0v9Q/bZyL02WvVv1ugt0CBqs0a9kIo/rblb39tA
	59vq3ak9qPXbrN0Kr9AIntrzs1vCnTikQXAVh0h/Qwgft6vcezJ0jyWogPsjQEFfTUwcWr9Tky2
	FayWGnOotNbAes0kq8uILFFqlQhJhz9W4fMb7fCDQBuh+SvzGIWvn4Pr75rcNIYpixMpkOMWxiu
	leESppth/wkMvguEbeEK9uddUPaTLQwpdhf0rehSlgn08WyPW50d8Chc2D99FY6zdLv8=
X-Received: by 2002:a05:693c:40d0:b0:2a4:4884:e03d with SMTP id 5a478bee46e88-2ac301fad99mr12556610eec.11.1766045441864;
        Thu, 18 Dec 2025 00:10:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaDc+tdn8dz/1azt+99U8sha2Qy8hrm5AGs8FFige9H3qCjFhCgiFTf9zVCb1j5rvBRmpiLQ==
X-Received: by 2002:a05:693c:40d0:b0:2a4:4884:e03d with SMTP id 5a478bee46e88-2ac301fad99mr12556586eec.11.1766045441272;
        Thu, 18 Dec 2025 00:10:41 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:40 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:41 -0800
Subject: [PATCH v2 01/12] dt-bindings: arm: coresight: Add
 'qcom,cpu-bound-components' property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-1-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=3052;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=+Jqa7JFXnLG9afqUMCpYAS5qCe7jJ7CCqJKnko2EM/E=;
 b=QxzfOTMXLpA75RWYYuwBvLFwkh6xifOv2aAmFGxZ7X3aUgF6UJGRlSWV7WZkOOqFEveY2HRNN
 BZgiyJ9fG8+Bh902i2nsoVUOu33jThGzWU31j9n/CWl/Di2RwU1Bm8E
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: ZyEPLroXmO-VHlENASxxR9O0ffOmgGCn
X-Proofpoint-GUID: ZyEPLroXmO-VHlENASxxR9O0ffOmgGCn
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=6943b703 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zthVEJJq2wqy0CFkTqIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX9x77oEkinpDQ
 QEk0hrsH7L3sa2kAStvExckfW/Z3VJ8hMNDtUwp1fIJbwIK0SgUc6Cd0xVyQzSHpIYMR4vcrRhM
 KxnVEaP3qXGj87DYB+NwxBnMRpo8oIfVwqz4D8I9UcC5Ub1bULZf8/vlekFlcv4RLGVWLqLkP+N
 ugK7tS6La+6LpZDoJoo83pcLFHZNrpYLA8ohruPn2UTzwerA716PdwvNkm3bvbKj0z4jp2Kf1wa
 EhW1wPYVrf5c8iGdE6Q8VLjumiAokAEJ1xWm1R9iTAWKdnz0ZflqpXVuxhgvFzDIFq+ZyCTPB4Y
 zT3+0KBAGWdydKwPcQJ5MzFD7YQw2idIdZJYTs/wyOE6v1q73WPTbbwno+4UuCoslhNKjV2JXSZ
 mqLx/zvhkt6N5plHMF3HiCsiehj1Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066

Introduce the `qcom,cpu-bound-components` boolean property for CoreSight
components (TMC, Funnel, and Replicator).

This property indicates that the component is physically located within a
CPU cluster power domain. Such components share the power state of the
cluster and may require special handling (e.g., cross-CPU register
access) compared to system-wide components.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml        | 5 +++++
 .../devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml    | 5 +++++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml         | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8af2226b817f6af5f533b1bfc74736..a4c7333e8359da9035a9fed999ec99159e00a1d9 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -57,6 +57,11 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,cpu-bound-components:
+    type: boolean
+    description:
+      Indicates whether the funnel is located physically within cpu cluster.
+
   label:
     description:
       Description of a coresight device.
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 17ea936b796fd42bb885e539201276a11e91028c..2c6e78f02ed84d95bb4366e4c4bbd1b3953efa32 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -67,6 +67,11 @@ properties:
       Indicates that the replicator will lose register context when AMBA clock
       is removed which is observed in some replicator designs.
 
+  qcom,cpu-bound-components:
+    type: boolean
+    description:
+      Indicates whether the replicator is located physically within cpu cluster.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a39138df9adde0c9c9a6f5583d9da..8c4f2244a5c74dc8654892305025a4e6bccbce07 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -86,6 +86,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     maximum: 15
 
+  qcom,cpu-bound-components:
+    type: boolean
+    description:
+      indicates whether the TMC-ETF is located physically within cpu cluster.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.34.1


