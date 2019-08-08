Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31B385B64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 09:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731162AbfHHHQY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 03:16:24 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42694 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHHHQY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 03:16:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay6so43188538plb.9;
        Thu, 08 Aug 2019 00:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Do5CFtVi9NCcTSKZkexhPtuQR5/W3q/75hgi7FAin40=;
        b=qZt1LDH00qJJ9fE/ZsizY14Te+pYIXCNKV1YW6ghgPk/omgGaqm8JsiuLqo0sQdbhv
         OumkjpNc7WibBEjFe9wBtFlngXA9kebZuztxaYe4DTmImanlv8QxETfIaCc1r3bwz+Jy
         +Df6l6e+l/f0ThjK/DsxE01kCb6FdBPdpi3ZT5PVuII1k8zLysyBTD4LHenr7be1emKv
         MbSR1mVoM/fMJV2nuAyaaoJWXIq+oVHIszHYiucuXeY7K3imA3155gqwBA6U79HHe3bt
         Vr0A1cNCWlSBzqjS9yKvNTkY+DtjQdI0/7sVQ9crtDXPfNYPO4KtA1a96ikanMt3QALG
         qmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Do5CFtVi9NCcTSKZkexhPtuQR5/W3q/75hgi7FAin40=;
        b=qTbbWNYdYGbFl4exhhy8TAK+x1V9QQYgkYVDuIlwIxhow8/DVBiw7skHHgy0ObYBzx
         qvLVGFbzYfgfh/BUQ+W5M/ClJjq/oLWsEJLXnsIpadUOElwmhiimXHAr2yAYOpLvBz+K
         JEnseDmfDUQmLXu94i21IJP9NGrbncLhYR88ypyRHYtEoqO8h6Fhu1bFzWieGaZKy9+0
         wyYrWGz9f9M5PLFqpPR3ln1ZcENBIQUML77QaX7pH1Az/pFyHGiN6GYs0Yq+g1aIvHsK
         aIqg35a0kpJfnWDouuLVuww6PvROfO7IqoJWkYvmpKSHXnP6t4+Gnk8HDF4BlOi8S6ZK
         +lXQ==
X-Gm-Message-State: APjAAAVPayIuKFFmlfgbijArT0cEBegzwJb4MgAMcmJkv5KlJdfWOxwe
        /40cEoSnYYSL2NbiUi7GYKk=
X-Google-Smtp-Source: APXvYqypHk5e0aTFkFJU05xQIEIvKal64ctjHqJ5MfnBXONJ25Al8crSv2pnbsUMzrSInxOMdKRf2w==
X-Received: by 2002:a17:902:1004:: with SMTP id b4mr2353592pla.340.1565248584001;
        Thu, 08 Aug 2019 00:16:24 -0700 (PDT)
Received: from localhost.localdomain ([122.163.44.6])
        by smtp.gmail.com with ESMTPSA id m4sm158947802pff.108.2019.08.08.00.16.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 00:16:23 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     agross@kernel.org, kishon@ti.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] phy: qualcomm: phy-qcom-qmp: Add of_node_put() before return
Date:   Thu,  8 Aug 2019 12:46:12 +0530
Message-Id: <20190808071612.14071-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each iteration of for_each_available_child_of_node() puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence create a new label,
err_node_put, that puts the previous node (child) before returning the
required value. Also include the statement pm_runtime_disable() under
this label in order to avoid repetition among mid-loop return
conditions. Edit the mid-loop return statements to instead go to this
new label err_node_put.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 34ff6434da8f..e7b8283acce8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2093,8 +2093,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
-			pm_runtime_disable(dev);
-			return ret;
+			goto err_node_put;
 		}
 
 		/*
@@ -2105,8 +2104,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(qmp->dev,
 				"failed to register pipe clock source\n");
-			pm_runtime_disable(dev);
-			return ret;
+			goto err_node_put;
 		}
 		id++;
 	}
@@ -2118,6 +2116,11 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
+
+err_node_put:
+	pm_runtime_disable(dev);
+	of_node_put(child);
+	return ret;
 }
 
 static struct platform_driver qcom_qmp_phy_driver = {
-- 
2.19.1

