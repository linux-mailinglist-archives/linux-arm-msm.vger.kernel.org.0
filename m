Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9025323368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 22:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbhBWVrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 16:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbhBWVrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 16:47:02 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA78C061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:45 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id w18so9677487pfu.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tqWQhT3LjBz5MByIC+aXJToZ1jZ2b58/ZuDpVrbD+Uo=;
        b=Y/jL/5NhCl6kU+DaTLgVV6B8EkXtSb37eblUKcVW8JjbDaqdAo6oQ6glZf3vUe+i+N
         9j9IM24PzKejIsunuWX5gdlecz8ZDBWOgV3zYKDJlChOfRinURMmxSZE1bWB7JSbP0wO
         2yGti4I1CX8vc8Szvs6L+bsxKCtk0rzj7C9Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tqWQhT3LjBz5MByIC+aXJToZ1jZ2b58/ZuDpVrbD+Uo=;
        b=R3nUMDSdw3FxULvZ/Rh+18tTirQX4hToto/oUzZ6g4cw3HQvbbtHxK0qFZF3tTkshM
         kIbE9K9u4U0eER/F39pX3xTM0KMCamkK5SfoLrXNnGDdFYTGoCiumDqE6ej05yBc76EB
         gIielUUuX+YImnMkNJwKFpThNytg56fH4OZz8o/AdxWtrbjTaNxFX5TaYmOOBQmgnnuh
         H7VkO9DHLik6fUAdh2LSRL5roNWMEVifyylJzX3q8vD2BYDn9RuoOgJm1eRx9174k7dj
         oiUpB2nBwZ7f9KEp8c9v9E3z94yrSEVmv7jNnpnDC7yqNJ16b+iOrUZGPjGDCL113NKj
         Ynqw==
X-Gm-Message-State: AOAM5336vk8whOHeduhwuFLvIorah7DF8ymLJ+BHMHZS6Tzehsy6+MDp
        Rdg1VqIZzgF6x8RoYw4nUrER3A==
X-Google-Smtp-Source: ABdhPJwQ606cvIhvmU7L+ZXAWRGkhUDsIa6rT3NdHLlZ0IwGaAHKV89yTlDBpyaOXb8wqWixtQyA3A==
X-Received: by 2002:a05:6a00:1a01:b029:1da:a7ee:438f with SMTP id g1-20020a056a001a01b02901daa7ee438fmr4126793pfv.77.1614116744909;
        Tue, 23 Feb 2021 13:45:44 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id r68sm137951pfc.49.2021.02.23.13.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 13:45:44 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/6] firmware: qcom_scm: Workaround lack of "is available" call on SC7180
Date:   Tue, 23 Feb 2021 13:45:36 -0800
Message-Id: <20210223214539.1336155-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210223214539.1336155-1-swboyd@chromium.org>
References: <20210223214539.1336155-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some SC7180 firmwares don't implement the QCOM_SCM_INFO_IS_CALL_AVAIL
API, so we can't probe the calling convention. We detect the legacy
calling convention on these firmwares, because the availability call
always fails and legacy is the fallback. This leads to problems where
the rmtfs driver fails to probe, because it tries to assign memory with
a bad calling convention, which then leads to modem failing to load and
all networking, even wifi, to fail. Ouch!

Let's force the calling convention to be what it always is on this SoC,
i.e. arm64. Of course, the calling convention is not the same thing as
implementing the QCOM_SCM_INFO_IS_CALL_AVAIL API. The absence of the "is
this call available" API from the firmware means that any call to
__qcom_scm_is_call_available() fails. This is OK for now though because
none of the calls that are checked for existence are implemented on
firmware running on sc7180. If such a call needs to be checked for
existence in the future, we presume that firmware will implement this
API and then things will "just work".

Cc: Elliot Berman <eberman@codeaurora.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Fixes: 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and legacy conventions")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/qcom_scm.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 21e07a464bd9..9ac84b5d6ce0 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -131,6 +131,7 @@ static enum qcom_scm_convention __get_convention(void)
 	struct qcom_scm_res res;
 	enum qcom_scm_convention probed_convention;
 	int ret;
+	bool forced = false;
 
 	if (likely(qcom_scm_convention != SMC_CONVENTION_UNKNOWN))
 		return qcom_scm_convention;
@@ -144,6 +145,18 @@ static enum qcom_scm_convention __get_convention(void)
 	if (!ret && res.result[0] == 1)
 		goto found;
 
+	/*
+	 * Some SC7180 firmwares didn't implement the
+	 * QCOM_SCM_INFO_IS_CALL_AVAIL call, so we fallback to forcing ARM_64
+	 * calling conventions on these firmwares. Luckily we don't make any
+	 * early calls into the firmware on these SoCs so the device pointer
+	 * will be valid here to check if the compatible matches.
+	 */
+	if (of_device_is_compatible(__scm ? __scm->dev->of_node : NULL, "qcom,scm-sc7180")) {
+		forced = true;
+		goto found;
+	}
+
 	probed_convention = SMC_CONVENTION_ARM_32;
 	ret = __scm_smc_call(NULL, &desc, probed_convention, &res, true);
 	if (!ret && res.result[0] == 1)
@@ -154,8 +167,9 @@ static enum qcom_scm_convention __get_convention(void)
 	spin_lock_irqsave(&scm_query_lock, flags);
 	if (probed_convention != qcom_scm_convention) {
 		qcom_scm_convention = probed_convention;
-		pr_info("qcom_scm: convention: %s\n",
-			qcom_scm_convention_names[qcom_scm_convention]);
+		pr_info("qcom_scm: convention: %s%s\n",
+			qcom_scm_convention_names[qcom_scm_convention],
+			forced ? " (forced)" : "");
 	}
 	spin_unlock_irqrestore(&scm_query_lock, flags);
 
-- 
https://chromeos.dev

