Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D05EE481
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 17:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfKDQQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 11:16:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33398 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfKDQQ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 11:16:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id s1so17822498wro.0;
        Mon, 04 Nov 2019 08:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3uo0BMKlK0y8MI6JAlvvPKjW+q8BZt61AS+QsUjT+0=;
        b=Tnb/Lo2rthzMTsJJH+VXKXylmJSmWJd9ZdltDZOhEHkcTYtjujuaWVHzY81dFUM3JR
         N/1CCvPQA3hUOEBn8zR+5Wlb+vrp4wTZI/D+ixZyE0XfsZab4OTFocXtc2wWPjKAxXxL
         ppnWzttt/aOtsZVrPuA65eRxAW/bThXyLybgOh6/JHV4Q25v4q9ttBttw90hZmCMEj7q
         BtJ3kB+xsNuohdYEaRwoF6FUKwvrR1FtkQFNye4DPVAm6xW8EQHvmiwwTTPLrvQ+2j0M
         yDC58XoxcpHR14OQK0lZ/urATEZxpIdWfCFoiJrZpCCi4ToJSSlc9N/G5ZGf67mqcSNm
         CV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3uo0BMKlK0y8MI6JAlvvPKjW+q8BZt61AS+QsUjT+0=;
        b=JQI9OYSpmBASQGj5SqL45RH7IoNnhl+OgZyTthQ78OD2lfzx6A67pOafiLtIfhlgOJ
         4W82/sAFS5tx8K7lKmqBXGRBfATgAYS/Y+lyumtmN6m7uROZ/2UTpo/Lm80OTihN2pMz
         qm1JYLPqH4PInkz1RA2aArgWB1h9DnxeaaqhjdjiMw9VYTzlHJRPqvdrpsojLfIvZw5x
         Aa5DM66pXWhN0W4nTQsF/V4uoLj1kP7g4bF8eeoQzOwBAd21N2znIpuy4lRh8oFfkJqn
         8euQ1hVc4YXJLOqlJe8l6nuM6kv0srCanWF0tG/kR08zVuEXzwyreIxH4CpTBkBHMP/U
         c0gw==
X-Gm-Message-State: APjAAAXHgky99Of6XNMG5lnRZ4iDqHL2/FyqZr96mwisIQv/IRYU9Rg1
        S3x6rZSNe1lT/NCFdlVaVfQ=
X-Google-Smtp-Source: APXvYqzH2/1W/bp/+tW/I54PiPKy05mHniUEGDtYNElwkgXj0oL+pntAV6+W5ERlrQLcUUPhqfcI6A==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr24904912wrs.239.1572884215437;
        Mon, 04 Nov 2019 08:16:55 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id k4sm19652778wmk.26.2019.11.04.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 08:16:54 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] slimbus: qcom: add missed clk_disable_unprepare in remove
Date:   Tue,  5 Nov 2019 00:16:44 +0800
Message-Id: <20191104161644.11814-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The remove misses to disable and unprepare rclk and hclk.
Add calls to clk_disable_unprepare to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/slimbus/qcom-ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index a444badd8df5..4aad2566f52d 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -641,6 +641,8 @@ static int qcom_slim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	slim_unregister_controller(&ctrl->ctrl);
+	clk_disable_unprepare(ctrl->rclk);
+	clk_disable_unprepare(ctrl->hclk);
 	destroy_workqueue(ctrl->rxwq);
 	return 0;
 }
-- 
2.23.0

