Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2B02C0CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbgKWOEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgKWOEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:23 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F71AC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:23 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so17365142wmi.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4dySM6ga3g1JccS9VpKiXH/tknJsBk9CHeAdOMBOgi8=;
        b=wmQ/SWXhQATuAMF2bttR04zNFBN1ch30xgUQLiLKDGapsjUJjlydNZqj1hOAXTLR9T
         TK6WyoZ5UAPbu5w1v24IKVZnXoCmaxTd6Gv+0+c6/f8slx0mDrkF34z4j+G1sg7Xs6x8
         l/q1NGpZb1E4yDdliqUHlnrJt0prki1kSKs/ef8OEHYNEviX3C32rrdVJUJTQcLimEMd
         lkiNuXGSpDsLOiR+t4DQ3FzzaKxigtAHnMovRHrwBU0QGG0gnBRnSgZiJJQfeRNI9GMh
         6X7DRHSNjjDW4R+Fk+vf90VC9D3rsR0nASyBAaDSqOIYaYdFf+6PKqYrPRcFDIqOPE5E
         jqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4dySM6ga3g1JccS9VpKiXH/tknJsBk9CHeAdOMBOgi8=;
        b=i7k+oURNJVcAkxzyzaU/wz7ubjLSwuW7mog5F8Dn6eD9RU6ub9/e031UfCDu7jiSXy
         a3vAly49kFtssJHmex8WWmo3EnqhsDPuT6/cNAT0WPYwSLfNE8dzsBb0fXvdaLuuUgt8
         gpa4paVIPTBS+CVfalLanBpvJfvK22p0hsv8YKldLMDymnG7eeUTmCWiF92njmpVm+xZ
         ENGlQgoPnkyGeAXdFRCo0kuafGhcx6hq2rGbiTgwbbt39gVyYpvgPrplMX357QNWTqJc
         JT1G4dwoLUbev3vzeKdGc4g6z/ZjutDRAbqPBEn1qdEkEF22SSw36wRO44wIwH3JhgsO
         4q+A==
X-Gm-Message-State: AOAM53042e60s1NgaQmiOfmqcKhEsismaAddquBioKiKLS8wjZwDcxL8
        2cjRzELLZSs5P0wqiG5wrM6zXA==
X-Google-Smtp-Source: ABdhPJwy9YsYUrAQkyBjMAo6v7cV3TIG9bAxmm1kSJC4wFGcE135LQno1aGtxNqLy5Fa7BPzgEWgIQ==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr23467876wmf.14.1606140262059;
        Mon, 23 Nov 2020 06:04:22 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:19 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/8] mhi: pci-generic: Increase number of hardware events
Date:   Mon, 23 Nov 2020 15:10:59 +0100
Message-Id: <1606140666-4986-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the IPA (IP hardware accelerator) is starved of event ring elements,
the modem is crashing (SDX55). That can be prevented by setting a
larger number of events (i.e 2 x number of channel ring elements).

Tested with FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index e3df838..13a7e4f 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
 
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
 	{					\
-		.num_elements = 128,		\
+		.num_elements = 256,		\
 		.irq_moderation_ms = 5,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
-- 
2.7.4

