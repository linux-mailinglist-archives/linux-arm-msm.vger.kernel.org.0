Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A74561E7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 14:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfGHMeJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 08:34:09 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42185 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbfGHMeI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 08:34:08 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so7542873pff.9;
        Mon, 08 Jul 2019 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MLBd5ipjuaWF6DPUTaW+cEXsKPZzvPBtYteZGdDRUQE=;
        b=QAfQI1Osqd5bdsUrWqNxZ+YpMGNRLWV/QZ6vENHH3tpny6tIAzEm1Avgsfby2LVc+n
         adBKiLITz808aavsIoGPAKq/8Zcxd9oRX65sceUiH0WIur57j2cPq0TWuVZZK44zXps7
         N4E3893BiIQ3FgPvrlMUtiTvWvrjTaaGc8Y1Hfx6MeLbviQOdknDiou5+rEu9XIUjUAo
         JKV/4zlwk0MU4MXXVKNtGCvQLC5kNKLCv2RFj10liqDtYsTGSNtZ32cShAyKJCr3mMUG
         kLihxN7XrH6eFuBoAle7lZiER/CyLZFv0e7xeY5OK4I2azfOKvgprF9s7co7z2zmu5an
         5/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MLBd5ipjuaWF6DPUTaW+cEXsKPZzvPBtYteZGdDRUQE=;
        b=fv+fcOY1bi0cyLVnxDbs5ilpKmWbM4mvMM5BFNhOG/4RRNIDhg5gmNQl09hlPYjnel
         rkYhzlzIH2++ye20KQNwQnLd9zWcwaXpCev/Bv1dS4DtXf/7TOmjZyyyCzqW63sgG/lE
         3smnhk2aFNrNFMxZOJAf3geYK9O9optOQ5eTXiy/2dLJLdtU+QRO8eLdbfeu+FhT33TB
         FBku0wePbm2T02ccCLl9a23uTXShTngTFoInMiWp9MnRYvqQgFR9cRqp/Nd1ARy4MhN2
         8YvxyZIjmtofdpJigTd2ZRPfU6hyaU/VXUSjuxTmGEbJ5YEU9vDeQaDi5zp7UVixq3wQ
         BI/A==
X-Gm-Message-State: APjAAAVj3cFSSqD6iuzehDj/r9YUA7AzEpPTuPY4b5/OKSMiu1V3KRMz
        E7M3y+yaWDi4IxXIVSDbnY0=
X-Google-Smtp-Source: APXvYqyKFw0r73ZmDpQMocBH3EYWI8p0Qk7BJEIJYtWShA0+vleBlChH9teodpWZczWpIqeHhtmGbQ==
X-Received: by 2002:a17:90a:d14a:: with SMTP id t10mr25445609pjw.85.1562589248247;
        Mon, 08 Jul 2019 05:34:08 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id w22sm18200733pfi.175.2019.07.08.05.34.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 05:34:07 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 12/14] phy: qcom-qmp: Replace devm_add_action() followed by failure action with devm_add_action_or_reset()
Date:   Mon,  8 Jul 2019 20:34:01 +0800
Message-Id: <20190708123401.12173-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

devm_add_action_or_reset() is introduced as a helper function which 
internally calls devm_add_action(). If devm_add_action() fails 
then it will execute the action mentioned and return the error code.
This reduce source code size (avoid writing the action twice) 
and reduce the likelyhood of bugs.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index cd91b4179b10..677916f8968c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1837,9 +1837,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 	 * Roll a devm action because the clock provider is the child node, but
 	 * the child node is not actually a device.
 	 */
-	ret = devm_add_action(qmp->dev, phy_pipe_clk_release_provider, np);
-	if (ret)
-		phy_pipe_clk_release_provider(np);
+	ret = devm_add_action_or_reset(qmp->dev, phy_pipe_clk_release_provider, np);
 
 	return ret;
 }
-- 
2.11.0

