Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3335AB31
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 15:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfF2NCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 09:02:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35514 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfF2NCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 09:02:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so8639985ljh.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2019 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lniFIm91gCkBVo8OT7Qc6rB8XEZiKvYZhCGqRwQxgRg=;
        b=R/OUJdhNfZGHaJoOsvmC50TZU4KNiySqOFuqTZkhUMlRuF2aiKO7gw52YdVXItSgcn
         yULpt7pmN8Q0FFQWwWXuiz9aPOeB3pvaPkb6xxb4hn467Tb4aGWSL9SCavDLu8IkKmmy
         qrTeh6vZQGGT0xcFf5zz72dp/fegF92Xn8K1lsaMp74Y52ZV+yXlor4P8xA3LvmbAVRg
         tyhC8dkj7Wq74VCB6f5GSAxCnIBTYFRJrgHvcNYjkbMf39LLwokl+2KRAWR7rROFUhJW
         510SqwEGSIvRO7vwvVY/+PCm/RmKugHh6Jbbn1ODQskyPdvHfCTEPIlI0+NbNPr/JqAa
         NqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lniFIm91gCkBVo8OT7Qc6rB8XEZiKvYZhCGqRwQxgRg=;
        b=nPztyCtpIs3x7LU6dfs3NnlcTetSiGTINrnb0Q+VZPyUAmH/EB8sxZ99z0czHROeaq
         vr6l6P3YHyJEXt/KESYQCeRNM/e7YkAgV2b++cZ4ma88BCwvUhh+t48FC1ITUEZbVT//
         IIv5NuffXLKN+pRRMckMfmUwb+7yBaat79tXI9+ZsnZOGAYmfsV1kQ18Ra0J8uYQnZIb
         Tc2SCLXAC2Aj6vZ/PZQHlzml5q15GBtNFpBCIjaNZuC2OZgC7H/dj1Kwvat44uoW5s90
         Ns/hFYaV0JbyMYRLLNZ646F1Jtq0PmnNIntBgo1JnZtvt4nN9qu7bXGDhdnheOJft5Cx
         mwXg==
X-Gm-Message-State: APjAAAURC8dVNJrn/AWnhs/mbLe6WN2EXKxtjEdAatBunZZHb5USTFvZ
        49PDmUJn+OQEXfZoiWmpruNEeg==
X-Google-Smtp-Source: APXvYqwVGU+xg50XiekYht3IIxEqFHM099dgUifn3T0K/F2g1KQaP1T9fAtfYeTQ4lNEuy0h1An6cA==
X-Received: by 2002:a2e:8744:: with SMTP id q4mr8768966ljj.77.1561813321447;
        Sat, 29 Jun 2019 06:02:01 -0700 (PDT)
Received: from localhost.localdomain (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.02.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 06:02:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/7] gpio: of: Support some legacy Qualcomm HDMI bindings
Date:   Sat, 29 Jun 2019 14:59:30 +0200
Message-Id: <20190629125933.679-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Insteaf of the MSM DRM code going around and inspecting the
device tree nodes by itself to find "qcom,misc" GPIO phandles,
we add a quirk to the core so that if "qcom,misc-gpios" and
"qcom,misc-gpio" isn't found, we try to find just
"qcom,misc" as a last resort. Provide an explicit whitelist
for those GPIOs.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Rob/Sean: if the approach is overall OK I will merge this
one patch already for v5.3 so the rest can be queued for
v5.4 later.
---
 drivers/gpio/gpiolib-of.c | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index aec7bd86ae7e..c927eaf6c88f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -286,6 +286,45 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *
 	return desc;
 }
 
+/*
+ * Some non-standard Qualcomm HDMI GPIOs need to be supported as they exist
+ * in random old device trees out there.
+ */
+static struct gpio_desc *of_find_hdmi_gpio(struct device *dev,
+					   const char *con_id,
+					   enum of_gpio_flags *of_flags)
+{
+	/*
+	 * These are the connection IDs we accept as legacy GPIO phandles.
+	 * If we get here, the same prefix ending with "-gpio" and "-gpios"
+	 * has already been tried so now we finally try with no suffix.
+	 */
+	const char *whitelist[] = {
+		"qcom,hdmi-tx-ddc-clk",
+		"qcom,hdmi-tx-ddc-data",
+		"qcom,hdmi-tx-hpd",
+		"qcom,hdmi-tx-mux-en",
+		"qcom,hdmi-tx-mux-sel",
+		"qcom,hdmi-tx-mux-lpm",
+	};
+	struct device_node *np = dev->of_node;
+	struct gpio_desc *desc;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_DRM_MSM))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id)
+		return ERR_PTR(-ENOENT);
+
+	i = match_string(whitelist, ARRAY_SIZE(whitelist), con_id);
+	if (i < 0)
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, con_id, 0, of_flags);
+	return desc;
+}
+
 struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			       unsigned int idx, unsigned long *flags)
 {
@@ -330,6 +369,10 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	if (IS_ERR(desc) && PTR_ERR(desc) != -EPROBE_DEFER)
 		desc = of_find_regulator_gpio(dev, con_id, &of_flags);
 
+	/* Special handling for HDMI GPIOs if used */
+	if (IS_ERR(desc) && PTR_ERR(desc) != -EPROBE_DEFER)
+		desc = of_find_hdmi_gpio(dev, con_id, &of_flags);
+
 	if (IS_ERR(desc))
 		return desc;
 
-- 
2.20.1

