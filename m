Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF1380BAF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2019 18:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfHDQZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Aug 2019 12:25:14 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41024 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfHDQZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Aug 2019 12:25:14 -0400
Received: by mail-pl1-f196.google.com with SMTP id m9so35361302pls.8;
        Sun, 04 Aug 2019 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5WlmJ+yd/d7SIJ24wXZRYm8DiNvuInZwPvh//jsoG+E=;
        b=HL0ic2X+mfG2OTztd7bP7gg/t7pOpxH3L3xqJ6xCf8149ouUJNxSkNzOnkQwgdZ3j+
         QtKydCyWWP+BUQ+R/kK0rPhIWurkw1U2HW7EDab/PUrDJEs8/S+77qvE6HENuEPjv6HD
         MWkcASbOfSqv7MlEZZehxuyApStZcvQdgOW+ZX+wS+eabVaCnje6aiav+cqS7D/17584
         68Tr+iOumn/dAx/SsHVlwXsQQQW3OiF7An1Q29daNrwTC2GOr5FHgQyPgPcfVggF7E5P
         h/1rNgWj9e3aMK/rDO5ZwDooV8gBar5PJisPNgp6Czx50et9wn0YcyIki0uSObsaD783
         iMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5WlmJ+yd/d7SIJ24wXZRYm8DiNvuInZwPvh//jsoG+E=;
        b=Fkljpsp/pV1ZlqOwHxNU4Z3Fmb8pQomVWn6FIXCjNnjvLkcAlK/3UaDBh/ms2sgr8b
         R7yFqYN7ztFfKD9Od96mWJByPOrJP0Y7zb3323bNYR5UYLit7g3WP3nmgomJFP+TSBcS
         2amBQKKGdUOCjZf/JgHN8CCIUcGOFLlSJKzqYH9PSyI6pQSv0CAPzCeJG1UQ7MHDdPOz
         8zhn3tfQ+McVuDB7o6pvvhQhi+ZVPlRWDmnLcAhWmbTLxl6wGWOkA5woy2oHB75r+GbZ
         LLo2/Gv85IsVyRppAv9lCwQ6BqjX1HojO4RB8p/OinbwZTo/VK2Jmu96tvFWVSynUwfS
         jgkQ==
X-Gm-Message-State: APjAAAUeA1n1jw0jn0kwVApBzq4HQV30MpmMNIJXTBtCUXlTtQhIMOkN
        3tKCo+v4olg03esnTSdneH0=
X-Google-Smtp-Source: APXvYqyOB1YihaDuk90aKgQfss8ov2tWeKeFp/qhmVCx/yCsGih8L2APUrCm2kNBjo6CDYtyNdcNEA==
X-Received: by 2002:a17:902:1566:: with SMTP id b35mr144143678plh.147.1564935913785;
        Sun, 04 Aug 2019 09:25:13 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id u1sm79708839pgi.28.2019.08.04.09.25.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:25:13 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] soc: qcom: smp2p: Add of_node_put() at goto
Date:   Sun,  4 Aug 2019 21:55:02 +0530
Message-Id: <20190804162502.6170-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a goto from the middle of the loop, there is no
put, thus causing a memory leak. Hence make the gotos within the loop
first go to a new label where an of_node_put() puts the last used node,
before falling through to the original label.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/soc/qcom/smp2p.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index c7300d54e444..d223e914487d 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -501,7 +501,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
 		if (!entry) {
 			ret = -ENOMEM;
-			goto unwind_interfaces;
+			goto release_child;
 		}
 
 		entry->smp2p = smp2p;
@@ -509,18 +509,18 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 
 		ret = of_property_read_string(node, "qcom,entry-name", &entry->name);
 		if (ret < 0)
-			goto unwind_interfaces;
+			goto release_child;
 
 		if (of_property_read_bool(node, "interrupt-controller")) {
 			ret = qcom_smp2p_inbound_entry(smp2p, entry, node);
 			if (ret < 0)
-				goto unwind_interfaces;
+				goto release_child;
 
 			list_add(&entry->node, &smp2p->inbound);
 		} else  {
 			ret = qcom_smp2p_outbound_entry(smp2p, entry, node);
 			if (ret < 0)
-				goto unwind_interfaces;
+				goto release_child;
 
 			list_add(&entry->node, &smp2p->outbound);
 		}
@@ -541,6 +541,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 
 	return 0;
 
+release_child:
+	of_node_put(node);
 unwind_interfaces:
 	list_for_each_entry(entry, &smp2p->inbound, node)
 		irq_domain_remove(entry->domain);
-- 
2.19.1

