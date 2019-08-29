Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00356A262F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 20:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfH2Sig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 14:38:36 -0400
Received: from gateway22.websitewelcome.com ([192.185.46.229]:23465 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727726AbfH2Sif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 14:38:35 -0400
X-Greylist: delayed 1270 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Aug 2019 14:38:35 EDT
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id A3A39BA24
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 13:17:24 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 3Oz6iP5eR3Qi03Oz6i4C8P; Thu, 29 Aug 2019 13:17:24 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4R26aKYoB1gosSniDsCUeeu1fuM8QS65KD+ZkxX9Q0w=; b=HuIvn3lcsdwyR/f1i9X91ECcI9
        31/RWsd7s3uQhgTA14Tk2hOiISCr68MOB/sPnDVZBFRVk7ZhdbPnUmNPQBn/RX1MwzfMMvuvXmwXY
        LOyhitd3yDVcuPpPJgkW5TNZYUXcae/dAV453ICHa+Shpl74zx1QyPkWjiQNWwjw+hfgqzJEKNolc
        CXQXym+S1+JHMlQDeG/HYmDt8TkndLmUo74cjz7aEhy8jjwxIK9/ARBqtSypvv8GQcAOBhG7cw2VP
        tULZXU4OoaiYeovDoqTQJPv2hrXszkJvL+GN038uotf/P0FbaJzLxOo75iYb0W7D55TjlTSWDjIqC
        iqQX6mBg==;
Received: from [189.152.216.116] (port=42850 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1i3Oz5-001MoD-I0; Thu, 29 Aug 2019 13:17:23 -0500
Date:   Thu, 29 Aug 2019 13:17:21 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] rpmsg: glink: Use struct_size() helper
Message-ID: <20190829181721.GA22554@embeddedor>
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
X-Source-IP: 189.152.216.116
X-Source-L: No
X-Exim-ID: 1i3Oz5-001MoD-I0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.152.216.116]:42850
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct {
	...
	struct intent_pair intents[];
} __packed * msg;

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

sizeof(*msg) + sizeof(struct intent_pair) * count

with:

struct_size(msg, intents, count)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f46c787733e8..621f1afd4d6b 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -892,7 +892,7 @@ static void qcom_glink_handle_intent(struct qcom_glink *glink,
 		struct intent_pair intents[];
 	} __packed * msg;
 
-	const size_t msglen = sizeof(*msg) + sizeof(struct intent_pair) * count;
+	const size_t msglen = struct_size(msg, intents, count);
 	int ret;
 	int i;
 	unsigned long flags;
-- 
2.23.0

