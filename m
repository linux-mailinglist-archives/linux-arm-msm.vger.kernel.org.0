Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323241B7C0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 18:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgDXQrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 12:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgDXQrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 12:47:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C48DC09B046
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 09:47:21 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r4so4875614pgg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E3KjD6DEHWViNkrcMMSN/omOCLanYpgnv+lBLaBhKo0=;
        b=L/h+pXonieUaKE73C74m7aMrsu8HHy+pR/uPK4uZDzSdlYpkfZZFlHeFh8cuAkVGnR
         9LMNHSbA35LlAXdwElE2wq/ptphsPvR5QFW+Fy5fz9fznaea8oujzZldCqIkd1UBld40
         xChpGFiZVBUmj51foycCY7G4sC9kIwiEVfO/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E3KjD6DEHWViNkrcMMSN/omOCLanYpgnv+lBLaBhKo0=;
        b=r6iNUh59sOYpReUZKK1w/rWRvXrYgomDL6FoA9gLcrg+LySTKfi0Y+uKrppyNYDWRI
         59Bh+ch83f6pFaVQn68VQnAQ41mWZms1Yd/X9zfFP0j/0Y2ZA7NCNVnXlMV76lo1g2lF
         Z7O8emAHLHcdJU5Iq24iErRbKCReTFiHeg98KXDRU9iNR/HFJ7/9LkdJSVsR+ESQKYdU
         yxWENx+6+Q4pP5YZjyGIE7bLKZdWL8bcoXFFOKk9Fi958yjZ4tqgUHhlJvYT4E2T7aGU
         qAohAEOM5NYxhHshZwy/CsM6FCHgRn3oxrnY9rUL3W4luGkQW5ONNFkV6S4MzfkHFxKp
         oX/g==
X-Gm-Message-State: AGi0PuZR/DGfOF+XEnfXSnlrtSF0O3gCH6ohlE+Eh2OEqOnY9VNrsEAM
        JmAyFd7zP5m47+Aztp+oeIeJ7A==
X-Google-Smtp-Source: APiQypJS5Vu2StLAphXoyH18FEjHXWpUyRYfnNWIgp88nn9o0an/t8A9h4S6g8LYSa3anEqvIzef7A==
X-Received: by 2002:a63:f50c:: with SMTP id w12mr9858798pgh.253.1587746840689;
        Fri, 24 Apr 2020 09:47:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id r28sm6319205pfg.186.2020.04.24.09.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 09:47:19 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, mka@chromium.org, mkshah@codeaurora.org,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/5] soc: qcom: rpmh-rsc: We aren't notified of our own failure w/ NOTIFY_BAD
Date:   Fri, 24 Apr 2020 09:46:54 -0700
Message-Id: <20200424094610.v5.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
References: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
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

Changes in v5: None
Changes in v4:
- ("...We aren't notified of our own failure...") split out for v4.

Changes in v3: None
Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 3571a99fc839..e540e49fd61c 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -823,6 +823,10 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
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
2.26.2.303.gf8c07b1a785-goog

