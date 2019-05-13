Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E298D1BDEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 21:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfEMTaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 15:30:05 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41594 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbfEMTaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 15:30:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id d8so9926302lfb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FS9Zs+3LWO+O30HH4l9Kk8Vdize9BSzeQBpadzl2HYA=;
        b=t15nWHPmFlGF4Hk/qXkWtGd6P4khoapB58QJFxrQ0ZNQUXmlHvGcZXvn8hgr3rc7X+
         eE/ASRA8k1AQG0DdZLyF3FiUVQKz9AjKmneEG4iuBy5DWguCj44rHUGww8VoLC14kkpV
         TAmsE70nTuh+vkyVTcFflq1Ihtv15Gjs6lN28RnAdyk6YEKe1sk82sQKEFoOgzZS1j0g
         ppmAaYnj4FwI7sFWE7rhWAusai9maT6zhjqYzXhVMTt9rwMyhTPogRZF82iPBQdLTLL8
         e41snlmZNXFO0Bqj9yPBVHA/mzxQ87IGeFK04GazkTYlofyN2rCzQMCISOTnU4Ay1zIY
         C4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FS9Zs+3LWO+O30HH4l9Kk8Vdize9BSzeQBpadzl2HYA=;
        b=nT0tPxYOeQVAAZUT80fHyeB2strJeh5v6e3aNHYrtAWuTMCjwyWppuvsoqTqsMQ2XT
         FGQg3Djz8bi9vJu7mc5/8vi2oh+3V38271++c6hGF59HEXy039KU1oM6gjak/fv3Vmcs
         kuX5uHZn3kbyi5g+UDDjXtBsEmpmanILzO5/ECRPfiZ/otvc/1rw1MNM84J9/4xvjgmp
         z0+ZiX9VU9pCi5T0TGd9hPs/LlnzNVBa4l0NFx22T8ycsYGnhaYzMh9wbtebg9PxBd3d
         JUKu8pptDIYGqvC7RRGrfK0SgNLNdYztfzeMmfUYq2k+OiYedcroIr86/PzYjbmt+2tA
         Ct/g==
X-Gm-Message-State: APjAAAUMALHkxMV6u49hVbspcKJe76/CdEjdntIdurVywwXCWLRMX4j7
        D0SZYTqWMCfLmEqR7k5Swqaymg==
X-Google-Smtp-Source: APXvYqwf7I+vqyV1oY+DdOoP8eb7s+6VlIHVgf1KVMJaduN8GSRO4HLl7ruL91VI1qfgG8O6PtC3NA==
X-Received: by 2002:a19:ae14:: with SMTP id f20mr14035921lfc.49.1557775415444;
        Mon, 13 May 2019 12:23:35 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q21sm3449365lfa.84.2019.05.13.12.23.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 12:23:34 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souvik Chakravarty <souvik.chakravarty@arm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Lina Iyer <lina.iyer@linaro.org>
Subject: [PATCH 16/18] arm64: kernel: Respect the hierarchical CPU topology in DT for PSCI
Date:   Mon, 13 May 2019 21:22:58 +0200
Message-Id: <20190513192300.653-17-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513192300.653-1-ulf.hansson@linaro.org>
References: <20190513192300.653-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To let the PSCI driver parse for the hierarchical CPU topology in DT and
thus potentially initiate the corresponding PM domain data structures,
let's call psci_dt_topology_init() from the existing topology_init()
subsys_initcall.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Co-developed-by: Lina Iyer <lina.iyer@linaro.org>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes:
	- None.

---
 arch/arm64/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 413d566405d1..f1559223c55b 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -367,6 +367,9 @@ static int __init topology_init(void)
 {
 	int i;
 
+	if (acpi_disabled)
+		psci_dt_topology_init();
+
 	for_each_online_node(i)
 		register_one_node(i);
 
-- 
2.17.1

