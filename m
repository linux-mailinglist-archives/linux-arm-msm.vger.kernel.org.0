Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A594DE136
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 19:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbiCRSlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 14:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235469AbiCRSlB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 14:41:01 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52F71C8DBE
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 11:39:42 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id p15so18677305ejc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 11:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZwBNxv31ujNSLTrPdhNM0458fsf06VpnyNFy23XaEkM=;
        b=3HyLPt3AUi5oYad0n4/hc+3xmHTgicSDQtnED6a8HMjpRI7fS7w3PoqInaxxMs3fTt
         6ymRR8UbBGNsXBe0UwK7sFigl+vWjptdZqYJBYGCI1ACOCyzjfa8Z9Pg9NFOw3mUvXff
         pNvBk+DkP7v/MTX0pU9MQ2EeQHA+fdHfU9YH6p0uu25D23uUda0GBESVwJh3aEp0KJCs
         xmnxDt/tpQU33XuOCIDDZ7g6gGzBhPaKokrXxLVyV+RBGnv7pnSIzKRe/dJFb1G/tFuU
         uoVcSaSEnP+3zyLmpjKx3m65qWoDGPupfzgkAYvxHqoYd+wfCS6JUa6DVr0LhJY40rO4
         AHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZwBNxv31ujNSLTrPdhNM0458fsf06VpnyNFy23XaEkM=;
        b=kMv7LJnKYUUjsMfr4Dq7wiC0j5KslXAKzJgrKw7t8i8riFBP6b+cVWLZmCBotgW5FL
         LKi+8o0C985A2eD3W529H7CIUJZ1fEqsYZLPetb4F8DQv1vuOhLtRMch4kVWZC7FiIWU
         h5HcPf1uiMQV7Cyqi6K4hzsKTE8WyyQOOMuyxpwlBBgJi1ty9i5xkVPRQXm8nnSrzYks
         RHuiWdb9OAQle+mJTKLKRAywO8jsaDcE8JkgozqJHNN536xRaGXkqtTANjUkcfKxBwzg
         doJo/S34gcubOd659MYsAeD8HOkeBYW7vJSchQwplPimXEOzgv9wI1q/BJyfal/5GFGI
         kwFw==
X-Gm-Message-State: AOAM530+OS3e8UuEPV2Ro1thy7yg3egvwBY1MIZ/6XLaT+pZhgeo5ZHr
        ZFIcKFpzSEkwUPJ2pzq34L2/tFUDOx68AA==
X-Google-Smtp-Source: ABdhPJynojliZCvGddFQNS0+a/KXK069NxTK7UrYbclBZMfvrCnqTqb4KctsfibHRAdKybm/4lpS1Q==
X-Received: by 2002:a05:6402:278f:b0:416:a887:9853 with SMTP id b15-20020a056402278f00b00416a8879853mr10909101ede.44.1647628229756;
        Fri, 18 Mar 2022 11:30:29 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb08000000b00418b114469csm4567551edp.52.2022.03.18.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 11:30:29 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] pinctrl: qcom: sm6350: fix order of UFS & SDC pins
Date:   Fri, 18 Mar 2022 19:30:02 +0100
Message-Id: <20220318183004.858707-5-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318183004.858707-1-luca.weiss@fairphone.com>
References: <20220318183004.858707-1-luca.weiss@fairphone.com>
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

In other places the SDC and UFS pins have been swapped but this was
missed in the PINCTRL_PIN definitions. Fix that.

Fixes: 7d74b55afd27 ("pinctrl: qcom: Add SM6350 pinctrl driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-sm6350.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
index 4d37b817b232..a91a86628f2f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350.c
@@ -264,14 +264,14 @@ static const struct pinctrl_pin_desc sm6350_pins[] = {
 	PINCTRL_PIN(153, "GPIO_153"),
 	PINCTRL_PIN(154, "GPIO_154"),
 	PINCTRL_PIN(155, "GPIO_155"),
-	PINCTRL_PIN(156, "SDC1_RCLK"),
-	PINCTRL_PIN(157, "SDC1_CLK"),
-	PINCTRL_PIN(158, "SDC1_CMD"),
-	PINCTRL_PIN(159, "SDC1_DATA"),
-	PINCTRL_PIN(160, "SDC2_CLK"),
-	PINCTRL_PIN(161, "SDC2_CMD"),
-	PINCTRL_PIN(162, "SDC2_DATA"),
-	PINCTRL_PIN(163, "UFS_RESET"),
+	PINCTRL_PIN(156, "UFS_RESET"),
+	PINCTRL_PIN(157, "SDC1_RCLK"),
+	PINCTRL_PIN(158, "SDC1_CLK"),
+	PINCTRL_PIN(159, "SDC1_CMD"),
+	PINCTRL_PIN(160, "SDC1_DATA"),
+	PINCTRL_PIN(161, "SDC2_CLK"),
+	PINCTRL_PIN(162, "SDC2_CMD"),
+	PINCTRL_PIN(163, "SDC2_DATA"),
 };
 
 #define DECLARE_MSM_GPIO_PINS(pin) \
-- 
2.35.1

