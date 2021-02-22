Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3FB320FAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 04:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBVDPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Feb 2021 22:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhBVDPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Feb 2021 22:15:15 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A592C061786
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 19:14:34 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id d2so8081888pjs.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=10bX1LhmHSABq3rbCwkHCGHgOoQb7s54OEYN7cNndl8=;
        b=oZJqsucUqFBnbwkux6q7xR7iW8JRFoFlP2voZ/7qmTu2mtTE1Ru98lvxoVv7H+bH/L
         QDE4ETm+Dmui4I79hJVV5d0wjpBvNxTx7xoK0JBEGWn9hEyZOyQYtMRewHv/S+ilJ03i
         JfDuOj2oCCFBgCoUCEm4NBxMHot8b5cvMXJdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=10bX1LhmHSABq3rbCwkHCGHgOoQb7s54OEYN7cNndl8=;
        b=dnowSN6aPgMPbUO4ymBaDriZqJt9O0TktYwhuWNE2qLY+kXdVRZ4WW7yq/7BT7BvhN
         1hE86zCOBMrb2BObPWI5ssw1bz9luIjdGE9CfI+Wu4Mbof6aimumjasN2+mOf3gYxl7E
         P+2QzWVEdJaL2z+Z4zk+AOn34KlFnH3kp92tp7fK+4OY8GuSBW41BWrXIgRTmIIhAiz3
         Ryv6OdYUkqBwfLA/NCSniqkiJaXbLftKusQrToP9ati08dy7936HbbUIjy2WwvYOEvb+
         h8u7deNLm1e9C49lvl+jrY0x9AurTuja+m1sR58PuGlIbfYi5xLe6fqh3yYpM2MEYBE5
         ZAqA==
X-Gm-Message-State: AOAM533eXJjBBTJMPAv7OVT9ePo8iE042KZ0OfwsJlAeoG7YPnleP24N
        fzb1hNFd2J4bB2PapAqoz2myOg==
X-Google-Smtp-Source: ABdhPJzoAPCyKrDvByjNGAdAC6zmE40zXki8pi+kP+MAnLlrgwKxW1wkS1B0WbUCZPPvvsTFo5aF/w==
X-Received: by 2002:a17:90b:2382:: with SMTP id mr2mr21322836pjb.190.1613963673547;
        Sun, 21 Feb 2021 19:14:33 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:a878:327b:a10a:e189])
        by smtp.gmail.com with ESMTPSA id e8sm12460450pgb.35.2021.02.21.19.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 19:14:33 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH] firmware: qcom_scm: Mark string array const
Date:   Sun, 21 Feb 2021 19:14:31 -0800
Message-Id: <20210222031431.3831189-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mark the qcom_scm_convention_names[] array const as it isn't changed.

Cc: Elliot Berman <eberman@codeaurora.org>
Fixes: 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and legacy conventions")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7be48c1bec96..8e8e9f7fcea5 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -71,7 +71,7 @@ static struct qcom_scm_wb_entry qcom_scm_wb[] = {
 	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
 };
 
-static const char *qcom_scm_convention_names[] = {
+static const char * const qcom_scm_convention_names[] = {
 	[SMC_CONVENTION_UNKNOWN] = "unknown",
 	[SMC_CONVENTION_ARM_32] = "smc arm 32",
 	[SMC_CONVENTION_ARM_64] = "smc arm 64",

base-commit: f40ddce88593482919761f74910f42f4b84c004b
-- 
https://chromeos.dev

