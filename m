Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60AE37F2C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 08:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhEMGI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 02:08:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230244AbhEMGIZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 02:08:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E60D61287;
        Thu, 13 May 2021 06:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620886035;
        bh=oqZQusK/WVRrFCtgfoMfc39A2AtVcjpu676GMv7v+0w=;
        h=From:To:Cc:Subject:Date:From;
        b=dpnqn/fnOFj8PmGhJHmRPoREgcOslxYMHzHTK5lBMvJDstow+5rRmcQ9/M4a36Icc
         DH4OO7V9kkqAUOgU7vTpqobQQaiGoXAr4ORdZAhFgbriG1Fq1HHqQxdEhwWFzf/LYR
         InrlPSYuJ9/+mEx4IAz6QXuLl2byAtEkqO6TUpzrtgx88nrFZy3zPmw2VuBuEaI5k8
         4Y1FEcBI5fFxyN507G3juRU7z8vNNIVPq2qH1T6T4a1jA8GOcltk/iVzphAiabceL2
         Xbbz4XyejybChW486cF1IrheBJAlUBkIzt4b99jO8WqS0JLV+4SRA/Q5hM7EDLry/Y
         THPE4XYKs1Cug==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: sm8350: use interconnect enums
Date:   Thu, 13 May 2021 11:37:05 +0530
Message-Id: <20210513060705.382184-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect enums instead of numbers now that interconnect is in
mainline.

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes in v2:
  - add missing include for header qcom,sm8350.h

 arch/arm64/boot/dts/qcom/sm8350.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ed0b51bc03ea..cdeea45a2b2c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -656,7 +657,7 @@ mpss: remoteproc@4080000 {
 					<&rpmhpd 12>;
 			power-domain-names = "load_state", "cx", "mss";
 
-			interconnects = <&mc_virt 0 &mc_virt 1>;
+			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
 
 			memory-region = <&pil_modem_mem>;
 
@@ -1063,7 +1064,7 @@ cdsp: remoteproc@98900000 {
 					<&rpmhpd 10>;
 			power-domain-names = "load_state", "cx", "mxc";
 
-			interconnects = <&compute_noc 1 &mc_virt 1>;
+			interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
 
 			memory-region = <&pil_cdsp_mem>;
 
-- 
2.26.3

