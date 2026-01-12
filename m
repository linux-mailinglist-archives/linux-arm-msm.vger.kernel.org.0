Return-Path: <linux-arm-msm+bounces-88611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC1D14D88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5200030638AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13312311C17;
	Mon, 12 Jan 2026 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHNRz1r0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9odF98e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289D310635
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244512; cv=none; b=VXcXNIOD72EhuhPwmNRYYy0SFbWnsYs8X9sboiIP+TEV4r/L81HHVFV4YYr8Oz3859vTGjrhbNB2CEZ6yrT/BwPnJxfWtz9ArL5YNl39JcRxu3fzE6IBzcHXmH41XQ90jycoG27uF3YLB4DgyMgq8z4SAPwK1oervR7jRusYFZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244512; c=relaxed/simple;
	bh=qsW0Uz10Qjl56BkQXengJG1xwxEd220vytxWkB7IWMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rL5bNWdaMbKQ2nM1tG+nx9mdJWtfQERA8hlkzQ9YhI1FvWl13yVMNeGXBVmT3Y6hT4xxPgc3z+E7IZMKYgR2+eaRVoJ4XquK0s51gUky6bsfq7pz24urJCGRgY/VSY5z6i8WJvrO5WdhRwyWEqTTgJxivdVRREgvnUn+HIEHDK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHNRz1r0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9odF98e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHfIwV1426564
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tJKzdZlC6pG
	QHIx9PxzGt0O5YSMlkLVNoSgcCXEO92o=; b=JHNRz1r0pqZsGB7eAFsOOfxd75N
	pU0mI5PFFUqQcqTkje9G8zxJpA7tHKcDGK5Y7ktR8UpDfORZkhLisBO6C9pTUPzA
	0BJFsNnidUse/qMbXHsG7NYTUq5DaFpC88+xHX2e/VGZaNOPWiQgnZJd7+HJU6cS
	vXPnbXOAKPj8L7xh8yyIoayrUqCLqk3XxOBm513NcIE+WE0Dw0+tzgfmPX6vrF2L
	LSFZAKWWzT2ZCw18Mo8cVcveChLeGJMS+oR4FrojSpAbUd4GoBeXhC4tnqNkf7xu
	RlcLSNAB/3chWmI3W70gTUoS2yz/FEbe/QUr7Loxmbr6U2wymFa+yisXo4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn34g8ump-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f27176aa7so99429105ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768244509; x=1768849309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJKzdZlC6pGQHIx9PxzGt0O5YSMlkLVNoSgcCXEO92o=;
        b=U9odF98eXcTl9UNUqCku5EFd6fWrGHiRn8LLZS/zu58daHZc0Hw5br/7JDlP7fGSEz
         d3b1W7ipadK/vcMczEUAsudXdjgUPD7va7Wuwj5Fe8GTuLGkKnhoojT8GHgMFJ2vqJqf
         ZXyiKj0MB/xw4yicBP2TCiLvLUrv779+Zkjjlcxzys4H0Hbrv/eJbpuNxvb5SlkCHLAk
         MY1lp8nmXsm6eMccgvy3u/N3GrFvT4MWKxYJ1PUkBUfGWBv9IGaGJoUzMh3DpiqDm7jX
         TVPpv/h2VzCPPU7hO69qW888zoPAH0SmdZnJTs/ArZlmVdMN7AJLriTj2ti6qZYBJru7
         9slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244509; x=1768849309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJKzdZlC6pGQHIx9PxzGt0O5YSMlkLVNoSgcCXEO92o=;
        b=Lj3BYmyvzUGEdTTqDkWx4djeCzLPs9DZcMks3sbCeNTVlbMbc96ffp2lkJzeJAofoC
         aQi5vMCrIpwJ6PcJkfyRcfIM0L7Sza2v3gUS/ejNxuOm65FGUyFo3X3SDcCZf+GyopwJ
         Ue7aIdCKMPDg6ifSVtdv/OgMixz8gYF+BYfJD2zCrVQgUXsggasJ8KhlMn8hzhWRfVN2
         oFS7NJYMRNNgzNSD0HD4+lMbNi75Y3reargftIQvzZ8hABR0sPOXKNXXSnVqSG8HwrZQ
         eQXbBTFIBWNtvS8Ke7xPfwr3LDW7hob7leMV0msHN0wKrSkHbGQSDdcvkEbWOlJmE4nD
         CgIw==
