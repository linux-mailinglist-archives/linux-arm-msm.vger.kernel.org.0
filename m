Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE15F492DF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 19:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348482AbiARSzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 13:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348449AbiARSzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 13:55:41 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE52C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 10:55:40 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id i7-20020a9d68c7000000b0059396529af8so18845018oto.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XziV/n9B8PpP9E8+IXEEf54U2FY8YzKnDMuVpjY6U5A=;
        b=HkPZzoOIRCtl6lrqaCk0aFbTnEru8Ew05oHxXXc/Mzpl+2MWEQ7HjlUppuJ2b3MM2N
         o7MRe9xLnfOqhoLiu87FbzSt6LQsvdx5GeuIwU3LU3kyQdNNQ3uzUZrpIPYjvmCWRkua
         J0aBtoLHaZYn7ut7fwLw8QHJrnipKlOm01dmkgYmq4fFttooXrFNw41Iy2ob9VX5NQf2
         c/BSaC8PsUsjTOmWPQtVYr3N6pdY/D+A1/5mHzHyQGq2V0dVA1Iq0jUNT2JKXmsepe+d
         qwphza+a1aOOU4f+KaZHUJjBhX+MJRiKKvM0vu1kymTfyww+JDdTCc4o2SChJa2taNXV
         s/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XziV/n9B8PpP9E8+IXEEf54U2FY8YzKnDMuVpjY6U5A=;
        b=V0xHXKYMAHKmwxgMYh6rrOD74iBBFbauGe2YlCPMquaupt2RTxMLYgNeR6lb2JgyQh
         iNfsVMKmegWEyKCeCjB2dLDCGSJ2qFbQxjJ1ZNlWbHBwscsK3f4XNglrcUm7zwp4HVvK
         kgQ6XyGE8edoGCzojhGqgG43HwycSz1jrjtWsPLw3Cha7xhXUxSaQBBU/Q9A5j/9sOZg
         6Rw8sYe92FNOWmtdchUKgxDxqx1JfDVjqL8QerWZV6seZbDGWUBlSGNQ5mfaFDvHA4Bi
         1fNcRsfMitdhPxgVC0Tkju22sWPJ0ra14gmRmhEJZk9QP+FH5rzQZnz5FOkw4nPfbHuo
         cmfg==
X-Gm-Message-State: AOAM531FYXkW9mFKCceISxotKR162Rs7pcjzFqrMDHgpzKvcY088UIOv
        4wtwswhXqctW8k/mKV1MmRnLZA==
X-Google-Smtp-Source: ABdhPJxlA7kt5pwruBssnEeyA/MsZssNoJJ/xTh9YGDq/TqY3+IfR7fHEcrxgAzpVSOQTS7M3hXJKw==
X-Received: by 2002:a9d:6d89:: with SMTP id x9mr11329377otp.52.1642532136376;
        Tue, 18 Jan 2022 10:55:36 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id n19sm7258855otq.11.2022.01.18.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:55:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Thara Gopinath <thara.gopinath@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH 2/2] arch_topology: Sanity check cpumask in thermal pressure update
Date:   Tue, 18 Jan 2022 10:56:12 -0800
Message-Id: <20220118185612.2067031-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220118185612.2067031-1-bjorn.andersson@linaro.org>
References: <20220118185612.2067031-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Occasionally during boot the Qualcomm cpufreq driver was able to cause
an invalid memory access in topology_update_thermal_pressure() on the
line:

	if (max_freq <= capped_freq)

It turns out that this was caused by a race, which resulted in the
cpumask passed to the function being empty, in which case
cpumask_first() will return a cpu beyond the number of valid cpus, which
when used to access the per_cpu max_freq would return invalid pointer.

The bug in the Qualcomm cpufreq driver is being fixed, but having a
sanity check of the arguments would have saved quite a bit of time and
it's not unlikely that others will run into the same issue.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/base/arch_topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 976154140f0b..6560a0c3b969 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -177,6 +177,9 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
 	u32 max_freq;
 	int cpu;
 
+	if (WARN_ON(cpumask_empty(cpus)))
+		return;
+
 	cpu = cpumask_first(cpus);
 	max_capacity = arch_scale_cpu_capacity(cpu);
 	max_freq = per_cpu(freq_factor, cpu);
-- 
2.33.1

