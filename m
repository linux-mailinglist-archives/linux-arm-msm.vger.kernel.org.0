Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B48168278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 16:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgBUP6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 10:58:49 -0500
Received: from gateway30.websitewelcome.com ([50.116.127.1]:32701 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727312AbgBUP6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 10:58:49 -0500
X-Greylist: delayed 1315 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Feb 2020 10:58:47 EST
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 0202D15D4D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2020 09:36:52 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 5AMFjRAoovBMd5AMFjO302; Fri, 21 Feb 2020 09:36:51 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qy3VUhSFQbR/QODX65I3k6L3DnhrN3vMmE0x2nhKRIU=; b=MhnS4Z2AijH+e+0WEBKcZI53yQ
        OhHGC9GjJK6Gp9S/9Rnxe0J0aDHzBMNOPqA2VOg3dK8RpNc+hyzmpGZuMJ86PlP045V9Iimu/HsZs
        5spFwbcvxGwQ0cPPHwxvgyOOxLQcrc9zYZ9EeVihj+DPfzQIpAm7tCjni3PGh1AF3qnLgxcv40x75
        TO5hPEs0n2AsoSdxKP/N7mWP2bCoJmtv7ATzktjoD+M3OpTbUqLwehvrvGSaKAU91AbnedziVDIJQ
        rJ5JKgS/10Iux9IZK7o1NNiyVJxIZp48dFTR4YLFPKOMeP0xpd4rV9OiLFih42mkGCYjM+ep+nnuv
        fw/2l55w==;
Received: from [200.68.140.54] (port=52670 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j5AME-003kyv-Fz; Fri, 21 Feb 2020 09:36:50 -0600
Date:   Fri, 21 Feb 2020 09:39:35 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] firmware: qcom_scm: Replace zero-length array with
 flexible-array member
Message-ID: <20200221153935.GA3313@embeddedor>
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
X-Source-IP: 200.68.140.54
X-Source-L: No
X-Exim-ID: 1j5AME-003kyv-Fz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.54]:52670
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 24
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
 drivers/firmware/qcom_scm-legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
index 8532e7c78ef7..eba6b60bfb61 100644
--- a/drivers/firmware/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -56,7 +56,7 @@ struct scm_legacy_command {
 	__le32 buf_offset;
 	__le32 resp_hdr_offset;
 	__le32 id;
-	__le32 buf[0];
+	__le32 buf[];
 };
 
 /**
-- 
2.25.0

