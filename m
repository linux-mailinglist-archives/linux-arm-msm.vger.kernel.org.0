Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715763BA68F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jul 2021 02:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhGCA6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 20:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbhGCA6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 20:58:11 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29482C061765
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jul 2021 17:55:38 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id r4-20020a0568301204b029047d1030ef5cso4951542otp.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jul 2021 17:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YCuLYJ5O0b8LBoAKT9/3WK6Ifs6SJmLEad6FyRxEfNk=;
        b=BCHDgJOZWoDZ1eJhju4Z3/1I4vL+iVH2EfJbus2ZBbVu+Q8zSdQDpeBvIWV8bw7M4O
         R5g82z+ftlIV2p4WSfd3kZlD7JCR2ajSkzdG/qjx74efWiwFywsTX/L0EgSGWqghrDZe
         hMB0vBZVrluFKVTly9hk7h8OQ+NAoCgR/F5FdzdQl/TIMwGCSwdGiOCXmFIqhB2SDX5d
         c+Ghs5j5apHbMOvvID+hozXCDObLXVZn+ULPT4MFbXUJBN4kuE4SDBgHe1Oujau8qI9I
         5IXsFDNvL8fu4Ven6tQSFt639OMxkcCMtWcoh4xuBIzhAOaUIz3I8QuS8ZygH6AXQSbU
         4H0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCuLYJ5O0b8LBoAKT9/3WK6Ifs6SJmLEad6FyRxEfNk=;
        b=ELkzg1aWWdtCAHMNw05FSiJ4YtbZujxaBTU8sYuyJFCmJYNvuerb+WL0vUJwyAfl/O
         75ExEoodnxDUTpgxvwIZlR1bdSxuMnkvijpB9qeGU8GFaG7PNpbhV5hCLgHXimYn3CDx
         4V6pajNcJ/uhDWcqs85pKEIzFzsNJrJcSG2XjywAWkpOcKYaJOzWhQbvOgq56OIjG27L
         Xp/zxoW2PA/pX8W+7yoaGpdxGPnS3Wr/4MnMd1PZojZKw3OICYpDHT51jTnrUDzacJDD
         WvmQgxFcBu3/R19ckpyKm3vKHuRiER4o75mC6lskWoa97fepdYAjIrMpwk7Qg8RtvZn9
         oKRA==
X-Gm-Message-State: AOAM531bzIMm/s8nhG4JH6Ji8Zm1W9UzRPeqtrn2Nl/h4iZNIuDa0heU
        A6k2h3AyELmCxo8vWDBcs17JUA==
X-Google-Smtp-Source: ABdhPJxZ/jKGnXlg/SLxrYDYPjeYeGa/Wgkx+EIlbifoN0klpwr9Yz6vx35CP4dFZ/c7XtWT6YZAAw==
X-Received: by 2002:a9d:5d11:: with SMTP id b17mr1651104oti.216.1625273736714;
        Fri, 02 Jul 2021 17:55:36 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o6sm1057170oib.3.2021.07.02.17.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 17:55:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: rpmhpd: Make power_on actually enable the domain
Date:   Fri,  2 Jul 2021 17:54:16 -0700
Message-Id: <20210703005416.2668319-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The general expectation is that powering on a power-domain should make
the power domain deliver some power, and if a specific performace state
is needed further requests has to be made.

But in contrast with other power-domain implementations (e.g. rpmpd) the
RPMh does not have an interface to enable the power, so the driver has
to vote for a particular corner (performance level) in rpmh_power_on().

But the corner is never initialized, so a typical request to simply
enable the power domain would not actually turn on the hardware. Further
more, when no more clients vote for a performance state (i.e. the
aggregated vote is 0) the power domain would be turn off.

Fix both of these issues by always voting for a corner with non-zero
value, when the power domain is enabled.

The tracking of the lowest non-zero corner is performed to handle the
corner case if there's ever a domain with a non-zero lowest corner, in
which case both rpmh_power_on() and rpmh_rpmhpd_set_performance_state()
would be allowed to use this lowest corner.

Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index fa209b479ab3..29a339942301 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -30,6 +30,7 @@
  * @active_only:	True if it represents an Active only peer
  * @corner:		current corner
  * @active_corner:	current active corner
+ * @enable_corner:	lowest non-zero corner
  * @level:		An array of level (vlvl) to corner (hlvl) mappings
  *			derived from cmd-db
  * @level_count:	Number of levels supported by the power domain. max
@@ -47,6 +48,7 @@ struct rpmhpd {
 	const bool	active_only;
 	unsigned int	corner;
 	unsigned int	active_corner;
+	unsigned int	enable_corner;
 	u32		level[RPMH_ARC_MAX_LEVELS];
 	size_t		level_count;
 	bool		enabled;
@@ -385,13 +387,13 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
 static int rpmhpd_power_on(struct generic_pm_domain *domain)
 {
 	struct rpmhpd *pd = domain_to_rpmhpd(domain);
-	int ret = 0;
+	unsigned int corner;
+	int ret;
 
 	mutex_lock(&rpmhpd_lock);
 
-	if (pd->corner)
-		ret = rpmhpd_aggregate_corner(pd, pd->corner);
-
+	corner = max(pd->corner, pd->enable_corner);
+	ret = rpmhpd_aggregate_corner(pd, corner);
 	if (!ret)
 		pd->enabled = true;
 
@@ -472,6 +474,10 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
 	for (i = 0; i < rpmhpd->level_count; i++) {
 		rpmhpd->level[i] = buf[i];
 
+		/* Remember the first non-zero corner */
+		if (!rpmhpd->enable_corner)
+			rpmhpd->enable_corner = i;
+
 		/*
 		 * The AUX data may be zero padded.  These 0 valued entries at
 		 * the end of the map must be ignored.
-- 
2.29.2

