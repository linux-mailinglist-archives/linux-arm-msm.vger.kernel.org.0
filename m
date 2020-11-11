Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812C92AF3DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 15:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgKKOkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 09:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbgKKOic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:32 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7B9C061A4D
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 06:38:30 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a65so2555119wme.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TWPvZ8Q5g6TI75wYwlmr663kYENsDmC3EDOVf4VZUws=;
        b=CBTrBBASaPzbM0zto16rBPP1OtKXcFcWsvhLYI02MALLIPA8DBtqGeNIIaBw2f+BYF
         LLSdWMMqLd1cSxXQEsUH2BDaLqw9CDkEnwrTTZW+IKADXbZYpeqKuc2AwrkRnbzBJvzQ
         RffPysPxe41v9IaY+NabRgB08ToFDJIM4T+iuCGZHbRfAx6f9YQYZ4FoGVyO19YkNfuh
         ayoF4L+aUqUl6J5nhl6ahgS90QBIiFDv2cj+q6JANh/QZ7oPo2hoe6gTHDLZws9wELu8
         rylgwYhm1mNBQ9PCWEvkBrWzy1k0xYBYr5egz1ts4u7OvEe1TY4MEstnEl8C8eOmoNIa
         b/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TWPvZ8Q5g6TI75wYwlmr663kYENsDmC3EDOVf4VZUws=;
        b=cRbQBmmdlsY96tpelaBllEwJZhaZSTvC2F2eLbogM5wqxaqY7GlLco3vknlp99NqS5
         IR15+k/BgAFemkXPbWD9b1bIX8FhCyH/e4U6wttH1ZyDoHPM/69TPrCAoQQFHae371Us
         wOngugWRpJZUCs4riVHcjOq5nUC63bnMSed5znCRJm7kGQKYQSrDNxuFZ43N4NJzoDcO
         3x16RuBI/H+A6TCDqBC9qMqm6rkUuYCp4KgvWlcqaDeoTGEFFNd2ar30D6XFDXatiT4C
         deXyDcJ6NFB9RFirm7FtyLLFAt3xty5tZYI8788tJLyMdtfQpeO27wCJJb+UKi0Ki3ef
         mFrQ==
X-Gm-Message-State: AOAM532Bd0TErXaOP22k4TXXYnCuEMvZyAakY8n3O7kdR+/8DhRZo3nD
        xUU69cmOCTc+RW9QhKVSGG2AiA==
X-Google-Smtp-Source: ABdhPJzJnrW6sIsYgEniA1h0eOK20YSa2wpZZMzrO2n9cS7E6RV6QQ+uX601nYZo5UQ2XWvRiiHHRQ==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr4427544wmk.65.1605105509436;
        Wed, 11 Nov 2020 06:38:29 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:29 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/8] venus: helpers: Calculate properly compressed buffer size
Date:   Wed, 11 Nov 2020 16:37:51 +0200
Message-Id: <20201111143755.24541-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For resolutions below 720p the size of the compressed buffer must
be bigger. Correct this by checking the resolution when calculating
buffer size and multiply by four.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 688e3e3e8362..490c026b58a3 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -986,6 +986,8 @@ u32 venus_helper_get_framesz(u32 v4l2_fmt, u32 width, u32 height)
 
 	if (compressed) {
 		sz = ALIGN(height, 32) * ALIGN(width, 32) * 3 / 2 / 2;
+		if (width < 1280 || height < 720)
+			sz *= 8;
 		return ALIGN(sz, SZ_4K);
 	}
 
-- 
2.17.1

