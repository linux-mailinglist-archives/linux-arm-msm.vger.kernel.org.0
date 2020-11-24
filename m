Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD67B2C2F20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403958AbgKXRrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404020AbgKXRrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:47:46 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3BBC061A4F
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:47:46 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id w4so18085460pgg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D8tPSsYL1qfIVkcuPbhvLnnL5asoR8hb7TjnZUtF55c=;
        b=kJmaRcUEMsT8jHB+Gq+d+M86v0kV4uA4QNxg8wP6Jx4fx/QkRJQBLTaks0GEYrYCXH
         vMWeozBudkIku9CEGq5ASZ7QqrQA2aOei7tAlFtUC5fMz/HbFem+v/Do2dk7APjseMl4
         Pc0x5reiISDWy5FqKPzJyWP/UofkJSPYekMu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D8tPSsYL1qfIVkcuPbhvLnnL5asoR8hb7TjnZUtF55c=;
        b=IRCR7+feBPmte69JPPibq0nqpsJQjxtAeAtJrzT7nMcRUsA2zBLlsZU6O56Gb8JUyI
         eYKceCRdsW9v+A5nIMyaECRPJvu7GSJ4qqYTtN7R65LVwJM25z99kw8FDuaV1LF81XBm
         PZyguljZ+tW6qSjXAL3zD901l3KI9SvROjDhM1hjupIUcHQ6OBOITbVCUdJ034//ReoE
         3b8RK2EAUdV0v9gM1sBs4yx5gVVFIC9GFFbEuTXmQ9R3gFs9iKFXEwje3XNK6Dsw1VjO
         aBj4zswiN1zvl0g+W4OBJicgmlTZFPb5Wm3clmnTFZmkCxUEgnOUHkAsyZyjUQ5lMyxM
         xTVQ==
X-Gm-Message-State: AOAM533N+qLIS1HfO5qYxXKrUYwrR1loCdEAHLnvwj2BOUrqKzY7eMXp
        e4yNnBfZFjqCdjIblYuIactYQA==
X-Google-Smtp-Source: ABdhPJyBJULUMYEWPTxjWku02vD3DrDQD/ZbLXbaawto/H1pM+se8SKoCpExYCi52Od/6GCPMajYtg==
X-Received: by 2002:a63:6341:: with SMTP id x62mr4527970pgb.93.1606240066021;
        Tue, 24 Nov 2020 09:47:46 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i4sm13480459pgg.67.2020.11.24.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:47:45 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Tue, 24 Nov 2020 09:47:20 -0800
Message-Id: <20201124094636.v2.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's currently a comment in the code saying function 0 is GPIO.
Instead of hardcoding it, let's add a member where an SoC can specify
it.  No known SoCs use a number other than 0, but this just makes the
code clearer.  NOTE: no SoC code needs to be updated since we can rely
on zero-initialization.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 77a25bdf0da7..588df91274e2 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -210,8 +210,8 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	if (!g->nfuncs)
 		return 0;
 
-	/* For now assume function 0 is GPIO because it always is */
-	return msm_pinmux_set_mux(pctldev, g->funcs[0], offset);
+	return msm_pinmux_set_mux(pctldev,
+				  g->funcs[pctrl->soc->gpio_func], offset);
 }
 
 static const struct pinmux_ops msm_pinmux_ops = {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 333f99243c43..e31a5167c91e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -118,6 +118,7 @@ struct msm_gpio_wakeirq_map {
  * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
  *                            to be aware that their parent can't handle dual
  *                            edge interrupts.
+ * @gpio_func: Which function number is GPIO (usually 0).
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -134,6 +135,7 @@ struct msm_pinctrl_soc_data {
 	const struct msm_gpio_wakeirq_map *wakeirq_map;
 	unsigned int nwakeirq_map;
 	bool wakeirq_dual_edge_errata;
+	unsigned int gpio_func;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
-- 
2.29.2.454.gaff20da3a2-goog

