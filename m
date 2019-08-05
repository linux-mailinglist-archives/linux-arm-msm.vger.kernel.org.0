Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FD38286C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2019 02:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730907AbfHFALy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 20:11:54 -0400
Received: from gateway21.websitewelcome.com ([192.185.45.147]:20236 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728851AbfHFALw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 20:11:52 -0400
X-Greylist: delayed 1340 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Aug 2019 20:11:51 EDT
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id 3FAC6400C865A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2019 18:49:30 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id umjKhdP0I4FKpumjKhlpPJ; Mon, 05 Aug 2019 18:49:30 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9li+YhxHo8+AujwqhsMZd9x+rcO10TXeZqodcMKx7qo=; b=wDvshsv1z+1fXiJZtY4PyLHNww
        TX8STZuvfNMy65c16V2YqeJF4e8e/HsisSBSRMNAYeBJY66xYI/a5XrZfQP5O40mD+yeXeHv8mhGF
        /W+BkPEqN7tqKgN4uGAsH1ddru52eG7RKMGdhbMA68N7j/W90G6NeAxsM+j0UroIzheN1fD8VsZFI
        sA/k0BthKK/9Zm04QwPf2oMN8gM7gjlYuj/OllN0eoj7w5ZOZWXvKUz9mCf309++jkyGM+YRn46r6
        5P/kqFvhARxma5FJxkO5SiwELWfYONvsDrQNS5FCEC9Xm8TJyI6CRkGjHeBRV/2krkJOt1cspawIF
        VSuTx2Wg==;
Received: from [187.192.11.120] (port=40464 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1humjJ-000yz7-1L; Mon, 05 Aug 2019 18:49:29 -0500
Date:   Mon, 5 Aug 2019 18:49:28 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] drm/msm: Use struct_size() helper
Message-ID: <20190805234928.GA2785@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1humjJ-000yz7-1L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:40464
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct msm_gem_submit {
	...
        struct {
		...
        } bos[0];
};

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

sizeof(*submit) + ((u64)nr_bos * sizeof(submit->bos[0]))

with:

struct_size(submit, bos, nr_bos)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 348f8c2be806..7c17c6154058 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -26,8 +26,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		uint32_t nr_cmds)
 {
 	struct msm_gem_submit *submit;
-	uint64_t sz = sizeof(*submit) + ((u64)nr_bos * sizeof(submit->bos[0])) +
-		((u64)nr_cmds * sizeof(submit->cmd[0]));
+	uint64_t sz = struct_size(submit, bos, nr_bos) +
+				  ((u64)nr_cmds * sizeof(submit->cmd[0]));
 
 	if (sz > SIZE_MAX)
 		return NULL;
-- 
2.22.0

