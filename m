Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7F25738F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 16:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbiGMOev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 10:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiGMOev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 10:34:51 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD61433A04
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:34:50 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so3945184pjr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EojiiqnaR1Vv9soFAihFtCV+EF4ew9tNYkxtmv1eok=;
        b=yF01ur2I88yDa32mCYv4eenhFmUAzs9Y5pELgNgyAZI7lHRy1yd0lpdl31fiViswHU
         ZouLyEyPQuRqG0TRkC6nao2r/n4qG0AgC7d+Elq711xNGqlF/G8rfVi5ZgJG3/wREA8j
         W+36NFgQrPayuMmnK816i+J/8qmDDT3XlgpnyF5nL7JxYsPwQQPAgGYmZR6vOQvVDlwX
         mD3nqeQvVtlLcETnbUsYmbklEMBnyPmH/reXSf/BZFpCXZUwru/Onf5sR72wKcr0w+Ns
         KhKLfyc8x7LH+YNyszuaiO83rF71CeA5/oQl256IQq/c/MQY7mg+UzdinOfCj2x9IoNH
         ax3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EojiiqnaR1Vv9soFAihFtCV+EF4ew9tNYkxtmv1eok=;
        b=5iz1C2Ny0VTNSmudenllsb6/t7LMn1FgBxG2VK/DIjVbzg7OfPyly3K+MvJ0D9z+cb
         HFtroQX2sIu1Dq24TxVJfP7rQu5QnDZEB9JxecbKKgn98hrgzUY/Tx8KYNAfFD8te8JJ
         DnAnyq8n1tiq4YeY3tU5uv1eo57DE/lWKJIjHC1fEeFv4TSidSWerkkyAT1UCMnOsTKC
         ga6G0FNKd6YzTCGqjnweTYzQ1p65xF/BorpBMnyQT6lNo3JIiCEhwm8rgz2NwXpiFHVM
         O8v1l4lf4hRbI52W2tGMh0Ocic/MRspR0lE9TgSXRDCqDSwcdmfXo2reZM4NPB3Like9
         x2Wg==
X-Gm-Message-State: AJIora+0oYdDwL3BBdp6SEQt7ijpAZ4pEh0HRdvcREvJ/3foAqnzSIrE
        kyAXUrkv61apkMicuRKd+/YK
X-Google-Smtp-Source: AGRyM1t+5vdlca/j5x85wtZOkOXyR6Zw1Jdx14KpG1VbIXcgYR/E5OG0uRpCCrwYLmM4Mrqv86DE+Q==
X-Received: by 2002:a17:903:32c3:b0:16b:fbc3:3269 with SMTP id i3-20020a17090332c300b0016bfbc33269mr3808418plr.117.1657722890168;
        Wed, 13 Jul 2022 07:34:50 -0700 (PDT)
Received: from localhost.localdomain ([117.248.1.226])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902780e00b001620960f1dfsm8977872pll.198.2022.07.13.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 07:34:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Steve Capper <Steve.Capper@arm.com>
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Fix PMU interrupt
Date:   Wed, 13 Jul 2022 20:04:29 +0530
Message-Id: <20220713143429.22624-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PPI interrupt should be 7 for the PMU.

Cc: Johan Hovold <johan+linaro@kernel.org>
Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Reported-by: Steve Capper <Steve.Capper@arm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 268ab423577a..2d7823cb783c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -477,7 +477,7 @@ memory@80000000 {
 
 	pmu {
 		compatible = "arm,armv8-pmuv3";
-		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	psci {
-- 
2.25.1

