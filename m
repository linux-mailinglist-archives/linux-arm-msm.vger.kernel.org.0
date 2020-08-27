Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968C7254987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 17:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgH0Pdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 11:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgH0Pdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 11:33:41 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BBBC061232
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:33:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g1so3613449pgm.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLogCY9snthkks89Ea8CnKQB+BmwpQEsk4ur1DM2HdU=;
        b=BkSNnJtZWr1nebAVtZFleChfEIZX1Ul2Ahd6LQna22QOuwjvS4znFuCi9Rk5uCwoAo
         wsweWskmO00ZS9A+jlYlaoiiuhf1RG6P3uYkNM+xWSd6b++ZfHGc5fkClqFv1mH8aEUK
         nlb5HA7p159z1jRabNuNV/qxS6WRAP55aadI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLogCY9snthkks89Ea8CnKQB+BmwpQEsk4ur1DM2HdU=;
        b=Xeo3nbf9AFzvMYfhBHJe43UlFtZvHi48ONSOSHkjfwlByeL52z9f/OqoR98lMd6Dgq
         Y7FTjFHZIf47fRkNN9RX7GotlLnlMIlWQ8PasVi07HZ+MQRqaiCQIHVI3jD/zuPvxWE9
         T+MVb/Yh5yt5Ip1uuUiVkLVqYc17NPhTLrD4UHIX+3RNmYp82iRENMEURfF3v08FQylU
         8qiEKSeUBiVHj8FNzJSr355sl8qtW1BBtLdDzMmCazhi64wt0MPTPHI8LgjpNnb5Dd3T
         6rtDnWZr5de0sbdkiafbgSAL4X/6Hu/+TwA70S6vWIjW7yIHm8M3xCqnKq5TdH0oeIfT
         oAMQ==
X-Gm-Message-State: AOAM5335fJkNOuumFhhRdtogirf7K3YcJoZxBg5a8bqmxWwt7gZN8x1w
        Wf0GXBARh8U8Aed+YWsCCRTl0zlStC7YUw==
X-Google-Smtp-Source: ABdhPJwbYpqy+gzLGlY7DU9mHynPfbjLpramh455uzAwuYGrfuMQFSgWKylzRDRhuQdd5ch+5tlRkg==
X-Received: by 2002:a65:52c5:: with SMTP id z5mr15387187pgp.105.1598542419246;
        Thu, 27 Aug 2020 08:33:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id y7sm3192105pfm.68.2020.08.27.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 08:33:38 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     arnd@arndb.de, naresh.kamboju@linaro.org, vbadigan@codeaurora.org,
        rnayak@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: sdhci-msm: When dev_pm_opp_of_add_table() returns 0 it's not an error
Date:   Thu, 27 Aug 2020 08:33:34 -0700
Message-Id: <20200827083330.1.I669bb4dc3d92bd04e9a695f97904797dc8241b79@changeid>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call
dev_pm_opp_of_remove_table()") works fine in the case where there is
no OPP table.  However, if there is an OPP table then
dev_pm_opp_of_add_table() will return 0.  Since 0 != -ENODEV then the
"if (ret != -ENODEV)" will evaluate to true and we'll fall into the
error case.  Oops.

Let's fix this.

Fixes: d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/sdhci-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b7e47107a31a..55101dba42bd 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2284,7 +2284,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (ret != -ENODEV) {
+	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
 		goto opp_cleanup;
 	}
-- 
2.28.0.297.g1956fa8f8d-goog

