Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75BD1B4FA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 23:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgDVVz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 17:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgDVVz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 17:55:27 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43822C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:26 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v63so1812449pfb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfuhF99BRaSEh0bfmWqr7aSzcTnP1RLVseb4QVvFXi8=;
        b=lMzLpPm6h+VTQ1aXb2wCKeBILA8eBpvnCjaMmppBWioTLLm56Fars7TegBE981Y4qa
         UOdGk+wGv/kTK/aZzPeroP9IgG2TaeCkUoP1xJdMwgQA8t3RJcynzQndzKK/IT/4kFLc
         GPomLauJym/7f+mCx5tyPC+qCW8zVmC1mK/kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfuhF99BRaSEh0bfmWqr7aSzcTnP1RLVseb4QVvFXi8=;
        b=HmUoCEtxDLcNbGF0cSYbUb9K0dlGVCPMde7xTFfFO/m+ns3EPIpbRbjLeW+MKclodH
         DP+0OwWYmRnOTG7067d6NjgHboWlr6qdbT6368DXDygV8NzNlWkv1TmOkL2LjQIXLg3M
         kKDjhxyonSgIEyBpIlxk1QSbnaELC37uIUOfzwgOvEtxCgWaRpGJ3FuicnItV56x6Cf2
         AF8WexJvHhmKX4Vpmr3cXEtWqsFWe4M8jlPbDYp+dTbDynwXZ2aV7SUS9Ioh3YC3esa7
         nVSwzikqC3jsW3jWuC6r4Nk6Wl4hBO5MSzpZIVHsTzRvynO3UByfaFuFNDQMjOPd4co/
         toMg==
X-Gm-Message-State: AGi0PubmOFA+GNsl1Pf7XD32bPNOxu3SwZTjyTWqjmY7T6VGM6lrGb+q
        FVcESW87koIz9TJB4+EF9OVRwg==
X-Google-Smtp-Source: APiQypIMZx29EYw/LuKiakgkcK5iD2peotdc67FckTndEWYZzYUjvYUqWxgImzq3lAvbHw2Tfn3gYw==
X-Received: by 2002:a63:df42:: with SMTP id h2mr1118598pgj.216.1587592525841;
        Wed, 22 Apr 2020 14:55:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id r4sm211072pgi.6.2020.04.22.14.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 14:55:25 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, swboyd@chromium.org, mkshah@codeaurora.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] soc: qcom: rpmh-rsc: We aren't notified of our own failure w/ NOTIFY_BAD
Date:   Wed, 22 Apr 2020 14:55:00 -0700
Message-Id: <20200422145408.v4.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
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
---

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
2.26.1.301.g55bc3eb7cb9-goog

