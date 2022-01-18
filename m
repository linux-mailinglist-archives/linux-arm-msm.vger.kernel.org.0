Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41B4492DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 19:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244394AbiARSzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 13:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348467AbiARSzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 13:55:36 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2B0C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 10:55:36 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id bb37so360457oib.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 10:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZFGTElrC3sfK3btUfb11FHGF7x4FjrcJFy3qIIQKiM=;
        b=hCarYOz34jr83WftfM0iS+dwH1sSDGCkfsBkAB57NfnKesxK4aaH5gD3/gh3issx9+
         Daa5eBqKtQcCCoptygVZMnTNfFjMD8xIZoP7jzlGWUGzWWIUiTFJ3vGwzYp8QHUkHvDX
         qpJY+Q0N4siTxyRUiqYaSBFwPjztC9Dwyzg20xTJeFpuiUGSgcpmoF9mm+KrEFyb2VW5
         GQXv425AFDyHeYwfKpRwAaPL9cGijJqd3aCus/IssOUsVcRu3y4VSnTgwf3/Qoy3a4e5
         rNzA1caD7HISrSKPftdbKKczvNQz2zBzNro1xInu9PrWcsjXFXZdGcNMIqx2ZFbW7Sac
         ENvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZFGTElrC3sfK3btUfb11FHGF7x4FjrcJFy3qIIQKiM=;
        b=jFLxU/TmGUdOGt0csrBGOYn/mMi6XAqdjeOWoYYd674FHeB4GXR6Zbsq4tX1XmGGco
         f2AYlUSXAKyHoUETlM6ayGzbvRlX+5g4CKT1OP2SXY+gkpxMSImKaDznN2qYgHYJ4fEN
         9uPkBZ1WHuuxQtJ5NpSIFyxM8cxIZrA7odd54ibM49Kbcn6PIN70vsvwOZloitudSHVg
         7RLyvcF5aDoVvjLZ56OXG7P5X5WGeXnIbtyErKaEgM1XMTTEUCT2Uq8+ILkIUqh/KqHC
         MaC2E0bPS59f/SELUqvW3jTnN6vRIKA3gM/PVVClFBiiPOaZvGPhH+Hx2nAECjcSoeN9
         ViSA==
X-Gm-Message-State: AOAM531HaPegz76OD5wC4trnXDRPIA7a+dnIs2BA5MgU5LTS+Ux5NTLT
        QvcZliIWgSlC/2VZUt+uCLknUg==
X-Google-Smtp-Source: ABdhPJwMGts/PsWLqBrYm3HeRRLwq7WaG7CdrrxQZDPqt3E46l7dlRGt5JffecmAxnLrUslTHJ33uw==
X-Received: by 2002:a05:6808:1508:: with SMTP id u8mr9261476oiw.35.1642532135383;
        Tue, 18 Jan 2022 10:55:35 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id n19sm7258855otq.11.2022.01.18.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:55:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH 1/2] cpufreq: qcom-hw: Use initialized cpumask for thermal pressure update
Date:   Tue, 18 Jan 2022 10:56:11 -0800
Message-Id: <20220118185612.2067031-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the event that the SoC is under thermal pressure while booting it's
possible for the dcvs notification to happen inbetween the cpufreq
framework calling init and it actually updating the policy's
related_cpus cpumask.

Prior to the introduction of the thermal pressure update helper an empty
cpumask would simply result in the thermal pressure of no cpus being
updated, but the new code will attempt to dereference an invalid per_cpu
variable.

Avoid this problem by using the policy's cpus cpumask instead of the
related_cpus mask, as this is initialized before the interrupt is
registered.

Fixes: 0258cb19c77d ("cpufreq: qcom-cpufreq-hw: Use new thermal pressure update function")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 05f3d7876e44..866fba3ac6fc 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -297,7 +297,7 @@ static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
 	throttled_freq = freq_hz / HZ_PER_KHZ;
 
 	/* Update thermal pressure (the boost frequencies are accepted) */
-	arch_update_thermal_pressure(policy->related_cpus, throttled_freq);
+	arch_update_thermal_pressure(policy->cpus, throttled_freq);
 
 	/*
 	 * In the unlikely case policy is unregistered do not enable
-- 
2.33.1

