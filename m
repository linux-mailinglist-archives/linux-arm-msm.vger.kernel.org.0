Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9B52D4FD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 01:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbgLJAsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 19:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730348AbgLJAn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 19:43:28 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68D1C0617B0
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Dec 2020 16:42:47 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id x12so1408949plr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Dec 2020 16:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TTt1TsB6n5AYUylj6vMhSt1zquU4m1Jo1mfpDnzKdik=;
        b=GBNic1/DYR0hu9wEjtUB8UbBPwYyf6O3lq0iViouZrZFFf/BPuFgJ3AyOCM7vUIYaH
         VibposTlUp0nBquc7wy6z5QXmhSu5Mi4O3Vpk0Zmvb9xcIRZf5av7XBLkUCnyBPONfb7
         3Tn5xwpUlrgrd6y7LdL2F55JwFDl9Va5b6zqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TTt1TsB6n5AYUylj6vMhSt1zquU4m1Jo1mfpDnzKdik=;
        b=H97TIQGCEvHHTMLm6iuYiL+SCqhMdWCfVCGzhlhJoVUN/btCsmxVqfQbMsjg1cOJG/
         0QAj6t671oKCBulLSC/L5uKVvDXi6fAA2sakXP4A5TcnnhoK+7qzQMsgYmN30SNNxZDw
         G3PgyWtwu1CO24c3ZpcuaumsrUrjplLyoZf3Ic5evpbAOYFuT909zHkDUVbez4Sbk1j4
         cjj0mEZ8UWB6FljaVrfM9qfM8RQPJx8Dn11nRSoNJef86ddEeNr9agdOPiFvhjRJD3E7
         FDk7Od+JaiprcYll/D4zAfLPXLfI2OrBXf0Fop7fCPsCar6ab1uk+vnZanbYRfNMuxpU
         o+VQ==
X-Gm-Message-State: AOAM53391iamP3PflkKCQhLcXBUF5hygwrC6WTxXez9s3q5dGzyxWQcr
        +2C6LuhUV92y7M7aW4QrbM4qqg==
X-Google-Smtp-Source: ABdhPJyMtkg1gADnTnZrv7GpAOnXBhIL6jv7eDvnuW2ThU6yQH95bQ78/0IDWzd7q82HDdudWS5HDg==
X-Received: by 2002:a17:902:56a:b029:d7:ced2:60eb with SMTP id 97-20020a170902056ab02900d7ced260ebmr4429248plf.24.1607560967319;
        Wed, 09 Dec 2020 16:42:47 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id l23sm3690430pgm.22.2020.12.09.16.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:42:46 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Wed,  9 Dec 2020 16:41:02 -0800
Message-Id: <20201209163818.v3.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
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
2.29.2.576.ga3fc446d84-goog

