Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2E526A026
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIOHtW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIOHs2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:48:28 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42DDC06178A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 00:48:19 -0700 (PDT)
Date:   Tue, 15 Sep 2020 09:48:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1600156097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=oQbJGKlOILQEJfEeS+UnwBDINlahrOvq2gL0itHoyUs=;
        b=YEdYeOhC2g0HXRlj13s0TKBMhSqBBd+F0wP6YgKXNF5dDlUYfpYpn0wHS43ojYj7Zqz5pL
        q7rrpV/uhuVVs0syRJ001I4nG9WtHFfvglVXCzatjJvDgULVeeualfNZdlh4PsiLGwFZk/
        qibfWY/c0sRvSnt6o+h/pH1WqCGkKaWorPEXz6QDLhtqZQLW+tV8nFsTqUs9yJBH3vINkr
        UDyn2OUnaED2ld1rZO9b6jNyEHNucwwpy4ByXnseKM6TMFqmzi+uxf/sQm+XG03y8hMB8w
        Q40ugRbBhFfUMXWUzcorQRfFFnm74SENgUztN0mrZwqvpi18mdPLb3CVOR1iTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1600156097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=oQbJGKlOILQEJfEeS+UnwBDINlahrOvq2gL0itHoyUs=;
        b=+g2QPbDAXoxyUi5DLr2+76szHo15jM3iUQ/2JjL/y9GUEk621Xb6u8+XrQt1NVlNUCl1x6
        lNsc8Wt8+JLk4yCA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Clark Williams <williams@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] bus: mhi: Remove include of rwlock_types.h
Message-ID: <20200915074816.52zphpywj4zidspk@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Clark Williams <williams@redhat.com>

rwlock.h should not be included directly. Instead linux/splinlock.h
should be included. Including it directly will break the RT build.

Also there is no point in including _types.h headers directly. There is
no benefit in including the type without the accessor.

Fixes: 0cbf260820fa7 ("bus: mhi: core: Add support for registering MHI controllers")
Signed-off-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/mhi.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index c4a940d989121..2b4ed30d47294 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -9,10 +9,9 @@
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/mutex.h>
-#include <linux/rwlock_types.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
-#include <linux/spinlock_types.h>
+#include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-- 
2.28.0

