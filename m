Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C36C6B0B1A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 15:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbjCHO2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 09:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjCHO2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 09:28:09 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6722FC7098
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 06:27:40 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id g3so66602566eda.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678285635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6eWDufY7+zICzKzyI2+VEmOCWAqgAtsARp3qb0zhsY8=;
        b=BbZ8k/NJjVEkIKWYoM90mY7gjrv4bUl1XdxfHAG6Pi0Su+OTW7idKqhV6e0Pjq8ufx
         9KVQq7qXfucc2dvxlDhTg+J/VLx9VjFnNqNyssrrvsPawSv0MIrTlaGMnzgDwgRhFBzg
         OTWG0hvelzCAcDgfVNwjMkQUJIs7GuM7SF6O6MqBB57PJJlBiVC4Uf+SY1q5WpyxOTQx
         KjR3rfVTF/PI/hsKELbOKTB8BHLd5JZWLvycEo8iQmJvo07Ve+uB3FoP5p699G9XG6DK
         s3VjIiTuj5ru68btyODXBVcXf88h64RPo2EY4VaBzGvy2nrYpxPOslpYufM5P0aAAZ15
         gi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678285635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eWDufY7+zICzKzyI2+VEmOCWAqgAtsARp3qb0zhsY8=;
        b=5/wWoknAWucBDyf0ZC6cxEvtOZeP7Q0V/bdWvNgO3kLWVfQyFJq3GX1+qeYDF+93QY
         oLJDEXVGhNqQKWC4sanqusQEzzfieMbmRy8RngWZuh00uL821VDLXoGkgsMqn6mKgT2T
         6llIqT5rmBj2PFghQnL5zMD6wuqTPxswqk5tCIisXqbD8O+pKmUoAqM2Y5pF513u1Rqe
         w3iD2x5LvsS+y0V7UDK0rfnzMBizRAn3qT1UT2bdGMsRuPNr1V0bXPSNEIl4AUZ7JymS
         9Fm66NYet5stAkmHYw+vTFMY040Kr9doHBgCkPUe9jVgz/hBk/0n5N/naWZ27aVF+Vw9
         aCUg==
X-Gm-Message-State: AO0yUKWeUTilWHJAMAuOQ9XWPJoblKzL04s/VGD0zObA9EnJcN88vIaI
        U68ngqWisbX+G5JW7rtoph0NuA==
X-Google-Smtp-Source: AK7set/yMNClsydz5D6EJJmjLHRDwVO5AMyRxnNSFx4c+gK6vbvDUFLhJrXDLDEFGhR5pwi+GZcmkw==
X-Received: by 2002:a17:907:c297:b0:8f6:88b7:73a7 with SMTP id tk23-20020a170907c29700b008f688b773a7mr15975693ejc.7.1678285635284;
        Wed, 08 Mar 2023 06:27:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id p14-20020a170906a00e00b008b1b644c9fbsm7543553ejy.103.2023.03.08.06.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 06:27:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8450-hdk: use recommended drive strength for speaker SD_N
Date:   Wed,  8 Mar 2023 15:27:12 +0100
Message-Id: <20230308142712.277659-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Downstream DTS (and sc8280xp-lenovo-thinkpad-x13s with the same
speakers) uses 16 mA drive strength for the WSA8835 speaker SD_N
reset/shutdown pin.  Use the same for HDK8450, as it is seem the
recommended value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Fixes tag because 4 mA seems to work, so this is just
choosing safer value, based on downstream DTS.
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9fa1a83d9554..e04de4bb7fae 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -754,7 +754,7 @@ &tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio1";
 		function = "gpio";
-		drive-strength = <4>;
+		drive-strength = <16>;
 		bias-disable;
 		output-low;
 	};
@@ -762,7 +762,7 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
 		pins = "gpio89";
 		function = "gpio";
-		drive-strength = <4>;
+		drive-strength = <16>;
 		bias-disable;
 		output-low;
 	};
-- 
2.34.1

