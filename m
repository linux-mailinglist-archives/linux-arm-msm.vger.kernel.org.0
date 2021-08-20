Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28AD3F3545
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 22:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240412AbhHTUcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 16:32:04 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:53671 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240052AbhHTUcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 16:32:00 -0400
Received: from localhost.localdomain (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 1EF473EB9F;
        Fri, 20 Aug 2021 22:31:20 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 6/6] dt-bindings: mailbox: qcom-ipcc: Add compatible for SM6350
Date:   Fri, 20 Aug 2021 22:31:05 +0200
Message-Id: <20210820203105.229764-7-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210820203105.229764-1-konrad.dybcio@somainline.org>
References: <20210820203105.229764-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add IPCC compatible for SM6350 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index b222f993b232..866efb278813 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sm6350-ipcc
           - qcom,sm8250-ipcc
           - qcom,sm8350-ipcc
           - qcom,sc7280-ipcc
-- 
2.33.0

