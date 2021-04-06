Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A97355F37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 01:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbhDFXGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 19:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbhDFXGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 19:06:19 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C42EC061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 16:06:09 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z8so18344871ljm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 16:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
        b=TpblUsbtD5po/N9CH/uKdwv0vEB3mnX65H7KPdYRddC7mVJFSjpYcspElVN2O/5zzv
         2NpmbX9x1UTxC/AiZlaBMKn4eS9jCVyuZQ/exmSW+stHaDAlpm6HzEuLtv+YbAGyjeua
         V4S8RLiqJk+mcEOvLgVUqhmmcWK2LLUItP/tmnl5KhP45rkzszvaaqhxln/vB2NErNSF
         whPy8AlWU59tdX6njnk0uAnKlCsN7wG36UGU6SFGzJ3mGEaoee9u6DAarPFvGZCBgvJN
         qqevv4fjV00ioLnCri+pzlI9ZIilUwxBMtOxAcgry/cd3REqfT8EOVLrcqTJqQiyak+f
         oa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
        b=cysQQ7BwYnhwKdJxvzwlsU5gqA5JAi9M/UxCMGn9ccBSAEnUICZi+Ar6DYowe9iHqR
         4RnGq0Z9vTDnePKcC0nq7N5R06pJRtp+WyWQVmeXFp/WEiiCZC0xRqPZcsCBmlFiZwgf
         CFoWdZup3QunH/5bcjl9kQg+vkwmollNEQgPuj2VIi24tsdX+W1mb1aiST1xBVRqnRKP
         mRKvd5l2BXEhRnG65P3gv6BNZvegOEAGxV+ksFm2oA387yEQfWGyecMQsPIkt9IfnYeS
         taBucKlkCFm8M8TBuLMmYHXsMyCEs7XQvV+HL/kkT8vrr4fOLC4T5bG2jo5Z7BRXnIkS
         2y3A==
X-Gm-Message-State: AOAM531WZ3KR7Wb0TqUtoWmLFajj5BtuQrTxxzpB5CXe5FRRZubptqj2
        MWoOLIYmXfC+7RYOWS1vXqXHOw==
X-Google-Smtp-Source: ABdhPJxc5AF4qmysF86wYNJ0vHcgPANetDoaI2kJ39Ne3VwoDSAJxdpOVbZhfFJ5YUI9Ez56qmMVXA==
X-Received: by 2002:a05:651c:ca:: with SMTP id 10mr240945ljr.63.1617750367763;
        Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b25sm2351498ljo.80.2021.04.06.16.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] clk: fixed: fix double free in resource managed fixed-factor clock
Date:   Wed,  7 Apr 2021 02:06:06 +0300
Message-Id: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

devm_clk_hw_register_fixed_factor_release(), the release function for
the devm_clk_hw_register_fixed_factor(), calls
clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
after that the devres functions will also kfree the allocated data,
resulting in double free/memory corruption. Just call
clk_hw_unregister() instead, leaving kfree() to devres code.

Reported-by: Rob Clark <robdclark@chromium.org>
Cc: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Stephen, this fix affects the DSI PHY rework. Do we have a chance of
getting it into 5.12, otherwise there will be a cross-dependency between
msm-next and clk-next.

---
 drivers/clk/clk-fixed-factor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 4f7bf3929d6d..390c16f321a6 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -66,7 +66,12 @@ EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
 static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
 {
-	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor *)res)->hw);
+	/*
+	 * We can not use clk_hw_unregister_fixed_factor, since it will kfree()
+	 * the hw, resulting in double free. Just unregister the hw and let
+	 * devres code kfree() it.
+	 */
+	clk_hw_unregister(&((struct clk_fixed_factor *)res)->hw);
 }
 
 static struct clk_hw *
-- 
2.30.2

