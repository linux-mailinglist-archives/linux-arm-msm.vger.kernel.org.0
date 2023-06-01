Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD3C71A264
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 17:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbjFAPU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 11:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbjFAPUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 11:20:47 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AB219F
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 08:20:37 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so1445799a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685632836; x=1688224836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BkgUgrpwwxa79E2joMX5PCkdnw3FEmz5/0UeRIQYLVE=;
        b=P633ue8sHaY7BHRgYVc7juuqy0oe9r2WhMKEdB11z0z/6xOjNJVCssxN2oaSiP87hf
         Z7246lLMyd9l8YiHhf8ErlrYNk89w7EJD1EWW3VOFIRe14v7tLvVyG8kTGza8NuM+g3J
         DJ1PiTLiiIO9pxNyr7e8MWZCR9KkZaCdacfZw6MkiXWkLsNOfyA0jhrFDi2ZacNT2O3e
         CWU1jOuWiihcCJOdMnqh7eCCpLNPVjGO/+UKQ7XbcNvXOW9XpfJBs9P/Q5+lrbMgK2ZT
         SqdYOiXRISXxvSyDQUNstJCQ+9cKt8j+86sdWA2OHF690cFGubfFTYHH4SZuk54li6fd
         CT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685632836; x=1688224836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkgUgrpwwxa79E2joMX5PCkdnw3FEmz5/0UeRIQYLVE=;
        b=A67oFtuDxOtwQtsm556C4my362Yeicb0N9dOB52Zc17jiSRKcdrQLY8Eckhy55kGUb
         qB21AgJ7CsDQ1WTBsHWnNws7XcDLbhug7+K/kZI6plcp+gMftn21ct5ayypSIrOzbjEV
         t1B+KxsECV90Y3GHWZ2pyZbIzFFUUmZMBPtabgKNeNA1lvngn7u0PurDT266OZwjc94n
         QOvoJAiD82Sw1rgEePS0Sa5wopFd83VQ5vkx8C0nk4ejw8UwkVONmrFCvsoIUIrfpXC6
         bw1+QMwUdLGIkudFJxrQ7Wa4Y5oHLDc1Fgi177hwVVh7uNyIgHzaz4BZiDmS71BvKeQr
         JoNw==
X-Gm-Message-State: AC+VfDxfq7mwxpEJf9fo3tSqG87RroJ/yIlr6C+MtAeb3n5lDBQMBzAp
        UW1x9N8ZtbxWltFDnjuga/kmBQ==
X-Google-Smtp-Source: ACHHUZ7+sNgPkjN3e1dqjJA7PlmTAc8/cPlgCrX0tpo4wDYy5GnPEr/Uiaj7gRM7574oJNLRCQMNqw==
X-Received: by 2002:a05:6402:6d4:b0:514:9528:6e6f with SMTP id n20-20020a05640206d400b0051495286e6fmr192608edy.7.1685632835839;
        Thu, 01 Jun 2023 08:20:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402160e00b0051422f31b1bsm7298664edv.63.2023.06.01.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 08:20:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] pinctrl: qcom: qdf2xxx: drop ACPI_PTR
Date:   Thu,  1 Jun 2023 17:20:19 +0200
Message-Id: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Driver can bind only via ACPI matching and acpi_device_id is there
unconditionally, so drop useless ACPI_PTR() macro.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
index b0f1b3dc6831..b5808fcfb13c 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
@@ -142,7 +142,7 @@ MODULE_DEVICE_TABLE(acpi, qdf2xxx_acpi_ids);
 static struct platform_driver qdf2xxx_pinctrl_driver = {
 	.driver = {
 		.name = "qdf2xxx-pinctrl",
-		.acpi_match_table = ACPI_PTR(qdf2xxx_acpi_ids),
+		.acpi_match_table = qdf2xxx_acpi_ids,
 	},
 	.probe = qdf2xxx_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.34.1

