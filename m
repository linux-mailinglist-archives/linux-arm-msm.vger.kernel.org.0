Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E1D46A7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfFNUhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:37:22 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41173 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfFNUhV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:37:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id s24so1450973plr.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xc2tEV/bPIimEWuq/mx6XQl4uW5E/9HmwBDqWANEBLQ=;
        b=f+xML+VchGG9yvxavXjNsjNVbK3VAFrVVcq6kWal4BvttG0orUQbFLW2olqgj7BMzy
         +G7z0QsC9mySDJXmWmhC1V4p5CHk3tZWZJj8CjbNwgDyIoLBSveQC5b6e6/iYESAFrgo
         B3JUcipxuBLgYl0hkupxbWFA7XeDaeSE05pCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xc2tEV/bPIimEWuq/mx6XQl4uW5E/9HmwBDqWANEBLQ=;
        b=HExRsqLgmDqzopsvWtBmtsxCJ34JRBaaQHL4lg5EqEnbb8dONg6Jz/AtohYujj3N3G
         /IjzNBnr1XfufLmw+iFjjGoGjw56rEtVo0CfWniZSLqsg7rWFRVUKMy0NEPbWfcsT2eF
         QXsmK/16grVWGlkvlTTgX35CkscIukYIhtnzoav3tlhHoz78/5zTeA8QkgMMRWBvkPuX
         RIOmlNO/O2feP4Y/G3c6OTyLvWrGKKPnqjDbAatgEgOvQOj5rilIm/QKrbexaj0jTwc0
         ubXPk48G5u/fPuvwgsnOb14C/0mNV8Fjush7QczTKtdge8W8Y1bcHCoLUYOXdgmdY3f/
         s3jw==
X-Gm-Message-State: APjAAAVUclXRbVkYf4OW3Na/Hb/Ezz/PdmZ45ZEY1Ufl5i1l4z33oGAq
        /c2rRGCqbUgvBHs9gcSOtI0rwA==
X-Google-Smtp-Source: APXvYqzGtL2Jtymma+e1JFXRy/AlOyyMqpctXtRvu9IkvOp5322GgCYlv2vgbvWRfDVD3ZikBHfDrg==
X-Received: by 2002:a17:902:2ae6:: with SMTP id j93mr97791257plb.130.1560544641087;
        Fri, 14 Jun 2019 13:37:21 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x5sm3673187pjp.21.2019.06.14.13.37.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:37:20 -0700 (PDT)
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
Subject: [PATCH v2 2/5] soc: qcom: cmd-db: Migrate to devm_memremap_reserved_mem()
Date:   Fri, 14 Jun 2019 13:37:14 -0700
Message-Id: <20190614203717.75479-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614203717.75479-1-swboyd@chromium.org>
References: <20190614203717.75479-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This gets rid of some duplicate code, and also makes the reserved memory
region show up as 'cmd-db' memory in /proc/iomem.

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
 drivers/soc/qcom/cmd-db.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index f6c3d17b05c7..10a34d26b753 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -238,18 +238,11 @@ EXPORT_SYMBOL(cmd_db_read_slave_id);
 
 static int cmd_db_dev_probe(struct platform_device *pdev)
 {
-	struct reserved_mem *rmem;
 	int ret = 0;
 
-	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
-	if (!rmem) {
-		dev_err(&pdev->dev, "failed to acquire memory region\n");
-		return -EINVAL;
-	}
-
-	cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WB);
-	if (!cmd_db_header) {
-		ret = -ENOMEM;
+	cmd_db_header = devm_memremap_reserved_mem(&pdev->dev, MEMREMAP_WB);
+	if (IS_ERR(cmd_db_header)) {
+		ret = PTR_ERR(cmd_db_header);
 		cmd_db_header = NULL;
 		return ret;
 	}
-- 
Sent by a computer through tubes

