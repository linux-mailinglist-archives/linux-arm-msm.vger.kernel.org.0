Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA2B785701
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 13:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbjHWLpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 07:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234476AbjHWLpu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 07:45:50 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284E0E6A
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 04:45:43 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bbbda48904so67033501fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 04:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692791141; x=1693395941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIFCktYXgfosXvRJrwvf1Hn5zhw2HJrFavQvWXV6mTw=;
        b=FdRXZNWCys86ONbUfYvQt0vxbvSb4HIgklznVQGdtN+rWYFQDHN5vkpve/5CJnNfn0
         5s3VZrvsls5p+XGkTBmmmRvnisaiCbLVuu6WfI0LmwzJSHFlQGrxqLlb94eSRvdV89CH
         loGY5WrubIPPZJFot0gctKFAddpdRDYdQFoJ8O9IMyntHzizVbRSShqJ13RIOVWaaU/P
         H3fL9VZZ6ojindXZV0JU6IVQMgsegNpiMBwb/8ZOZ1R0DKhNj9dhlXnhzJjQ6SuHnVgS
         AUW6q+ue5ZhZhqD8S56ehtCFHqUVKhKt3CQ65kViyjmuobxfaM5uvejp3PI0Lg8wB7JX
         Mqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692791141; x=1693395941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIFCktYXgfosXvRJrwvf1Hn5zhw2HJrFavQvWXV6mTw=;
        b=g5BIuwifg+KsL9fAFHKtnlRcGXn+YbYsqabXenrG0+tyAXKyiLFCCnrQL/umwD+YJE
         sRfLl/5BKylBfcTT/kk63bWr5mHsM2dsJIewWMnW2PoSi9/mDy7RULTvRp3EmPBz86qX
         ZynfeX/GzaBVXxuy1Bsl1pyV/gf/RUF1fM+NpxxjRYRE92JKH2XuSSoyKwlKh08aQ56V
         iRWA7sI1yBNeYdoD/q+0M9INIqA35nQkvZ7+LVQ6I/AYUw2eAAmkIrKb2PvsP69PnNsm
         fMgjkiLRqM/gV2Zft9nl3+7Abcj+xBxEFAyj0D0vq8E9kADzpwcpRAyMNnY801MKz7Z6
         LPsA==
X-Gm-Message-State: AOJu0YwRymgGc5MJvl0/iuwS7uStkAXXTaYr5ZxvqAmvsr9gTymgNXpi
        XMSJ62M2RlO+OwtMwz4j/Q2XQQ==
X-Google-Smtp-Source: AGHT+IGfHdql2lUUitqm6RYx89C3kDrLaaP4sDPXsex/N/CCvhLQQH+Cc4IngnkpCXY+EGU9voq4uA==
X-Received: by 2002:a2e:9546:0:b0:2b9:ed84:b2bf with SMTP id t6-20020a2e9546000000b002b9ed84b2bfmr8931106ljh.33.1692791141363;
        Wed, 23 Aug 2023 04:45:41 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bce12000000b003fbc0a49b57sm18503577wmc.6.2023.08.23.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:45:40 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@qti.qualcomm.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH v3 3/5] clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
Date:   Wed, 23 Aug 2023 14:45:26 +0300
Message-Id: <20230823114528.3677667-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823114528.3677667-1-abel.vesa@linaro.org>
References: <20230823114528.3677667-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jagadeesh Kona <quic_jkona@quicinc.com>

Add support for set and get hwmode callbacks to switch the GDSC between
SW and HW modes. Currently, the GDSC is moved to HW control mode
using HW_CTRL flag and if this flag is present, GDSC is moved to HW
mode as part of GDSC enable itself. The intention is to keep the
HW_CTRL flag functionality as is, since many older chipsets still use
this flag.

Introduce a new HW_CTRL_TRIGGER flag to switch the GDSC back and forth
between HW/SW modes dynamically at runtime. If HW_CTRL_TRIGGER flag is
present, register set_hwmode_dev callback to switch the GDSC mode which
can be invoked from consumer drivers using dev_pm_genpd_set_hwmode
function. Unlike HW_CTRL flag, HW_CTRL_TRIGGER won't move the GDSC to HW
control mode as part of GDSC enable itself, GDSC will be moved to HW
control mode only when consumer driver explicity calls
dev_pm_genpd_set_hwmode to switch to HW mode. Also add the
dev_pm_genpd_get_hwmode to allow the consumers to read the actual
HW/SW mode from hardware.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v2:
 * Renamed gdsc_[set|get]_mode to have the hwmode suffix

 drivers/clk/qcom/gdsc.c | 32 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 5358e28122ab..c763524cd5da 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -363,6 +363,34 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 
+static int gdsc_set_hwmode(struct generic_pm_domain *domain, struct device *dev, bool mode)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+
+	if (sc->rsupply && !regulator_is_enabled(sc->rsupply)) {
+		pr_err("Cannot set mode while parent is disabled\n");
+		return -EIO;
+	}
+
+	return gdsc_hwctrl(sc, mode);
+}
+
+static bool gdsc_get_hwmode(struct generic_pm_domain *domain, struct device *dev)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(sc->regmap, sc->gdscr, &val);
+	if (ret)
+		return ret;
+
+	if (val & HW_CONTROL_MASK)
+		return true;
+
+	return false;
+}
+
 static int gdsc_init(struct gdsc *sc)
 {
 	u32 mask, val;
@@ -451,6 +479,10 @@ static int gdsc_init(struct gdsc *sc)
 		sc->pd.power_off = gdsc_disable;
 	if (!sc->pd.power_on)
 		sc->pd.power_on = gdsc_enable;
+	if (sc->flags & HW_CTRL_TRIGGER) {
+		sc->pd.set_hwmode_dev = gdsc_set_hwmode;
+		sc->pd.get_hwmode_dev = gdsc_get_hwmode;
+	}
 
 	ret = pm_genpd_init(&sc->pd, NULL, !on);
 	if (ret)
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 803512688336..1e2779b823d1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -67,6 +67,7 @@ struct gdsc {
 #define ALWAYS_ON	BIT(6)
 #define RETAIN_FF_ENABLE	BIT(7)
 #define NO_RET_PERIPH	BIT(8)
+#define HW_CTRL_TRIGGER	BIT(9)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
2.34.1

