Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A199027D517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgI2Rx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbgI2RxU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:20 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599B6C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:20 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id o20so5299752pfp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3OCoOb+JFwXi2wMv6xbpF4vbDUAK9pGDZl8s+55Ok38=;
        b=CY3xSlhp90EMIar8OSFcqeG1hs/T3B8VyrW6GQrLY2a2FJzU9ejCTR10wI/nXoDQO1
         v6n3qonu8tqI06JQJCqnk12E22Nus3CeGXYnNqHfupyOVU8Qcm43XLw+NyQXiKg+IOmb
         4fzaqvPU2SeU3TNRQitpJsS+HVS6v/TfsSNUr6uerSjyLXa6VnkRTT+pclXO4fDYnObn
         qde8OCfA6zomxvsBaZoOrWJajK3AuQR5KpGdXvPt5PPGmpCjT4Ue09vW0lAi9gKR572m
         Oqbtoy7zB+LCZCbjEOAplCC2I16ugJr/kvDasFKKx8rWl19ldCDBOUE/f8i0za2apSRJ
         LAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3OCoOb+JFwXi2wMv6xbpF4vbDUAK9pGDZl8s+55Ok38=;
        b=pM1f3X9sBTtEeEDFOpSbvvs/iNPLZ1mGA//Tq17Cr3bvaq6YlAx051AD1MGQvvcUUV
         qkCP/E8DGoAJyNlrmzphjefHi3pHryf2nYACrpf4j79WOQ526ws7fkL58Rf6n8HVwjAJ
         2sakz78Yrzot3Sz3janajt0CkmWw/POcGmjVys1UhvD1Kz2LkVpJLS7RuQM//MYd0jdc
         BA15UGYyyXxTfQwvlPydVjgM+K5akRfUDDyhNfOXXG5DFa0hIrE4nMJcdf8clwFvQOee
         2yw+2y55J/RlJJRZLLlwJF5p1FlzJsnXEc+L+LXTvhsgLWV13aLAMTGl0bGubHBMTH12
         p5JA==
X-Gm-Message-State: AOAM533uLN0YlxUkXkKdYkl6cwKPkHYdjNUAbAzQFHhXJWTu2CPVWTgH
        lAoUHFlBD8nrctC+sVXJzUGR
X-Google-Smtp-Source: ABdhPJwvFlIjoVNA6mxVHO5t5M60EU/7EzXH9zO09Xgs400hPCTD3JMm6+dvmhS8Wu0dEH3/OCGxjQ==
X-Received: by 2002:a17:902:7290:b029:d2:ac30:1690 with SMTP id d16-20020a1709027290b02900d2ac301690mr3180256pll.62.1601401999852;
        Tue, 29 Sep 2020 10:53:19 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:19 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, Clark Williams <williams@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 12/19] bus: mhi: Remove include of rwlock_types.h
Date:   Tue, 29 Sep 2020 23:22:11 +0530
Message-Id: <20200929175218.8178-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b2c0214bfbd6..008b8f6fa9ff 100644
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
2.17.1

