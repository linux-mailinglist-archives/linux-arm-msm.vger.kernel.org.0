Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A001B1BDC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 21:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfEMTZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 15:25:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34618 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbfEMTXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 15:23:19 -0400
Received: by mail-lj1-f193.google.com with SMTP id j24so11269360ljg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 12:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Nbt/R0uZX9P8HTLZOOX7O4bQjSSh3KmuxEw/gJfnJ0w=;
        b=c9ATK+kF7r7EPNbGkGdt7Bm63ADC4YHAW78L6XgGCewkxmYTEtG+L0LG2PjuZOY9P6
         GIc/wvpLNy0UH3lkOe6ZFzROaxSq6yzGyHcvnwD2CRd7HZc2KPc2eU2Qqjw/+V6Y/odG
         8g1QUs5Jnsr58ljysRy+9dUb1w4F/dykHejwWNEfEpnjahvDUevoLs2Q6KSLe41qv/kt
         0zP1wQEuDypoCPrKTbmlS2icrt04INJA7iFSJ5TpXPM+7IfemYXsH5ks1f1TIKzK3DDH
         bHfdYw7ILT8JPAFLDWe6W30v1tHH6XaC6WnzwDnPcwbc/4E0bjVz5MHKP4astQUCxbqu
         Hwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Nbt/R0uZX9P8HTLZOOX7O4bQjSSh3KmuxEw/gJfnJ0w=;
        b=GHkDgbCUJe8Iw1fEr7CUIiY2ZgAG+LZOslE2cXEY+Flxrr9arvzb+NoEKs1vTxe+56
         cIKie/NzsVtQJOcIwxDstU/NSC2aBORPRzx2kmksh64pLK2a3y14jhu/jOSzNmTVcpVG
         4qkdciKcLK6t1KECEUuAAVKK4KAOoHKF1jjNK5HkYQqtG04QF/O1IAWFd8WzHEjNaB61
         uQPpYLOUYrmXmLH0W/dcfTH9Ovow+g3NA7N39zIIMGFeiggoXn9T5+JKRczwpJHvM1hq
         RwB5kOzh/xT5pIhliCxaDLd4UPWODflIPlp5P/WZLspJIVLLuTm9mgT86jy9HWH8PVX0
         aUfQ==
X-Gm-Message-State: APjAAAXsMNDqYcDm+noqz+q8MUgjpjXcwfQFjUX1LYtMQ27bLIDJC0g9
        nKO7kvCEgpqTwF90c9k7pA5gpQ==
X-Google-Smtp-Source: APXvYqw/K4DSr+T5mHbidlXB09i9OsKjJE0jmVRY6GRi9vogaHyD5Mxz5/BfqSTiLW4LknGP/8Tf2g==
X-Received: by 2002:a2e:1312:: with SMTP id 18mr4211531ljt.79.1557775397083;
        Mon, 13 May 2019 12:23:17 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q21sm3449365lfa.84.2019.05.13.12.23.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 12:23:16 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souvik Chakravarty <souvik.chakravarty@arm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 06/18] drivers: firmware: psci: Support hierarchical CPU idle states
Date:   Mon, 13 May 2019 21:22:48 +0200
Message-Id: <20190513192300.653-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513192300.653-1-ulf.hansson@linaro.org>
References: <20190513192300.653-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lina Iyer <lina.iyer@linaro.org>

Currently CPU's idle states are represented in a flattened model, via the
"cpu-idle-states" binding from within the CPU's device nodes.

Support the hierarchical layout, simply by converting to calling the new OF
helper, of_get_cpu_state_node().

Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
Co-developed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes:
	- None.

---
 drivers/firmware/psci/psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 9c2180bcee4c..b11560f7c4b9 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -316,7 +316,7 @@ static int psci_dt_cpu_init_idle(struct cpuidle_driver *drv,
 		return -ENOMEM;
 
 	for (i = 0; i < num_state_nodes; i++) {
-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
+		state_node = of_get_cpu_state_node(cpu_node, i);
 		if (!state_node)
 			break;
 
-- 
2.17.1

