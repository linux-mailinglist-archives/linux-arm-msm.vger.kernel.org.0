Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F8762B758
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbiKPKL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiKPKLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:11:50 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5E324F1A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:49 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h9so29106499wrt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBLFfpuYzGwgHiIgmRksJJfjyWbMcIkXPEI0JtdHAgc=;
        b=E9OGNwlxBGugaTZ7cl1i+RM4u7NF8JNxQAcVNkYohJjc1dGfLkXj0IsPcGsTvqnbao
         z3aD3MBh41ssAllpNEb4BmNlP98uuyL+MSvYHewAylnGeC3Co7QlOPO3D6XeIweyblq9
         cO7TcpFa7Ym7LG87mixQonkX7mSKeuDrIGrmYpqtQoB9vS7fJRjgGnxHdXDf3va8lR/+
         mTKDUljTUxlmos6TuAHeNA2PsolL9f7bEbTM/mKDfo3DOJIR6HIdNWKx85yFoKnntZwo
         ohMRILZ8o/tF1SDkOa5wNF1eb7TZUzBFjMbL8CBdjwdcrrBYZ7P8ah9W9jqnZF7lcmHV
         unVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBLFfpuYzGwgHiIgmRksJJfjyWbMcIkXPEI0JtdHAgc=;
        b=Mq2x9h6013zOwbdmKAg1C1PVrGdNlEBAr11SqjKa3t9xkL0rOdfq7ol6NMkHCUzIfP
         kcB0vEtAeKkTGFHtq0Y++XbfgWrIPtzEyHoQOMJHy3rNmkn5XWRxj4j/f9Dz97+jfr/b
         TzCGjdPl3B8B/65hLZOW9Xjmd3WnGXeoUBABDTl98LkIxjtGH/xWg219NtLHu5tJ5Cr5
         hz77FF2l/Sdm1ZddIhRgB9hCW1zHOh/IDwG+jT15k83ei3z4awNHkANJEm3FM1epL7Tf
         65MPTOw+fPPw2RAgK+D4L2Vw6QLpLtvKdltLpEWC6N4qE/aJq+oFvMM++Thy5bQX+bbT
         7UQg==
X-Gm-Message-State: ANoB5pntKX3dh/F4rD+CcGBBEV32NLrHhgl+xBmf6VqJUnGmg81XLbID
        CLttpKnbrHkZHZJ4IFmwZPe2Ng==
X-Google-Smtp-Source: AA0mqf67BDpZ8h0XiJsmLizFY7Aa6egS8/MBdPM5GdJT1i1IHJ4mldiWcZ+Dm2j07ccNTRbLfW9bVQ==
X-Received: by 2002:a05:6000:12d1:b0:236:6e2a:ac17 with SMTP id l17-20020a05600012d100b002366e2aac17mr13307315wrx.345.1668593508782;
        Wed, 16 Nov 2022 02:11:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c350c00b003c6bd91caa5sm1741752wmq.17.2022.11.16.02.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:11:48 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:11:36 +0100
Subject: [PATCH 7/7] pinctrl: qcom: spmi-gpio: add support for pmr735d gpio
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-spmi-v1-7-6338a2b4b241@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-gpio@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the pmr735d gpio controller providing GPIO control over SPMI.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f758522d035e..66d6d7ffbd43 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1242,6 +1242,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmr735d-gpio", .data = (void *) 2 },
 	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
 	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
 	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */

-- 
b4 0.10.1
