Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF35347C33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbhCXPTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbhCXPTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:14 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CB5C0613E3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:11 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a1so30713765ljp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=v97pfOc4wkHEYLNV13IKhZN4dNBeU79Lu9y2VS+lBjB12QYlkvwkgu5zYE9OCOosLl
         BBGF0NeD6RdbhyA4ZSLoAWj57W6+NeHbE4i9klTOV1u2ZYpSnl3jBmmAOF2jtqH+a6B5
         7XIdCG37smDlqai4oAnutXmDnP5F7+xNN1t4Sqoqg61BMea2j9G+33R/V97EjyytAm4+
         WTllpBHpiT/zceAldkY5KNC2sx6XJyJl8imGEpWR1Z84pSSwo4FJ3yJuGHsIjmd3RK+q
         hzrGdGq9n6RD9MQJKAZrDguHacli8bMQQd2tDY7UX62AbZbhdwV36Cdus3DI7C4D7ZXR
         +AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=WgR2FCeF+gjCSaTKBUbf3MV3sRY79TLHUevuuT2UXslmdHzhyYQzwl3XF/G4HwTNsr
         wunt3+p0bYl0v1XXsVRotnpG1K3/p/DcTttlmsBIzeIOVHMjCKkkLtG8gQ5XVGKzOfsp
         buMHI93Bd30IpFqHchkVdFzxXsU+cmYBAkrowwWWRp46ugHQlhR4k/3Z0XmRLBb1g5Nn
         g6U4T/UXv+bJHDynmaXZQmcmrGwxrgMBcBxOJ622d8cTrTMZ5TO34kHPWhknMREE3ymM
         OJcMzNmNnfeurYiT8rWTDJMoYyk6HGMG+XQ9PFcGhgCvMCFWke7LeOQqbb9ghylPTcSI
         iwJg==
X-Gm-Message-State: AOAM5319x4jVa0yZf5jd5VO/696z3Iu4PzvtaQlqUrO3GkOYiYwYB4nb
        QAAwmM9rBUBlrmD1/BFVDsnZxw==
X-Google-Smtp-Source: ABdhPJy7sQnjixlxXt2dxgPhyoBWzHKFhcfufQc5+XNuAJ+ErdVXS3tnmZXpUAcNqIG+KRIjkGVLgQ==
X-Received: by 2002:a2e:7301:: with SMTP id o1mr2429148ljc.42.1616599150228;
        Wed, 24 Mar 2021 08:19:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 03/28] clk: divider: add devm_clk_hw_register_divider
Date:   Wed, 24 Mar 2021 18:18:21 +0300
Message-Id: <20210324151846.2774204-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
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

