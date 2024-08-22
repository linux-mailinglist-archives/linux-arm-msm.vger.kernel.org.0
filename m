Return-Path: <linux-arm-msm+bounces-29290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E4995BC03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 18:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 913091F23160
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9191CDA33;
	Thu, 22 Aug 2024 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEoKM56i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53091CDA12
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344433; cv=none; b=FcTryZpRUb4MOpM65xxUqRzLVDzaCAlWhX/1OrWtMCWwu3875vE/aPOypDKXyQiDg+Rzcf8hrwiTiPY+05nxc32gWimw7Kqx02LDznjiDXwshuwQvpxbW4FOLx3ZMPiXg4afs7P5dLPBGKpA9KthL8DTWpV+9c3D2U+UAcK9My0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344433; c=relaxed/simple;
	bh=l6Kww17V1Gd5y62L9kocI/d35MuDd1bZ7ZhVlzMWiwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+kqx36uWQSKJzy+9HB3iC5XZRe4BoPVeX/et/DdkVnHUkbye83dtupkIfyUr6nMVnivBRkWUHAMRS5o+YqlXbptqPW5foYwvtLtezQr9r/zgQVabk3hgZhjH0Oew1hNuIUvtCzVpoXGSDZOWO1b1VZ1hjEbEbNnCtbRa9+FsqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEoKM56i; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4290075c7e1so1409645e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724344430; x=1724949230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU3KE8OpClc69UGPW8/tNiTT0P1BSjvACL1i+Qa8X78=;
        b=xEoKM56ixNpASyvW+VGhxbCPvos8dJiSA4mA3c7uYsrOkOrAhkRG0dxSGL2y/CO7Fy
         QTlILcKiflp9qiem5gKG7uRoBYeqLmEt2r61/NvEHAJQmwPBd8WcV2UlBBxiTCFBZQ7S
         uWh6cykZQT2c8/14OHrStD7GI02JSE+AGaAksHuZb/y7ke1ro9ABD/nFx7zTRUspFvYr
         fFap7YFBVNfDrfHlPUc9Jz0EBvwuAxbOnpBaSJp2Z1xpGFJ/pwNzji8tMd57uunwmV/I
         vvp5wATSqLXAYg+qjutuLxqTQsFkyp7p1iLJkif88asP+8FPkMe7jexmQwf2TVWV8eAd
         SEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724344430; x=1724949230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XU3KE8OpClc69UGPW8/tNiTT0P1BSjvACL1i+Qa8X78=;
        b=eevG9BVxASA083u/9Na27TqLrXqtEmHDPbgFEj4F7y86b+6diUEAzZK0phoghXiZ5z
         xWaCwo3/4ugH6LEFWBFjLjgqAwfIxnQgoPGfFiCTYEdZWPJ2kThxHT7tg2HfQXX39In7
         ZyO7xc7fHV54Gx6IK1JC8HS+2VYCAWJpbHa4vnuSYiVzEijT1Q1/kGuBPNqYUDdH6NE9
         SV4m7LAQSiNHOF75BbaWDbbDdErlmDLpA18sZ/oF+Z3xbZJa+C0GlF4sxQbDop0tN72S
         5eU8BHbjVgP+uyZDkyDed54dib97WwUT+R6ASSciqVPmzMaV8ZKOHRWcA8IyuxCYG9ak
         xkiA==
X-Forwarded-Encrypted: i=1; AJvYcCUc6Os8QIZEs0mgkZ7qwMlg3LMj9W6h5zGVdPvUdKFhSC/eWiaBr0Ky9ttVskM/+IN7EZ4wb46ClwUPAa84@vger.kernel.org
X-Gm-Message-State: AOJu0YzJrPyKOUfihsPhFKMS+dvZGTd39lYuZRhWVf90LBfqFSTmmWnf
	CqEf5ri9rW6ER0etwcJ2FED3T4J4YW+PqaWkJ5qGcrnpFZL7T17783LpSqcJPqk=
X-Google-Smtp-Source: AGHT+IG8UTa/fe8++7QtyBpzenYZedHNEThBpAvYXZlhDKR26418e4WI82bBos2ltyRQ0pHEuhJCIQ==
X-Received: by 2002:a5d:6da8:0:b0:368:4c5:af5 with SMTP id ffacd0b85a97d-372fd72f091mr2165930f8f.10.1724344429994;
        Thu, 22 Aug 2024 09:33:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813cdcfsm2069377f8f.29.2024.08.22.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:33:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] soc: qcom: pmic_glink: simplify locking with guard()
Date: Thu, 22 Aug 2024 18:33:45 +0200
Message-ID: <20240822163345.223787-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822163345.223787-1-krzysztof.kozlowski@linaro.org>
References: <20240822163345.223787-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify error handling over locks with guard().  In few places this
elimiates error gotos and local variables.  Switch to guard() everywhere
in the code for consistency, even if it does not bring benefit in such
places.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

The part in pmic_glink_rpmsg_probe() depends on previous fix.
---
 drivers/soc/qcom/pmic_glink.c | 49 ++++++++++++-----------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 452f30a9354d..dfed8b84eb5f 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2022, Linaro Ltd
  */
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -97,31 +98,25 @@ void pmic_glink_client_register(struct pmic_glink_client *client)
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
 
 int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 {
 	struct pmic_glink *pg = client->pg;
-	int ret;
 
-	mutex_lock(&pg->state_lock);
+	guard(mutex)(&pg->state_lock);
 	if (!pg->ept)
-		ret = -ECONNRESET;
+		return -ECONNRESET;
 	else
-		ret = rpmsg_send(pg->ept, data, len);
-	mutex_unlock(&pg->state_lock);
-
-	return ret;
+		return rpmsg_send(pg->ept, data, len);
 }
 EXPORT_SYMBOL_GPL(pmic_glink_send);
 
@@ -208,52 +203,42 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
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
@@ -326,9 +311,8 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		goto out_release_aux_devices;
 	}
 
-	mutex_lock(&__pmic_glink_lock);
+	guard(mutex)(&__pmic_glink_lock);
 	__pmic_glink = pg;
-	mutex_unlock(&__pmic_glink_lock);
 
 	return 0;
 
@@ -360,9 +344,8 @@ static void pmic_glink_remove(struct platform_device *pdev)
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


