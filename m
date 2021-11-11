Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEC444D973
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 16:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbhKKPvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 10:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbhKKPvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 10:51:13 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C542C061205
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 07:48:22 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id z8so12722925ljz.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 07:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vm/CQHumQ1uukLhv2xWgernc5RdPc12W87OkHQ+477Y=;
        b=XxYpt9ltP6c2AopfLgF2vjY1/uR0wJbA6FIaTCU0bHqBNAUESxTcjoMHGcQE44/F49
         g2/Eqp44C67yN0k1oYUAK0ezbq551E5kWKCklGqv/4Pr5akDOhsXFLcefNkUj1onGca6
         FFU6u5YoOgl6A9b8ZEuvakwMyXpvUIjzsA0LSJp9JqzP6HIrh8Nlnl3zySVIsTSuIoge
         y7bPGKFpsGgazAvZzhx4vt8Yym6jNbd8P1tnNGCpCjbCU5GpzrlER9PSeDG0K3TqMjpB
         cQBCatYgMqx6xvxvZSLmJAIBBF/qri4+U6FAKWejbwGDFOceBM5oW4wqnLlHIawVK3L+
         emsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vm/CQHumQ1uukLhv2xWgernc5RdPc12W87OkHQ+477Y=;
        b=xBdnRu1w7dPVcFLstB+3eYAuL2rJMtx6so+vLqy3pGEuvpGXGwaj3gA4HOKk74RTgm
         /pN33Lj++VN0Kyx7ABYmMSv05AWOdYvAO/PvDKt0gL+mS7dnPOCptbCz8rE6umk/pb9x
         /8cHDfjatEBa0xjEjxsNxprtMAE0/p+zGq5Ke102fOzyoQsg7y+/D+vGSZv/hrcJg5l8
         idvIfCQF+h4BWJTB4aERGQHkwKSOwnOXUxVISk3G3ZKRxAIY/3Uooyb0xtNfUpL2tsT7
         Qd4ZJ4x+e89pAuyX3TORNR6VZphwZhrZgbuJwXVWtIZNCooaS2G3gb200u8Gmo/Kyvqm
         7P4Q==
X-Gm-Message-State: AOAM533imvp19kXMmJIlvX7SWI0S7jB32psveudans5r30nwuWyJov+h
        ZWbJerOcpt3npWPOlxCp12bkMQ==
X-Google-Smtp-Source: ABdhPJwsvEUTrt78lmjoUsS8uiF0aU5osIvGnEd7eZ3BWeyJKnI1IJJEq2bqsGLYoTTheTHAjmVI5w==
X-Received: by 2002:a2e:869a:: with SMTP id l26mr8408179lji.453.1636645700806;
        Thu, 11 Nov 2021 07:48:20 -0800 (PST)
Received: from localhost.localdomain (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id t9sm317072lfe.88.2021.11.11.07.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 07:48:20 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 2/3] cpufreq: qcom-hw: Fix probable nested interrupt handling
Date:   Thu, 11 Nov 2021 17:48:07 +0200
Message-Id: <20211111154808.2024808-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Re-enabling an interrupt from its own interrupt handler may cause
an interrupt storm, if there is a pending interrupt and because its
handling is disabled due to already done entrance into the handler
above in the stack.

Also, apparently it is improper to lock a mutex in an interrupt contex.

Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 3b5835336658..5d55217caa8b 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -343,9 +343,9 @@ static irqreturn_t qcom_lmh_dcvs_handle_irq(int irq, void *data)
 
 	/* Disable interrupt and enable polling */
 	disable_irq_nosync(c_data->throttle_irq);
-	qcom_lmh_dcvs_notify(c_data);
+	schedule_delayed_work(&c_data->throttle_work, 0);
 
-	return 0;
+	return IRQ_HANDLED;
 }
 
 static const struct qcom_cpufreq_soc_data qcom_soc_data = {
-- 
2.32.0

