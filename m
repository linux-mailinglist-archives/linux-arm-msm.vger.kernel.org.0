Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7810547762
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jun 2022 21:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbiFKT6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jun 2022 15:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbiFKT6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jun 2022 15:58:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B5B369C4
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jun 2022 12:58:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id j20so2392037ljg.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jun 2022 12:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxQkwpPSC0y6PSBnoCHGL4044465zqiVx70IXoXpvOc=;
        b=BHkKobmasFZUBwncc9LygpAPBRmbKMJOq3yO/P8De5qhIRgAOZgUPRaJ+wFyzFAGaz
         NpSJYJLa/f5h4etHmJe5dy92Di1ZF1fWOdOrbckf67s7wpYN3gyQQThSEB2wMFfm4zX+
         RP1z9RUvbI+CAcx2psfP5l0p4YU1p1NP4OkE4eswC9k3wz7wtA42nq4lbUk8NTVogHhl
         3yYHIdzkHfRxZdt6mniJOHr3waqXHkZuMjGYiL3GAr9/uALlUqPQyTZDn4HTXwwd0Njd
         AlmxFA+Zw4BEM63KkHT2Tf/We3UUqYpNJnfx/rsrxq33Q2FR/gC8VtXl8lsRQZ8LfWx5
         L2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxQkwpPSC0y6PSBnoCHGL4044465zqiVx70IXoXpvOc=;
        b=rL+kD0SmsggH6PBJPEmqoMo0yY7UuMz/LiFgy7hebrM1Ro+k5Wf3uGkTZvdFVRZZr5
         QkWxzEgkoFL3vg93nUpaGDycNDtAmUjXfDwtGSK9qZLJxt7Y8KbKZQQeRLG4fMaQw60R
         t4P2pWxMkP+EK0LeA9GJC29a2lXPs5ZsHvGot+hGoGepH24eXPIzqvB9eFt7hLri7FRK
         IGIxbrwbMbJ6+HP/lDuGL0HKEN5pMg75olKJGJnhUNxtkvGDmSZ8vB75444P9IA8tPlq
         XJZfXrvsie2VM7PRSrCn7h9GVf1s8jAjU8peTBicH7/SCqGk2j97P9Ti3XYQEnoirbe6
         meZA==
X-Gm-Message-State: AOAM530aWO0ZhqUtKVi6ij/fXOkPwNJHc3SF2cHIWZ7AoQ0rBIf7S7Ol
        09ydYQqnsIGq3BDO6R8saZ9aTw==
X-Google-Smtp-Source: ABdhPJwcAibQ8M+9PY44AHNLQKkTKnNNepX/fDokdOIeO0ZAKvSmcH3oc9JG/OaBl8CiQrgcVHYE3Q==
X-Received: by 2002:a2e:968a:0:b0:258:e311:ca01 with SMTP id q10-20020a2e968a000000b00258e311ca01mr6274999lji.337.1654977480161;
        Sat, 11 Jun 2022 12:58:00 -0700 (PDT)
Received: from localhost.localdomain (78-107-206-185.broadband.corbina.ru. [78.107.206.185])
        by smtp.googlemail.com with ESMTPSA id v30-20020a056512049e00b00479526185a0sm364948lfq.118.2022.06.11.12.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 12:57:59 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vinod.koul@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404: fix default pinctrl settings for blsp1_spi1
Date:   Sat, 11 Jun 2022 22:57:13 +0300
Message-Id: <20220611195713.131597-1-andrey.konovalov@linaro.org>
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

The current settings refer to "blsp_spi1" function which isn't defined.
For this reason an attempt to enable blsp1_spi1 interface results in
the probe failure below:

[    3.492900] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
[    3.502460] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
[    3.517725] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
[    3.532998] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
[    3.548277] spi_qup: probe of 78b6000.spi failed with error -22

Fix this by making the functions used in qcs404.dtsi to match the contents
of drivers/pinctrl/qcom/pinctrl-qcs404.c.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index d912166b7552..0d9e1f19aa67 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -669,8 +669,25 @@ blsp1_spi0_default: blsp1-spi0-default {
 			};
 
 			blsp1_spi1_default: blsp1-spi1-default {
-				pins = "gpio22", "gpio23", "gpio24", "gpio25";
-				function = "blsp_spi1";
+				mosi {
+					pins = "gpio22";
+					function = "blsp_spi_mosi_a1";
+				};
+
+				miso {
+					pins = "gpio23";
+					function = "blsp_spi_miso_a1";
+				};
+
+				cs_n {
+					pins = "gpio24";
+					function = "blsp_spi_cs_n_a1";
+				};
+
+				clk {
+					pins = "gpio25";
+					function = "blsp_spi_clk_a1";
+				};
 			};
 
 			blsp1_spi2_default: blsp1-spi2-default {
-- 
2.25.1

