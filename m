Return-Path: <linux-arm-msm+bounces-41038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 085929E9303
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CEBB18804CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AF2221DAB;
	Mon,  9 Dec 2024 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jldf+6SX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9622069F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745389; cv=none; b=uLmV+UmzJjr1x7X7bFN0DcwouFpLAQMGa4dt/epzNqwRH+0Wts4jLLbtGRXk6iqHca5dw9XclukrcxFNWmiolFnq+YUwLJVIacN8Rm9USISu7DBM3Lm44ZVUWs9cgZF6yHs0bFapyUbtmWXwccqFTW+qZCYhbJE2X042RwZr9Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745389; c=relaxed/simple;
	bh=UYoZ37RyjculWpGQiCFSZYiIahzyfcf1uiQSJqQ8/ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1aO57KgmiQyO5nwmpHsd67Gdim4M0SOeKw05sdyeXv7ziISjTF6gubUBgnVIzlRPH9Yjhz/ka1D9msP85rLobnmkvBSFu59R9ZE2I92C395Gt8fgmC9IjWkZI2v7qnqtO0/niXiyK60sKIkqOLsV5GhTzQ9D8DdOMVYXDw5ou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jldf+6SX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa65f707419so40362066b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745386; x=1734350186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn1iITUqCTWw5geBpowIVLe7vef2f6kBTXYqRCfLbA0=;
        b=jldf+6SXzkNxO5eR3FCMfMXk3TTrrbFryRvlxyefDC7+Iwip4K7LQPakSquKhcKnFL
         lbr97RAcmoHMlmUyuVYB8wTpeyTxEd3FNfWzSviBxo7kr+lQKy3/P02GyPhB3gO7ce2p
         5jqTWKk8to0zr5qzfCr5416wlMDlleqtVsD+qZGN8eRmqLv1R/wNg+4hgjawG8TtWXMY
         Wq9kkJ1M7Tgsn8mNPanOXDMZCfrwzyQ5Pqcj2iot29w63epl1aVyZq5zECCk48fg2K4f
         DdEH2+O9BD9IEd0fzegfKcPMH4PJo0eQeMO7aNsK2/VAzdnLXKc02dKewZNOyeRifXA6
         1aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745386; x=1734350186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn1iITUqCTWw5geBpowIVLe7vef2f6kBTXYqRCfLbA0=;
        b=bYUyKQP8JiXg2JZW9DeFfnhd+Wuf/b6MKbuvOZ07hHUatv8kQzViBvVolAFvgSpY2s
         /EVWWiuy9L9f2mrZWA1eQCjLd4b9IDEZ9F/8nZ0xpaefwXD86f+J2CFkxer/RIk5bSLT
         BaRd99m+b0mFrh21Cob5ZdFrxfgJeQWACcSWzhWbiwq5+kRIbRp4SLaKVYx7a/Rd4nyk
         6eC/2hrqnnm2VEL0ARStr2FV18ID3SqgsZt0tAm1fVTu5F54/SLsK79PNEUorh6pSP1p
         CAq4kPY6hGggK/gOmO9WaB40oGuoUavNHK7+QUzqsOoAwa7pxRHaP20L9jCNP9UQkNpQ
         CUcg==
X-Forwarded-Encrypted: i=1; AJvYcCVvjri7I2/vvRvSE/LzjDdCpJWp5/aKNUZGIBE4JKu3SMbrv1ns+GkRb2Ek5wwkfCF6U6dbQzj4d267TVE9@vger.kernel.org
X-Gm-Message-State: AOJu0Yysdb95imgnftvpoaCLZm1zFs00Kzo6vGoIjSd+Su1gkUgKVBsp
	gihkASO/ItaxK8LToN0c0XE2DEQMSS68CVWoHPpwNDS5OsG0kCD3MdrYNHOWE5U=
X-Gm-Gg: ASbGncurDy0pnjUKRquISKYFr/o1fm00ga/L+j4hGq2x9PfuFXF/R8+6XBOt1xjEDPq
	mHZ0G+qb0D+0WZ1d7QckgESE7cQBiK8EZdnX1phcUtcThVD2gWa6pQyatHYnkthSD0ePHikWEzq
	fnpyfAlrcu3cJFAzxJIRLHCAynEbuiA/ZNk2pwMJtOYeqcYltGZ3Oyen2VeAuAVWyvtXmuVojHG
	LIg9+Ncb0PtQrXO9RcVeh6MfnHExm0GQQHbbm05zgmTNiAN2k01Uz//g2YTcikF
X-Google-Smtp-Source: AGHT+IH6FhBYyaKwHnnukYERgUgguK/+8BJ07//maa179WbVCtwvOKPm8MChdcKGphqtryASdBJurg==
X-Received: by 2002:a17:907:944d:b0:aa6:3736:bad4 with SMTP id a640c23a62f3a-aa639bd5e31mr533078466b.0.1733745385627;
        Mon, 09 Dec 2024 03:56:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6651c01c5sm343333766b.23.2024.12.09.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:56:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/4] soc: qcom: pmic_glink: simplify locking with guard()