X-Forwarded-Encrypted: i=1; AJvYcCVOoXNkVSSNLAkj1qrmpp9zBitC7LwiEm1/Rgln4HHYOatVo92aJDsnZTf5UCRCOoUV34m+1zRMdEjl/C0e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fun7cBQo4uV5mspyssLZQdqAHnZkHBxTggalVc2W+KI1QexF
	cUSx9PBwm7MQXdZy67Mozerg+mdzQn33sTFOp7FhwhP5+lr5jBmj2bJU8Twp7p/3NsmQULbmEyX
	vXNB/HaxQaCZcnD5Dltpfje9yM7nov2VE7UomraNyEJukadMTm6AVOru2IqkiQoadr3U4
X-Gm-Gg: AY/fxX5vkVyspV9ELwoczfxLJ4GxiRhx0kKMcQL3YP+uFQHq/6wgRJJzXTv4T/jOrjp
	e/rTlVURtzkQG5jp2e2Z3EcX8gkwg1FruIctUx0NcVd1d+GIZVjyynVygkjIMneZZYHgGb/0B80
	mEIc3il+MjfU9lC4pO39E1h/2jiXjQX/B2abkOQWeirrZDFcuHq/SzLji3ZWwNHneANGZ0wAtZr
	+788yjkCZN4pnIPDijXEXjHxtSwmzhk2WKz896VQN8/xq+w8VhHIts+UeOASusEnx9V65Gd+U0F
	DNpCaykiK1yOdM/5GmLaw/gmLDQ5QHzPhdcNPT+EajY/FKf5DjAcRRrdLqUnqSt5bG8t60oSdD0
	wXD0ttsqTlIBTORk2YqQ93wrQKIlDC/8wlWafMf163Nk=
X-Received: by 2002:a17:902:da90:b0:295:565b:c691 with SMTP id d9443c01a7336-2a3ee42892emr200539645ad.17.1768244509269;
        Mon, 12 Jan 2026 11:01:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmRrWohybqHuXyyw7hdbDgfVyDpxFktI6ED0wq2Z2WPdbgy4rafLnbLbVHRpR8HUiY4xsP+Q==
X-Received: by 2002:a17:902:da90:b0:295:565b:c691 with SMTP id d9443c01a7336-2a3ee42892emr200539115ad.17.1768244508600;
        Mon, 12 Jan 2026 11:01:48 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8888sm180120595ad.76.2026.01.12.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:01:48 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v1 1/4] spi: dt-bindings: describe SA8255p
Date: Tue, 13 Jan 2026 00:31:31 +0530
Message-Id: <20260112190134.1526646-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112190134.1526646-1-praveen.talari@oss.qualcomm.com>
References: <20260112190134.1526646-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fbKgCkQF c=1 sm=1 tr=0 ts=6965451d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b8-5IbU7OP05I74H5fIA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE1NyBTYWx0ZWRfX+6KiiMcnc1qN
 bXOuezGOZd6NGaqq2QxdEsDep9xUo1qoDwizj+lBo9cGkQhaU6ayfb6LIqDmQ1vRi8/ktq3H4Gh
 4L4495iIm5OTRXe2O2li8nrk7uerD+a1E1fqZ4B8H5zv6dUoz+RYe/uDgF18x4joNUcgyVkpndS
 DUYWU2NVFDHZ3fgtOe2pHvsldwFBiEngA7bbpRiw51RgG82xt45isnQw41Rc5h4Sk1ziYJMwGnQ
 pUa0QrsP9SIlCHpGarnJaADB6MkQeXE4BjFbxiBxxgo8mpn3aQ3eQBt81DipKN0yiI7DpVfv8xU
 WxngaM0KIfhdP5lCe+BEzQBjMvIsJtWVd19hPHvKkg4biPNn4n9y77vTva2uaR6qdxVBQMTwbta
 5mG4Fo/D2u2gMs7kahr3ZQzzO4xTF5Hni3CTdzE6bHhBvtAnITMfowdpsut3y54dP3GGvVyK6R9
 xhXQAXk8KVUMXUAthhw==
X-Proofpoint-ORIG-GUID: ZOAQgRr8aTVJJkeO14cfAro4M3KfyvfX
X-Proofpoint-GUID: ZOAQgRr8aTVJJkeO14cfAro4M3KfyvfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120157

Add DT bindings for the QUP GENI SPI controller on sa8255p platform.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 .../bindings/spi/qcom,sa8255p-geni-spi.yaml   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
new file mode 100644
index 000000000000..8c6825b8ddb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/qcom,sa8255p-geni-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-spi
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    spi@888000 {
+        compatible = "qcom,sa8255p-geni-spi";
+        reg = <0x888000 0x4000>;
+        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+               <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
-- 
2.34.1


