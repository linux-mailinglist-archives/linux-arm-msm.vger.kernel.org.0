Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F89372DBAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 09:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235139AbjFMH4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 03:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239396AbjFMH4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 03:56:22 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBB810F7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 00:56:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f8d0d68530so1845735e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 00:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686642969; x=1689234969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLNlz/8+ewTofYujo4xBdn+VfsPe1NjsAkjdE+/T2lI=;
        b=yI0KfpvMYAVhst/VjwZPYlKi3apIdLLfB9OLYcP+rjSND5KVbBz4quir9YCcnwMqTS
         9e3C4bp2fABv7ttsTxURH2bDSTlCH98Y/4HnF1ny0RrAvWE34h8/qaYTV0dUkOVhYERS
         v0Jw7ijYc4VxaEuRvhx0TCdBEM4fvxEBkQCdv9wyuDVZkVB2As3IhWyXbzuOyw8GGpUO
         lyyM4pTRvUTfJfo7jhmjGeuqfkF/2b+wb8Zva0yuMhOmCwic4KISGW+PMiql3aycTu3r
         MHgHqYHtYNyyPWFiDp/xydOyg6oZEIdcqAMja0ya2WWuvDamOtrWFpW6h2lyj+C/q84J
         Xkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642969; x=1689234969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLNlz/8+ewTofYujo4xBdn+VfsPe1NjsAkjdE+/T2lI=;
        b=JlrEr9Up4qSXLsZliU3u0eAnhkhMjC1ofnaoW7+vaEBe+e5OH5ob+8u5G6lF4Xqe/H
         IWhh3xdmdZPb+XEMcPmw9dKEqTPfjxtuCqIT0G5eAqArvrh1NH9FH+FbRYpC3GRtiATX
         Q8Tz64SZ2ULPmdpRJUff9QMzbDcnDbEEptKQhEo8KzMDjqrwDUevMtoHRI8HKmeD25pR
         yqBApT6W2K6g/PM5weSFOUzbuxZApGlx7Yz8IdSwJIbLYbMEZ5hOQJCfhPZu6cqNQgNT
         Pvxls2dvpbBWKdAjBzfvcQI2H9I2itnCrAbiZ+Sj8XPkqMCnp04xl/w5ixuo0wFggzOG
         Al5Q==
X-Gm-Message-State: AC+VfDyhKuG6wDTDV0KPL4xgtRrHF3SfIteK8nyjbdBOhU36J5eOug/V
        ndzostczSOGnn/XvcyXRbVWVpw==
X-Google-Smtp-Source: ACHHUZ7hGwHrv75NCopv0xUxhoqhqggmmbNZBRaZT9SLhZPRTdJXuMNZaTsak64W654oe0hzb6VqOw==
X-Received: by 2002:a7b:cb8f:0:b0:3f7:26f8:4cd0 with SMTP id m15-20020a7bcb8f000000b003f726f84cd0mr8579223wmi.16.1686642968523;
        Tue, 13 Jun 2023 00:56:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c0b5400b003f4266965fbsm13662316wmr.5.2023.06.13.00.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 00:56:08 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 13 Jun 2023 09:55:55 +0200
Subject: [PATCH v3 2/8] soc: qcom: pmic_glink_altmode: handle safe mode
 when disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-type-c-v3-2-22c9973012b6@linaro.org>
References: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gcoujHHWT0tH34VUiSmqNPPpiXV+hYxjsfgjgght78I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkiCER/WuXCeh7DJtSTsu0fX5PE6QTlxLQo7r9b4PY
 kJhHAr6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIghEQAKCRB33NvayMhJ0SYGEA
 CLpqfOBhCmrMTFxfuJS7/Xi7967jZl8n/1eErD9LPr0JRZCHVYjx4NFLnBoUj5NN4S8hREQnsWM98W
 uG6Iwj726lfhlivMwB9XN82HX1Y8frylJmT1iwTT12Qj+Ec47Z1eq435Zpmgfm7v61mUzjssw0Sxvq
 ZKxoml57Ko16TZE+0LTMw094uK5qYG5wIjnggnkXPjIKx9uLcBS6GIkLI3GpGsMpzGkWpVlilOMN3R
 YZIEpaVTCL8HSGwZQVpxqsIoMfzviDgFrW1XHsnT30SiU/BJyv31k6tyjdbk9aE0mBZVCgJuN154xT
 yNcqbj5yjK3E30mu1KKLKMyJhJ7HXVoPD3JRdyqDbPJZkKOIyNQ4d5yh+RRZ73WThTtmNVyZJv/A9Z
 cRUHiN2m+YwpaWazxAAOAc2wi8msOLhcecvEAuydS7VyPfSrF0B5Lsmxdv/xbBFsiEqD36YD+htPe+
 l0T5nOUAYbUn6HIK/O2vqs9Zx4hESJ8B1wEhZPQui1Yn7oSbNnJImr/ULKCbSQbhGUftUkVom778jC
 rqG2Zi1qTTQbb61qVr9EwqD2YJdyRwkFYBy3t79qo0GANSizxRQkmgZiMu7/T8YpiRixGqdlQ69hWW
 1plfmsnOwM9V600MUl6tp6GCbfxXFXGyd8/8ZrADsFM2muNZ8eNgBUdlmQiw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some Qcom SoCs, the Altmode event mode is set to 0xff when
the Type-C port is disconnected.

Handle this specific mode and translate it as the SAFE mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index df48fbea4b68..007d308e2f15 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -173,6 +173,20 @@ static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
 		dev_err(altmode->dev, "failed to switch mux to USB\n");
 }
 
+static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
+				    struct pmic_glink_altmode_port *port)
+{
+	int ret;
+
+	port->state.alt = NULL;
+	port->state.data = NULL;
+	port->state.mode = TYPEC_STATE_SAFE;
+
+	ret = typec_mux_set(port->typec_mux, &port->state);
+	if (ret)
+		dev_err(altmode->dev, "failed to switch mux to safe mode\n");
+}
+
 static void pmic_glink_altmode_worker(struct work_struct *work)
 {
 	struct pmic_glink_altmode_port *alt_port = work_to_altmode_port(work);
@@ -180,7 +194,9 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 
 	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
 
-	if (alt_port->svid == USB_TYPEC_DP_SID)
+	if (alt_port->svid == USB_TYPEC_DP_SID && alt_port->mode == 0xff)
+		pmic_glink_altmode_safe(altmode, alt_port);
+	else if (alt_port->svid == USB_TYPEC_DP_SID)
 		pmic_glink_altmode_enable_dp(altmode, alt_port, alt_port->mode,
 					     alt_port->hpd_state, alt_port->hpd_irq);
 	else

-- 
2.34.1

