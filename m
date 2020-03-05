Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05C1D17A3C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 12:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgCELMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 06:12:23 -0500
Received: from gateway23.websitewelcome.com ([192.185.49.218]:33834 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbgCELMX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 06:12:23 -0500
X-Greylist: delayed 1234 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Mar 2020 06:12:22 EST
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id D1133A4FE
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2020 04:51:47 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 9o6VjLAb6Efyq9o6VjOzh6; Thu, 05 Mar 2020 04:51:47 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=i+ZHZ2JVyHEj+om0jPMA5888/g8cqPU9hC9wyCq65OM=; b=q4Ud1DSux3DfZClKV3HOrVqd3o
        7fIsWjoE+UIanmYTWP+vhoG7Y1vRXw+5v7Un6Z45Z2pV5ItrrPkeHerZFTUE3kHTGyIp32VRAJAwE
        U7zMXvGDENe9DBeMzngD0w895DKZSn2nSIQn4s9U/BvejcWNA5wb9QMz1dnkG36MSSi8PD3wVW95J
        CYkf9r3cWwcLdlPaQPfvnrZFttGXgcxJI7me072Wqg7Iu5k6A69CgRiiLojtQbq4/Qkz9PYLAGjRP
        riAoVrbFxFtyXioh2AOUWQxA60baNAcHGkeeP7sMh3ZM7ycI7rJs7+rQTliXk/vW4lfcENiDOD8tB
        epRM69+g==;
Received: from [201.166.169.220] (port=3124 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j9o6T-003f7Y-TU; Thu, 05 Mar 2020 04:51:46 -0600
Date:   Thu, 5 Mar 2020 04:54:51 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] drm/msm/msm_gem.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200305105451.GA18973@embeddedor>
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
X-Source-IP: 201.166.169.220
X-Source-L: No
X-Exim-ID: 1j9o6T-003f7Y-TU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.166.169.220]:3124
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 18
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
 drivers/gpu/drm/msm/msm_gem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9e0953c2b7ce..37aa556c5f92 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -157,7 +157,7 @@ struct msm_gem_submit {
 			uint32_t handle;
 		};
 		uint64_t iova;
-	} bos[0];
+	} bos[];
 };
 
 #endif /* __MSM_GEM_H__ */
-- 
2.25.0

