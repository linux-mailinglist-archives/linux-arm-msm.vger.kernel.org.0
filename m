Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5044C15B5C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 01:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbgBMAXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 19:23:17 -0500
Received: from gateway24.websitewelcome.com ([192.185.51.202]:47139 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729132AbgBMAXR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 19:23:17 -0500
X-Greylist: delayed 1441 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 19:23:16 EST
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id F3FB9280C
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 17:59:14 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 21uUjml4kXVkQ21uUjAqT5; Wed, 12 Feb 2020 17:59:14 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/+tuQXIxcgFaHv6yXlJ1vmExFRnqlxjpnHGOi7H52Tg=; b=po54q2qUsGuaR0K/Wp1vdgTtMA
        4bqd8irT0krgOs1LiVOytLou0n39j7GCldKLTSLj6DB8xRasxdqlbzlvZ/wM0Ot48ApyfidA0/eia
        9RyncvjU45xE4mXrHLV+xgyGS7BHwgOkZXHN6UeIJipMGwoTDuTt8BVpDfl0NDdNze/ehwnqtYx3K
        de9oaVhsFhgDoaqFVR1fCyQtua/pXXF3Vt/YlzvAfrS8PAP9RFHY0PF9B3hsI0AWl5zhrvN3iv+/+
        zQzkd5wMRVzV26FryXUDqCLpFKO+D/chlpNGqp2oO49IH7uivTKFJ1eqwHJCfNJhWzhr6t02Hy2J3
        17O01tGQ==;
Received: from [200.68.141.42] (port=17873 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j21uT-003MB9-45; Wed, 12 Feb 2020 17:59:13 -0600
Date:   Wed, 12 Feb 2020 17:59:11 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mfd: pm8xxx: Replace zero-length array with flexible-array
 member
Message-ID: <20200212235911.GA20179@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.141.42
X-Source-L: No
X-Exim-ID: 1j21uT-003MB9-45
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.141.42]:17873
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 14
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mfd/qcom-pm8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 29133326c6fd..acd172ddcbd6 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -76,7 +76,7 @@ struct pm_irq_chip {
 	unsigned int		num_masters;
 	const struct pm_irq_data *pm_irq_data;
 	/* MUST BE AT THE END OF THIS STRUCT */
-	u8			config[0];
+	u8			config[];
 };
 
 static int pm8xxx_read_block_irq(struct pm_irq_chip *chip, unsigned int bp,
-- 
2.23.0

