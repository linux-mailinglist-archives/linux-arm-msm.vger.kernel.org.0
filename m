Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AAC2F70D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732364AbhAODR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732359AbhAODR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:17:26 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD22CC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:16:45 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id b5so4403291pjl.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyxvs6de5u+Z0m5qJhr7VhYBFLTdTIfC8RRDwWALIGE=;
        b=HAbKDK5rv41PPGuh2wyV3MFE70eGf6mPnEf1NMLGeGm5JRHPpB+hLQ0wdNWXyhMPtb
         1lSfZ3g9SzALttGKdtcHryzu9F9zSNz9l7pYqXWq5LskTDzwlHt0eDRHme0McQ0KPd/l
         FlkBqLs5lznTP1vC9juIYvp4WhILRV84VdIsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyxvs6de5u+Z0m5qJhr7VhYBFLTdTIfC8RRDwWALIGE=;
        b=nlMUWmOe8xpZ8MLH8YJ88xJ2hYQiEAJJ44wFDzmCLf11x8byZkPlqTlHm1VglpCewa
         M4drJmLpwXo46DsqTEL5D3ML5K0l13rqjmcTrcKHnz5o9eytPJD5k4Q4dhV04vmCIAKS
         FlBPD/+mMAl6HDNKDccMCUPQYYE+1v4eSf7U0cRBbQ6Bq6g6oEQJPDR2hhm3LtiPEqSj
         r7P+Zv9TyY9UQMLXUJx9nyfH7T3gPPEiEanIKoRvqKGEqP51yySJPBEIaW7pYS7WTLKY
         3pu/CnTMQ6b+HYLZlfX0Z+uNYfbqweGh+RfjeX1vW2HkKhZjfLSJp25hgIdK4oU8CA3B
         tbhA==
X-Gm-Message-State: AOAM533GVqteYfsaBohyp56Dh39YdlUfO/fiebkHGl9YTvx0uYCvLnOz
        KQcOwQF5QJiOyr4Sp2LTzWH+HcedvyqT/z+N
X-Google-Smtp-Source: ABdhPJz/TOwL5g0bqm8zhaIK26fsyTXSQybdBfLWLSXM8nfDQ0sR5O5NUGxSTueSzAcyJf0vMtJh7g==
X-Received: by 2002:a17:902:d50d:b029:de:5b13:498d with SMTP id b13-20020a170902d50db02900de5b13498dmr5498673plg.38.1610680605123;
        Thu, 14 Jan 2021 19:16:45 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm6346318pfl.219.2021.01.14.19.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:16:44 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Thu, 14 Jan 2021 19:16:21 -0800
Message-Id: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v6)

Changes in v6:
- Don't wrap line; bust through 80 columns!

 drivers/pinctrl/qcom/pinctrl-msm.c | 3 +--
 drivers/pinctrl/qcom/pinctrl-msm.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index e051aecf95c4..d1261188fb6e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -210,8 +210,7 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	if (!g->nfuncs)
 		return 0;
 
-	/* For now assume function 0 is GPIO because it always is */
-	return msm_pinmux_set_mux(pctldev, g->funcs[0], offset);
+	return msm_pinmux_set_mux(pctldev, g->funcs[pctrl->soc->gpio_func], offset);
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
2.30.0.284.gd98b1dd5eaa7-goog

