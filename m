Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705A01A8BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505506AbgDNUKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731040AbgDNUKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:10:48 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB6DC03C1AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:10:48 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id c138so453798pfc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppH/+YgCTeOL3Dr2C7WADabmRRYp+dAF5+qWcrgchF0=;
        b=BwmNsRYexbR7lKrCQrRx5vsflrNkwJmuQvHInrHOfAT5Dk3KjbgEjVMmw76lAtjYT1
         NMhgs04kdmPjqzqupZHaAZB8KgSRn/q/t6O2dWDYs7nPuwzziHX3Qc6PFNZ5kankIYN3
         ynMKtW6TWXTgjetozVX2nrvQnHjWoNtgmnvT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppH/+YgCTeOL3Dr2C7WADabmRRYp+dAF5+qWcrgchF0=;
        b=sBBCw5POP255L/n6qvlZSO/PycF7kvyn5ROtn+6cWTNUq/0XtJWMyJYzT80iyw5gSY
         1bsCkI4157G6bsk9QUP77qt5J9Fl9lUQAY7Ai1OVfbQPFsH8BeQ+Nz3xZ018QOfG1o75
         18QxrqyLJC/yKjFkS/TTOtwmpScQ4yU1lMKcioeBIJkkd286sEH9u1cKWT5LGsgsfaPn
         kU/4fIoAIx3mnk1RCspb+cCmy8pNjxXbjwCOtOJkuI3gvlT/w3dfUIfL6fcBKAAjeixR
         xjMD5jtXo6hgjehfyCs8K67zclxAfBVmICi8+gFDpFV6wx+l32v4F6MOtUm3bVFYLffD
         JOug==
X-Gm-Message-State: AGi0PubkPUXCkHM3GcFKaWtTLFoMSGSkRtm0aArpE0KwLFZ9Klvssqo6
        SG/pplmTiUI+0sn92IRRL2gHPA==
X-Google-Smtp-Source: APiQypJPg1zVr0kK4Hik17t3Nla01ANehPz3YuKx5NpHqPaF9GKVC9k17lYP+tIq+gKMj4lum9Z3kA==
X-Received: by 2002:a62:4e0c:: with SMTP id c12mr23544904pfb.87.1586895047930;
        Tue, 14 Apr 2020 13:10:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 135sm12189805pfu.207.2020.04.14.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:10:47 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, joe@perches.com, swboyd@chromium.org,
        mka@chromium.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()
Date:   Tue, 14 Apr 2020 13:10:16 -0700
Message-Id: <20200414131010.v2.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
References: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If our data still isn't there after 1 second, shout and give up.

Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("Timeout after 1 second") new for v2.

 drivers/soc/qcom/rpmh-rsc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index f988e9cc2c30..02fc114ffb4f 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
@@ -174,12 +175,13 @@ static void write_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id,
 static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
 			       u32 data)
 {
+	u32 new_data;
+
 	writel(data, tcs_reg_addr(drv, reg, tcs_id));
-	for (;;) {
-		if (data == readl(tcs_reg_addr(drv, reg, tcs_id)))
-			break;
-		udelay(1);
-	}
+	if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id), new_data,
+				      new_data == data, 1, USEC_PER_SEC))
+		pr_err("%s: error writing %#x to %d:%d\n", drv->name,
+		       data, tcs_id, reg);
 }
 
 /**
-- 
2.26.0.110.g2183baf09c-goog

