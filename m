Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC32DD0455
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 01:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbfJHXpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 19:45:08 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39135 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfJHXpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 19:45:08 -0400
Received: by mail-pg1-f193.google.com with SMTP id e1so187299pgj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 16:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g6+fgv7o5Mc/zUQb4lUQ0sPjn9LWoOyx6TnpyyZahZg=;
        b=B6RHNGrOm07WuboIxNb1d1jtA7CxE+Hg4E/LLnretKo9zn+WzF/8/gnt7eHlHC7kuV
         a6O5MtzttqIam4d9/Sfwv7663+um+CwN1uJMQAk6inURP47Sw3biIBa5adylsqJrHD7k
         eAh0rhspz/fShqdgLZyVDhAKqUlBvWElg4vrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6+fgv7o5Mc/zUQb4lUQ0sPjn9LWoOyx6TnpyyZahZg=;
        b=lnSpXO7qF60H94yaGLM7TrzR5huNdIlVWDnJbNNTFt8fkNWT6zbwXATWMYvHlaayLv
         Z5RPIl4d7hHgTw5nqFYsgjxfa2CDM5fUKJOw7nLHUN1qDZH3T1cKuwCTQACevC1Sxptk
         dsfzd0KXLD84FPoawd4CPuZ5vrdzOFTbU+avhjP60z27PZBAnZuRxxhB912lQIE4QmD/
         mZNy+CN4+QZcmj7Mjaz1zNqjDcQH4MQ30iPWECLIyjFRotL37j4iGFkAbOxwjXYACplf
         31qxfEwjtJeCB2VNtD7aFF99N/VZfyXDg0/rPWtxUeK8VqRcjGVb2vU1O3n9ADxQxn7o
         5B9w==
X-Gm-Message-State: APjAAAUaffQdsYp3SIwqr7k7p7GMoozyZL1RMiO9tnvfcbzULlz7LTqu
        INlC1YoDU0tqszNdALODqaYiYQ==
X-Google-Smtp-Source: APXvYqyhBo3fTurEQKhDAY4F2lAq09MkB0eqZgCj9Vojx0DdkadMQ+Ue0N/CEyFcdaBCAoLbQXbrFA==
X-Received: by 2002:a63:eb08:: with SMTP id t8mr1120368pgh.49.1570578307734;
        Tue, 08 Oct 2019 16:45:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s202sm210671pfs.24.2019.10.08.16.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 16:45:07 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 1/2] soc: qcom: llcc: Name regmaps to avoid collisions
Date:   Tue,  8 Oct 2019 16:45:04 -0700
Message-Id: <20191008234505.222991-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191008234505.222991-1-swboyd@chromium.org>
References: <20191008234505.222991-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We'll end up with debugfs collisions if we don't give names to the
regmaps created by this driver. Change the name of the config before
registering it so we don't collide in debugfs.

Fixes: 7f9c136216c7 ("soc: qcom: Add broadcast base for Last Level Cache Controller (LLCC)")
Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc: Evan Green <evgreen@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/llcc-slice.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-slice.c
index 9090ea12eaf3..4a6111635f82 100644
--- a/drivers/soc/qcom/llcc-slice.c
+++ b/drivers/soc/qcom/llcc-slice.c
@@ -48,7 +48,7 @@
 
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
-static const struct regmap_config llcc_regmap_config = {
+static struct regmap_config llcc_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -323,6 +323,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
+	llcc_regmap_config.name = name;
 	return devm_regmap_init_mmio(&pdev->dev, base, &llcc_regmap_config);
 }
 
-- 
Sent by a computer through tubes

