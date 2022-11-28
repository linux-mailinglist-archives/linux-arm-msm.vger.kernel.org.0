Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4D063A84D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 13:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiK1M2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 07:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiK1M2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 07:28:38 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E90E0C5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 04:28:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id x17so16535293wrn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 04:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnRmpeX7Za1sWr1VkDlo2FHkUAThnM0g5s11O2viS1c=;
        b=TbdM8b/0XHPm58+CEjQmrHHfsyBGr3vgFMKGqS6Kute/Vf7tpsO2+TCxDGrkqgj3ig
         vxr1jRnbkCGqFMang5w1zaRokdxAFZE05zxPnvsoy0bZoSJy2cBVOM7G4J/3jrfms6V/
         BQCfJTwMYwTxoHaZt6g7xvcIRwRs9iaL0VVxfavJkdOFU3EvloK5XzinRz6+VQpOp1dW
         njTd06i7rbe07mu7j+0wIJsuDGCT4d9dTl9MxoLWNaIvAdvAW+oqw8pW2U4UgrAaPUTC
         AKtCzUDkQ3y48BIBaEfvdS0yAIHcfk9XfHEK6uvCdmb0CWEqsRoX5XeWxV24WzpFOD/E
         OsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnRmpeX7Za1sWr1VkDlo2FHkUAThnM0g5s11O2viS1c=;
        b=GeNq2WKOtyD7I9D92VGKY/imoP2lTN+lSvEmPKzzWBffVLnQoW6PwBaF04cnobjXST
         UgNB4bbBmkPz86zstbAd86SkO9Ibo2k2JcIfqvg2bjFD9HpVKy91Krn6gwpxQqR9sstW
         Q2BmKBzWu2aqnaVk1LFGDC0FlkV2sx1SpXDvl4sdnDdiXhZXfkUYubnnBL1bG8yn9H0x
         h1neIt5ytckUgLKgz0tOIclf7lj0P8tclEgIcakP89qAW9pGXhsRVakKl7M29e0CQ9x3
         N1QehG12jAXJJ611V5EhNaZNdTg6iYdmzu25Q90+H+Wy+Xq2BTXwJPUEaO9GIytMGYXt
         Vanw==
X-Gm-Message-State: ANoB5pnWEm2CDNelByCiB3KJq2Co+eE7mmXE6Cv9g7r3CsXuc0Yva3Vg
        48Ynti6IyYYTeLKTTF2Isix9lA==
X-Google-Smtp-Source: AA0mqf5pJJTYZAe4stWQmRpW/FM7fUXXKxK7Eo3twx456P3wlcGr7r4KyXETdbl4fBbfKd3dhi/Jfw==
X-Received: by 2002:a5d:6dd1:0:b0:236:75a8:58d with SMTP id d17-20020a5d6dd1000000b0023675a8058dmr31861897wrz.295.1669638517341;
        Mon, 28 Nov 2022 04:28:37 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b002421db5f279sm598405wrm.78.2022.11.28.04.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:28:36 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 3/9] clk: qcom: gdsc: Add configurable poll timeout
Date:   Mon, 28 Nov 2022 14:28:14 +0200
Message-Id: <20221128122820.798610-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128122820.798610-1-abel.vesa@linaro.org>
References: <20221128122820.798610-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Depending on the platform, the poll timeout delay might be different,
so allow the platform specific drivers to specify their own values.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 5 ++++-
 drivers/clk/qcom/gdsc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 0f21a8a767ac..3753f3ef7241 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -107,7 +107,7 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
 	do {
 		if (gdsc_check_status(sc, status))
 			return 0;
-	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
+	} while (ktime_us_delta(ktime_get(), start) < sc->poll_timeout);
 
 	if (gdsc_check_status(sc, status))
 		return 0;
@@ -454,6 +454,9 @@ static int gdsc_init(struct gdsc *sc)
 	if (ret)
 		goto err_disable_supply;
 
+	if (!sc->poll_timeout)
+		sc->poll_timeout = 500;
+
 	return 0;
 
 err_disable_supply:
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 803512688336..9a1e1fb3d12f 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -36,6 +36,7 @@ struct gdsc {
 	struct generic_pm_domain	*parent;
 	struct regmap			*regmap;
 	unsigned int			gdscr;
+	unsigned int			poll_timeout;
 	unsigned int			collapse_ctrl;
 	unsigned int			collapse_mask;
 	unsigned int			gds_hw_ctrl;
-- 
2.34.1

