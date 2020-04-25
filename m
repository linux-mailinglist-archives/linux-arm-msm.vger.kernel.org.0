Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743A41B884A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 19:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgDYRxR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 13:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726391AbgDYRxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 13:53:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA99C09B051
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:16 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id p25so6440845pfn.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T6BvBkudSN6hkasbyZGWSa3w45a+c98m9U+hOofx/k8=;
        b=NEKoiDnc0Wi50X0JTm+A+6re24GlOXXy5EwslehbGg0ESmM/naqdfJB/7zVnENvn69
         Z/cM5xkv/B7Fdrh+1Zx7IxuMskOWEsYDAjLG4TZUzDLEH6WR4WNKDjGutqvyCm0q4slz
         kmAsG9fOvfK1r8wsPo0HvsFFdIiB6lymJBFeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6BvBkudSN6hkasbyZGWSa3w45a+c98m9U+hOofx/k8=;
        b=GAUPljGAhUC9l24j3lBYFrzp7HxCZx2CROTvfyk1IXhkLmX1FD0qukbHa5NOJ7sjfN
         xDQEwWvj5Fb1pc29dE0BkmPNa7tx7Qay6QvsML/xrmhSo/efOXYAJbQOJmw6zD61CXwu
         Pw64Als1gvPxfiVFCxg2R+/c32jsOLHoTcamCJI3ddFAuKoMOexBEXtdk9O2lCd4Qpxj
         vkHBMoHB1TU0D2fPU00UJVojmSleSe/LOn3B0ILfstOhgUum0et9OpszyUNwy1Sg0tXb
         C9a9qM+/sDUF4WlLb3DAtLsXq8KjQGHvlG6ayqE5q4n4DkOFpN/c+rjrT2g/ZUVKOmoE
         fjqw==
X-Gm-Message-State: AGi0PuYa/Pq9BP8HmqgZwG11e9bpt9fDn1Xok93fY5Z1SkQSTz3dOlWG
        Hi/XC6IrfsXiSDUzr8TscV3xtA==
X-Google-Smtp-Source: APiQypJaAykefOasRlVrm2hc/uuRjttMHBxajhPlVnDwiTfDYgBwedKFua0ICaPmzcIH4jLmretzWA==
X-Received: by 2002:aa7:8a9a:: with SMTP id a26mr14699121pfc.77.1587837196403;
        Sat, 25 Apr 2020 10:53:16 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v127sm8342148pfv.77.2020.04.25.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:53:15 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/3] soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
Date:   Sat, 25 Apr 2020 10:53:11 -0700
Message-Id: <20200425175312.124892-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200425175312.124892-1-swboyd@chromium.org>
References: <20200425175312.124892-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

readl() returns a u32, and BITS_PER_LONG is different on 32-bit vs.
64-bit architectures. Let's loop over the possible bits set in that type
instead of looping over more bits than we ever may need to.

Cc: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 3f4951840365..28121a32a434 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -371,7 +371,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
 	irq_status = readl_relaxed(drv->tcs_base + RSC_DRV_IRQ_STATUS);
 
-	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
+	for_each_set_bit(i, &irq_status, BITS_PER_TYPE(u32)) {
 		req = get_req_from_tcs(drv, i);
 		if (!req) {
 			WARN_ON(1);
-- 
Sent by a computer, using git, on the internet

