Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B461B7C09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 18:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgDXQrT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 12:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgDXQrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 12:47:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E96AC09B047
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 09:47:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g6so4868998pgs.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 09:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8LMkNBqXB+CeQceWfD+1N1s9IOWokLMqWssX/DZezGQ=;
        b=QsUZIst0n7NitTwTbPskwHB/A9M3npMfgM+TRceAN2YLnBjo7TiuFLgIDIAlNhloZQ
         Hhw57EsdqXMyumDsh1p+qtH9Zn5ICKQGQ58SLXj71jnWAYQwMA/6Pufm5DvprHi4Cef4
         rH4sHfsgJYbQ0P7x2TuhVvmMmpEyWPlY6KftQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8LMkNBqXB+CeQceWfD+1N1s9IOWokLMqWssX/DZezGQ=;
        b=Q161pK9PaqwacDpdTdKr+4EhcvSU+v95iBdXc60eD64+SjLQ5zABn1TGB5I4NyUIsY
         vuL6MfuSNGGEIq3Fm4F5UD9tvm4pmpsk4tH+rEHQdWvA6K/ezE5Ct9zjNgH1R4xLgMl2
         HwmcUEcYcY/BggzPr80J19+E9fKSfoxcAjTLd/fJ8gkk7Qc5McbyDj79M3p60cb0FLKj
         qFzJkoKYnLU7uyxUFOhXfNe6sHajvU9YSZsd1jwUWMQ2rkpVEFyM7GXCbi4rOyHtgwUJ
         8k3m1iAygbI6lavP7vV99Hs0TGSRJxlQ0JCBr55kqznHcJ6QQ1gCDIY5SzvdY7ol2WU4
         2ZYQ==
X-Gm-Message-State: AGi0PuYKeFvfyGbKoskBaLcCoVyjN+2QKJ0l6UIqDOtRvzsqhkqFAFYQ
        rKDTYpc3GehzHT6Ec/K1cDV3Rw==
X-Google-Smtp-Source: APiQypJWdVuaFCmqhM/KqVMwq1a10HxnD754ZLgp0ghuRAORQk+vl0gQ1jCPIlxmNdNeTKvaSlm4aw==
X-Received: by 2002:a63:f30a:: with SMTP id l10mr10233893pgh.372.1587746838702;
        Fri, 24 Apr 2020 09:47:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id r28sm6319205pfg.186.2020.04.24.09.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 09:47:17 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, mka@chromium.org, mkshah@codeaurora.org,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] soc: qcom: rpmh-rsc: Correctly ignore CPU_CLUSTER_PM notifications
Date:   Fri, 24 Apr 2020 09:46:53 -0700
Message-Id: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Our switch statement doesn't have entries for CPU_CLUSTER_PM_ENTER,
CPU_CLUSTER_PM_ENTER_FAILED, and CPU_CLUSTER_PM_EXIT and doesn't have
a default.  This means that we'll try to do a flush in those cases but
we won't necessarily be the last CPU down.  That's not so ideal since
our (lack of) locking assumes we're on the last CPU.

Luckily this isn't as big a problem as you'd think since (at least on
the SoC I tested) we don't get these notifications except on full
system suspend.  ...and on full system suspend we get them on the last
CPU down.  That means that the worst problem we hit is flushing twice.
Still, it's good to make it correct.

Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches")
Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v5:
- Corrently => Correctly

Changes in v4:
- ("...Corrently ignore CPU_CLUSTER_PM notifications") split out for v4.

Changes in v3: None
Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a9e15699f55f..3571a99fc839 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -806,6 +806,8 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
 	case CPU_PM_EXIT:
 		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
 		goto exit;
+	default:
+		return NOTIFY_DONE;
 	}
 
 	ret = rpmh_rsc_ctrlr_is_busy(drv);
-- 
2.26.2.303.gf8c07b1a785-goog

