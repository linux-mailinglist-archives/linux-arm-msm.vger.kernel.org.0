Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B3A3C8245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 11:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239021AbhGNKCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 06:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239022AbhGNKB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 06:01:59 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8ADC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 02:59:07 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b8-20020a17090a4888b02901725eedd346so1371664pjh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ToADbup+MfTcTpglli3NLkX2Wd5wYfKIe/K2kf6rNBQ=;
        b=Bm0nGwXC1+3vIZuFsqmqFFkDVyv4H+yw/oCyHEFUNrjUwzDfFhEinIq6VEJHhumP8q
         8YBEt3k77xz7rNVpBszjuY1GRRmlGGrhe3exOvxWRAPLCPqSTRFvjYqRAibBQ+3eGaCC
         ZlULeS6pAbg0adnyqaTjgGlKt2hfzwPDTM4EozrdgDTcPF1yUFQqiR7TdvsOTsAaUKjm
         lk9Lvfzpimn4v2LVUPsayU8Gbjhh8dWeFNYleEKdZ2lIrJAQCaYsVXzwObZjmJN6ZzoY
         QMVbl5Hj4/n8344XpSP65M8nMT5OmUBLSyPvNUFCjK/ayPZCFX40Vrv3T1KwMxf/qAoY
         RFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ToADbup+MfTcTpglli3NLkX2Wd5wYfKIe/K2kf6rNBQ=;
        b=ckLMlKVzs7DKt6j5f9t0/1ZJxUxPNDmLVMM2Obzam+04DeadYr5AjOA6LnBHySYp83
         uCb8fXHuUmWZ+znwdtFEDe3SbY56rbkgoszCzRrrE5eCOW1vjagFE317t1eWKifJLVts
         uu5QDDc63zFbOXzh9hc7zEoxKElJ1irdjBWxOIvNHBe1UJCJAncKjdLFj/YLFTgeuMFf
         1WNryGTs+SftBSo5MhxfZMl9bc3GNmIEADfER6W4tRHV6U2Jt7FF2SpxKDdbqp7o5ZIx
         Ne5slafkAZM00b2V6UxorfM1sZTOHHt/3LkUYrXFUN4q3Ce1JQJAqpIlcYukT5X8tYte
         UptA==
X-Gm-Message-State: AOAM531e34UlEzbkp2Jq/erD+a81VJmFBZKTRftcPT9Vb8AG+7sVexJI
        RmgK15FzzkYh4q37VmZoMKnryw==
X-Google-Smtp-Source: ABdhPJyaZ05UA4Nk36Abw5RVyDDb1ciSkKP0wmY3pLKxX2qeHryYINSqgme8/521alXputJLQ+2AEQ==
X-Received: by 2002:a17:902:7042:b029:12b:2b94:30 with SMTP id h2-20020a1709027042b029012b2b940030mr7210927plt.9.1626256747422;
        Wed, 14 Jul 2021 02:59:07 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g1sm2283304pgs.23.2021.07.14.02.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 02:59:07 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/2] reboot: Export symbol 'reboot_mode'
Date:   Wed, 14 Jul 2021 17:58:48 +0800
Message-Id: <20210714095850.27185-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714095850.27185-1-shawn.guo@linaro.org>
References: <20210714095850.27185-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some drivers like Qualcomm pm8941-pwrkey need to access 'reboot_mode'
for triggering reboot between cold and warm mode.  Export the symbol, so
that drivers built as module can still access the symbol.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 kernel/reboot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index a6ad5eb2fa73..31bf2611ee12 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -32,6 +32,7 @@ EXPORT_SYMBOL(cad_pid);
 #define DEFAULT_REBOOT_MODE
 #endif
 enum reboot_mode reboot_mode DEFAULT_REBOOT_MODE;
+EXPORT_SYMBOL_GPL(reboot_mode);
 enum reboot_mode panic_reboot_mode = REBOOT_UNDEFINED;
 
 /*
-- 
2.17.1

