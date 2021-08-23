Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901AD3F53CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 01:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhHWXwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 19:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbhHWXwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 19:52:06 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0363C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so1086807pjx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ofv+j2S2FbiKvsZuOL3LOydJGqLAS0ftgkBRlwGwLQA=;
        b=DRUPWBF+7oiDZ6doVRUz5uLuTc8hII8QmvugZNqz/WWkU12lBZlIkv/4xxEEvDL3Ay
         DUSEcibMrh8t3srnfcL7KddUkz7JG0mo96E71E3w6bv4uKcZSR3n7XRbrm9b4UbgCooF
         UA8Iw81QZ/AiQg5PvmgYLI2vvVHgp8Fe3/Zbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ofv+j2S2FbiKvsZuOL3LOydJGqLAS0ftgkBRlwGwLQA=;
        b=gJBQ2dGlJB75a4fIWryFpqg6rZZ2dvDKl3Q3sqLIOJC1wcJK3jXVMV4bsph/yWS+pz
         UEpkUtM6De3YTS7lAYKTGo3hl5UmOZ7j6tiRL8H8yoKlVKtR938WTCgahNP1o2lCH6fn
         Q18wrJDtol/epVGJ698UkOGH3HqLk8Zpp2CYv5ErdSRJdtQGULZzEYntxhFSklOTtRXB
         7wMOW6J8cBjaweSI81OnCvOd/5Uk0/bdVLRV4fyt++Qsp2nM2SPiroM9CHqUFQs7Ar4Q
         T+J7uKy8hEu6hcgT0LLtHBkB3ZCGXgakST6V6E0oFshVlefPOkNn04BFrnnOtxWsnCSI
         ln0A==
X-Gm-Message-State: AOAM530M3oNVsJZmTJPpj3saUGIkRQb+2Mp3JvcmUoh+abrVP4Ndyxfi
        klvKilznay56YbxxKl2YKb7epw==
X-Google-Smtp-Source: ABdhPJzkpDY3t+VBB6BNghMoJ+ykky8fF3OI69J+keDxdweBYcplBMJj87ECZHqX3Cj7LOzRjdmjtQ==
X-Received: by 2002:a17:90a:458c:: with SMTP id v12mr1178683pjg.50.1629762683388;
        Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d459:dfd5:c7a0:283c])
        by smtp.gmail.com with ESMTPSA id t14sm20074660pga.62.2021.08.23.16.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: Loosen dependency on RPMSG_QCOM_SMD
Date:   Mon, 23 Aug 2021 16:51:20 -0700
Message-Id: <20210823235120.1203512-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210823235120.1203512-1-swboyd@chromium.org>
References: <20210823235120.1203512-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There doesn't seem to be any actual build time dependency on the
RPMSG_QCOM_SMD, besides that these drivers should be a module if the smd
rpmsg code is a module. Drop the compile test dependency so that these
drivers can be used without RPMSG_QCOM_SMD being enabled. This is useful
for the qcom SoCs that are using RPMSG_QCOM_GLINK_SMEM instead of
RPMSG_QCOM_SMD and thus don't want to enable the SMD driver when it is
never used.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/remoteproc/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9a6eedc3994a..f30d00a3aabe 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -154,7 +154,7 @@ config QCOM_Q6V5_ADSP
 	tristate "Qualcomm Technology Inc ADSP Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -173,7 +173,7 @@ config QCOM_Q6V5_MSS
 	tristate "Qualcomm Hexagon V5 self-authenticating modem subsystem support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -192,7 +192,7 @@ config QCOM_Q6V5_PAS
 	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -213,7 +213,7 @@ config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -246,7 +246,7 @@ config QCOM_SYSMON
 config QCOM_WCNSS_PIL
 	tristate "Qualcomm WCNSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SMEM
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
-- 
https://chromeos.dev

