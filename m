Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7C61D2E4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgENL30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgENL3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:29:25 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF76C061A0F;
        Thu, 14 May 2020 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589455762;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=kyqOTIgPY2FVYUkrxJxirXO096mc9FcXhI5LqXF8Ed0=;
        b=s0A9XXQzST1w2MXj+JRl8pyDZvPP+et884Y447ZG86HWFWxFsBi0qxLi6+8M2VT97l
        gwYvbbZnnb94V64lTC7GYF+SQqt8pj3adk3hpRpANPSSp410hr7Urlrb1FckmDjosF9j
        zLHHYHjA0aUL4+1PXWCK3Bs/1Kj4kJuAar+t1k/8cx/8qZAOhCFlu4tAQALtHU3ncUaN
        0vYTpK/dM00QkcqC7mjJyBRgQGUJntQv+jykst+JmAm/c/ffYUryQQPmbkavoYJnnOv0
        xWdm2Z0ATeIa2bMcuJUY9pz58VV3J04TE4bDp09jyIchyizk4+vd+iCKoSFp9YQ+k3Wa
        k6iw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw4EBTKHex
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 14 May 2020 13:29:20 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/3] arm64: dts: qcom: msm8916: move gpu opp table to gpu node
Date:   Thu, 14 May 2020 13:27:53 +0200
Message-Id: <20200514112754.148919-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514112754.148919-1-stephan@gerhold.net>
References: <20200514112754.148919-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In msm8916.dtsi the GPU OPP table is defined under the root node,
whereas in msm8996.dtsi/sdm845.dtsi it is a subnode of the gpu device
(which makes it easier to find).

Move it to the gpu device node to make this consistent.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 69129c0b20aa..32bd140ac9fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -358,17 +358,6 @@ opp-998400000 {
 		};
 	};
 
-	gpu_opp_table: gpu-opp-table {
-		compatible = "operating-points-v2";
-
-		opp-400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-		};
-		opp-19200000 {
-			opp-hz = /bits/ 64 <19200000>;
-		};
-	};
-
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
@@ -989,6 +978,17 @@ gpu@1c00000 {
 			power-domains = <&gcc OXILI_GDSC>;
 			operating-points-v2 = <&gpu_opp_table>;
 			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+				};
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+				};
+			};
 		};
 
 		mdss: mdss@1a00000 {
-- 
2.26.2

