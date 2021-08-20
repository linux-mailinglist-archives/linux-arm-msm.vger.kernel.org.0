Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614023F354B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 22:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239403AbhHTUde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 16:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238656AbhHTUdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 16:33:33 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6208C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Aug 2021 13:32:55 -0700 (PDT)
Received: from localhost.localdomain (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 5922E3F34C;
        Fri, 20 Aug 2021 22:32:53 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Add RPMHCC bindings for SM6350
Date:   Fri, 20 Aug 2021 22:32:42 +0200
Message-Id: <20210820203243.230157-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210820203243.230157-1-konrad.dybcio@somainline.org>
References: <20210820203243.230157-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings and update documentation for clock rpmh driver on SM6350.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9ea0b3f5a4f2..72212970e6f5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,sc8180x-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sdx55-rpmh-clk
+      - qcom,sm6350-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.33.0

