Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368621C4348
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 19:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730489AbgEDRun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 13:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728158AbgEDRum (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 13:50:42 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CEDC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 10:50:42 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a7so247817pju.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8Gc1kLtVFV1R0DlMxHKBiZCxcvYh6OWtByO2hqsTrM=;
        b=FOxWRUBnJzJVUb5IWf8gQ9P/c3XoYLS/3PJIpB6UQ8NWsi3QdfYS4ejR1Kt/8v4M/2
         i1bf2jHrsxWGIHh2kKe4W7ovWNWEkbgsv/C0LokWb0QxEOUkQGn9x2TZa/D/tSN8kz7X
         QzjRTPHzs47Sadt3o9ssO4HvltSm7IfmzUhOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8Gc1kLtVFV1R0DlMxHKBiZCxcvYh6OWtByO2hqsTrM=;
        b=GBaCTmaYpjIllba8niWvnYO5wzgOmyc2DRIqCUM2e2bLuI9k9lmIcXyd/ThmfL7jaE
         qrvdDXpII7S0ZWmlv1XHnWf3xu7hO4h3qW5zHajIqk4iUvsUilrskanrDD/C0EgPJESE
         /zEZTBtr/R5Cre/kj3UvbfnSBcY/D4dGLjBDC+gzy7G1iQLrC1H7NTtInnIN7KnItYbv
         DpjSwEzUirt4dJ0lstRFtLLzsxrEq8WjP5Y58Mqub/6v5AehmFXYUV7rQGstlAIXjqs9
         BG3qg81Og+4rUFRe36ybhpsyDwauQY/Vs0zrZNDtFfzoGRMeqUU3ONGGiYIkscWDIP7q
         6nrw==
X-Gm-Message-State: AGi0PuZtEuhGQxU0pB1tgL72PC84eG4ijpDGblcV19bTCIT/mAFLXZMP
        HZamgYZFd5MQEAkYp2SpiniGCA==
X-Google-Smtp-Source: APiQypLS6Pe3kf345ZuGLyJX052jOycUO5tM4IpImtW4T2vjYe80UVC64Gt8dI+HpM0uR3NAnK9xxA==
X-Received: by 2002:a17:902:7203:: with SMTP id ba3mr356417plb.202.1588614642270;
        Mon, 04 May 2020 10:50:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id t3sm9402062pfq.110.2020.05.04.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 10:50:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, swboyd@chromium.org, mka@chromium.org,
        mkshah@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/5] soc: qcom: rpmh-rsc: We aren't notified of our own failure w/ NOTIFY_BAD
Date:   Mon,  4 May 2020 10:50:16 -0700
Message-Id: <20200504104917.v6.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
References: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a PM Notifier returns NOTIFY_BAD it doesn't get called with
CPU_PM_ENTER_FAILED.  It only get called for CPU_PM_ENTER_FAILED if
someone else (further down the notifier chain) returns NOTIFY_BAD.

Handle this case by taking our CPU out of the list of ones that have
entered PM.  Without this it's possible we could detect that the last
CPU went down (and we would flush) even if some CPU was alive.  That's
not good since our flushing routines currently assume they're running
on the last CPU for mutual exclusion.

Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- ("...We aren't notified of our own failure...") split out for v4.

Changes in v3: None
Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 8c338335fc21..298d4a003c1a 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -824,6 +824,10 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
 		ret = NOTIFY_OK;
 
 exit:
+	if (ret == NOTIFY_BAD)
+		/* We won't be called w/ CPU_PM_ENTER_FAILED */
+		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
+
 	spin_unlock(&drv->pm_lock);
 	return ret;
 }
-- 
2.26.2.526.g744177e7f7-goog

