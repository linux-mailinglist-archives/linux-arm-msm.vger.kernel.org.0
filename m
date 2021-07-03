Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C723BA691
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jul 2021 02:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhGCA6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 20:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhGCA6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 20:58:10 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA309C061764
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jul 2021 17:55:36 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id e1-20020a0568200601b029024ea261f0ccso2673171oow.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jul 2021 17:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIcS8obOc85rCVwddJOC5Q1ZEP41KlN6e1ByEjBZDh4=;
        b=cz5eKLT3Mfrcuw1d0gVATA1CPxF1lmHeSbzucy21fRc7wAiMSeA5aKFpxzC1DscteG
         7wwpeQ/QlyjZWtlJXwJs8hVrKESzg3wcNMHubg7U8FXTsjDxWpkMze0d+ZwD9w4KGpd5
         6kQ/QbNLv7IRCihTxzIrWqS+2XHToTvZPYOGjifwjwUBoTQDonkjtzD9XMpSUZC06s/R
         CQwVgum+qDGNqm1qbPoIAy4pth+iXmmy2H+Zfv4YtqKfdm26lC5vjHrvzeOIiBhH3SPx
         +GUnbzr1bMSbArumnNjSCJI2SVg+uW7BsyDXJRpfSv3pcKlgGwFYS5aCciEhCoYfubK9
         Gmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIcS8obOc85rCVwddJOC5Q1ZEP41KlN6e1ByEjBZDh4=;
        b=ZiZdgh7RdcPwWn589jT0UupArCYtFCP81YNcbcDCeAbZMIKwionJdgkKZo8eFKDdFj
         yHq2aYcxp1Sujnv7DUwkGw2jL/rVvMpbXWTl6ZRhPXIq7ick4UZmJDVrDYwtMIPkSzbJ
         Aw+OpoiLqYqNiIyWcPlZHyhCJyDtezqYi8ah5y4rOgcdNvB+rbisIZBHcflN2jfN0WpV
         IFAOIm41lAMGXmtkK3t42F0dlQ3i22HA2E4YJnMisVksYXiyOaNTeTDhOWyMToW5XNjw
         jJM5DS/c4YgcD2G1+4v3XYWn39YgKE23vI/lXMQJCAx4worXTg6JsEijS+dHgsvLEglZ
         +JqA==
X-Gm-Message-State: AOAM532gMM0OsR6PhZICIFPzJ1HJaKid4ZyI7P7SVO95zOX4hrWaoT//
        pwAjTgJAhYepFg6SW2+zdaJgNA==
X-Google-Smtp-Source: ABdhPJxMQ+72I5ZXnQLzRvLObttN2wne2wU62B4Eo3NebgR4TM70/8SvZdK4un9v/qNJpefbaAof7A==
X-Received: by 2002:a4a:5e81:: with SMTP id h123mr1859650oob.11.1625273735844;
        Fri, 02 Jul 2021 17:55:35 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o6sm1057170oib.3.2021.07.02.17.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 17:55:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
Date:   Fri,  2 Jul 2021 17:54:15 -0700
Message-Id: <20210703005416.2668319-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

rpmhpd_aggregate_corner() takes a corner as parameter, but in
rpmhpd_power_off() the code requests the level of the first corner
instead.

In all (known) current cases the first corner has level 0, so this
change should be a nop, but in case that there's a power domain with a
non-zero lowest level this makes sure that rpmhpd_power_off() actually
requests the lowest level - which is the closest to "power off" we can
get.

While touching the code, also skip the unnecessary zero-initialization
of "ret".

Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 2daa17ba54a3..fa209b479ab3 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -403,12 +403,11 @@ static int rpmhpd_power_on(struct generic_pm_domain *domain)
 static int rpmhpd_power_off(struct generic_pm_domain *domain)
 {
 	struct rpmhpd *pd = domain_to_rpmhpd(domain);
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&rpmhpd_lock);
 
-	ret = rpmhpd_aggregate_corner(pd, pd->level[0]);
-
+	ret = rpmhpd_aggregate_corner(pd, 0);
 	if (!ret)
 		pd->enabled = false;
 
-- 
2.29.2

