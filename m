Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF96DEBE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 14:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbfJUMPt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 08:15:49 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37545 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbfJUMPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 08:15:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id y5so8327089pfo.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=FyfRV5Js9+leUaktEVHjzJNcbnyCVZmNmn0rQoEZsq8=;
        b=sS7o7iqs+RScyt6BaNZLIHcYIvEhJBzm7BJzVTX38JcWinbzToZ3aJ5g9oqzVF6+LA
         pQKXXkGuulQiZqNUINoLALWG17assWoUELh6fWzIh/rgY8oufCDbqAqSPPFYuaMrRoCJ
         zMf8Rf2YFIkiY3PAL4K1+UaQ1lOxuO39kCeF6/eV9yyNt1zvc+ElEWiQT9jhtWtWm8+f
         ittQeVB8GHx5bZtd372Di6jzjY/sBJQB5v1gBtU8T0phCcDpGFasEJ7mtIjf33oQV84m
         ijB5jkjTmzw4ey3nhVsYg200l/pNeOnk9DIUPSf2yrkqE4Nn1EXptze6w7LvBo1+xQPc
         frow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=FyfRV5Js9+leUaktEVHjzJNcbnyCVZmNmn0rQoEZsq8=;
        b=IoP5/i/T3rD4Z1NTQym7y7UUgnS09O2KYXHkRFUpecNSHzSz8kKdCS7xhBqcrlHk+j
         Logbc6/TTlCH4GepQtJV890ReybRdyqdCVj+aBSJjoT+V4dO/RhZ3nKj9kbqO0w46INZ
         Y7cy7tzRvlvpnelU85vR1k+N8QelNwLJWOzqP9NH2BoLmfufspLuNf50tNrCz4riYH4p
         QfX1rJfeDqxIhV1EgMdXHAVzmEslugyxmLLZZxX/RsKGhw+EEPtIg+nqgUGyC2twAy1F
         RBDdRQ3p4kXIjNXlDhro0uDZyCMsxQh9WVf5KxSQrjj8paWt0woThboj4fuYE7PKZ5V0
         Pwhg==
X-Gm-Message-State: APjAAAXx1e4tU4XN3l8MWPcmSrRp34c8c99QTL+LezVAuBXwcsDbHv3/
        5aRXUfJBSeQgNSl/1JxrRs+Z/g==
X-Google-Smtp-Source: APXvYqw5PBkD1utYutUy6zvkffZmPfQ/KetF+YXD6Io7HIuCYrta9vEtYPa8mkg2wYcbkc+A22Qy0A==
X-Received: by 2002:a65:68c3:: with SMTP id k3mr5280332pgt.247.1571660139404;
        Mon, 21 Oct 2019 05:15:39 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id 127sm15132523pfy.56.2019.10.21.05.15.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 05:15:38 -0700 (PDT)
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
Subject: [PATCH v5 5/6] clk: qcom: Initialize clock drivers earlier
Date:   Mon, 21 Oct 2019 17:45:14 +0530
Message-Id: <75ae9c3a1c0e69b95818c6ffe7181fdeaaf2d70e.1571656015.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571656014.git.amit.kucheria@linaro.org>
References: <cover.1571656014.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571656014.git.amit.kucheria@linaro.org>
References: <cover.1571656014.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize the clock drivers on sdm845 and qcs404 in core_initcall so we
can have earlier access to cpufreq during booting.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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

