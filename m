Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92920421CFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 05:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhJEDhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 23:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhJEDhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 23:37:41 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0C5C061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 20:35:51 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id c6-20020a9d2786000000b005471981d559so24193230otb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 20:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n1sIofEKORsTR+BKeozYVhAx4/whk5x8HA7cir8+0Rs=;
        b=bqdhqIyb/rrIB3tr4O1+Y5bzOlc/VapTa2T6YM2GSnffpAN6gA5SSi2TG/O83hmClo
         482YwpGqNQTJRjUXkEVyCxzeJ/wOKJBNQOCMYEmkefYIypNd7pxu9qyioG/AnIUcy91Y
         L39eL4FFDO/UZZIP2uL+bLHXDi6Vc0dSghkqO1XCwqJxO7aWShNx7YrjIHfgt+gDnruj
         8LLfyLn6Q6vRCuZhEU1mc6F6hjcy1E/ZJQbUF7FLzvae5ISUF7Eoz1F8Uv4osvGOMZFv
         WdVYuPYZIpNTXsDSejLgSKy5OUd9/RPD1zS73rw6yxh0jU7dbhrPumnMFjDvsNKFXpoH
         nreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n1sIofEKORsTR+BKeozYVhAx4/whk5x8HA7cir8+0Rs=;
        b=r3V1RnKxKivahqe5BoD8TQ3KKnwwW27CX3T5d1jH1K4iZPnCSHioxusA9kFGb1hXXR
         eCQYCqdxr9iO+5fCj5Yqvhl0s0/JmH+5uvm+kPhILEkHD7hO4rFsx/qVIs7MybJYn5GO
         aYCyxOxRDH3HC0YqSNNfJCfJcrWeP+kyRrI9E8Jx0PK8o6ZWTfOPJR85/ydDmo8GTrBd
         OFlWOOP4AHphwkfTbOvzVQwQAldeHa4RpifsFCQ2EXzRdY1xcXel2m6ul+C4NAQb6lsM
         EPDf6VC4hQgM6fCcjinc8FirTbFB+y7h5kGezC3Bohi64yt78uVyXc7S69TZJcGJ/QaX
         NnxA==
X-Gm-Message-State: AOAM533O/tXEnk3fNwx6MfFCfT+fYaGahY7KR7xLP3QEASLjKbZJhYYI
        V9NZ6qBBToxIxMxJvaXYwDyhrw==
X-Google-Smtp-Source: ABdhPJzDMQWh9R0Akj/n4iwivgOsF6bWnpo67N8Y0fKzCgGtLK0N9e+9JiW5btQzwzjFxPMj52KJUA==
X-Received: by 2002:a05:6830:128d:: with SMTP id z13mr12717938otp.19.1633404950695;
        Mon, 04 Oct 2021 20:35:50 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id e16sm3075101oie.17.2021.10.04.20.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 20:35:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] soc: qcom: rpmhpd: Make power_on actually enable the domain
Date:   Mon,  4 Oct 2021 20:37:32 -0700
Message-Id: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The general expectation is that powering on a power-domain should make
the power domain deliver some power, and if a specific performance state
is needed further requests has to be made.

But in contrast with other power-domain implementations (e.g. rpmpd) the
RPMh does not have an interface to enable the power, so the driver has
to vote for a particular corner (performance level) in rpmh_power_on().

But the corner is never initialized, so a typical request to simply
enable the power domain would not actually turn on the hardware. Further
more, when no more clients vote for a performance state (i.e. the
aggregated vote is 0) the power domain would be turned off.

Fix both of these issues by always voting for a corner with non-zero
value, when the power domain is enabled.

The tracking of the lowest non-zero corner is performed to handle the
corner case if there's ever a domain with a non-zero lowest corner, in
which case both rpmh_power_on() and rpmh_rpmhpd_set_performance_state()
would be allowed to use this lowest corner.

Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Fixed two spelling mistakes in the commit message
- Changed the last hunk to search for first non-zero level, rather than the
  first non-zero index (i.e. 1)

 drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index e280a8194725..0ca77ed22c6c 100644
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
@@ -401,13 +403,13 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
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
 
@@ -452,6 +454,10 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
 		i--;
 
 	if (pd->enabled) {
+		/* Ensure that the domain isn't turn off */
+		if (i < pd->enable_corner)
+			i = pd->enable_corner;
+
 		ret = rpmhpd_aggregate_corner(pd, i);
 		if (ret)
 			goto out;
@@ -488,6 +494,10 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
 	for (i = 0; i < rpmhpd->level_count; i++) {
 		rpmhpd->level[i] = buf[i];
 
+		/* Remember the first corner with non-zero level */
+		if (!rpmhpd->level[rpmhpd->enable_corner] && rpmhpd->level[i])
+			rpmhpd->enable_corner = i;
+
 		/*
 		 * The AUX data may be zero padded.  These 0 valued entries at
 		 * the end of the map must be ignored.
-- 
2.29.2

