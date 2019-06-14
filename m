Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2790946A50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbfFNUh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:37:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:47016 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbfFNUhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:37:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so2079377pfy.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lsF1y/LAf5L+2wQLGdeHEaRtoQrXQNuhBq52QCwbapo=;
        b=OLPYBKcTI+78/S0FOVJMy9P3vw12j1xgEFVW/Zh4gP7hfjAUxnZ/FizK29hQocZGeB
         2VpJiAbbc9MRZmfY6iqA6wq4sqz/DCAzWfkPb3oBtXfVwHvMeiqwUEbDqYQklOTGGTb+
         Mt95Re9HEDvxMcRC3XaQjslmVZQNgfybwBtYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lsF1y/LAf5L+2wQLGdeHEaRtoQrXQNuhBq52QCwbapo=;
        b=Zm0xH/BPtq7R6XD6+hC9GqkwLUY9jvoozlZ1qMjzRYDD6FahADFXRoDd4PTD9/oMPp
         h0sxTdKN5Zs4/vrrBU2jfP418L9ThTV2rIYta2dM0IsPfVfr+HW2w+lsAcP0vu0i/tUZ
         IPuSrX5uknu87FOJJf6t92uP7ERVjtJs1UFQ8A6fQOb8HdPccTJxI6dxdFGn9wwabUGq
         w+1537Fb2KhjVtsZM2hgqQ2Z4/AVGtAH9bvdv8tMfR7JrOoPmi428czbsFpotpAQOfNO
         mKfmfeHn1zeLMOLyVfO7MW3FiyJsA3UTWMDCOTfvUJxBGo8F69FQJyDg/YqEebp+K/4q
         DyOg==
X-Gm-Message-State: APjAAAVVGJ75mU0EqziSddCH/qrVWDcHNSkcmyMvqtQdsW5xB08llodN
        ibXrt0egectdSKV0EJlqtIXqbw==
X-Google-Smtp-Source: APXvYqyh8elsGc5/c/L5iwGKta5WBR5tLdN1CqyHJTufMS/UgZnVCWVLvirzqoh1gd6Gf0IQIIbSKw==
X-Received: by 2002:a17:90a:d14a:: with SMTP id t10mr13015629pjw.85.1560544643851;
        Fri, 14 Jun 2019 13:37:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x5sm3673187pjp.21.2019.06.14.13.37.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:37:23 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 5/5] soc: qcom: cmd-db: Map with read-only mappings
Date:   Fri, 14 Jun 2019 13:37:17 -0700
Message-Id: <20190614203717.75479-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614203717.75479-1-swboyd@chromium.org>
References: <20190614203717.75479-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The command DB is read-only already to the kernel because everything is
const marked once we map it. Let's go one step further and try to map
the memory as read-only in the page tables. This should make it harder
for random code to corrupt the database and change the contents.

Cc: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/cmd-db.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 10a34d26b753..6365e8260282 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -240,7 +240,8 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 {
 	int ret = 0;
 
-	cmd_db_header = devm_memremap_reserved_mem(&pdev->dev, MEMREMAP_WB);
+	cmd_db_header = devm_memremap_reserved_mem(&pdev->dev,
+						   MEMREMAP_RO | MEMREMAP_WB);
 	if (IS_ERR(cmd_db_header)) {
 		ret = PTR_ERR(cmd_db_header);
 		cmd_db_header = NULL;
-- 
Sent by a computer through tubes

