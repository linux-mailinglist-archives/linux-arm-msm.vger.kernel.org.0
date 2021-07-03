Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0623BA6BE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jul 2021 04:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhGCC6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 22:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhGCC6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 22:58:43 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7F0C061764
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jul 2021 19:56:09 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id r4-20020a0568301204b029047d1030ef5cso5183278otp.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jul 2021 19:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4JBEn265RptunOfiTs8m0M1fvn//fFSz5pJNGMHvF0=;
        b=pGRPaUXtl6GI7prIsGs6Khy5OqJoKovWnX9eyNulqc/9P+Ny82xu97dZdyKM1UZJPj
         K09VavETGZPhaUbLBjlbEw4inxokntOCpYyZ0mfgbt8sJhe9hqIpI1yRl097NVwTTbtJ
         Dym5m/Gl7j30YkbyJUrSCKLUq2Pp17pr1eE933JgoyuCqgMsYj+uxtRfrF6q/Y+EkUSI
         CgXCAR+IyK7LdzmsjN+DCtcycOZsyBCZlq3KK+5By8d4ozJx5tiugTwcV2uAbihUC1Mr
         t0PHJdZHmGpGJU6CWiLFQeJ8dfBKV2UuD8aHRo3dEoGi8a6LFB02ec9uBx16gpKRpMlV
         yZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4JBEn265RptunOfiTs8m0M1fvn//fFSz5pJNGMHvF0=;
        b=h4Nao7qUxubCM+94ceAQHcPQ/Zxp8q4yvEMv50LlGdI5YbZzJwqJLihY3MJgfgvf0t
         pngsSWS9vlErcBrBtirCBXc97yF85j5wPXI8LTqXc9BP4Xc2+Z65aZa+metpJMOYRzPO
         2KPgSqOY3RI8jsNOAHftD2xAgm53mUaFc2phRpKzRYL2jsNq2TuTzP23LiHQ/x1/bcyZ
         0Vib/zbXLoSOLgfmLiGTKzKk4R4SzOT0oxmx+0pkS2KMkGWiiEA7o0CjSyQjgZjROTbw
         00TRxTLgK9U4qUTycPKgDy7yy68rwb60yRCweUklbsrfDkuR/+vTb4XJEXxikUmXXNTJ
         Wrag==
X-Gm-Message-State: AOAM533G33ql2KE1mT3McPSQxAuIPEHAaLimO6bfsVkOD+I6GnNwixPq
        5bRk8zK43wVRf7w9/bJCyjDxqQ==
X-Google-Smtp-Source: ABdhPJzR77b2c9BpirjHCvdYuYm9vS4EP4rR3vtmVD1kjsYVCHS3FjWLvwvYHBB7dDbXLaZr+Q/dGA==
X-Received: by 2002:a9d:3d3:: with SMTP id f77mr1943963otf.43.1625280968433;
        Fri, 02 Jul 2021 19:56:08 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y6sm1143547oiy.18.2021.07.02.19.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 19:56:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/2] soc: qcom: rpmhpd: Make power_on actually enable the domain
Date:   Fri,  2 Jul 2021 19:54:49 -0700
Message-Id: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210703005416.2668319-3-bjorn.andersson@linaro.org>
References: 
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

Resending because the hunk in rpmhpd_update_level_mapping() was left in the
index.

 drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index fa209b479ab3..76ea6b053ef0 100644
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
 
@@ -436,6 +438,10 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
 		i--;
 
 	if (pd->enabled) {
+		/* Ensure that the domain isn't turn off */
+		if (i < pd->enable_corner)
+			i = pd->enable_corner;
+
 		ret = rpmhpd_aggregate_corner(pd, i);
 		if (ret)
 			goto out;
@@ -472,6 +478,10 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
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

