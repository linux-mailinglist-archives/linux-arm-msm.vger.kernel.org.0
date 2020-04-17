Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DEF1AD386
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 02:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgDQAGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 20:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726543AbgDQAGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 20:06:48 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4E0C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 17:06:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 2so193479pgp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 17:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WM3Tq0c8R3pgUAX4sl8Zd0e3Hd062EPmdbrM6FgguUU=;
        b=jBba+lDeR1UxjQTUBpFeX0n0PRNXdoK3rtzyiDFPQ091GElSDjdsalQlXrekANhDqe
         4xEkIdsckzZcZnQ5U10pEFk3Idfrb0qH3qnsKk4nEJOvTv4MBtaDSqARSrvQLVQxg/Zi
         +XGARiFpySJByDwKte0zrvNIrkfksQU89QtKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WM3Tq0c8R3pgUAX4sl8Zd0e3Hd062EPmdbrM6FgguUU=;
        b=HCPp4S/ZoUZSFGvRVimnragR3zC+CgKNsC3f6hHsR77a7C8aIdrsY6DAUx1Pn8rFvk
         RKcincxU/Zn0f1X3+XFZQ2kbfzp5oc1gTAA/bXXNDqtKgz0ULmqBX33Cq4+Ghwd3Zdce
         dcg/0wmf7+qKXeVsPXBngj7F/LPyT+kenriUB+30D4H/KXPECcnhiCtWd0OVy7VP4Aub
         I8omHHAWb+8MQee4VmvWz+fQHx5I2cFgC/0wCO2y9sBRTG3er45DSS5e6LYn63hGexDN
         fwYigWyC8bfqJ711RQZ2IdBKUwLj7To9tEgIS78h3hQ5suzH5n6aFXNwFd8Mzj1c88sj
         YdPQ==
X-Gm-Message-State: AGi0PuYXTUJZajUxD6Arx3RJ8kWSyp9V7j+DnhVwcjFbBJr+w3eeBII/
        QIyPsrVv37W4VFD6onincv1gsQ==
X-Google-Smtp-Source: APiQypJePOhPgmDt0fk0dA30owcqD7Ov/yBmvqpeMHtIsiA2fngqwfwdQWTVO7iPQyZIbrP1llCtmg==
X-Received: by 2002:a63:581e:: with SMTP id m30mr281345pgb.295.1587082007280;
        Thu, 16 Apr 2020 17:06:47 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 78sm11064801pfy.185.2020.04.16.17.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 17:06:46 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kbuild test robot <lkp@intel.com>,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH] soc: qcom: cmd-db: Properly endian swap the slv_id for debugfs
Date:   Thu, 16 Apr 2020 17:06:45 -0700
Message-Id: <20200417000645.234693-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Read the slv_id properly by making sure the 16-bit number is endian
swapped from little endian to CPU native before we read it to figure out
what to print for the human readable name. Otherwise we may just show
that all the elements in the cmd-db are "Unknown" which isn't right.

Reported-by: kbuild test robot <lkp@intel.com>
Cc: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 4f8b739c6485..fc5610603b17 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -254,7 +254,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 		if (!rsc->slv_id)
 			break;
 
-		switch (rsc->slv_id) {
+		switch (le16_to_cpu(rsc->slv_id)) {
 		case CMD_DB_HW_ARC:
 			name = "ARC";
 			break;

base-commit: d6815c5c43d4f9d18e557d27fd27ae8d9cfd450c
prerequisite-patch-id: fc235b174200bb1b24876628a89a841d1c2e4aad
prerequisite-patch-id: df579afb4eaea4200733d9dffb1d75eef8d8360b
-- 
Sent by a computer, using git, on the internet

