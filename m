Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8B56E837B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbjDSVU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbjDSVTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:54 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E8D7D92
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:28 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u3so1536743ejj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939168; x=1684531168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV3WWTI6GB2UlbmqWPXHYuAERKFaJ5yLwZ7zQAEmSCc=;
        b=QxlvU7YjTqZ8QW0ZMYPidvVtlc+7O6BYyB2BdqZZD1mix5htxage567JHDqbj9qMP+
         3UQb6/Y/Ef0SScm48Xw2nfs65zIXEJK38yBnEvUTZyHSsO6lopAc8D459ftN32D4p6eB
         B1qOyipY1j3KwxvTq3t/VXn7Dv3LAjLr+ZcRkn3eIsXUNutZuAYIa8i1OsGzfqcuUCtj
         Zj/BSkuHjQ2kfx9fSy2/r2EDoY4W0E/UUXirHS+KYiYLMdZb/Td/B5+k4tcVcrvXp5rg
         VbLT0C+RCIC55uQPIuji9EtHGuKE0+UfVrjm6AZK8zkUM/CAPWsN/WHcg/tTbp/UPbK8
         2wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939168; x=1684531168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV3WWTI6GB2UlbmqWPXHYuAERKFaJ5yLwZ7zQAEmSCc=;
        b=j0FJPOHWa6BF0Xl8wskTMyGdI2nwi5dYsP6/obzJY0oEURXX9jADm3BxlpisLdIxnc
         Rg1Q9EvVNPyafcJwg3MGP/jmtd4VyThinvT8nGDowa+rhzZQDToEZ9733beUxKOwg6sS
         62lXAYC90quyoOl/P9Ayy+39c1KgQUhV8Rdk1hcZ1+gnDWeahs2pCtFa1Y72QfxJTHRW
         FU6ECyucDDL2+VSk5Y63FNpgSP9A1qPybhtGV4kgMgLk9j+WaMFLZzT21Fo2u/yR5fbd
         /42ujNfGw5eUsLz3y/keByhv7wJs87JBct021/Tik72k0iht6AnY45+AKYgQJ3c2aNgd
         mYmA==
X-Gm-Message-State: AAQBX9cE1zHUk9givHDq6epS8RUKgJLQXIKlzwM9BUO/4Lugrln/QIUW
        69Lp2N+Mm+5BNrOr2sPya7xBlA==
X-Google-Smtp-Source: AKy350Yu+/VW8kcGPFu+/SVJmKIcHBwblGAu941DbwWayz8Fd8HeeRYZBIXGajjbluqejjup52JZpw==
X-Received: by 2002:a17:906:a84:b0:94f:62a2:d1ab with SMTP id y4-20020a1709060a8400b0094f62a2d1abmr12495900ejf.63.1681939168162;
        Wed, 19 Apr 2023 14:19:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 18/18] arm64: dts: qcom: sdm845-polaris: add missing touchscreen child node reg
Date:   Wed, 19 Apr 2023 23:18:56 +0200
Message-Id: <20230419211856.79332-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing reg property to touchscreen child node to fix dtbs W=1 warnings:

  Warning (unit_address_vs_reg): /soc@0/geniqup@ac0000/i2c@a98000/touchscreen@20/rmi4-f12@12: node has a unit name, but no reg or ranges property

Fixes: be497abe19bf ("arm64: dts: qcom: Add support for Xiaomi Mi Mix2s")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 8ae0ffccaab2..576f0421824f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -483,6 +483,7 @@ rmi4-f01@1 {
 		};
 
 		rmi4-f12@12 {
+			reg = <0x12>;
 			syna,rezero-wait-ms = <0xc8>;
 			syna,clip-x-high = <0x438>;
 			syna,clip-y-high = <0x870>;
-- 
2.34.1

