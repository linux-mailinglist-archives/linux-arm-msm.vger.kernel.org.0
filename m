Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46227B8D39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 21:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245419AbjJDTEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Oct 2023 15:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344066AbjJDTCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Oct 2023 15:02:50 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A731B49D7
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Oct 2023 11:57:41 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-405524e6768so1193385e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Oct 2023 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696445860; x=1697050660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VP/93kPYzgXpGiMnYL3cDAWfcq1rdpyqoQ0GDHykkdc=;
        b=L9a9tG9aIH8P939QhipXrnN4BkS5st5dPYQIQe2hgyHOW7t6ysB8YQCI2jRis+KCq/
         RakwqEm/zdd5O/Pxzcl2nwuG2Xqf6sF7n8pWIpPYyojEMjvQxEAcYxf8wexTdkQVH0+W
         jHZGDOegygX/Qdz+GK5XFGWF6S3ZUD0CHpC4cmLmLBP28drJpKj2i/61AKGC7Y80/+km
         sq/TTFgEta4KnSORaSDlJKzh5c003SGxYBhFXdi9l8twN2+idd8BTR4PsPkaxrKLLsIE
         zWUxOphpdaiJS/zF25BOkpjiWAuA4alWqwQwAFD4EkwNhzaCNqaa2WGblaUe8ePooTWu
         kS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696445860; x=1697050660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VP/93kPYzgXpGiMnYL3cDAWfcq1rdpyqoQ0GDHykkdc=;
        b=QQDI1VHmXPxBqnxh6P67UbXJtV6BMoLozjCyZvmXkzpx6fMePkcMnXCcsX1I/Dsi3N
         +soOiJ9gc+NOFo+jmLhpy9saD9T5IfRrvFSqwBsxdejyc7dK0pXNZoBxbkojwBX8oRow
         V/9PSxOBtR6EzyHWAoL5HRJcMKosOjwfRAfOob6eXAkEPRBvZ9GlDKsOrz7i7kacUAgD
         E/6eWZiJpYGKq9AsMuyi8akCj0VJKUAZ6+7+w3ge3iX8KtR3wIM9rm+HkS4ZATUW+vzT
         ee1frrKZS/DA7sIK7oRMr6uflPXY7C77ugf1rBZ8I7Cy4X+4Z9BhqqJUfE48pGlRBjBi
         NEAA==
X-Gm-Message-State: AOJu0Yy8JuwsNOI5MDKKG2nHizGeMJu5cmT2nTwka45eoVQkqWTnD2Ec
        Wava6dqtr1QSvyLxX21nKxOnbQ==
X-Google-Smtp-Source: AGHT+IEJTJuahfEEYmg48ihNCJ1wp/pAt2zBM/ZV1nJ9A4jgjKVxVZj05+YRd7g7BmqXWjXsuBLsKw==
X-Received: by 2002:a5d:4b11:0:b0:31f:ecb2:1bed with SMTP id v17-20020a5d4b11000000b0031fecb21bedmr3137805wrq.15.1696445859897;
        Wed, 04 Oct 2023 11:57:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cd6:4440:32bb:f50d])
        by smtp.gmail.com with ESMTPSA id u12-20020adfa18c000000b00327de0173f6sm1284961wru.115.2023.10.04.11.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 11:57:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] firmware: qcom: qseecom: add missing include guards
Date:   Wed,  4 Oct 2023 20:57:32 +0200
Message-Id: <20231004185732.98621-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The qseecom header does not contain ifdef guards against multiple
inclusion. Add them.

Fixes: 00b1248606ba ("firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/firmware/qcom/qcom_qseecom.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
index b531547e1dc9..5c28298a98be 100644
--- a/include/linux/firmware/qcom/qcom_qseecom.h
+++ b/include/linux/firmware/qcom/qcom_qseecom.h
@@ -5,6 +5,10 @@
  *
  * Copyright (C) 2023 Maximilian Luz <luzmaximilian@gmail.com>
  */
+
+#ifndef __QCOM_QSEECOM_H
+#define __QCOM_QSEECOM_H
+
 #include <linux/auxiliary_bus.h>
 #include <linux/types.h>
 
@@ -44,3 +48,5 @@ static inline int qcom_qseecom_app_send(struct qseecom_client *client, void *req
 {
 	return qcom_scm_qseecom_app_send(client->app_id, req, req_size, rsp, rsp_size);
 }
+
+#endif /* __QCOM_QSEECOM_H */
-- 
2.39.2

