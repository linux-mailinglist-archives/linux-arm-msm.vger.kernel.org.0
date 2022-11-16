Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F6A62B74E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbiKPKLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbiKPKLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:11:49 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C7C2181D
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:48 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id g12so28859231wrs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DomrnSm96zSkZhM662uK9kmnG2CwT9HGpFGat7R0RuE=;
        b=L0HLr2ApuBLN9ODseDtZ7fQx7rZUezBQWIvjTICqT7R+u/7cKpEPy7RXegSlBKXAYY
         S+avTR1gK22gih/ALc29dC5mOnMF6FfUGjozpf0xtpxkQ8mym67TZEv+t3tP6l9iB50T
         TFZI1XF+zW0ZhKYWlIx92fa20YTDXxlizOiFYyVe+rAW4k58VaXtJNfKAH9n/hm6U+rj
         m/ZnKIiwcnUzTN2m90xauNeqauP2Bqy9O6IYCP/FGJqvz6QME3Vj9VZNLHzb5W1ENIWO
         dBAk2jR/DEH4VEIS2XpjlkdCYTZj4o/kEwSn2A51t9ZSczuta+k7iGka9Qzx/DklIVqe
         jejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DomrnSm96zSkZhM662uK9kmnG2CwT9HGpFGat7R0RuE=;
        b=aHufTeukDPJ8tdvke0GZwqjWmiTOdO03ny/0FZblx27hX6TEeR+DjmvdPu5iLGWZOR
         /jTPp50c42nA4ZHm9INva71oxHWC+bfVctGxNWz1c24JeRkk465IApWXlYiBkeV9JPRh
         5+wbPXqaIoi0tU+Fx4nMGKSWBWBF12Qq+8dOrywlvSK7981jWRS6XXieoTlW+m4galLp
         e9JPsly31m/+j5Kzv6Sb613kbHd6B2QBxwvRzQ5hfM5IDOxYykcnaIopo1GkSW9C6uvN
         CC0k+If6Z19MFBx0zEtu3edZ/8mfbRV5/WfUnp/dsGgYS5rxIY2ZtvYwx+hGFQ8l7y4b
         HgXw==
X-Gm-Message-State: ANoB5pmsfPpcgIKYN4O3KVd0iWTS+3wfkLszQpL4RcM5IHGTnWMuiLeh
        /MGt+arysUIDwIaWOGL8Wv7t0Q==
X-Google-Smtp-Source: AA0mqf46L3aO5Wq2TgigsokvsrVab1bV5ZmAtx/l2FRYWi6zJ/iR3zRqhDoHxoAWdmBbFIDhjfZO9w==
X-Received: by 2002:a5d:4810:0:b0:22e:3659:2d92 with SMTP id l16-20020a5d4810000000b0022e36592d92mr13278929wrq.604.1668593507966;
        Wed, 16 Nov 2022 02:11:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c350c00b003c6bd91caa5sm1741752wmq.17.2022.11.16.02.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:11:47 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:11:35 +0100
Subject: [PATCH 6/7] pinctrl: qcom: spmi-gpio: add support for pm8550 gpio control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-spmi-v1-6-6338a2b4b241@linaro.org>
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

Add support for the pm8550, pm8550b, pm8550ve, pm8550vs & pmk8550 gpio
controllers providing GPIO control over SPMI.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 89695b5a2ce7..f758522d035e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1221,6 +1221,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
 	{ .compatible = "qcom,pm8450-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8550-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8550b-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8550ve-gpio", .data = (void *) 8 },
+	{ .compatible = "qcom,pm8550vs-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
@@ -1232,6 +1236,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
 	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */
 	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },

-- 
b4 0.10.1
