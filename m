Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760D318C2BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 23:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgCSWGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 18:06:53 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.196]:17520 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727228AbgCSWGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 18:06:53 -0400
X-Greylist: delayed 1278 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:06:52 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id CDE4C98CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 16:45:33 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F2yrjLISLXVkQF2yrjcPDz; Thu, 19 Mar 2020 16:45:33 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WTd7EnKGo4FHnu7wihfWR6l+ZPWeBMrxMRWj0hfozns=; b=iEW0dPXzzTfXLnGkz53SLNDyD3
        CTTLk+c944hiowrTvKsJ+qJ1lQ4KKtc0l+lDpE+nETILJ/ZLuiv4CIF3Fzc94tRlZSztYKy3spgyS
        SA1fMFZMgsS0wAWyrsSyU1qstD4dsnU8sIurO1XEqbC2b12X83lhwbbo4nGZeBwIBvQUNPEjJsQkQ
        xPutaP+4ieTHk1841qOOyViu9TtIJgLUvtoAUZ1vwJLQ0rGOlKP69WSl3kPZ24ddJV2CeyEs5bFKM
        c8BMHILYtOqOdzIUnxpRvD91hnSXK1Uk65y7Z75KLzqJjvxRT6+IVyndDdJ2N7PxT6ngcjUpAl0Aw
        bb21qTTQ==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53386 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF2yq-001ks2-2s; Thu, 19 Mar 2020 16:45:32 -0500
Date:   Thu, 19 Mar 2020 16:45:31 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] irqchip: qcom-irq-combiner: Replace zero-length array
 with flexible-array member
Message-ID: <20200319214531.GA21326@embeddedor.com>
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
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF2yq-001ks2-2s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53386
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 63
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
 drivers/irqchip/qcom-irq-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index abfe59284ff2..aa54bfcb0433 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -33,7 +33,7 @@ struct combiner {
 	int                 parent_irq;
 	u32                 nirqs;
 	u32                 nregs;
-	struct combiner_reg regs[0];
+	struct combiner_reg regs[];
 };
 
 static inline int irq_nr(u32 reg, u32 bit)
-- 
2.23.0

