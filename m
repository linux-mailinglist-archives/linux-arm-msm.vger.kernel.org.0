Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2537825482E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 16:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgH0O7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 10:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgH0O7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 10:59:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC72C061264
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 07:59:42 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m71so3721899pfd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WuL1dIUKsXBKS74w29uHtR6KbU+GU+6B3P99Ro425TA=;
        b=ghTzCFJCnPmQ+DImiDILpCS6WX5yhT8MFpZj9RUpmJjv3EXxiJN5WUqT8L4MXcuwxD
         pDNzURkebg9gNy52q5ZsI/Dui3sJhS0Z/2W9PKez79BQdhhRwnf5Mb6p8J4gRu4Gxh8v
         SveFSFYljkwpakvd+DNDZCZJZwc8Vmf6chJRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WuL1dIUKsXBKS74w29uHtR6KbU+GU+6B3P99Ro425TA=;
        b=NTI22d5Ogdc7DYI05suIOuz6XfNGT7GN/NoHe2or9FFzyQKLO50oqjy5Mf7vyVcSZU
         px9yP4hreInlHgJICY6ZdXA7DN/NJdUhN+7p3XcKwbh2PSVk28AdOhGsw0nKPi/oDOla
         isf/0JHqIq0U3OdOs083K6lrU3+/WnwtV+saNZXRUvEhRcZOL9VbqNwQ1KVqdzrV4gDR
         ClvdUAq+9OuIHFJ9eKlx1Bp7MxAvUKnNOPtvFTR6pQKX2un+SBvkcXt9CCflG/OsKI5r
         lxaLnx57l8aDKZ1CVZyBgl8R/TRmlWX0raYxrB4EL2UQdMpV+5/UBjsmVPQ72+ZPhOZp
         PjLQ==
X-Gm-Message-State: AOAM530qHx0UDDLehf5O9SknrVQU32Z8OsG94t1asBDrBoBhOuVf+ebx
        EY9zzZSzJPceojHWL/kMZ+MIaw==
X-Google-Smtp-Source: ABdhPJzzU+IA2AKHCax5T4tD+YBJLoQ/6ieQfs/9z2zBy3H5T5H0eGgx+8rRdt3zBu85loFG04lVjg==
X-Received: by 2002:aa7:9427:: with SMTP id y7mr17053693pfo.12.1598540381631;
        Thu, 27 Aug 2020 07:59:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id u123sm3113198pfb.209.2020.08.27.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:59:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     vbadigan@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chris Ball <chris@printf.net>,
        Georgi Djakov <gdjakov@mm-sol.com>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: sdhci-msm: Add retries when all tuning phases are found valid
Date:   Thu, 27 Aug 2020 07:58:41 -0700
Message-Id: <20200827075809.1.If179abf5ecb67c963494db79c3bc4247d987419b@changeid>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the comments in this patch say, if we tune and find all phases are
valid it's _almost_ as bad as no phases being found valid.  Probably
all phases are not really reliable but we didn't detect where the
unreliable place is.  That means we'll essentially be guessing and
hoping we get a good phase.

This is not just a problem in theory.  It was causing real problems on
a real board.  On that board, most often phase 10 is found as the only
invalid phase, though sometimes 10 and 11 are invalid and sometimes
just 11.  Some percentage of the time, however, all phases are found
to be valid.  When this happens, the current logic will decide to use
phase 11.  Since phase 11 is sometimes found to be invalid, this is a
bad choice.  Sure enough, when phase 11 is picked we often get mmc
errors later in boot.

I have seen cases where all phases were found to be valid 3 times in a
row, so increase the retry count to 10 just to be extra sure.

Fixes: 415b5a75da43 ("mmc: sdhci-msm: Add platform_execute_tuning implementation")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/sdhci-msm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b7e47107a31a..1b78106681e0 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1165,7 +1165,7 @@ static void sdhci_msm_set_cdr(struct sdhci_host *host, bool enable)
 static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
-	int tuning_seq_cnt = 3;
+	int tuning_seq_cnt = 10;
 	u8 phase, tuned_phases[16], tuned_phase_cnt = 0;
 	int rc;
 	struct mmc_ios ios = host->mmc->ios;
@@ -1221,6 +1221,22 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	} while (++phase < ARRAY_SIZE(tuned_phases));
 
 	if (tuned_phase_cnt) {
+		if (tuned_phase_cnt == ARRAY_SIZE(tuned_phases)) {
+			/*
+			 * All phases valid is _almost_ as bad as no phases
+			 * valid.  Probably all phases are not really reliable
+			 * but we didn't detect where the unreliable place is.
+			 * That means we'll essentially be guessing and hoping
+			 * we get a good phase.  Better to try a few times.
+			 */
+			dev_dbg(mmc_dev(mmc), "%s: All phases valid; try again\n",
+				mmc_hostname(mmc));
+			if (--tuning_seq_cnt) {
+				tuned_phase_cnt = 0;
+				goto retry;
+			}
+		}
+
 		rc = msm_find_most_appropriate_phase(host, tuned_phases,
 						     tuned_phase_cnt);
 		if (rc < 0)
-- 
2.28.0.297.g1956fa8f8d-goog