Date: Mon,  9 Dec 2024 12:56:11 +0100
Message-ID: <20241209115613.83675-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209115613.83675-1-krzysztof.kozlowski@linaro.org>
References: <20241209115613.83675-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify error handling over locks with guard().  In few places this
elimiates error gotos and local variables.  Switch to guard() everywhere
(except when jumps would go over scoped guard) for consistency, even if
it does not bring benefit in such places.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

The part in pmic_glink_rpmsg_probe() depends on previous fix.

Changes in v3:
1. Rebase - bigger changes in pmic_glink_send() comparing to v2.

Changes in v2:
1. Do not use guard() in pmic_glink_probe() because of jump.
---
 drivers/soc/qcom/pmic_glink.c | 51 ++++++++++++-----------------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 11e88053cc11..f842ffa3c356 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2022, Linaro Ltd
  */
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -100,15 +101,13 @@ void pmic_glink_client_register(struct pmic_glink_client *client)
 	struct pmic_glink *pg = client->pg;
 	unsigned long flags;
 
-	mutex_lock(&pg->state_lock);
+	guard(mutex)(&pg->state_lock);
 	spin_lock_irqsave(&pg->client_lock, flags);
 
 	list_add(&client->node, &pg->clients);
 	client->pdr_notify(client->priv, pg->client_state);
 
 	spin_unlock_irqrestore(&pg->client_lock, flags);
-	mutex_unlock(&pg->state_lock);
-
 }
 EXPORT_SYMBOL_GPL(pmic_glink_client_register);
 
@@ -119,28 +118,23 @@ int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 	unsigned long start;
 	int ret;
 
-	mutex_lock(&pg->state_lock);
+	guard(mutex)(&pg->state_lock);
 	if (!pg->ept) {
-		ret = -ECONNRESET;
+		return -ECONNRESET;
 	} else {
 		start = jiffies;
 		for (;;) {
 			ret = rpmsg_send(pg->ept, data, len);
 			if (ret != -EAGAIN)
-				break;
+				return ret;
 
-			if (timeout_reached) {
-				ret = -ETIMEDOUT;
-				break;
-			}
+			if (timeout_reached)
+				return -ETIMEDOUT;
 
 			usleep_range(1000, 5000);
 			timeout_reached = time_after(jiffies, start + PMIC_GLINK_SEND_TIMEOUT);
 		}
 	}
-	mutex_unlock(&pg->state_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(pmic_glink_send);
 
@@ -227,52 +221,42 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 {
 	struct pmic_glink *pg = priv;
 
-	mutex_lock(&pg->state_lock);
+	guard(mutex)(&pg->state_lock);
 	pg->pdr_state = state;
 
 	pmic_glink_state_notify_clients(pg);
-	mutex_unlock(&pg->state_lock);
 }
 
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct pmic_glink *pg;
-	int ret = 0;
 
-	mutex_lock(&__pmic_glink_lock);
+	guard(mutex)(&__pmic_glink_lock);
 	pg = __pmic_glink;
-	if (!pg) {
-		ret = dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
-		goto out_unlock;
-	}
+	if (!pg)
+		return dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
 
 	dev_set_drvdata(&rpdev->dev, pg);
 
-	mutex_lock(&pg->state_lock);
+	guard(mutex)(&pg->state_lock);
 	pg->ept = rpdev->ept;
 	pmic_glink_state_notify_clients(pg);
-	mutex_unlock(&pg->state_lock);
 
-out_unlock:
-	mutex_unlock(&__pmic_glink_lock);
-	return ret;
+	return 0;
 }
 
 static void pmic_glink_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct pmic_glink *pg;
 
-	mutex_lock(&__pmic_glink_lock);
+	guard(mutex)(&__pmic_glink_lock);
 	pg = __pmic_glink;
 	if (!pg)
-		goto out_unlock;
+		return;
 
-	mutex_lock(&pg->state_lock);
+	guard(mutex)(&pg->state_lock);
 	pg->ept = NULL;
 	pmic_glink_state_notify_clients(pg);
-	mutex_unlock(&pg->state_lock);
-out_unlock:
-	mutex_unlock(&__pmic_glink_lock);
 }
 
 static const struct rpmsg_device_id pmic_glink_rpmsg_id_match[] = {
@@ -379,9 +363,8 @@ static void pmic_glink_remove(struct platform_device *pdev)
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
 
-	mutex_lock(&__pmic_glink_lock);
+	guard(mutex)(&__pmic_glink_lock);
 	__pmic_glink = NULL;
-	mutex_unlock(&__pmic_glink_lock);
 }
 
 static const unsigned long pmic_glink_sc8280xp_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-- 
2.43.0


