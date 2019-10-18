Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2C5DBCF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 07:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395492AbfJRFYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 01:24:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35711 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388756AbfJRFYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 01:24:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so3120297pfw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 22:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jDq5W42aFu1uYq0Wf8hvxLigwHa6+BiXckCc47UbuNo=;
        b=pwVGwpyvQv+pshWx85LTbypti0ekQXXbxw/w/zZDphsXBvkSuLrySfri6X+lvRjV7h
         nClLK/yOUe7XNSihPqlLnE94DyXPhNlUmpufyT5aTtKMpbsDctNH9upkqD0akX9BaghO
         nva/hRKa/F2qh8c5AHFeNg/SJYT7fStW+H0c7oEZlONcl3bPHhCVVqMS1/MB+OCE2EqJ
         2SdnSUZcub8AxIvp1baJmgKYKpaJPEjWFFf6oe8QcG/FIzl/Wh/Lb4C0j+B+xYfGsvVJ
         gY95+KKx0ad0wMuuD/8V2Q8n1uw9BqYeYwehpOXYbWqVzpyGArmAmWC1Pp3tm0VhLdK3
         lCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jDq5W42aFu1uYq0Wf8hvxLigwHa6+BiXckCc47UbuNo=;
        b=QntJo0KQQAd3nr1IjPQctpMSATlSUBz3lqd74BMPrBmDn1q1nNo4irJ64YDAIUbTpU
         PFFXBxo3jdyBsjDeeJrdxZ6nGbQ0bQXkvFv7wcH1DsNI6y2CwjP7AI3XQb+ZQXqugawq
         wCZ0mujPS09D3RwLYx79VKv+FTVrNXAaBP9VGZ2pPHFDsJhu7LDKCNgx9+RKohHTQ+8w
         iP0hRe8KbYnPZUWxwn89vaNAGdiYiG1YdRVEzsx6UYUGpDGl8hXi6Nf8iMU+N1SYxW8S
         22waUhY/uZvQHn10UDGOfKxYu34/6XRHh0+8RgqRb9fcxyNkWUbSr7df/9dknVArUSKY
         vrlg==
X-Gm-Message-State: APjAAAWPUGuxbgacak3yFdiGQ7X4a4rxC5UrHppu5N9X1zrZN3x99pDf
        /hPvWhxMcNlk1/0oYR0bh+SyxA==
X-Google-Smtp-Source: APXvYqyezGIQ7Ue9t3Jo96VVHFYoqaoyr2+zBXKnyVoWMT90aSE0pee2gnV+wwaa5VzK53ZQsh8lWQ==
X-Received: by 2002:a62:1a15:: with SMTP id a21mr4491058pfa.5.1571376249793;
        Thu, 17 Oct 2019 22:24:09 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u11sm2178760pgc.61.2019.10.17.22.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 22:24:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/4] Bluetooth: hci_qca: Update regulator_set_load() usage
Date:   Thu, 17 Oct 2019 22:24:01 -0700
Message-Id: <20191018052405.3693555-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the introduction of '5451781dadf8 ("regulator: core: Only count
load for enabled consumers")' in v5.0, the requested load of a regulator
consumer is only accounted for when said consumer is voted enabled.

So there's no need to vote for load ever time the regulator is
enabled or disabled.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e3164c200eac..c07c529b0d81 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1393,13 +1393,6 @@ static int qca_enable_regulator(struct qca_vreg vregs,
 	if (ret)
 		return ret;
 
-	if (vregs.load_uA)
-		ret = regulator_set_load(regulator,
-					 vregs.load_uA);
-
-	if (ret)
-		return ret;
-
 	return regulator_enable(regulator);
 
 }
@@ -1409,8 +1402,6 @@ static void qca_disable_regulator(struct qca_vreg vregs,
 {
 	regulator_disable(regulator);
 	regulator_set_voltage(regulator, 0, vregs.max_uV);
-	if (vregs.load_uA)
-		regulator_set_load(regulator, 0);
 
 }
 
@@ -1462,18 +1453,30 @@ static int qca_power_setup(struct hci_uart *hu, bool on)
 static int qca_init_regulators(struct qca_power *qca,
 				const struct qca_vreg *vregs, size_t num_vregs)
 {
+	struct regulator_bulk_data *bulk;
+	int ret;
 	int i;
 
-	qca->vreg_bulk = devm_kcalloc(qca->dev, num_vregs,
-				      sizeof(struct regulator_bulk_data),
-				      GFP_KERNEL);
-	if (!qca->vreg_bulk)
+	bulk = devm_kcalloc(qca->dev, num_vregs, sizeof(*bulk), GFP_KERNEL);
+	if (!bulk)
 		return -ENOMEM;
 
 	for (i = 0; i < num_vregs; i++)
-		qca->vreg_bulk[i].supply = vregs[i].name;
+		bulk[i].supply = vregs[i].name;
+
+	ret = devm_regulator_bulk_get(qca->dev, num_vregs, bulk);
+	if (ret < 0)
+		return ret;
 
-	return devm_regulator_bulk_get(qca->dev, num_vregs, qca->vreg_bulk);
+	for (i = 0; i < num_vregs; i++) {
+		ret = regulator_set_load(bulk[i].consumer, vregs[i].load_uA);
+		if (ret)
+			return ret;
+	}
+
+	qca->vreg_bulk = bulk;
+
+	return 0;
 }
 
 static int qca_serdev_probe(struct serdev_device *serdev)
-- 
2.23.0

