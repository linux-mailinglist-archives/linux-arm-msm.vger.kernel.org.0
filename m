Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D9E2F9965
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731925AbhARFky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:40:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731994AbhARFkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:40:37 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3783C0617A0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:33 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id cq1so8741495pjb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eAWt6YWJV9rVkyRVRYREZ26SkjQtfm+kwE3f0DptsOE=;
        b=pUg1OukP1ltytWVSIwajGaORRogwFVTOtvudGLK3iquawYRQjP57j6JeO5LfYYM0lt
         GsW3razLBDslHRuc0ibhp1WlEaDvBpM6JjSblIT3soHZXD3X1zyGLQSOHZ2zq0DO/5Qy
         Uw6w7VBxSLOCxKXMmz2EzhJvP7GYFpT6vRdRRrzWKQ5/AnJjadWO8O5lculwJTiE6X81
         mUNeB/z7on1oK3zB4eMQtZMKawqriomXGWot5FXMqrjlCMB+yZWrRuoNMt5TjzkogDAS
         l6EuzOVyq6P3hNY6XSX7x3inoxY/M47pYLPTyqJ6gSQZM9n+L1ls7bxojMk6FGuXag1S
         xcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAWt6YWJV9rVkyRVRYREZ26SkjQtfm+kwE3f0DptsOE=;
        b=X6/iYSxesTdPZ1NAMOsO/BsgshKJuUSFyyt2m0Ez1EFlP0vIbc0HOt+6Nq0bkc7MxC
         SU8ljaK+JIrDvwJXeyLKR0xIYRidQEgKckIk7Csb5y6Yiu5ypVclTL1HYH9uZ3T63dYs
         R0lDc1CZcMpl5SF1Vtt0ofoBgVyINQ6y8NHNnpiUGYM5GLu/LP/WpAP5jAL+BTz+kFPv
         litAMGgQqn0Xrfl14ihLcXB4khpoJP+XFtteBYMmaQXNzCXSnmLvb0eFBWrUvxTcc7wg
         Jo11fCiX7NI0h017MiwUsZiJ8lRxyFsKfUrNrDypZ+PqBPrtaRWHNECj651EiuHGzSxL
         0N5g==
X-Gm-Message-State: AOAM533NAsCFP5k508Wr2MRfj1CXIkuntLkkjwv/JWWFIyAH2qnZmlM7
        vL2Egxl4Zv57AkyIUHc8l+7b
X-Google-Smtp-Source: ABdhPJycXDFdUuYAY16+5RBdV9U7iEwFbD63JOTY4mbMaHBzOkF21LFsgvHZv6TctlEUPQt8MOaCAQ==
X-Received: by 2002:a17:90b:1956:: with SMTP id nk22mr1284533pjb.17.1610948373534;
        Sun, 17 Jan 2021 21:39:33 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:33 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/13] ARM: configs: qcom_defconfig: Enable watchdog driver
Date:   Mon, 18 Jan 2021 11:08:50 +0530
Message-Id: <20210118053853.56224-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable watchdog driver for Qualcomm platforms.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 5627b142d5fb..9573c0406954 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -295,3 +295,5 @@ CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
+CONFIG_WATCHDOG=y
+CONFIG_QCOM_WDT=y
-- 
2.25.1

