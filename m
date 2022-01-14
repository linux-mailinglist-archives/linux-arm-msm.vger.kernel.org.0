Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6CD48E8CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 12:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240647AbiANLCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 06:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240646AbiANLCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 06:02:44 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3707DC06173F
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 03:02:44 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id z22so33570278edd.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 03:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nfTpTGejjbs1/IGPoPayvAsK5HXiDgr01tfB1Ox12/o=;
        b=F4kAU5sR4g6LVo0JnWblWrXfyVfC4H454DjEzaz7/ozw0szvs3R1q3Y91nZ1hCi9dh
         zx/WWapKaJ3nGVMZzcVilNc5dPgRr4A8TEK3h9GBFI/m4/LWda1yVgFQg7CmHg8E6XAC
         FdZbhGUyGHbK/UYiDHMZ/o5JHdXDmY1m4WI61dRVsRNfwGyHFDwvsHRuNb4qRiLop0mh
         Y90+yFSHNiyAMKqkCxHKrojCHqVEaCTPG03p5PTnnfVG8w2z8fuh5h9dq3sEjyppfa4o
         9YkZ+snIayxn0AD5clE9HBui221LF9ToMbKcnX0tyMaLkLQ9ht5hph4jwJrQ2dg1NrCJ
         Zx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfTpTGejjbs1/IGPoPayvAsK5HXiDgr01tfB1Ox12/o=;
        b=ml8ShksaF/1YFtElHzc2eOMeF7fYdG5bkefp7D4OblKSW8BnccM+bGpByvI7jDNWlm
         56UKqee8aMkbMLAiHpwPT5omo48cfsswq96Z00Y37Dq4Juw5nJC9IOZwxEsBMuFupM/A
         3keJtjzOXmrQNSzJvBHL9KWPDaIa9DWthqL/c2+2A4mcmjjag6J2HRtQPVgMXH5jfOFC
         F8SmmqVVgojPDEww8SXIO6iwfoIMrJlDu3WDk76gIrMOltASMVpSoIaMssAVS6JqLh7C
         18dwtYuyYOnnFWf3gyT1bO2rJW2BaGO4Jj0l/Vpe/5UtkdcV0ay80n5n4KuskyG9sLxa
         xp+w==
X-Gm-Message-State: AOAM532FGfFxC1bclqenHhAZX+JAJnRbTLBDsDWu7vlRf5JWtRl9Q4+X
        HU7bmDktzYb+U0ux/e+9bu6ewyZDDzLA5YyO
X-Google-Smtp-Source: ABdhPJxrqLroV1LJ+YyoXVnpa0G8hJgPhVutmPuZ1ZhswksM4KJynfcwHTX4uevBrPH9BDYmLyIFdg==
X-Received: by 2002:a17:906:9b8e:: with SMTP id dd14mr6629836ejc.307.1642158162583;
        Fri, 14 Jan 2022 03:02:42 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id 21sm1725718ejz.24.2022.01.14.03.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 03:02:41 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: venus: hfi: avoid null dereference in deinit
Date:   Fri, 14 Jan 2022 12:02:26 +0100
Message-Id: <20220114110226.130380-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114110226.130380-1-luca.weiss@fairphone.com>
References: <20220114110226.130380-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If venus_probe fails at pm_runtime_put_sync the error handling first
calls hfi_destroy and afterwards hfi_core_deinit. As hfi_destroy sets
core->ops to NULL, hfi_core_deinit cannot call the core_deinit function
anymore.

Avoid this null pointer derefence by skipping the call when necessary.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/platform/qcom/venus/hfi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 4e2151fb47f0..1968f09ad177 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -104,6 +104,9 @@ int hfi_core_deinit(struct venus_core *core, bool blocking)
 		mutex_lock(&core->lock);
 	}
 
+	if (!core->ops)
+		goto unlock;
+
 	ret = core->ops->core_deinit(core);
 
 	if (!ret)
-- 
2.34.1

