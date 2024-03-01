Return-Path: <linux-arm-msm+bounces-13101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97686E6A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 18:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 609E5B2225A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 17:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11491170B;
	Fri,  1 Mar 2024 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WThNEJ/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF66882E
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312572; cv=none; b=O2GxazxyOaVKVKe87jQbGocIG/4WwuHbU45ca9w6mbxGh/+8e9tObxtcWgueedk8qVAoQCPrC83Nxdro7nNp5zGbg6xAyqcex3Vt4EURo6ZqYz7Jwi7ZOUGdKOn7HK4+AIkCjH9MUOTXCIv615CUQx9X3QWvInvu98mnW8bXFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312572; c=relaxed/simple;
	bh=XwGOf1MLWzPXiuaGkXStpdLvB4FPo5vk4nLwFw1ga6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PInpO1sBD2pNJkUkc6tEaNHIY5YjpIpKy2SwimRaTQiXhZU7dIqGKT0Hcv/yhj3oWu8kAm6Jf3klnkfPklIlD76xZqx7WoGjo6bObhJJC2JtXQNmB3RnbUWmbE+294RFfLWfN0uxbZljcQTa/Eam+Pz3pwtaaK+RBh3bjp6ZzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WThNEJ/L; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-365253c52aaso7594555ab.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 09:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312570; x=1709917370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGWJjaxvrYhNIssQekJJrsQHyV2VIpv1G8S6HOh3hAI=;
        b=WThNEJ/L2qGEsrsSRQ5Ki6mTeXizAM7+MZh1SXDqsmKktz8dkDGUXXBgw1ydz5Eprh
         JXzQSoOMm/8NEZqvlEr0rWF6uMQNAK+XXIMTxDGrbuCWt7YP2YBbXLtUufi4BuVrbNgm
         1qkcD27ENItsobns+2pybMXBxyDqYKJ/KKkmuqy/V65e/B1QllGk3lQQHly1QDc6Pn28
         v7hWZgauQSLXFDMolNLfIifY8V9fLN+EazdVewMMRn31khryiXKdiITFZEedkpspzLhO
         DbI8Xo9SlGoEmB/51gkmZlzC4kodcGaVa8BK03ghQl8kJRWqTvA6WLbp3/60OfVF2nHH
         iB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312570; x=1709917370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGWJjaxvrYhNIssQekJJrsQHyV2VIpv1G8S6HOh3hAI=;
        b=gMEXnMMTGnQeg1j8/KWclCRIQ9eFZLWhOSuFcyjYLc3wP90BkNCMG9O1rukwtvjTFD
         cnNtC7BJYVZt+76TsTGwdrSnMyai1d3OFB1FuEgCh/scuj7JDAlyAyFQX/JVGdDsDgJa
         AGKXRHgEDdYAmmu4DOQ6+9haEpxn5RhE9mHY6ZCU9g1XSN5kByRgm2lOPtIxpPVprE5I
         Y8aAlo+ChQNE1Y4qHI2oNQ6PprNCpYormXP0njOBAGLjfA8kDORgAsK56B/TO5Q+Ml5v
         BOpoDveBBKCt05diLCU/DQZhY6QcIgDBX8ABShL5cRo8KSeQHStLu/lzSSC5NO6UqUZZ
         wiHA==
X-Forwarded-Encrypted: i=1; AJvYcCVu7W7NqSJjqFl4wpR8i4ngOyuJfTdAB86sqgXT0VxGJYc35ehOzfzewCmxYnBbAQOTlwbm3MqsVluzL3AiF2lEmUYxrOwA0gHI3dxHGg==
X-Gm-Message-State: AOJu0YzJtw0LDIdMk6lusCA1VRofsX+AHlzzfujCgQqsqjkyva4O2N10
	SjbDvEhCKYF2lMHtJJo0EztjeDcF44UmT3/EjLagShtXjYP+Ge40Rbn+KFy2BBk=
X-Google-Smtp-Source: AGHT+IFuF5YM0vSwjoMxJ/sucKgi07FMEwtC0vCsj/aKhS2iBQBSGrnHVpzotqrIOWbx7KwjP8VSpA==
X-Received: by 2002:a05:6e02:152b:b0:365:4004:83bc with SMTP id i11-20020a056e02152b00b00365400483bcmr2366487ilu.14.1709312570335;
        Fri, 01 Mar 2024 09:02:50 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id o2-20020a92dac2000000b0036581060910sm991430ilq.6.2024.03.01.09.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:02:49 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 3/7] net: ipa: pass a platform device to ipa_reg_init()
Date: Fri,  1 Mar 2024 11:02:38 -0600
Message-Id: <20240301170242.243703-4-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240301170242.243703-1-elder@linaro.org>
References: <20240301170242.243703-1-elder@linaro.org>
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


