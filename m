Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CDD5FF7AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 02:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiJOAq7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Oct 2022 20:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJOAq6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Oct 2022 20:46:58 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FC273310
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Oct 2022 17:46:57 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id f140so6353560pfa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Oct 2022 17:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R97F6tafPKuH3Wb7fiZxQjJXQ8j8fICZkLtVUZ7PMKs=;
        b=QLOUkKXyXKxnryU68yEhMzW1PSO+tRC1EVQ8JePXkfSzUNUQJ0RadH5pPzjAzQTFIT
         X+zIARW2wZiFSM0322qGBZ8JMTApMuHr87RSSBerUKjjkwMjN6cySAwNasjkY+rfRB6g
         FH8xHUljGnHr+qyB3oOQFLvZTK5dme12KdxQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R97F6tafPKuH3Wb7fiZxQjJXQ8j8fICZkLtVUZ7PMKs=;
        b=iInU/3fU/tS82q4APzO6eCAr08uyq9iBFJ/vZx9Dgu/uQW1k/2inOStsHUqBHsjh4y
         KYkeltnNsLUsQX0kct1bjwLFdznOaZZL/MURWK+6v98Rhtj9XbNfEa5/FkDEdWWfAFIU
         ysApRXXtwsGSDNqWPwXCFAZhhtjQm5QzLAqH8IZ6pwEAfOyKNEUh9ym+Z4jpb1pQl3Ag
         V1oT0JMmYeBuua/sxchMU/o4DWWZJ4ZjHnA1+vGX+xePm5Ysjt9dNNHiV+iFofkogz4V
         O0y56OMPJZl9C40Sdw5dF4MIIHvjWGz5Q4mUaAcvOc9jj+WTfaZ6jFWZ6MITNeD4ohCe
         CBbQ==
X-Gm-Message-State: ACrzQf0D8SJMyQytQFSKaE+z/20k8Q/KCw+e9DQkowZH0gmJ27XSIs+f
        COhUmHdbNQc3125uFvXkWKeIrQ==
X-Google-Smtp-Source: AMsMyM5BFZx0QDc7pR9+g4YFHVAhun5z2HILPgjazDPHaBjdjuDPXO1Gf0dWyqcBdWzhp7aXYiemcg==
X-Received: by 2002:a63:1145:0:b0:46a:e00c:579c with SMTP id 5-20020a631145000000b0046ae00c579cmr479334pgr.279.1665794816651;
        Fri, 14 Oct 2022 17:46:56 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:9d:2:9f6e:fc87:d13f:1fa6])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902bd4400b0016d72804664sm2230802plx.205.2022.10.14.17.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 17:46:55 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH 1/2] soc: qcom: cmd-db: Mark device as having no PM support
Date:   Fri, 14 Oct 2022 17:46:53 -0700
Message-Id: <20221015004654.3930122-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This driver purely exposes information from memory to the kernel. Let's
mark it as not having any device PM functionality, so that during
suspend we skip even trying to call a suspend function on this device.
This clears up suspend logs more than anything else, but it also shaves
a few cycles off suspend.

Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/cmd-db.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 629a7188b576..33856abd560c 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -338,6 +338,8 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 
 	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
 
+	device_set_pm_not_required(&pdev->dev);
+
 	return 0;
 }
 

base-commit: 4fe89d07dcc2804c8b562f6c7896a45643d34b2f
-- 
https://chromeos.dev

