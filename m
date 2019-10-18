Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71CF7DC04F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 10:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442247AbfJRIwU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 04:52:20 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45472 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442245AbfJRIwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 04:52:19 -0400
Received: by mail-pl1-f196.google.com with SMTP id u12so2511225pls.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 01:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=OV9GCJs4s7auzZpPSYG5QvReU/tq3thTyE+8LoeVN7Y=;
        b=dmfM6j4ABh73a19Lql/07zj2f/0Iwn3aie8/jiCr1K6Vb5Ytac72LE/hl62BYZwskf
         QBwjojv+SJ1y1JjFxvkRx0+t3VRWbQXLB4bs1jv9Bgr6T1w7haFGcRELPXqQh8cLsO9Q
         o/LW/pGLKqF1eb3h0BDTea7w3frkGKdGJ1fc8F3C3UyetgUMZBobiCcynMF0g6pUJd5+
         uelEYgHFlec1Kc0m2bSBsZ/9BmMTMOFHR35jIjaxBSH3+KO1kKE1rm8v1Y4A9HPOZB5N
         6u8HtAVKYO42M0csV83e7fwx0jGrnSAMPeHvLPR8wH6PomL1eIVbxOHmIwYfaHBw2nhj
         +fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=OV9GCJs4s7auzZpPSYG5QvReU/tq3thTyE+8LoeVN7Y=;
        b=UxY22kn+hGo6hsQy/NitlnbgIn2BCjGDIgnZ2lviJVrK9BCj9GH7woXPmXki4teK0q
         SR9LeW0Q28FxlWOSmJa3tj6eBhs9JNjav1ogyaE2unoArO0cmkr7f09BRXxZjImpU6gC
         aENn0ynzCdKgeB+27Ebr+tI31t09Q4dW21NxvbJri9YHVbbxurhNAAxsD3nMmTzMx9IW
         atnrNzwmrAlRfMsNh2eIRnfZOS481BKbmtzfHjMCs5UZqI1+8jQZH1eSepB1I80G+ti3
         SkBmVMMfYdoZ90wtApsJgqdehOmk4e+3NofXTRbNZVSes5o8oQkAacsCucqc8nYMabeJ
         WgVQ==
X-Gm-Message-State: APjAAAUzMisDwbLmngcpgd1pbRDpO2zoKDwcj+/VFKI+CvRej2TXablf
        vLlSeYIazIP7d676xjo3fKrxAB7SCUiUUQ==
X-Google-Smtp-Source: APXvYqxSXKnzx+2EEFL8oM5GrGOtshkcJz4Aom/KrgOWjvBC/g0YvXv1JagKhBDGg1PhBCmj3qhHyQ==
X-Received: by 2002:a17:902:8505:: with SMTP id bj5mr8309860plb.296.1571388738714;
        Fri, 18 Oct 2019 01:52:18 -0700 (PDT)
Received: from localhost ([49.248.178.134])
        by smtp.gmail.com with ESMTPSA id x5sm5246107pfi.32.2019.10.18.01.52.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 01:52:18 -0700 (PDT)
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
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v4 2/6] thermal: Initialize thermal subsystem earlier
Date:   Fri, 18 Oct 2019 14:21:59 +0530
Message-Id: <511b47ab70f6be4ba0f2d7f69217ee593a0bcfd8.1571387352.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571387352.git.amit.kucheria@linaro.org>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571387352.git.amit.kucheria@linaro.org>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the thermal framework is built-in, in order to facilitate
thermal mitigation as early as possible in the boot cycle, move the
thermal framework initialization to core_initcall.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/thermal/thermal_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index cced0638b686f..69fcd54f8a83e 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1537,4 +1537,4 @@ static int __init thermal_init(void)
 	mutex_destroy(&poweroff_lock);
 	return result;
 }
-fs_initcall(thermal_init);
+core_initcall(thermal_init);
-- 
2.17.1

