Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296C444F620
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhKNBcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:32:51 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:60257 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhKNBcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:32:51 -0500
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 37E3B3E905;
        Sun, 14 Nov 2021 02:29:56 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: qcom: llcc-qcom: Add SM8350 compatible and defines
Date:   Sun, 14 Nov 2021 02:29:38 +0100
Message-Id: <20211114012940.112864-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatible string for SM8350 and add required defines to the
binding.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
 include/linux/soc/qcom/llcc-qcom.h                       | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index e12fc7999356..c0ea3df2d2ce 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,sm6350-llcc
       - qcom,sm8150-llcc
       - qcom,sm8250-llcc
+      - qcom,sm8350-llcc
 
   reg:
     items:
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 437c9df13229..bf8b749b44e1 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -33,6 +33,10 @@
 #define LLCC_MODPE       29
 #define LLCC_APTCM       30
 #define LLCC_WRCACHE     31
+#define LLCC_CVPFW       32
+#define LLCC_CPUSS1      33
+#define LLCC_CPUHWT      36
+
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor
-- 
2.33.1

