Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38FD05689C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 15:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbiGFNmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 09:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233617AbiGFNmW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 09:42:22 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9514425E85;
        Wed,  6 Jul 2022 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=utAtQv4SqbiUynayumHMkkGjOVv7dPJdD+8PTBd8DII=; b=ZzNg/eMhPxg1FEQAwGadfaOjs/
        KNQtsm1KCXYdNudxnncj9xz0RjGOGktD9Q0ZOQhVdrC/gVnQPIfzmhGPnCQCTLHKX0MDpfpUjjKsI
        TbsGyliDvmZVqasZx95fIDajYiuFSm+Ja/4SlVFTkiUdpEBAijE6sSAyJxjcUKSS1gVsP3ReebxDy
        6ZgTG/ahN72qQ2qsOIFtQpUlENgDfYqMYvtOakaf7p/pB2LAdBJCNaMm1ZYvt0q0pujVZlA9FHJ86
        dmGmiOHRPpTLShObqgxtBCh18Eo43yM7WIY8w/A4n/M/2i1Q8LXVj691ZOcFVExH6zM2FsoQVFc5J
        I/S42NAQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o95I9-007M5K-8y; Wed, 06 Jul 2022 15:42:09 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/6] dt-bindings: clock: qcom,rpmcc: Add MSM8909
Date:   Wed,  6 Jul 2022 15:41:31 +0200
Message-Id: <20220706134132.3623415-6-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
References: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the "qcom,rpmcc-msm8909" compatible for the clocks available
via the RPM on the MSM8909 SoC.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2: Add Krzysztof's Acked-by
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index 9d296b89a8d0..8bbb370198dc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,rpmcc-mdm9607
           - qcom,rpmcc-msm8226
           - qcom,rpmcc-msm8660
+          - qcom,rpmcc-msm8909
           - qcom,rpmcc-msm8916
           - qcom,rpmcc-msm8936
           - qcom,rpmcc-msm8953
-- 
2.30.2

