Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55CF7138E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 10:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfGWIGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 04:06:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39306 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727375AbfGWIGE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 04:06:04 -0400
Received: by mail-pg1-f196.google.com with SMTP id u17so19020987pgi.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FnYq9WMNCA5j58+eOL9UHb7C05FMTgGEkUJ9/uOB0nA=;
        b=QfwTwwOHlT9JCTh7ajivyrYwT21uj5fjsJH0jhDROyd6azQz03uwEyT5nfcD6GP9UM
         +YmCIH1PFxItRaMc2hH1GMZV6jv7w/Sw9Pgy2Dqrrkyni6kiU1tqZKCzQGaHzZF4nTFX
         ZvUd1nSN8Ijp8mMgNSyVr+y+1Kzd7tI0JFqpGo1g6WmZDMdnYQKOY8ikvcOXcpRaB6BQ
         MZ64LX6egK4RYgXPH0f6l2SsNPfsq0fNsyo44NSaIBaBF+0jKFbk4eGwBXo3FNMP6PnI
         GL1tSSXqoQMZ3ZxQLrHElb/XKL/PNFskcNj3Er0xmjCnzdEJctIVM6kxWUXsCpcOZ+ys
         Ld1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FnYq9WMNCA5j58+eOL9UHb7C05FMTgGEkUJ9/uOB0nA=;
        b=L7skDFHxW0+C7y96jd20qQBWmhMcycGvMaby1pNaqWpTTJrMroyDNYZszHSD75mvxB
         zDCpOxv9pBuVVbWidqrGwrtqUXL2vVNU0w51JC6r7KmtI7wrQCwdReXNYZ1hF/Wqa1AS
         WwGYXwxfwCB8RfKk3MloKfxT1qG4qdUriH61++UZSrJ9WZ8uI7tLr1+dcaQ5J0uBHYnK
         FwWrCZi02bAVMIAKtRoHSsN4VP4E8W7661DPFksyM8pVD1ho8YM6P/5QG9xXR+GbJrwR
         CfDygrE7n/GPPWYSfYk82G/3TJuxn1CEwBg3N6HvqufIxDNO34pKgYoCsPpHYD/iPlss
         rvMA==
X-Gm-Message-State: APjAAAUoetNP0n/e50baOXTqpchlGqqYb1zaoTkWkG1SzPLaMNeM+iQn
        s/dVU19a7KfhFXGbMJgD+aDXdIJy
X-Google-Smtp-Source: APXvYqzz5TAIPmw/htmUyFFGW5rC7DZQv/nFab6WS/OqoUI4VTyhXo3W7fvQieKtmT7t1P8frWXxkQ==
X-Received: by 2002:a62:1ccd:: with SMTP id c196mr4538036pfc.102.1563869164122;
        Tue, 23 Jul 2019 01:06:04 -0700 (PDT)
Received: from localhost.localdomain ([122.163.0.39])
        by smtp.gmail.com with ESMTPSA id u128sm48561967pfu.48.2019.07.23.01.06.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 01:06:03 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] bus: qcom-ebi2: Add of_node_put() before return
Date:   Tue, 23 Jul 2019 13:35:52 +0530
Message-Id: <20190723080552.7588-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Add an of_node_put before the
return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/bus/qcom-ebi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index 03ddcf426887..0b8f53a688b8 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -353,8 +353,10 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.19.1

