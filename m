Return-Path: <linux-arm-msm+bounces-13030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C85586D5A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 22:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D2801C2330B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 21:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B00614EA5C;
	Thu, 29 Feb 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZvrrRto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3718113E7F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240167; cv=none; b=usLn9gdQh2cEfRFW0Iw58Qy5ChP1J+tMuPSuikDoRoR/MUGNUpHC/6JwCzJdpM/aX4uhcihdK7K0BJxBpZXX/zK/YE2rFR8WDtAIF/GWY4B/skEfbgiDR1Jd47e6qVHKcIWpDLve+fGSTaVdnA/D0Nu5YHX0Cw8O7XwOekyiM8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240167; c=relaxed/simple;
	bh=XwGOf1MLWzPXiuaGkXStpdLvB4FPo5vk4nLwFw1ga6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kdFB78Vws4xwXXwrqcyfaKV1RaKvhC/N3zshYwceOPECSFQsDM/f3F9PDaa//ihPN+c/k6faexaKxQX0SPONE+66T0T6aJoJbuUFrKIchm88rWlI31BNiOzkbohEvwWtjT4FEzfnx/xfP+fEpQirXeI/4zC41Y7oE5NLEzzRkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZvrrRto; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7c7701f95b6so74088539f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240163; x=1709844963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGWJjaxvrYhNIssQekJJrsQHyV2VIpv1G8S6HOh3hAI=;
        b=vZvrrRtoJ0d9uTr6s3Pb/ceg1M0WUShdeXro7vTkFOuyMhhCxWOBFuU2vqDIMYMbx6
         1p10cO8/kLLuKXEdFnXVzAQIlPL6RG436NEt/5Rwbr6MQgNhyR3nYpzdNPA8aEqS9GX/
         L7nWkkoY259bDUvFZxZtQVuJandsi1M9vCy/fr3uNBCtIbHjWxU23ABTel1RfWDhjfb3
         jYBkqSKnZiscII1i+2l9mZuhkrlbZAF2MkyGc9PjB7a8Pobb6dbuz+pXcUyxA/8NIZCM
         G/p0Svhvp4q7v78mMdfpipj/SuQyTGlWoexXe9A2Pov9eniDYEG1ujo5gizx2vS8T8Qr
         JCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240163; x=1709844963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGWJjaxvrYhNIssQekJJrsQHyV2VIpv1G8S6HOh3hAI=;
        b=oG5utFyEx1VIhFClBSIOKQTyGldOOjdYuLvfVBCGPAxJAoZNgK3khqGEbaIZEdBmK5
         KPM0AcWIAqnDnstIBQecpE4F42lLuARH0IXO0mlaH6uyl2l36U46xD4oEXFgb6x/m4eW
         HamP0Z8P76PTFHEGDlyG+Pyv1MH4T4fj5Ega8pkg4+hwHRbE+NvNYfuVT5k8cQb4sE8p
         r7zCkt7QbC+MeA/kdtyn077hq+X5Z/HyciV6vwKhHO9eC+oH6njhm3z9CDCmRiRFoLYt
         MLQhmCP7Lg1I0ET8HzqtxeFxgpGN0ENEML5sDJE8qwLv5IQgI1PmRhQYqIvSvBeeTqqZ
         lscw==
X-Forwarded-Encrypted: i=1; AJvYcCXoap17ni+97K8FNLlLgNrqd17vkCcBdu14Ed8qh76kCnLlmcor4GTUVmLeilzudUEAoW+c7isDysoUbAUDADAgLiSGDq9yGptc7i62sg==
X-Gm-Message-State: AOJu0YyccUdvDnL7T89x5gZW0PdV/dJq520UorXORg9UU/p+VabZ2IU8
	sQ83VkhQ1ZhxrKlHndLpZHsISAf28y1NkXbRy2D/1Fdf8/XJo6ynEbmgCezqZxk=
X-Google-Smtp-Source: AGHT+IFiZEOjl8Eg1h5669qLC0O7+SdSht2D0xZWN6IxWmQVMl7eENwv3Y4e2KBM5sTVa/64RKullw==
X-Received: by 2002:a05:6e02:2195:b0:365:1c5:7a5a with SMTP id j21-20020a056e02219500b0036501c57a5amr24688ila.4.1709240163486;
        Thu, 29 Feb 2024 12:56:03 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id h14-20020a056e020d4e00b003658fbcf55dsm521551ilj.72.2024.02.29.12.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:56:03 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/7] net: ipa: pass a platform device to ipa_reg_init()
Date: Thu, 29 Feb 2024 14:55:50 -0600
Message-Id: <20240229205554.86762-4-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240229205554.86762-1-elder@linaro.org>
References: <20240229205554.86762-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than using the platform device pointer field in the IPA
pointer, pass a platform device pointer to ipa_reg_init().  Use
that pointer throughout that function.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 2 +-
 drivers/net/ipa/ipa_reg.c  | 8 ++++----
 drivers/net/ipa/ipa_reg.h  | 4 +++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 6cf5c1280aa4e..5c9c1b0ef8de5 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -866,7 +866,7 @@ static int ipa_probe(struct platform_device *pdev)
 	ipa->modem_route_count = data->modem_route_count;
 	init_completion(&ipa->completion);
 
-	ret = ipa_reg_init(ipa);
+	ret = ipa_reg_init(ipa, pdev);
 	if (ret)
 		goto err_kfree_ipa;
 
diff --git a/drivers/net/ipa/ipa_reg.c b/drivers/net/ipa/ipa_reg.c
index 6a3203ae6f1ef..98625956e0bb4 100644
--- a/drivers/net/ipa/ipa_reg.c
+++ b/drivers/net/ipa/ipa_reg.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2019-2023 Linaro Ltd.
  */
 
+#include <linux/platform_device.h>
 #include <linux/io.h>
 
 #include "ipa.h"
@@ -132,9 +133,9 @@ static const struct regs *ipa_regs(enum ipa_version version)
 	}
 }
 
-int ipa_reg_init(struct ipa *ipa)
+int ipa_reg_init(struct ipa *ipa, struct platform_device *pdev)
 {
-	struct device *dev = &ipa->pdev->dev;
+	struct device *dev = &pdev->dev;
 	const struct regs *regs;
 	struct resource *res;
 
@@ -146,8 +147,7 @@ int ipa_reg_init(struct ipa *ipa)
 		return -EINVAL;
 
 	/* Setup IPA register memory  */
-	res = platform_get_resource_byname(ipa->pdev, IORESOURCE_MEM,
-					   "ipa-reg");
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ipa-reg");
 	if (!res) {
 		dev_err(dev, "DT error getting \"ipa-reg\" memory property\n");
 		return -ENODEV;
diff --git a/drivers/net/ipa/ipa_reg.h b/drivers/net/ipa/ipa_reg.h
index 2998f115f12c7..62c62495b7968 100644
--- a/drivers/net/ipa/ipa_reg.h
+++ b/drivers/net/ipa/ipa_reg.h
@@ -12,6 +12,8 @@
 #include "ipa_version.h"
 #include "reg.h"
 
+struct platform_device;
+
 struct ipa;
 
 /**
@@ -643,7 +645,7 @@ extern const struct regs ipa_regs_v5_5;
 
 const struct reg *ipa_reg(struct ipa *ipa, enum ipa_reg_id reg_id);
 
-int ipa_reg_init(struct ipa *ipa);
+int ipa_reg_init(struct ipa *ipa, struct platform_device *pdev);
 void ipa_reg_exit(struct ipa *ipa);
 
 #endif /* _IPA_REG_H_ */
-- 
2.40.1


