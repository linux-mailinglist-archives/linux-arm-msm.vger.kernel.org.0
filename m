Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49452F86D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 21:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388075AbhAOUke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 15:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbhAOUkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 15:40:33 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8D9C0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 12:39:53 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id c13so6195159pfi.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 12:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mx5JYqiiqeL/1i/1oqLREwGjuTF0JZu0HOVxr4I/yE=;
        b=B7e3vVB5BWZefAgSQtq4sqCrLA0Ra1GJmdYR/yQZiTakDXwbk7HE/z0koHPAOx1DqO
         1DwjTZW6v8CUh/xDPYoIxE4JuR60exX5FDGIFDk/E26csnte8so/Z+/cpGIHQd9bJ9/v
         4a2fDQ0Ha7RlSYw5yglrKfydi5U/wMRXCMb3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mx5JYqiiqeL/1i/1oqLREwGjuTF0JZu0HOVxr4I/yE=;
        b=NXlaMIToS+lmN5dzrTCxbk/eUPBx24KNAFW1rgXx61ErQQQtJJyMW57N9MrPq3lqjr
         CuqishMGfBZlSIW0mOEhbmgEefpW/bnguuEg1tInqeYOYSGlN/tk0eKW4y05NTWXB9Pm
         FYKucMKhHuGK6GtAsac4RT1/xmXVU9JdfktBxrvrO0U5MrHz7BiwGY9W7dSRkATcDy1V
         igLe7Qnos2gJ8s+wlp2BcNvu3htHtSpBFvESJC0cjVc5/4+uzCGgUaSIazRxoSpZ2fCf
         rQs/11UUGddHNaHWESeP32AxxSTBa3tJCAqXStkMgdAD6m/PYDwYCiQjtgWqpj339F0v
         5W1g==
X-Gm-Message-State: AOAM530TJ0D/9wGw9zhi6A+eXWt3PNEGy7HJVeiMMtqO9z/W7EHLt+kk
        uF8ws+94PljyKai2RT5SrUfQfQ==
X-Google-Smtp-Source: ABdhPJx/aX7DDkniIIeXVUQbJOYikiXLekTlNd092SbtJjQy1F0hK/K1sPsszRARGVN/2uy//fjMmA==
X-Received: by 2002:aa7:9357:0:b029:1a5:43da:b90d with SMTP id 23-20020aa793570000b02901a543dab90dmr14393001pfn.54.1610743193208;
        Fri, 15 Jan 2021 12:39:53 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id v2sm8632916pgs.50.2021.01.15.12.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 12:39:52 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] soc: qcom: socinfo: Don't print anything if nothing found
Date:   Fri, 15 Jan 2021 12:39:51 -0800
Message-Id: <20210115203951.850873-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's skip printing anything if there's nothing to see. This makes it so
the file length is 0 instead of 1, for the newline, and helps scripts
figure out if there's anything to see in these files.

Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/socinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index a985ed064669..0844b5d4e354 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -373,8 +373,8 @@ QCOM_OPEN(chip_id, qcom_show_chip_id);
 static int show_image_##type(struct seq_file *seq, void *p)		  \
 {								  \
 	struct smem_image_version *image_version = seq->private;  \
-	seq_puts(seq, image_version->type);			  \
-	seq_putc(seq, '\n');					  \
+	if (image_version->type[0] != '\0')			  \
+		seq_printf(seq, "%s\n", image_version->type);	  \
 	return 0;						  \
 }								  \
 static int open_image_##type(struct inode *inode, struct file *file)	  \

base-commit: 3bc4bf77fa2adca8d6677461b6ec57505f1a3331
-- 
https://chromeos.dev

