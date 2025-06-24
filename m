Return-Path: <linux-arm-msm+bounces-62153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C6AE5C74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3828D1897F8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC362472A0;
	Tue, 24 Jun 2025 06:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqBAxHyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF824679B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745101; cv=none; b=u1oQCV385PUUyjiGjoTgYi6N3e4sTwHFlCSjX1WAGNG9bofZIaJ/z4/AtQ1OEFhACi3AVJf+Onq5oSPqQ6rHMZumBFWLHSNApkgprcdsPgGN7UgNbgGMzozlmOM7GmBR1tgQVfqaL/tJyFVZh00VmcC7LNcc6EVzEiVi79pwCPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745101; c=relaxed/simple;
	bh=/g0/ZP4wHtHkgn87d1qyuSHaHZRS6iAOtiw3E5bQBKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KMtzHm6xGKRBSthx7pw9YYHKGRYBMEujki8ozfnPws4/6WF+6Z2jOye2MTisz3nhm5e1WegTgKIRZXzD7mzK61eI9IGZbZESGsOF5263NX+tJhlYj9B55yW52K/R58Z8C/5yA0DF/cibrLw3alfBJUkrPk+8TrHNRAgkCQSnwxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqBAxHyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlAOH012128
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=nqBAxHyDFBaUQe7lELFAaV1X57k
	iE3MPmBjSgHZOhVws0HedSNThOc94RrczqMNOIuhdwd7kagpGwcFwAHH7vGMcAih
	NC2JxpwX2Y8fpw+gUeLtSb5XckodLvlB4xd6BDvA7vccfbnYSS+W4O8r4kg7Jbnx
	AQqB0DULZBJja8EvHvxM50WMpurVsl4kFY9zDW8vnGcf0aQ/ScFMnwjqFAsT/IfT
	D9Uy1qzGcN/HEgta/a8i3DCYRzTDG2wpwjXR0Pjx+DOJ50eb6TmFhL3vJ4s5y5S5
	bWL36NN2nF5fIgw5O5SEZ881FFrG+PE5UgxxcUrXHL3jcnjfrxqUez2eYyg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1sfby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31f4a9f67cso4371221a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745098; x=1751349898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=o8x00ODVyhWVcG/mFN9HKUqtq+mNWlKGgoIHrXCJR45BAALLh5lcX3O6K/okk75xwb
         T4n6cL7nAvtKElHz0FJvrj10yqozw5SrHT+1+HKiOHl/ec19+h4gzcOtWmdFmOcrhzID
         iSjjUWVbP8hB8917Cane/D7XCUJ6oOymYtAkzZSSdmvPl7sVJ1xbZ8pUuCwTHdK98wyR
         Zz2KvgfwUSZaigZqn0RLDzaGUtnYfDbDrY9ZWFJvfe6qAcelXYDVkzjTYWMk2AbxTb9i
         qF4wPf1c76MLg2a5xN7IPKcbnP4TBcOm4bJprPEiil7T8VQ+pPHek/l6EyYuwVdUHZwm
         X9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtaB8JFGLYTvcM+sM2qQ1hchEnKN7nXBqz91qk88HFHAbs1NsGPeRD7epKRecNKF8gDhsE5VtUjz7+N/t4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Q8CaiRRRNXqJxfC6zFit5nl1i/7WXN0ndko2Mqc2DGa/Eh6C
	cH/dlSXSCPTQ1DDksoI/86LykLCq4YxnRtGZjrFn6EJ23ybf2hNoQpS+vfgfQ0cza/nN8s60fgS
	1BItqXluapK3UzgtIUek4eq35lfaXgkLk/TOZPUeWYE/QHjsBUuQB1KXyW8HZf3XLTARq
X-Gm-Gg: ASbGncvCby8HUuW4YZxrryBO2i9su0Fs5AfbhZ4yba4J8RdCvaYiZTamhV4RimVd0Mt
	hL1OPDf8g0IpmhfaV3UhUd3gcecNYcyKXE34v5yukmn+ec2+DmqiUe4+qyef4H+KBglxl556e2j
	RA9pbbY1oVXpfKlwcWKGEOSwQNIgMuf2JKWIupY4zrzo0JJvldHVYaAkzA3ehSJ+aBtvKu/pbhr
	UqCnovjV5eCVkiFFGjW12svi+lQw3dF4/ftNJQBvhwu9tYj6FK+RFWFKa6DCu66pGOSPFpQMwcv
	zLpI0qOQXn3hjWE4QUEcZTpSNxQc5XQjEOjlPcDqIpxhyu43zt+WSH667aQvkaKfdl8OuWTqKu9
	PNQ==
X-Received: by 2002:a17:902:ce0c:b0:235:15f5:cc30 with SMTP id d9443c01a7336-237d97d1abamr276912085ad.16.1750745097808;
        Mon, 23 Jun 2025 23:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkSv1e6yZscpoifQQotP3Hcj8oMsbM5jLX5umPQVB1S7t8NeSUBaboum0YltNjUtaGRZQVxQ==
X-Received: by 2002:a17:902:ce0c:b0:235:15f5:cc30 with SMTP id d9443c01a7336-237d97d1abamr276911685ad.16.1750745097450;
        Mon, 23 Jun 2025 23:04:57 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/10] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Tue, 24 Jun 2025 14:04:31 +0800
Message-Id: <20250624060438.7469-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a400b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Q8gcoySYHcJanKXnUck8YGSWw2MQhSKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX78Zs0dw1y0EI
 HknPHQ+6VBSMdYtK6KhKPfAYbTgMnAcjMKesyov1opwBDiPSwz2ELvfrAO17OXCFG+6okVbl8EV
 5MxOPTmW9RUhqKk4O4y8AqPYk30bZDBMz085dk91ej7dY1YBT3WdaS90YxQy0GNF3Wdj1TG08G9
 hoEyQlGy3jCP+KyEIgbHM2xSo0M6GB4MRh5CaXB4cHltv+6nUkaBKt0sVYSXEysSJXPvIfP0SVc
 h/Fn9dGguhKuczooeZ9z5I1qo9nsVMFYMe4YIdoOiT73SrQHIVQeoqiDScStsiSjU77bC1Wwg0/
 D6sXhUsmCrh6SCSEKdAku4HILyABwGd18G21ERjdiZmY1T6ro/RhHcZOzwoNOUsW6KetmKwsJt0
 9rzJ5ddrZ7aC02ZK1cu0TsP+emKL7tqbIBTV6BX2XyHlMkpb9Hqve5ho364sQ2eUBXnL52NV
X-Proofpoint-ORIG-GUID: Q8gcoySYHcJanKXnUck8YGSWw2MQhSKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050

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


