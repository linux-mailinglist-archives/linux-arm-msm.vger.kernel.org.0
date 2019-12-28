Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895A612BE5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbfL1SgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:36:01 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39144 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbfL1Sf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:59 -0500
Received: by mail-pf1-f193.google.com with SMTP id q10so16317199pfs.6;
        Sat, 28 Dec 2019 10:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ujHJl1LlnUC8f51mXZ4Fb27CXnf51H+Hx/+mqG2aecM=;
        b=rNui478T/QEp9Tbc1cDUJs2i7U62DXb62rj94vzLSxPg9zViOhL1kw7a/GoZhfAAtW
         dEuAXR5m/IwJqTU8Ho4SxCK9DyMNaCW01BJEE4rLcg1UCjPg+iDfTE6SqPYxpu6rBI0u
         1gwxpMJFjMnhzEqsV0MIamVbpMQhGEK4jTv2xqY8UOESHGsH3kgKAQE+v3N0U9zi8zaK
         2mu7sqU8Usn4iGQNUrelWq4J+Pmwem+39Aok8/1WXkG6FtgGZT1WBARoaDrk1tVFr16x
         iKe4VKOyDBy2gS2GIId4qItvRtUgYZalhpev6bHNybwlqoCjOm2JJp7ygbyQ+hyUNa8l
         cmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ujHJl1LlnUC8f51mXZ4Fb27CXnf51H+Hx/+mqG2aecM=;
        b=RCoNsSr/SXpo5A6kzo3z/gYgz3KCX4vKx4XwsM/uuTgydU/gwYHVl+EQHeRDu+oU2C
         LY+2bWLazkzDAVsBdbJdMxj5z/ehbMXtyN+3mLQuGuIz+xEkq7qWF+oyRN+2gDczvTht
         kMJl5KelyiBOQ7ke3sCMqgdvsL54a662ZOobp75oBHAw5L6/jKtz1Qs60+orB8neez0U
         A4DxMZpIgD9JaQe/cyxTjbyrwNAPI70NZJzpijXpUOkx7yTnYR6YV3de+LK/UZraj8tB
         tuUS+rFkC69ma6sJicCikmw3u0aVfwZWezOBMXFNBXCWFOqFmrQkdDn6iAY66xIQlXic
         +JWw==
X-Gm-Message-State: APjAAAU/M6AFSGW6ODs0sRSM3OnGVXsGa9Wh79lQelfr11oMuMcs7um3
        BQ3V0ywOCKTlreDhhOt9OPk=
X-Google-Smtp-Source: APXvYqxIq2P3GfalCrglm2NNlOSSOLuNN16ePEwVBKXxH+eUtkSCN2+TsAdPG2+LZgKy1zvL62S6+w==
X-Received: by 2002:a62:197:: with SMTP id 145mr60624660pfb.188.1577558158509;
        Sat, 28 Dec 2019 10:35:58 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id w11sm44601709pfn.4.2019.12.28.10.35.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:58 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     jassisinghbrar@gmail.com, nsaenzjulienne@suse.de,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
        matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        nios2-dev@lists.rocketboards.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 12/13] mailbox: omap: do some cleanup
Date:   Sat, 28 Dec 2019 18:35:37 +0000
Message-Id: <20191228183538.26189-12-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.
'i' and 'ret' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/omap-mailbox.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index 5978a35aac6d..9b9994be5602 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -695,8 +695,7 @@ static struct mbox_chan *omap_mbox_of_xlate(struct mbox_controller *controller,
 
 static int omap_mbox_probe(struct platform_device *pdev)
 {
-	struct resource *mem;
-	int ret;
+	int ret, i;
 	struct mbox_chan *chnls;
 	struct omap_mbox **list, *mbox, *mboxblk;
 	struct omap_mbox_fifo_info *finfo, *finfoblk;
@@ -709,7 +708,6 @@ static int omap_mbox_probe(struct platform_device *pdev)
 	u32 num_users, num_fifos;
 	u32 tmp[3];
 	u32 l;
-	int i;
 
 	if (!node) {
 		pr_err("%s: only DT-based devices are supported\n", __func__);
@@ -772,8 +770,7 @@ static int omap_mbox_probe(struct platform_device *pdev)
 	if (!mdev)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mdev->mbox_base = devm_ioremap_resource(&pdev->dev, mem);
+	mdev->mbox_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mdev->mbox_base))
 		return PTR_ERR(mdev->mbox_base);
 
-- 
2.17.1

