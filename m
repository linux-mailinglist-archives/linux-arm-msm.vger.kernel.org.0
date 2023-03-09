Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CC16B291D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 16:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjCIPuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 10:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjCIPuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 10:50:05 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B157F24AA
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 07:50:02 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id da10so8873135edb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 07:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678377001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3doP5Qh80iui4dCoQV94mzeJJ78H6cWhfnuThkzdLnc=;
        b=bzSGWbK3XBNYMI/l6mAcjcVv8J0CJHGL6ZJ6DKroEYmhmhX1kbIoMNUDAD5+NIfBqB
         7aLZkpAMosJgKma9DuE/ecGfNTU7AaiDqOBGCgTEAhnr9gHZRHQiLsiDM5G7AaJHvUPx
         tANvC8NhYBgv95Oy+azKdLYh+nKWlN8u+ujD23DQLDoIJaP6oJjLouv3elNzYUPn1Yf0
         rWCqbnX+iXOr9SC/UYKFr1rDtiwz8+KdljOWu30t3wPTfSuig37kijy16EwyjeUGGRxR
         kHHh/KSVziq8kKc1kMDVnToa2Px4pxaM2Jqwa+HjLFHOnByN6/C9AZ7MeLvWD/t0Rb2Q
         NgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678377001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3doP5Qh80iui4dCoQV94mzeJJ78H6cWhfnuThkzdLnc=;
        b=xkpmQjNbyf/BTraMoCZSlyY7qfJoX822Q4PF/sh8WRelcaVzbW2JgM0ihhv0oSVEPP
         9qyYOb6L1HBtJCbvF8U17umA6qdt+2gMN1KBGZ8JfAHwzDYzSdvxR6Cfll2vuB6AfdP/
         RjP4RM08TcSW6HPNM5IyQAtaYo/yRDL4PXS86rM+/NMI8dhYNmvqe5Te6vAUuQnpQYP5
         yBXQlb9wGdaTI/ProJFys9UiEgAOvW4+aN5GyzwZVdwKuMA5lITadMPK6vLxe5jyLyPA
         r+wxjUxzATQgg3+nUYUGi0PeNjBKQu0Isg4XPaOr/QTQbWCZAG9WoMobSchHXZakG5It
         xjnw==
X-Gm-Message-State: AO0yUKXDXigNrYlhrczejo8IeZYRibcGoiaGkARJvwscdM8/vM2uDMfn
        wyormCbQhRqSsTup4IzgbXqNuw==
X-Google-Smtp-Source: AK7set96sRuCK2f6npm0e0rHwbfQ7f6lUjGN8ui1Ctxa0KmEiZ6XhRhwH1Ua80UeRdtXrmrvaB6Fcg==
X-Received: by 2002:a17:906:dac9:b0:8aa:c090:a9ef with SMTP id xi9-20020a170906dac900b008aac090a9efmr28883479ejb.55.1678377001056;
        Thu, 09 Mar 2023 07:50:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id h17-20020a17090634d100b008ee5356801dsm8981683ejb.187.2023.03.09.07.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:50:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] pinctrl: qcom: lpass-lpi: use consistent name for "group" variable
Date:   Thu,  9 Mar 2023 16:49:47 +0100
Message-Id: <20230309154949.658380-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309154949.658380-1-krzysztof.kozlowski@linaro.org>
References: <20230309154949.658380-1-krzysztof.kozlowski@linaro.org>
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

The set_mux callback in SoC TLMM driver (pinctrl-msm.c) uses "group",
not "group_num" for the number of the pin group.  Other places of
lpass-lpi also use "group", so let's be consistent for code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 27fc8b671954..bd32556d75a5 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -84,10 +84,10 @@ static int lpi_gpio_get_function_groups(struct pinctrl_dev *pctldev,
 }
 
 static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
-			    unsigned int group_num)
+			    unsigned int group)
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	const struct lpi_pingroup *g = &pctrl->data->groups[group_num];
+	const struct lpi_pingroup *g = &pctrl->data->groups[group];
 	u32 val;
 	int i, pin = g->pin;
 
-- 
2.34.1

