Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1AB459990
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 02:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhKWBTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 20:19:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbhKWBTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 20:19:52 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4403C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 17:16:45 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id j21so14454779ila.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 17:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OWGNEvMSJrz9gx0ocpfCOrjY/4kPGHl937GrD3qaOEs=;
        b=wuvsvAY2e4NToRbegyHp2Im6GDEau+HqX/NTdgt1a7V5K+QXKas/WpHZVb3dzlzdtC
         UCcw028tlC/kZZGF7PBVRyvR7RLHCVmglfeH7x7SWa2qkx6tk5bF4aeZcOCCQryS/R8B
         o3oeEYT+5eYnHapjYkiTx/wWJN1/28WVcT0H4rZZcbIEu3sr8vw8pCZyZE65SNuN8JOg
         Xr8+xL2pqsUdbI15BrjmUOn5wJIyDoZLBW4edb8OcJEFmp43HR1vF5zcldwhCAboVk0C
         KWahQ57zn7Ux0nYK4CIobqdgj8fvnPFN0+Wcp3mTnveMRuJTe/QsZZVVWGsyMOMKAM7s
         84/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OWGNEvMSJrz9gx0ocpfCOrjY/4kPGHl937GrD3qaOEs=;
        b=IIH0Z+nEhIULLHYdTzQD4Y1Qcifx332gVBDVQbWP8IP05SZ/nZqWpn9ikIMvkwvqPQ
         AdXlLObY7v9n2Owio1LBteP10yMqxoQ5o5RnNrjjHwBXs6uU4q54vOxNlCD60/B2/AK7
         8TAzStFOlbp3CSvTikA80s1rr410bIYD5u+YrmU0dYfF/fDovgAFiAQQfD29BH4Od5p6
         tnjWwj3xmiS2n3tsvaTsxAjop/YSXRxghULDf2oJ3DwMtC9IpNiLZu+6RuJaXf8Wj4jU
         MwSNasMFDFIJpMw2v8zx5wT0KKSRMsiUoml3rdEZvk1VwazGPaHZ2X8OPf4lx9GOuv0R
         vuMw==
X-Gm-Message-State: AOAM533jZlo4HtOrhRNlivqphokUmqFrSWWikbIXkHnVFJkSG1YXIZsS
        JQ7kCIXOY2QAWf39xfGYt4dgRA==
X-Google-Smtp-Source: ABdhPJzLCPeVZOxvyv8iSjcbhzruCpCgY1B7HMkL+iV82dFYamoEBB+pzoa8sWqq0Jr4YY7mvlzQOA==
X-Received: by 2002:a05:6e02:1a2c:: with SMTP id g12mr1728279ile.22.1637630205150;
        Mon, 22 Nov 2021 17:16:45 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id k7sm3909788iov.40.2021.11.22.17.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 17:16:44 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     pkurapat@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ipa: kill ipa_cmd_pipeline_clear()
Date:   Mon, 22 Nov 2021 19:16:40 -0600
Message-Id: <20211123011640.528936-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Calling ipa_cmd_pipeline_clear() after stopping the channel
underlying the AP<-modem RX endpoint can lead to a deadlock.

This occurs in the ->runtime_suspend device power operation for the
IPA driver.  While this callback is in progress, any other requests
for power will block until the callback returns.

Stopping the AP<-modem RX channel does not prevent the modem from
sending another packet to this endpoint.  If a packet arrives for an
RX channel when the channel is stopped, an SUSPEND IPA interrupt
condition will be pending.  Handling an IPA interrupt requires
power, so ipa_isr_thread() calls pm_runtime_get_sync() first thing.

The problem occurs because a "pipeline clear" command will not
complete while such a SUSPEND interrupt condition exists.  So the
SUSPEND IPA interrupt handler won't proceed until it gets power;
that won't happen until the ->runtime_suspend callback (and its
"pipeline clear" command) completes; and that can't happen while
the SUSPEND interrupt condition exists.

It turns out that in this case there is no need to use the "pipeline
clear" command.  There are scenarios in which clearing the pipeline
is required while suspending, but those are not (yet) supported
upstream.  So a simple fix, avoiding the potential deadlock, is to
stop calling ipa_cmd_pipeline_clear() in ipa_endpoint_suspend().
This removes the only user of ipa_cmd_pipeline_clear(), so get rid
of that function.  It can be restored again whenever it's needed.

This is basically a manual revert along with an explanation for
commit 6cb63ea6a39ea ("net: ipa: introduce ipa_cmd_tag_process()").

Fixes: 6cb63ea6a39ea ("net: ipa: introduce ipa_cmd_tag_process()")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_cmd.c      | 16 ----------------
 drivers/net/ipa/ipa_cmd.h      |  6 ------
 drivers/net/ipa/ipa_endpoint.c |  2 --
 3 files changed, 24 deletions(-)

diff --git a/drivers/net/ipa/ipa_cmd.c b/drivers/net/ipa/ipa_cmd.c
index cff51731195aa..d57472ea077f2 100644
--- a/drivers/net/ipa/ipa_cmd.c
+++ b/drivers/net/ipa/ipa_cmd.c
@@ -661,22 +661,6 @@ void ipa_cmd_pipeline_clear_wait(struct ipa *ipa)
 	wait_for_completion(&ipa->completion);
 }
 
-void ipa_cmd_pipeline_clear(struct ipa *ipa)
-{
-	u32 count = ipa_cmd_pipeline_clear_count();
-	struct gsi_trans *trans;
-
-	trans = ipa_cmd_trans_alloc(ipa, count);
-	if (trans) {
-		ipa_cmd_pipeline_clear_add(trans);
-		gsi_trans_commit_wait(trans);
-		ipa_cmd_pipeline_clear_wait(ipa);
-	} else {
-		dev_err(&ipa->pdev->dev,
-			"error allocating %u entry tag transaction\n", count);
-	}
-}
-
 static struct ipa_cmd_info *
 ipa_cmd_info_alloc(struct ipa_endpoint *endpoint, u32 tre_count)
 {
diff --git a/drivers/net/ipa/ipa_cmd.h b/drivers/net/ipa/ipa_cmd.h
index 69cd085d427db..05ed7e42e1842 100644
--- a/drivers/net/ipa/ipa_cmd.h
+++ b/drivers/net/ipa/ipa_cmd.h
@@ -163,12 +163,6 @@ u32 ipa_cmd_pipeline_clear_count(void);
  */
 void ipa_cmd_pipeline_clear_wait(struct ipa *ipa);
 
-/**
- * ipa_cmd_pipeline_clear() - Clear the hardware pipeline
- * @ipa:	- IPA pointer
- */
-void ipa_cmd_pipeline_clear(struct ipa *ipa);
-
 /**
  * ipa_cmd_trans_alloc() - Allocate a transaction for the command TX endpoint
  * @ipa:	IPA pointer
diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index ef790fd0ab56a..03a1709934208 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1636,8 +1636,6 @@ void ipa_endpoint_suspend(struct ipa *ipa)
 	if (ipa->modem_netdev)
 		ipa_modem_suspend(ipa->modem_netdev);
 
-	ipa_cmd_pipeline_clear(ipa);
-
 	ipa_endpoint_suspend_one(ipa->name_map[IPA_ENDPOINT_AP_LAN_RX]);
 	ipa_endpoint_suspend_one(ipa->name_map[IPA_ENDPOINT_AP_COMMAND_TX]);
 }
-- 
2.32.0

