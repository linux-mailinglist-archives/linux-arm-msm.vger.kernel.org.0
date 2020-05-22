Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E24A1DE573
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 13:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgEVLd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 07:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbgEVLd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 07:33:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3856C061A0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 04:33:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f13so8332225wmc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 04:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OajhC/Jlp+i5qsov4pnkcjK6U5hx+P44py8BzGS7Qqs=;
        b=abN68/5Nj5GdX9fC++rV7XC3ur2E20eyulOefbRkWbnKrAUtlysPhPPMLqTKRQD9os
         nwJ956KW0FJ7BVAV5e7aAeII3u3gli7euG9VcbTIctPPrbk9LsU4vcbvEs88rKkt48kl
         y/KqZ/VHG2Gieg/qFtseQPo5h2g1Ol+1FPSBnWmm6d83o5SYfww7iYMyja+MgRMJ7LCp
         Now19vKKy/Kjo8gurwddkhNJrrnTcHHomJ/EPjVZO3CB+DUdfyG6zYQb6kExTuuXsmCS
         NxvKu5WKUbO96+q64APDEZUl2EQJKf26aRt5a/w0xU56mmAXukV7DyBWJq4yreaP/fh1
         qYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OajhC/Jlp+i5qsov4pnkcjK6U5hx+P44py8BzGS7Qqs=;
        b=nmMF0sjo93qqgaK6UspYGQ75ZVpqB63lmCi7bX+FEoefS+5RUbJgTwDgyA8dF2kX3g
         jE+Q4vWBea/qr1YIsBqj1m+DjlI2oHiyp06WoUCH22ImfcHogLfXpJeNJBpEEph0RN1A
         Oj394dbTKLh9fO6xBjdlYVXK/ieiS+H1c+SrfwzGyJG2Q7Bu+lHoZqXfl651NGdHhVzT
         B3XNXkiDXXa/4LA0aAfW9TduJ5hrcMH1pdagg+nKLGgzW1yC5iSky3ti7eF9KXYsglIB
         05Kqm6d3wDuoXWJVbmE/v1AqjVcm5Nl/5Mm/w9SLHu9L0Pwt4gKU4EqamzQCanXjOjTL
         1hyA==
X-Gm-Message-State: AOAM530Jb5wKvS0XR7bBGev6VhoUmpSbStlLyxv+R8KjxR307CX4LEZC
        FH6zPRZjIstmnrV4fvXJJLMP/A==
X-Google-Smtp-Source: ABdhPJwfo7U/siJSifClNKcPlD6DhwK0aOP4wVhWFb5ziGMQ5SJYW3K4H+LHrChTPCeDT5exThyLUQ==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr13109176wml.117.1590147237437;
        Fri, 22 May 2020 04:33:57 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id y8sm628420wmc.37.2020.05.22.04.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 04:33:56 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     srini@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] nvmem: qfprom: remove incorrect write support
Date:   Fri, 22 May 2020 12:33:41 +0100
Message-Id: <20200522113341.7728-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qfprom has different address spaces for read and write. Reads are
always done from corrected address space, where as writes are done
on raw address space.
Writing to corrected address space is invalid and ignored, so it
does not make sense to have this support in the driver which only
supports corrected address space regions at the moment.

Fixes: 4ab11996b489 ("nvmem: qfprom: Add Qualcomm QFPROM support.")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/qfprom.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index d057f1bfb2e9..8a91717600be 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -27,25 +27,11 @@ static int qfprom_reg_read(void *context,
 	return 0;
 }
 
-static int qfprom_reg_write(void *context,
-			 unsigned int reg, void *_val, size_t bytes)
-{
-	struct qfprom_priv *priv = context;
-	u8 *val = _val;
-	int i = 0, words = bytes;
-
-	while (words--)
-		writeb(*val++, priv->base + reg + i++);
-
-	return 0;
-}
-
 static struct nvmem_config econfig = {
 	.name = "qfprom",
 	.stride = 1,
 	.word_size = 1,
 	.reg_read = qfprom_reg_read,
-	.reg_write = qfprom_reg_write,
 };
 
 static int qfprom_probe(struct platform_device *pdev)
-- 
2.21.0

