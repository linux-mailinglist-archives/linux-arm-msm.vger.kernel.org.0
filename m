Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B481060E588
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 18:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiJZQgx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 12:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiJZQgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 12:36:52 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADCEAC28E
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:36:50 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id c23so10304619qtw.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+O6n1+4Noo4lqABNPcNmHpEdPhT1c2lxt97PdSfadgg=;
        b=lGZQfp2ouRZjOccXJJKrtcDtmvCxmhC4VwWrnGQrDqBqrTinjAK6oSLGGSKU6q8NI/
         D7AkuJQCXxocXdMVUUSeCISSv0e3oMPgAZL3KbzSK3meS7rHCEBrqX0PmzNkRbv8v89v
         p2vZwwfodQZ2d/Ts5lq/OXwA0sYsYzTHtHZGPWZ8JnhsLjaBOJpx7B+V4bfQFaeBKRSx
         Hie6MX+Yvs4Fh9OaK2crkRH8Gs6ikBmlJF2vimFXoAvllkLUe6EIjzbI+1FOH+Pbzu9a
         vb92LPjLoOnXkV122OYrqkjywxDS1AR/kcs0hysf7a0qogvWKgBwPNSSYV6YIwLCxcFY
         8LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O6n1+4Noo4lqABNPcNmHpEdPhT1c2lxt97PdSfadgg=;
        b=lUtwbMS5DyJSYlUw+wm5qqLS0RvtoJ3tyUQqgFf5PTJcVKXHD6Gl4Ato9plWXuYZg0
         ojyhxclderpWMHCz/MI0JRP7y5/PMl1n3p2g9vkcCqldUgLwIhUGWUSEQ6kJkb6ogWZf
         5GRxo9l1uHDu4Dwj6DBUKxptH4D/CP5F9bUM7N1ryw0ZdHuDw36MJHmkpmm7jAz3UfKd
         R+zKGjEe9u7JgaL9cF/Am8zVp8b4z2Wdm6TGVAOgvm2uoHnXXZL7nYXh9a+4Z4eEfNr2
         SRhEIryNDdv70ceKb73riavhD/fMgPnDOa6QrDKaiTyY9GUI2uuRHbfOH+U+FKXMmVpz
         4fxA==
X-Gm-Message-State: ACrzQf29kSeSKfPNsXXD4FBrcjRWSSfBOmNbkPq3kYFWfSE2EFM2t30o
        sA2i5rZTWfcgB25elUepQX7Jmw==
X-Google-Smtp-Source: AMsMyM4nmCswutT+FfSqr7WQOhGm2VmuDShqaCLJO01GoLr+2YAVnpGdHlAlEdTjGAKXzOyAH3aelw==
X-Received: by 2002:a05:622a:5cb:b0:39c:fb06:5f6c with SMTP id d11-20020a05622a05cb00b0039cfb065f6cmr34629412qtb.474.1666802209719;
        Wed, 26 Oct 2022 09:36:49 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a424800b006b949afa980sm4161223qko.56.2022.10.26.09.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 09:36:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] arm64: dts: qcom: sm6125: fix SDHCI CQE reg names
Date:   Wed, 26 Oct 2022 12:36:46 -0400
Message-Id: <20221026163646.37433-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM6125 comes with SDCC (SDHCI controller) v5, so the second range of
registers is cqhci, not core.

Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware, but no practical impact is expected, because
supports-cqe is not defined.
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index af49a748e511..24ee7c0c1195 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -458,7 +458,7 @@ rpm_msg_ram: sram@45f0000 {
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x04744000 0x1000>, <0x04745000 0x1000>;
-			reg-names = "hc", "core";
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

