Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B976A81B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 12:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjCBL6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 06:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCBL6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 06:58:31 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42783A5DA
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 03:58:02 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q16so16289697wrw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677758272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMSOEYbZIrYW4LAXPSptDIJKdwkIcCT5i6XvEkOqxb4=;
        b=kNFPYwq+OUk2zmd8+vPXJWTNCjypK01F2P9d3hlHy3WuO//IsA3S08rDSXdGY7To9O
         KfYJqcoEQ6GDYv6U7SdsBo3W9MUo6YMk4NvXphh1sAUpfqISaHkLUc01Q7PmkYuCRky5
         xk1cNsLG5oIX5C+Bd7zRtCkikPGEjp5wSrnfYkRnenIGMvaOy0vZsU5JaWjrDvvBnCfc
         BkRdI+Qekw7Bd/AJCjHhCn/RBtqp/Fnk9K3uhd2RM3yp/8VSywulWeVkN5SqFcII5d56
         0MzHozrkGjl0+60luTnRpN1ed3LlxGNufu4vdz0aapV91o82pdF5mQlLJ3M1/vc5yI9z
         EReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677758272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMSOEYbZIrYW4LAXPSptDIJKdwkIcCT5i6XvEkOqxb4=;
        b=MWoutXAfpmbIbydrVgDG1ltVzPhCXzWMWLLxJAXd0K3eDzvBXDGF5Stzzwj5IcD3QL
         amXECqHBzMV7oG5NOhTwHnp0ngfHiY3HtD4LGzDMHIS/cb9Wchwnc3M+v2frrWhYbYh0
         Dnw3fYxpp7OrlVNVmc30ePhUB7adBB1dtwXFS1CxviB6pANYhdNC3K0BpOdSuikU5mT8
         S2FPTGniiwIgMx7IzSU1f1PW0XpiqwLRXFITFrjXjd09DY40qPtSQtEEwDPvR7YfiwLp
         E21fKxiaeOBQmIOLu6fkxdun20AWXrJ/88/wjnRhSalHnkPVO0BQ9t5ATOIVOHgDjTxi
         umNw==
X-Gm-Message-State: AO0yUKUKdcZdLWrjZh8P+BJNo3i5mEYOz/vXFxcBAtALFygaQb0z7RlR
        fqgJicXZ1SX2oRgTfkcnNT56WQ==
X-Google-Smtp-Source: AK7set9VFtG8k2kTb72OmJCbkeTB+4vzeUCKgK+4G8gPwjoZDyQhSnddGv1DN8XaxM1PT27nTtFUug==
X-Received: by 2002:a5d:42d2:0:b0:2cd:bc79:5432 with SMTP id t18-20020a5d42d2000000b002cdbc795432mr3912555wrr.25.1677758271927;
        Thu, 02 Mar 2023 03:57:51 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4a50000000b002c5526234d2sm15298209wrs.8.2023.03.02.03.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 03:57:51 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sc8280xp: fix lpass tx macro clocks
Date:   Thu,  2 Mar 2023 11:57:39 +0000
Message-Id: <20230302115741.7726-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230302115741.7726-1-srinivas.kandagatla@linaro.org>
References: <20230302115741.7726-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tx macro soundwire clock is for some reason is incorrectly assigned to
va macro, fix this and use tx macro clock instead.

Fixes: 1749a8ae49a3 ("arm64: dts: qcom: sc8280xp: add SoundWire and LPASS")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 022b0c041341..fc1504de6890 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2020,7 +2020,7 @@
 					      <&intc GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "core", "wake";
 
-			clocks = <&vamacro>;
+			clocks = <&txmacro>;
 			clock-names = "iface";
 			label = "TX";
 			#sound-dai-cells = <1>;
-- 
2.21.0

