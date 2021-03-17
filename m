Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83F533F34D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhCQOk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbhCQOkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E61C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id s13so2602312lfb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=Jme4PgXEb5C26U3C0VZay05pzwR2f++881i12NWP9OmLS+yrpY+dGp+2SpnP/iYbiq
         WqL0tw3A38pYCKyhK7bRQLU/XXUtlz+gmQ4jxzec2xfTXIpXTPueAKMOjx8+SxqN9RrU
         KKhUJ44KvLwyytMJd9/j6Nq2xns2ECjn+WtQ9uoviLd0TsDRY1vbfMEnniuO8mOQ7XIf
         G5cwe27Rgq/1Z/cjdWdIWIFjUmtDkzUAKZGvD+b72Ggp/YuDhDAYW3qlKNCwFJGnPqNV
         fPWhf5kZRHi/O7pgB/WTfSdNWkh5/3jacaOMxqsqZHrTOVeyXKkqWTuTHxLO9Skf4f1z
         JrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=r4bg+z/nv/4sqwDFV3EgU2wTYWUKsHd48f9uGqyJzdHooX2Sz09aPY6QxsAQz/mU9C
         8BSC1jpiGLFmyge0f1fEpFUIiHIdDNEMZTBfomzV+ABY1JD3b82NssD0HoZCqmMECnCB
         lH06oVfAWX+qS6DJyLbzSMcIljwiKRODSJv1E0vTemAcEUXV13QsUu6Lp6OiwDOfVcd/
         gCKBpIVmh7HHi6jYUUqU2g28uA8mhjBFjbLiugt2MpT9yBuDkrEmZO4q3W6uWUFrX0/e
         O5ECpWLUCB39qlcXRze6Zbk9ffaVda+i98KRLWxlE57IrZRzg7qCRh3DFmv31eB1zTPH
         pXqw==
X-Gm-Message-State: AOAM531PW/2egxgx6ZQaCDyb483bgre1fuAphN+DkaGusi2yqo2VCbdp
        WN5zI3mTJNZkMrPHgYF6PC1ZoQ==
X-Google-Smtp-Source: ABdhPJy+ESHie2qqCcI7ASd44IVF06jPayvgNlXGLpeNNO7XiJ6dZX5kUUMb4jBIDhs8YOxjhW633g==
X-Received: by 2002:a05:6512:328f:: with SMTP id p15mr2543462lfe.628.1615992043074;
        Wed, 17 Mar 2021 07:40:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 02/26] clk: divider: add devm_clk_hw_register_divider
Date:   Wed, 17 Mar 2021 17:40:15 +0300
Message-Id: <20210317144039.556409-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 3eb15e0262f5..162a2e5546a3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
 				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
-- 
2.30.2

