Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE0D38CF8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 23:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhEUVCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 17:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhEUVCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 17:02:39 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C403C0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:01:16 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso7851765pji.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qcucsln58OsrXcIsnyUyuUI/EGMDXBHA3sqXqZbY5oQ=;
        b=aV1t1CAkEUTf2hFhPL0C02ioDHWC3FjKXeMwGRamT26ZTjEZBzNqGTmZYDvrtA3HhS
         B2WWNw8sfATpuLnGwIlevkc8TkGaLuYHs0MAhP4CUy6CPuW23GqjJcR8w5m00Z9QeBoB
         bOVSeIcNZHPV0LfiH+KC/xKFS9oJiKDdeAbrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qcucsln58OsrXcIsnyUyuUI/EGMDXBHA3sqXqZbY5oQ=;
        b=G/UKZFeOfBUh1RSptA1xgUiJ3DPWQ3cc+9hyhO0HvnY6c1WV1qyj3bxExQqHpMmeO5
         x3ne1IkZEwrchg8SE9evfG1NZecKyT3qNcFrjJ1Onrf02LJySQtoqL2vY8SNQ0+wwHpw
         iDHqdLBPa8x7EKz1jd1p35+AE1CweO/HwWMEpNkQeEzmKVZiHuNa2VUll9kfW01Qlf7i
         Io7PjL2MhpUlRqTDBE6obserXalVS7agkg4Rod+HW21w37/0rezD6RZnfVjSlMdjLfPV
         E7wXFg1/kdGXIkTDHNG+6BLv20Fi+VvT/d25iTWjBKvGjAiJaFGWRM1Y8gjMBev+/Leo
         YW4g==
X-Gm-Message-State: AOAM530ycQMbk8IAhZgIPb+ruA92KJ+RbntTZlNi8LjRg8wIqpfdGNNZ
        mmlRwwRIrxR14ODZXS4h4Fe6RQ==
X-Google-Smtp-Source: ABdhPJzjiR9OmDU991lLjA+2s0PA+vhVMkD1DNqpi/iUqDxkAh+P7lJrs9JUFen9Q5TsbtHn3chUQg==
X-Received: by 2002:a17:902:b412:b029:ef:1737:ed with SMTP id x18-20020a170902b412b02900ef173700edmr14322796plr.43.1621630875766;
        Fri, 21 May 2021 14:01:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:10e9:a6cd:727f:561e])
        by smtp.gmail.com with ESMTPSA id o6sm5202532pfb.126.2021.05.21.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 14:01:15 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Joe Perches <joe@perches.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] nvmem: qfprom: Improve the comment about regulator setting
Date:   Fri, 21 May 2021 14:00:58 -0700
Message-Id: <20210521140031.2.Iaa641db08ce7c571860dcce13e4ce056008b711e@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
References: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In review feedback Joe Perches found the existing comment
confusing. Let's use something based on the wording proposed by Joe.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/nvmem/qfprom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 1ba666bcb900..81fbad5e939d 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -196,9 +196,9 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 	}
 
 	/*
-	 * Hardware requires a min voltage for fuse blowing; this may be
-	 * a rail shared do don't specify a max--regulator constraints
-	 * will handle.
+	 * Hardware requires a minimum voltage for fuse blowing.
+	 * This may be a shared rail so don't specify a maximum.
+	 * Regulator constraints will cap to the actual maximum.
 	 */
 	ret = regulator_set_voltage(priv->vcc, qfprom_blow_uV, INT_MAX);
 	if (ret) {
-- 
2.31.1.818.g46aad6cb9e-goog

