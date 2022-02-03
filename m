Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE0224A88FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 17:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240972AbiBCQrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 11:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352351AbiBCQrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 11:47:08 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E38C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 08:47:08 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id u14so7151173lfo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 08:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reEPrw9sqpKkfTltdTv+Hj/7serim+AXRNC/H74bgHM=;
        b=OWFstwB2gFB/0kMFf5Vs2iED+LaRqQrFkoghdt6xdDbpKgVusiczw/ynb+caQoqJPI
         5E7YLIQA7OoJbyT5zddPa+PXn7ljWqa4/mV5pCKuy9ApiqTWpEsHbUoiaXrHxAdvSKl0
         ghOL9zgfPf7py/2Q5qK8KaH0Nb/CcPMNcOcGzS7azsd2ilENpfP949pZzQ903+0i+Z9R
         q8CbV5zam8mbQfoKonjZixx4bQ6bkIw4WzDIagv8rgQoN5vy/GnxgmV2H47gbjY/nN34
         gf5EVEkAflePAIP6fZg0MoBvqg8I/taHw2OrojZsp9sYZm37uKETy1gjdtkS+FUcq5AZ
         NJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reEPrw9sqpKkfTltdTv+Hj/7serim+AXRNC/H74bgHM=;
        b=yKZTtnZUmotE76Uj0PmxanNVcTaT6zd4QDwz1+4id/kB9kkWO2iBgf1Z9lnK3qFy6m
         jXqgmCn6+7uJHmeHUF6Tl9a4LX+PHu2kZR6XFDusjhuR/wiUgkdEwJ+EepZ1ByddeyVw
         184MYPEL0xqcUg4mNHjyved4JbLlJC8gzgrNr6YOUDe0V6AVhJWIxL/UloJKcI7p5n7Q
         KLDOKYBysbiLyNLxqDyrFxj7VEcbDGit2r+q94BKqzKD0mVvPOAZ/nHylu26RT75kdiQ
         62NSXRPpf7AzLrCx5QghP4rGqJ2ZUW0WnZPigrHUemlynglujHf+0bjG4ilVepJmi5kM
         vSrA==
X-Gm-Message-State: AOAM533dpz60eLgrk4o+Nd4COjN7TZGFJy7+dor8NgqtZiCgI05fVtpV
        xmsVU0hSpz/X8XFd2SB7oVgGlA==
X-Google-Smtp-Source: ABdhPJwPyySBBtqTR0AgfkJFyxuAXgiUcz+WqWhlpUsO74QjQfGbU19Edvm/MIOKZGf9Nc9ZKE5rnA==
X-Received: by 2002:a19:c201:: with SMTP id l1mr27512108lfc.485.1643906826872;
        Thu, 03 Feb 2022 08:47:06 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id p2sm4208017lfh.55.2022.02.03.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:06 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/9] i2c: qcom-cci: initialize CCI controller after registration of adapters
Date:   Thu,  3 Feb 2022 18:47:05 +0200
Message-Id: <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The change is wanted to postpone initialization of busses on CCI controller
by cci_init() and cci_reset() till adapters are registered, the later is
needed for adding I2C bus devices and get correspondent vbus regulators.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index cf54f1cb4c57..eebf9603d3d1 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -630,14 +630,6 @@ static int cci_probe(struct platform_device *pdev)
 	val = readl(cci->base + CCI_HW_VERSION);
 	dev_dbg(dev, "CCI HW version = 0x%08x", val);
 
-	ret = cci_reset(cci);
-	if (ret < 0)
-		goto error;
-
-	ret = cci_init(cci);
-	if (ret < 0)
-		goto error;
-
 	for (i = 0; i < cci->data->num_masters; i++) {
 		if (!cci->master[i].cci)
 			continue;
@@ -649,6 +641,14 @@ static int cci_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = cci_reset(cci);
+	if (ret < 0)
+		goto error_i2c;
+
+	ret = cci_init(cci);
+	if (ret < 0)
+		goto error_i2c;
+
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_active(dev);
@@ -663,7 +663,6 @@ static int cci_probe(struct platform_device *pdev)
 			of_node_put(cci->master[i].adap.dev.of_node);
 		}
 	}
-error:
 	disable_irq(cci->irq);
 disable_clocks:
 	cci_disable_clocks(cci);
-- 
2.33.0

