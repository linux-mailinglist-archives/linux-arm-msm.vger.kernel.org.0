Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC99567134
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiGEOfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbiGEOfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:52 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4BE55AE;
        Tue,  5 Jul 2022 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=L3b7ESxd8J38WOrbkezOb890h9QZRy47gWYMihRBj4s=; b=Qoh3NlEMauOM72Um2IRI3XGQQb
        rvppuXLYr8AdwauuhZQi94rN98HJzeDa8KEXhqwQodfT1B0WcEh0svd3kkxHydXJBq6W/+pJoKhlD
        OvAFMY0nx8aDGuZ9StVP8Q67EUwZzpQCSJGohXjSeMEI8Ri2CBC9eTYtJDTSu1zHrCGIZUIkpyXCx
        DVQSFvbmAk8LLKFX4v7ofc1sJkOQ9sMy1HPdhkI+1EwzHdgvrnkHJtqoRvTKkSrGeGRC19yxteWtt
        Kf7rwq5DNsjMnNJBiqTD4vbpR9nSMzXWgXv0CowppKQQmst10vvpYF8m313UXevfv66DnIaKQBKKc
        BM2sPO/w==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeV-007EB6-Uj; Tue, 05 Jul 2022 16:35:47 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 7/8] dt-bindings: arm: cpus: Document "qcom,msm8909-smp" enable-method
Date:   Tue,  5 Jul 2022 16:35:22 +0200
Message-Id: <20220705143523.3390944-8-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
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

MSM8909 is a fairly old 32-bit SoC without PSCI support, so the
additional CPU cores need to be initialized with a custom enable-method.
Fortunately it works just like on MSM8226 and MSM8916 so just add
an additional compatible as alias to the DT schema.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index ed04650291a8..5c2e3a5f3789 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -221,6 +221,7 @@ properties:
           - qcom,kpss-acc-v1
           - qcom,kpss-acc-v2
           - qcom,msm8226-smp
+          - qcom,msm8909-smp
           # Only valid on ARM 32-bit, see above for ARM v8 64-bit
           - qcom,msm8916-smp
           - renesas,apmu
-- 
2.30.2

