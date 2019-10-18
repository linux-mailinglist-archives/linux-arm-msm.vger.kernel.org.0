Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE130DC057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 10:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632964AbfJRIwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 04:52:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37153 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632988AbfJRIwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 04:52:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id y5so3450326pfo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 01:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=yJmW/rmXm26duaDyfOHOFYteagLDpotWOjrp7D9YhkU=;
        b=VmFlhBj2FrlOil5Ro2+R3NNGOF/BhIIl/xJUhPKmdZjV4yp/3W9q2FDa07vgRUyBwe
         77DJhlG/aRp27LbwoEJXO7aSur71B1sjKABDOgQo9FiuCPRzwhM2EGYDXppyDUskM2w4
         oDQKuW9cziROsrSoLFPjze+hVNCnYlyglffqO4JyHA1qALqjQJkA+0jJJrI4srNoaco/
         6gZXAyhkxhS6Z12KgmQrt3Ou3COXNlyA9t3QoHgdbQxa9NpK4QKcBfmpGK0KTEp58xFY
         ZXoClqiKOSskIQt0qq3AHrxAfi3TvvA9L/F4nD/q4KeBj9rMfrxCDjL9eW/mmDmSOhtO
         aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=yJmW/rmXm26duaDyfOHOFYteagLDpotWOjrp7D9YhkU=;
        b=G7GX/ayahopWRq6zxFpKQDLjozMnrxX6CvwI5K6Cq8z9krII5+wS/vnBT8bKMir0re
         M3qta3/ezbJu0TXZw+a7dg5oL5QJxv9jXJ2g7SMKhb+0Q13w6s1v/dUfIffyXL2hpfDi
         Gw6Yia3+aYbIR5a9tISPCR/PsWJ7Mr4Mrc2VlctFyyv7CQSMYsYtOpwY3aK7X+WJ4zfN
         Lz8eZD/wG1W98S1kRXOMKWkWU/AkiAW2OyZtAEpUqQjCQwBwokaUSgiXgstUaKgdcxJI
         31IP3zrPRemNvzh8GxbNvtF3NuvIUK1xwPlyFdlhIHnCREdDLXDsXQwGk+G5If6vdtrp
         kYAA==
X-Gm-Message-State: APjAAAUF3jZ7cDaHTNKpGh4E+KUF2EWqOi+nmtmm317flmE9tkwnnh/y
        zxocvrNaUsoFkG4C2aazqo0cPg==
X-Google-Smtp-Source: APXvYqxI49Qp/6OHcYXVbuLyz5IE0hCMoyGFSumazKMZCgeoR23NYt8ytaEwx3DYBTG7pFS8jSIMCg==
X-Received: by 2002:a63:f854:: with SMTP id v20mr8674374pgj.92.1571388751747;
        Fri, 18 Oct 2019 01:52:31 -0700 (PDT)
Received: from localhost ([49.248.178.134])
        by smtp.gmail.com with ESMTPSA id d11sm5278150pfo.104.2019.10.18.01.52.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 01:52:31 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org
Subject: [PATCH v4 5/6] clk: qcom: Initialise clock drivers earlier
Date:   Fri, 18 Oct 2019 14:22:02 +0530
Message-Id: <a59321a1016de3f08098739b6db5d5190ac1c85c.1571387352.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571387352.git.amit.kucheria@linaro.org>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571387352.git.amit.kucheria@linaro.org>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
can have earlier access to cpufreq during booting.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-rpmh.c   | 2 +-
 drivers/clk/qcom/gcc-qcs404.c | 2 +-
 drivers/clk/qcom/gcc-sdm845.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 96a36f6ff667d..20d4258f125b9 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -487,7 +487,7 @@ static int __init clk_rpmh_init(void)
 {
 	return platform_driver_register(&clk_rpmh_driver);
 }
-subsys_initcall(clk_rpmh_init);
+core_initcall(clk_rpmh_init);
 
 static void __exit clk_rpmh_exit(void)
 {
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index bd32212f37e64..9b0c4ce2ef4ec 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2855,7 +2855,7 @@ static int __init gcc_qcs404_init(void)
 {
 	return platform_driver_register(&gcc_qcs404_driver);
 }
-subsys_initcall(gcc_qcs404_init);
+core_initcall(gcc_qcs404_init);
 
 static void __exit gcc_qcs404_exit(void)
 {
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 95be125c3bddf..49dcff1af2db1 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3628,7 +3628,7 @@ static int __init gcc_sdm845_init(void)
 {
 	return platform_driver_register(&gcc_sdm845_driver);
 }
-subsys_initcall(gcc_sdm845_init);
+core_initcall(gcc_sdm845_init);
 
 static void __exit gcc_sdm845_exit(void)
 {
-- 
2.17.1

