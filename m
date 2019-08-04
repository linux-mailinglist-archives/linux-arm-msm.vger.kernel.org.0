Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CCC80BA6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2019 18:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfHDQWN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Aug 2019 12:22:13 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45975 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbfHDQWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Aug 2019 12:22:13 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so38405095pgp.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Aug 2019 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arPSyYtCIEpHJx7VmrbGRXbOahwhzCvFL/DbWnjIMcY=;
        b=g4+Wq6fJW5FxjqATugBqVVOtB7OFxovBMMIvl/G8oQ0KCoryoaaI6vRw39t+ZrxJG2
         8uDnWeUwiwSP0UDtprlH6C2I4m0vVumKqOHnJesmczsYn/QxQg0Tt5yNyX8ethqbBRG2
         PiTiA1aDzFjb/XZ0WsOCrxM15xoP1Y8rfKf5wwjV7gdIGsKqTdz9gdZE5si+tbCfztf7
         7TvYybqA3bzVY5wfwu+R9NFz+ZLOAYwKELoLqLBIgALKxf56hQPfAFLda1oM2E4yVwEl
         XvcMXkNDW6EWKa3tHwaSygcxdtS8ITQ1bsCfV0McUtHVuIWK2MKpYE8NDLrJMbbeA5eD
         hKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arPSyYtCIEpHJx7VmrbGRXbOahwhzCvFL/DbWnjIMcY=;
        b=NRMw7KIPH/B5AFSiSRkt9N4jsgifqyK8bTObCws+26pezUc0KL7keSZbzrSZU+j567
         zvWzy1rj7zcY9Fax5xdai4AJfhucaRnB5xj1rw/entBUWQlqRwl85y0P6YUcyy+VEelE
         KYu5Dd/SfFfWzhsIgCrNwWVPHz3m99zpML56nz9RD2pY59ZW/nyKovRrRl58FkTJb7NB
         wkeOXcGFTvze2PYqdPW3HGpoNfXrLm0ZCKgA3GFvvVStRsMB/Ns93oKQ1XtGlcoScz5x
         bMthwwGnIatpojAK+lIElkz5ftoQuzIUObyHK5JR9NebP+qCwVeiBlkSRk6aIzoZXa0g
         OFPA==
X-Gm-Message-State: APjAAAW8ggD86lPu3xUuFTaj3uPyW906CoTmTIM8ToDtu9w9ju8Inbkf
        zxUhWsZUT4siCI+htGSihJg=
X-Google-Smtp-Source: APXvYqxzvBqU8xnQh5WRKKhv/bzA0aEYwwWJ/cxXiV4V9lHG+RJeNCKonswn6UeqLwi/Up+h+fncJA==
X-Received: by 2002:a17:90a:3086:: with SMTP id h6mr14541507pjb.14.1564935732996;
        Sun, 04 Aug 2019 09:22:12 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id b3sm97978763pfp.65.2019.08.04.09.22.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:22:12 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:52:01 +0530
Message-Id: <20190804162201.5838-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index f3585777324c..29fbab55c3b3 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1338,12 +1338,15 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			continue;
 
 		ngd = kzalloc(sizeof(*ngd), GFP_KERNEL);
-		if (!ngd)
+		if (!ngd) {
+			of_node_put(node);
 			return -ENOMEM;
+		}
 
 		ngd->pdev = platform_device_alloc(QCOM_SLIM_NGD_DRV_NAME, id);
 		if (!ngd->pdev) {
 			kfree(ngd);
+			of_node_put(node);
 			return -ENOMEM;
 		}
 		ngd->id = id;
-- 
2.19.1

