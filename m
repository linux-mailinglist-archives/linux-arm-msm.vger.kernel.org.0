Return-Path: <linux-arm-msm+bounces-2236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 143647FB619
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4645C1C210F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E6D4A9A5;
	Tue, 28 Nov 2023 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.b="EnGpX4BS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC64DA;
	Tue, 28 Nov 2023 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kernkonzept.com; s=mx1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description;
	bh=9KbMf3Wwnz9sl7k+vIjP8ILlV978ueS9S52e5elZ8v4=; b=EnGpX4BSGQGYxrkUjnp4HZ7vuJ
	KXHqjdo7zMpLvgfrse5dFNZ3GwWlBk+9fT8aEUQNJkOJ1RcV5tLWxy4jXjqFmPv+wSdcQWeDMeePw
	VyZtasf7k/IibR+6p3wlLXstwhQwRAoooJqa273CGJMvIIQ+Me/F1ZNSqBiGy0xe6DgyY4xtobjsy
	FKZ20e+mLTkbFh5Zb1hZRucA0d45LwXlIOk18+VVsdz4gQ+yzRe2+YSFtER8gRscG0hfHV6fDVgV/
	BxYLUd4dWf+C3uFVgHMeCawSziU1FPy5BU3pzOA79OfMVE1ZjJtT2EYXi4SZyZQkmeU4x5JpmAMCc
	KgsEaWug==;
Received: from [10.22.3.24] (helo=serv1.dd1.int.kernkonzept.com)
	by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
	id 1r7ud0-008PbT-2K;
	Tue, 28 Nov 2023 10:43:38 +0100
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Date: Tue, 28 Nov 2023 10:43:32 +0100
Subject: [PATCH 1/2] dt-bindings: serial: qcom,msm-uartdm: Vote for shared
 resources
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-serial-msm-dvfs-v1-1-4f290d20a4be@kernkonzept.com>
References: <20231128-serial-msm-dvfs-v1-0-4f290d20a4be@kernkonzept.com>
In-Reply-To: <20231128-serial-msm-dvfs-v1-0-4f290d20a4be@kernkonzept.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
X-Mailer: b4 0.12.4

Document power-domains, operating-points-v2 and interconnects to allow
making performance state votes for certain clock frequencies of the UART
DM controller. The interconnect path to DRAM is needed when UART DM is
used together with a DMA engine.

Voting for these shared resources is necessary to guarantee performance
with power management enabled. Otherwise these resources might run at
minimal performance state which is not sufficient for certain UART
baud rates.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 .../devicetree/bindings/serial/qcom,msm-uartdm.yaml         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
index ee52bf8e8917..e0fa363ad7e2 100644
--- a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
@@ -48,9 +48,17 @@ properties:
       - const: tx
       - const: rx
 
+  interconnects:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
+  operating-points-v2: true
+
+  power-domains:
+    maxItems: 1
+
   qcom,rx-crci:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -99,7 +107,9 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interconnect/qcom,msm8996.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
 
     serial@f991e000 {
         compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
@@ -109,4 +119,7 @@ examples:
         clock-names = "core", "iface";
         dmas = <&dma0 0>, <&dma0 1>;
         dma-names = "tx", "rx";
+        power-domains = <&rpmpd MSM8996_VDDCX>;
+        operating-points-v2 = <&uart_opp_table>;
+        interconnects = <&pnoc MASTER_BLSP_1 &bimc SLAVE_EBI_CH0>;
     };

-- 
2.39.2


