Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DEF3D8071
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 23:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbhG0VD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 17:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbhG0VDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 17:03:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C362C061369
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 14:02:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z2so24176652lft.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R7kGrtZpvotoea9KWR3b5/H2rAVf7kCtopxK8UOkjF0=;
        b=weeQ43hentGrVSMXuKSc3VhYfzg6ona//kj7BtF14rLLBNhoXph1HmWrN6uXx0Q63l
         FTK+zGN41Dk1MFZnkM7Gu8AVbw46Eow9OBMfpQMr6tOTT+2VqWMVxa10y+Rgxux1cao7
         sKMk/Ig+x+idwXjxahcFXiLUv8F0/LBB964sDmvIleU15X/68MnC2ka/ESUcC7xHX2TI
         8qp3su8+fzow6Tp3SNxXeln6tK/lKrwwDrKYhH8dB94mbznWmOXBWWdcLBOzUbLmE/TQ
         I+9vEV0yrgRKLWGlgKwMbjyZ7viUu0/87l6BJLphmqSARM703NURDSzQpfpphgyd3QG0
         OpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R7kGrtZpvotoea9KWR3b5/H2rAVf7kCtopxK8UOkjF0=;
        b=hUPCgB7lHMDIBM5sSpCC2UlGOiO2cgqJPq5isA+Ae9hj4+dDF6uCjWXkPhHge5Hc3Z
         KKTVITHwH6n/V7qLJNSKgoGxODf7tg10ZbHVgFHZmTvqWqRHaPu4/zbjfcDiOeZ4V9bn
         OBiGo67siaMDPtcGV+ZAoHvStjUEO5B7wAWIuGACZWgBh2fuDg8vNrXtrGjdJ550wmb7
         funoUiRocQCMMJb2cCRDiraMenrBHXyjxL116k6vpnSSFWRwxkEfFZt6o6OGzRJYQEZA
         p9HiIfkowLKqvntnpVTplNW7QokGoX4Sp4t7XJS0BpuZQdLuaiialZsmBx6FGyKWOTC3
         Bk+g==
X-Gm-Message-State: AOAM5313vGUjYTO2qW5MU/qg3vN72E3uCrxqv+9SM7M12WGgV1YCTGun
        n9a8SlXa/prtXRxmfBINGQKVlg==
X-Google-Smtp-Source: ABdhPJzcauy8flb+E2ExQj6faPwoxOH6Ak+9jpFck89mvp/31ZvieRBJUILkIGIvFTa1TcDZpwFuPA==
X-Received: by 2002:a05:6512:3767:: with SMTP id z7mr6944536lft.128.1627419775799;
        Tue, 27 Jul 2021 14:02:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m5sm355680ljq.22.2021.07.27.14.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:02:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] PM: clk: add devm_pm_clk_create helper
Date:   Wed, 28 Jul 2021 00:02:02 +0300
Message-Id: <20210727210202.717181-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727210202.717181-1-dmitry.baryshkov@linaro.org>
References: <20210727210202.717181-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_pm_clk_create helper, devres-enabled version of the
pm_clk_create(), which will call pm_clk_destroy at the correct time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/base/power/clock_ops.c | 17 +++++++++++++++++
 include/linux/pm_clock.h       |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 0251f3e6e61d..4110c19c08dc 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -519,6 +519,23 @@ void pm_clk_destroy(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pm_clk_destroy);
 
+static void pm_clk_destroy_action(void *data)
+{
+	pm_clk_destroy(data);
+}
+
+int devm_pm_clk_create(struct device *dev)
+{
+	int ret;
+
+	ret = pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, pm_clk_destroy_action, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_clk_create);
+
 /**
  * pm_clk_suspend - Disable clocks in a device's PM clock list.
  * @dev: Device to disable the clocks for.
diff --git a/include/linux/pm_clock.h b/include/linux/pm_clock.h
index 8ddc7860e131..ada3a0ab10bf 100644
--- a/include/linux/pm_clock.h
+++ b/include/linux/pm_clock.h
@@ -47,6 +47,7 @@ extern void pm_clk_remove(struct device *dev, const char *con_id);
 extern void pm_clk_remove_clk(struct device *dev, struct clk *clk);
 extern int pm_clk_suspend(struct device *dev);
 extern int pm_clk_resume(struct device *dev);
+extern int devm_pm_clk_create(struct device *dev);
 #else
 static inline bool pm_clk_no_clocks(struct device *dev)
 {
@@ -83,6 +84,10 @@ static inline void pm_clk_remove(struct device *dev, const char *con_id)
 static inline void pm_clk_remove_clk(struct device *dev, struct clk *clk)
 {
 }
+static inline int devm_pm_clk_create(struct device *dev)
+{
+	return -EINVAL;
+}
 #endif
 
 #ifdef CONFIG_HAVE_CLK
-- 
2.30.2

