Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318462FE936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 12:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729851AbhAULsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 06:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729707AbhAULVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 06:21:07 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5BAC0617A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:19:13 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id e9so1122330plh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jQe2wetugU1pRDNoKc4LJOQOkvxp53VsnbiI6RDAfCk=;
        b=JWhI8jHACexdhKZNQAB1k51Ex/gbBkuWtH4b7zMRmysDqXvSdtCk6gcqxtwhoC5lIf
         nlR6DkSOZnJL4r0XDi8JDy0lYfZKXQrzUKPm1HY31puRm3boWLqQAxaOgLMGiVuVStDd
         uIF6RYV1mDZ+GATOjv4zbSw8OjxDRRXYlTiakQgfcmprBexc9p5d5Awrkut673Bj1yZt
         OuWYzZ3b+q4rFTbTDdO/JhfOa38uQLNYS4HkYy/Rq3znUWIO/1glthWAlFBnrHG/UvWM
         G2q8Z1UyJu0RnmG0fKq0oQ9Hpv2eSuTGnzuTBS+kW2v9C4eZe8BBs7GQUA4Vm970BeRI
         AD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jQe2wetugU1pRDNoKc4LJOQOkvxp53VsnbiI6RDAfCk=;
        b=Tga10wmA3rzDrTlqHEkiu2+lWPOFoW7cy6lEJZAJdy7kT9eSf6mrkkCrMLhqGcjsS3
         UzRyfKPtSZKn78C6fdMywS9UiQ1YJtyDAeTMCJYvyRBaSS4+jK+HGNcks6qwQyQ0g9fK
         V9nIZLfkpnJIy7zfxyMMXy4OFLTDqFHPVOdy6fkQcuaLDL3vx46kbSW9YDXvkTc2rxcW
         sLTSUV8BO7Bk0JJYc0To/EltDohb+NPTI63zyDQuAokBJ9JIaTY4IosjJ77i9GUk/2U8
         cIh0XmzJqUxiJPkYib+T9Q50MljjjH31p6/jHFmV8nvUDZI8EbQ1qqG8yKMDWBmZ04m1
         I43g==
X-Gm-Message-State: AOAM532jBBocjhllBGdLDPUE4Y6qFPbJ0305PNm7BXss31c9dFxDFvRs
        gHdodx6yW6m8a/s02p4xlPTh8A==
X-Google-Smtp-Source: ABdhPJwNGwquTz5sTXjGQEvngNm64YXcGIcif0MXJgKVuRrhGd2tEwCjRjeCSGHJBffSlK3NCPp/8w==
X-Received: by 2002:a17:902:e8cf:b029:de:a91c:5ec9 with SMTP id v15-20020a170902e8cfb02900dea91c5ec9mr14575866plg.27.1611227952607;
        Thu, 21 Jan 2021 03:19:12 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id z13sm5393490pgf.89.2021.01.21.03.19.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 03:19:12 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 10/13] cpufreq: qcom: Migrate to dev_pm_opp_set_opp()
Date:   Thu, 21 Jan 2021 16:47:50 +0530
Message-Id: <c28815c88b59fe0f5c8ba5e4bda273d703b5d9b9.1611227342.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1611227342.git.viresh.kumar@linaro.org>
References: <cover.1611227342.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dev_pm_opp_set_bw() is getting removed and dev_pm_opp_set_opp() should
be used instead. Migrate to the new API.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 9ed5341dc515..7df18903b66c 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -54,7 +54,7 @@ static int qcom_cpufreq_set_bw(struct cpufreq_policy *policy,
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
-	ret = dev_pm_opp_set_bw(dev, opp);
+	ret = dev_pm_opp_set_opp(dev, opp);
 	dev_pm_opp_put(opp);
 	return ret;
 }
-- 
2.25.0.rc1.19.g042ed3e048af

