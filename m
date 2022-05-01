Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7828D516793
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 21:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354247AbiEATyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 15:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343530AbiEATyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 15:54:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5218764F3
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 12:50:45 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bq30so22304463lfb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 12:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jE9/PuboFb14GuqBHx68eAuJAQOqszMkhKSR3ms+SBs=;
        b=AqxjtyZVbCyvcvsdm+8xAIyecrmYiKKjjMpQqP4yRWBljnVSbvWH4y81dTL4dk8ebY
         ykZSkARM1U3XjBAfHASS2BUJLcDht0j0Y5Cl/VxlLsZ5O0In7TnAoAY64Z82LrY0uobO
         49zlesbO0OEnK/5Z2SO3mHE2387A1DjCfcGpGt+eagghG5ZQVa5fb2uHXombpL7RNMWJ
         QI7GyMBXx86qln5yAcN6SaXfSqKVjkniMeTUbqvdjI+oXE6yKmkqLJuPR3d5mYWhaleV
         aV2UJGBdpsfX7GOGFBFVsbpwd/HBktJzKfmLYca5KpRtQHr0swn0ZQoY5ZpvVpfeM5+G
         +Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jE9/PuboFb14GuqBHx68eAuJAQOqszMkhKSR3ms+SBs=;
        b=bzATfFOS0rO/8/W5CjR9a1eZ2CeT16f1fxd3SHDoq3kyHFgFLbOsp3wCGe7DP+l9/D
         vhDMzG4Y4FES3fI+okytcmjiJW5iB6pIWCpfZBRSpVj2XEN198081gCT+3wjUiFwORvF
         taIz1v7+7quNJ80A6EFfQXJpUTay1siKGYtBZKu+06EwEW+13UHFYCEQpldih+5uzPBc
         BcMVXJbtMbUbjUKgQEnJtPMhUdzOpb3DYDIXY+W168a0qnzsGz3lRgmq2aDIkUhlgljV
         EjYqrD2V1K3swT5dBYnpd+r8ChIHmnx29GvKvKG9eknFlqWQ7zzT99lfftb3BGW6nngc
         attw==
X-Gm-Message-State: AOAM530Tnd0wIIzBLxvTnBt5mghulDMRUC6piyaLNnANwG/mx63dt2LF
        bgzjtYwQSfXI1Jg4eNs74mQEZQ==
X-Google-Smtp-Source: ABdhPJwR5+Bc+l03QD4BQO5bezmcSXhPsN5/kj3iF3ZB4B+oJmQb9xRhTcJ1k/WZAH2mGEMLPxIpaA==
X-Received: by 2002:ac2:48a7:0:b0:472:18b:a477 with SMTP id u7-20020ac248a7000000b00472018ba477mr7223973lfg.404.1651434643727;
        Sun, 01 May 2022 12:50:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p8-20020a2eba08000000b0024f3d1daec3sm869162lja.75.2022.05.01.12.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 12:50:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] arm64: dts: qcom: add ITS device tree node
Date:   Sun,  1 May 2022 22:50:42 +0300
Message-Id: <20220501195042.4132724-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node corresponding to the ITS part of GICv3.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 3e4c710d3275..4fcb6e2b096b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2865,6 +2865,9 @@ apps_smmu: iommu@15000000 {
 
 		intc: interrupt-controller@17100000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			#redistributor-regions = <1>;
@@ -2872,6 +2875,13 @@ intc: interrupt-controller@17100000 {
 			reg = <0x0 0x17100000 0x0 0x10000>,     /* GICD */
 			      <0x0 0x17180000 0x0 0x200000>;    /* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+			gic_its: msi-controller@17140000 {
+				compatible = "arm,gic-v3-its";
+				msi-controller;
+				#msi-cells = <1>;
+				reg = <0x0 0x17140000 0x0 0x20000>;
+			};
 		};
 
 		timer@17420000 {
-- 
2.35.1

