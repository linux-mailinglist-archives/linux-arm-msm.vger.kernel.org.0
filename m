Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF82445CB8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350044AbhKXSAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350029AbhKXSAk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:40 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA79DC061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:28 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2779376wme.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=buYviz0EsUgobZTb1+UWjhyi7czeVNwVeTqZcQGLq9E=;
        b=om9pPKapcEc98HyXuYtg7ce2jRCXQPfnTfzGCPeUJ6R4ze+Cok6kn5Vbs17jY6rhfc
         WU0LDMZcDbI46qAl3FtxundYfl0hk8bMvhGWPZ6wXvierA9RCM1uj/B2LAGy5o84+iGB
         3dZRd44btHWlV+OipEKZyvj2N8kAXcN7Aon/faSsx4BECnZC9aV5MRLRJwbLEAEV4Jgh
         4wrhjFZOu6A8sirBkqzjpsNad5uwXMyNdUulBzqv/5FWt5cRgmqQyT0aeXR6RwqMDGkV
         4Tq0yVxJbQ1O2O0ZQ8H7zjmF6lqGooPBwSCr5g8UqML2WhH7GHTgTMO2L9lLY0RyOqRy
         Pk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=buYviz0EsUgobZTb1+UWjhyi7czeVNwVeTqZcQGLq9E=;
        b=jni1GD6aYOyTHmSpQ49TBG4LYgqoBx6KBwzGqvZL45/YF90G2y5RMjvkLop0bWqbqY
         gbm1zdkcyzIJVXqHnH5HjU8g3X/c6f3s6YFbVpkI3yBENrFrJqFVv/Zb5yQeQ/Zp2/tk
         SkqAC2JmrEoWcC1qUiHxtQ+w7R3W/wHwW+531aiSZHfZck/8jOshwS9LUMfmEDVrRKpS
         cFGMUqGmJJtLquRU/Mt0AaGt2kpv+F8UHCH6Cyn42KraDnbm0qDhzci70IZq8ZS10uST
         lQmTMq1uzBCLOPx4sNZHqZ8DQO1cHAIws3qcVSi+tR15JwRCr+HTp9b/bxpVNwzo5xa4
         5agw==
X-Gm-Message-State: AOAM532X/1R8FcKuL4tChNHMWbUTcud5Zw6b5+LiKDhNYw0SQmwe3blZ
        yodvIsIAn8n1zXqVoo0tHiAtSx+vkn682TFv
X-Google-Smtp-Source: ABdhPJzUWWh1rY/vGhf6D+Xs+DG/2hKxSdPAOniWGRr6UDQMnE8/xWx+DAqX6UgrVPMoWJ6vaXDweA==
X-Received: by 2002:a05:600c:6016:: with SMTP id az22mr17964279wmb.11.1637776647206;
        Wed, 24 Nov 2021 09:57:27 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:26 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 08/19] media: camss: csid-170: support more than one lite vfe
Date:   Wed, 24 Nov 2021 17:59:10 +0000
Message-Id: <20211124175921.1048375-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Change the IS_LITE condition so that it returns true for the second lite
vfe found on titan 480 hardware (8250), which will have id == 3.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index f0c6a72592f9..2c84d40fe3e0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -21,7 +21,7 @@
  * interface support. As a result of that it has an
  * alternate register layout.
  */
-#define IS_LITE		(csid->id == 2 ? 1 : 0)
+#define IS_LITE		(csid->id >= 2 ? 1 : 0)
 
 #define CSID_HW_VERSION		0x0
 #define		HW_VERSION_STEPPING	0
-- 
2.33.0

