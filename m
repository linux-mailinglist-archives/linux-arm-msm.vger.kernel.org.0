Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D31E31E1D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 23:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbhBQWM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 17:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbhBQWMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 17:12:55 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06AD4C061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 14:12:15 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id w36so406672lfu.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 14:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HVfGu++4BV6PFNDSYzZjy9kAL54M880pQ5198FJAC0k=;
        b=t7IoIIYbHnXIIPlwrasi0osgAEbXYwl8rH+PJymHu8wmfpdIwrztDwGti0NkKVRJ0j
         pWi58wOUfZI6CHSl2MivrqWfkRlaiiNtMz2mkwpXRID38AM/crcwmdcu129SyRhp+nMp
         tXZOkGZZS8idsDKRpZ0TOpmSvm+sODWZd2x+Tq7NAdYUZXG8EmRKdTlkZhiJSd1tqan7
         ZEll6hkrlRAeFautW5p2mnYGlaCQxRNthSpjz1oCmnseaoglBlYkgFGnzMNE1G62H7hJ
         UfqdYCRFaZq3VfhJcMzUFbyC8cva7Vryw7KOuBywvLmBYVMiHkYWQBuIwux+JlqzcbEx
         pWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HVfGu++4BV6PFNDSYzZjy9kAL54M880pQ5198FJAC0k=;
        b=fQtHl3WYR+eQDZgOMX2sYuKX0nMtNeICn5EgaOdcX+SIU0Yq576yvYdwQCaaNyZ9sZ
         +djqOvsXbTW6gneggp3+De34ESkyFfV/5GnabGf1lP35mVh4So0MUiR8n8afR/CRPkQm
         RABYhMuUCykRZvq2wfPkazTdBADRPQaA3b/vfOQmgBqOAwC6ENpd4ZZrPS37hkwJOxEC
         diDXHc3nZIjwSRdn4LvR9zKkCSZZqMukulIoN4WeplnLRpFLE0kIXSeeM+39qIO9AUXd
         9Kh0jMPQL/5yWwySLqbdw/FKbyEsSqdb5Wxi08dy9pMP+ruC+TEIe+aSGZx4bA0nJ+oz
         6gRw==
X-Gm-Message-State: AOAM531KGIuGQSbZwJWjHe5AUZPF9Of2skqTbOiSR/ML3IyH9cA7ohpE
        8Z23ycorbs/Kte5FTWPNIopgbA==
X-Google-Smtp-Source: ABdhPJwtLL4d6YOTdtI5gEmFRxi0+TOMhteGCHR0mfqNin1koBvqRKWhJIvDfnROUbBGKT1UuI28JQ==
X-Received: by 2002:a19:5f0b:: with SMTP id t11mr587147lfb.193.1613599933526;
        Wed, 17 Feb 2021 14:12:13 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id b7sm382926ljk.52.2021.02.17.14.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:12:12 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 1/3] v4l: common: v4l2_get_link_freq: add printing a warning
Date:   Thu, 18 Feb 2021 01:11:32 +0300
Message-Id: <20210217221134.2606-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217221134.2606-1-andrey.konovalov@linaro.org>
References: <20210217221134.2606-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Print a warning if V4L2_CID_LINK_FREQ control is not implemented.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 133d20e40f82..f1abdf2ab4ec 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -461,6 +461,8 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 
 		freq = qm.value;
 	} else {
+		pr_warn("%s: V4L2_CID_LINK_FREQ not implemented\n", __func__);
+
 		if (!mul || !div)
 			return -ENOENT;
 
-- 
2.17.1

