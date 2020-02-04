Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EFD152121
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 20:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbgBDTb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 14:31:57 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42403 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbgBDTb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 14:31:56 -0500
Received: by mail-pl1-f193.google.com with SMTP id e8so5072678plt.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mnXL4mq5RnnUrdKt8dTqwe0mdqkGu5G0RBIoNNOFIY=;
        b=nfrJpMl/NkXlXm1zwccGpX9nj3v7gheq6vapei2v1UBO/c34zZsr1OSdTykjwa9swb
         qg2aLP8dXGGFTsiErSDN9rLfFUyI5z4YmQ7SqAPHdRVHD4IdZsMHEc2jvNZUyGBdBbOB
         +KsEwSFp1bI4RClMbjKwtR/zXcSt5/PTy8ewM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mnXL4mq5RnnUrdKt8dTqwe0mdqkGu5G0RBIoNNOFIY=;
        b=TRZFZjdBvoxstSlL12o6v32MWl5kbYfeyyRfBLALt7ss6WjSePQ1JopBKcVTzwk81H
         56wsWevCp7Ccmy02/9FvRAa3FGS6H+7E+RJXJi+HWzb+rW455erUpsINIArOFmWVOTYt
         NH+Uz14/loBFGcTBnRVhFyOFQ7YnC9Hx//+UDsSLnF5Zw8IG9k9yj+gNr5dWdq9OKHGg
         JOxiWG+fW80GtD7TDQrzqU/LV6lSaPnxDhffStYwqQNmiwJym83ga8/d6QQ07OHtEDT/
         lgLZ8zYutMQBH3URv31RCdKyrHS7zwOiwnzbwFVQzkYezYI2BMdaqBbj8xRp3df42vin
         RuOA==
X-Gm-Message-State: APjAAAXIuCB5kH2KPnvUl5D8NtLNxSGRWKDbsc+Uz5kr7sUdtwboaoSR
        /H4jrrFLm3smWOEywyQS8309FA==
X-Google-Smtp-Source: APXvYqyO0lAh0JwBo+F40bj/gsmfbuZTVv1MHdOvKM6UesYAvtPuFBuzPvM6XvbXaZy87J57mdPGSA==
X-Received: by 2002:a17:90a:cb83:: with SMTP id a3mr842308pju.80.1580844715239;
        Tue, 04 Feb 2020 11:31:55 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g18sm24956626pfi.80.2020.02.04.11.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:31:53 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/3] i2c: qcom-geni: Let firmware specify irq trigger flags
Date:   Tue,  4 Feb 2020 11:31:50 -0800
Message-Id: <20200204193152.124980-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204193152.124980-1-swboyd@chromium.org>
References: <20200204193152.124980-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
should take care of this for us. Just use 0 instead so that we use the
flags from the firmware. Also, remove specify dev_name() for the irq
name so that we can get better information in /proc/interrupts about
which device is generating interrupts.

Cc: Girish Mahadevan <girishm@codeaurora.org>
Cc: Dilip Kota <dkota@codeaurora.org>
Cc: Alok Chauhan <alokc@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 17abf60c94ae..3e13b54ce3f8 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -549,8 +549,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
-			       IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
+			       dev_name(&pdev->dev), gi2c);
 	if (ret) {
 		dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
 			gi2c->irq, ret);
-- 
Sent by a computer, using git, on the internet

