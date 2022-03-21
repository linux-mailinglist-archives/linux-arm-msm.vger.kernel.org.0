Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66CAD4E27A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 14:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347931AbiCUNff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 09:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347921AbiCUNfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:25 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112973BF97
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:55 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a8so29863589ejc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PkYVYmY9Le2aSokUPH4KG71aD16wj93RAHpPc0N5vfM=;
        b=Hxc7aeJlYgvRRhGcrYyv1X44Sch6Tk7LZAeJVbWn9NZbCzimeNoWoV+WpFf8YK2q7G
         RuDIIPFD6orLxH1VxiCcJ8zP2BZd+4Ajkvps9HDF7bGg6uQrbi2LgB05HSTQw5kEcKhF
         MCbztYIHYG0Eh8hmo49sTgleoFm0kukmtXaLNgbS9u//wUtRHJDYo7oOtuevFf2maLLp
         f0PVk/gZ4oofN0O9AXcvnNtLDfr1OsnDWld5zUOFx4SHR1trOXKNjj5JIfOj57VSfIJV
         0oRW+YK9nVqwzDSjbjrA8i0pqwndiMp809JB7mSNCG80o1X5jdHbws+wKUMFKNksyYWL
         buGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkYVYmY9Le2aSokUPH4KG71aD16wj93RAHpPc0N5vfM=;
        b=Gnpc8RzbYswubnwpwNDWD+5gMExSzIdNC9BnZy0Omyin23BKoJ2z1IVV7uKHCh6u8O
         oA3aTFQCEYObNBP30K+EGi5CW6UZ+lEVvFCXm71/H6K/n/tVialnxuiC49N+6gdZTTgP
         7+hGuBgJpQkZaKy45bymwaQM9aoYmlcq6xX+ijrfV9BvgkPrk8iUlpB3IlFVyK2SMgGa
         zwFNEEsPokg5zzBr1wE9nWilcZEU3z72FP2f3wqx2um6IAriwg99baHAYHEBrTHNEVv5
         tC7KcVOITvTWdDIDhXjhPRalzj2ED1pV2/D75hEN3Vxbhv+1lcgW3OZcdorrylTWh246
         Bmng==
X-Gm-Message-State: AOAM531A1K6pnNq69A2BHKi5s8HLE8IIBa2DiljX4leH3/TgQ4FqAJfb
        Wx1hO9fzTaK461LMcm7viPH+2JvrToHHkw==
X-Google-Smtp-Source: ABdhPJyU3Coc4BvT2jI/q5GOqjcvZ07JMnbuOupESfqHWOrMFlZEqYtJ3ruZc8obgb6AZb6Hy452rw==
X-Received: by 2002:a17:907:96a1:b0:6df:c9e3:25e2 with SMTP id hd33-20020a17090796a100b006dfc9e325e2mr12664451ejc.138.1647869633415;
        Mon, 21 Mar 2022 06:33:53 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:53 -0700 (PDT)
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
Subject: [PATCH v2 4/6] pinctrl: qcom: sm6350: fix order of UFS & SDC pins
Date:   Mon, 21 Mar 2022 14:33:16 +0100
Message-Id: <20220321133318.99406-5-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133318.99406-1-luca.weiss@fairphone.com>
References: <20220321133318.99406-1-luca.weiss@fairphone.com>
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

In other places the SDC and UFS pins have been swapped but this was
missed in the PINCTRL_PIN definitions. Fix that.

Fixes: 7d74b55afd27 ("pinctrl: qcom: Add SM6350 pinctrl driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- nothing

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

