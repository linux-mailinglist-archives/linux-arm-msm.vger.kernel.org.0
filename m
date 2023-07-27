Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9679765646
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 16:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbjG0Oq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 10:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234031AbjG0OqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 10:46:05 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8864830FA
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:45:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so1854838e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690469147; x=1691073947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OS0/Lxd5lKrwuqIAbL/+8ULTmmH/V10tfKT3ZkQl4g=;
        b=ZZAp/HMdMyKbswenyzIOHOBslyFVPLkIYYGacEce4rmkUV6ai4D5X/9zWhvXzdS/Lf
         LJ9RjOVWZZgRFJ7anpqA8S4V4Oh9H4ZG6vUI02i7cNVpEV/helKGOf138k90tEpdyRHV
         +aeAGIWhTI+9wvxWowjmEw0KeF+JphX7OqhzoreNMuYQVAKqlod9JrVvSSux/Lcd1bdr
         isaTIqypnpRuY8KshiYbqaRMTfzVhDg7EQSTKkMlWH2VzN9j5p0Y9gaShLdvBqSRGzO4
         ypCvrRSiIpzMeo2sN5tvy7Mq0EXkhxfMv/jHz/uKzq+C43GAzwZ60cmwEYL6Usc46xf3
         Qs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469147; x=1691073947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OS0/Lxd5lKrwuqIAbL/+8ULTmmH/V10tfKT3ZkQl4g=;
        b=Lr/suHNv8aJaBE0DDpTr78J+MU+wjLoThgXy+UsWJn1dtzfDXubGpvTmG9YapU/Fya
         jF/f+jXeOyUqFHDLrmfYKBfjBJpcdh/8Kxi/EJDQjp7PO/d2Kb+YlwZRavVtio5Yt47V
         KLhzODJcHDrgR9vIVdMy/uQ76bLkCc3CIIhbW7iG6j96NTP00n8Csv3JAQhtBl2/Rnd+
         fBKSEYN+mXy9dEr0+F+9mGJ1++Ep/WeGbHjfEvN70AVSSh6CgH7rlNgK+ozmeYrW9QUP
         zEs3lNknBBGntBcaxviitpxA5YNvsWa6E+ogOe/JwBCMISEfaG/K7B0G9nwycRBkseyN
         tQcg==
X-Gm-Message-State: ABy/qLbUMiyf2DTk8JaCBaCDoPPYgicXSVq9W94qBpy3itUzhTP0YFlx
        7KEQ6w73lxJYWM7mSe1uLiW9kw==
X-Google-Smtp-Source: APBJJlGXBETZDllFMYnUFy6biPyn2Ehox7GbdpmmogvvyQO192JjCIOey9LxSi+XWGrcgzZiasrNww==
X-Received: by 2002:a05:6512:6c7:b0:4f4:b783:8556 with SMTP id u7-20020a05651206c700b004f4b7838556mr2015913lff.66.1690469147649;
        Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 3/5] drm/msm/dpu: autodetect supported interrupts
Date:   Thu, 27 Jul 2023 17:45:41 +0300
Message-Id: <20230727144543.1483630-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this with looping over the enabled INTF blocks
to setup the irq mask.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c    | 16 +++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h    |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 0cecdc847b49..e3c50439f80a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
+	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
@@ -480,7 +481,20 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 	intr->total_irqs = nirq;
 
-	intr->irq_mask = m->mdss_irqs;
+	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
+			 BIT(MDP_SSPP_TOP0_INTR2) |
+			 BIT(MDP_SSPP_TOP0_HIST_INTR);
+	for (i = 0; i < m->intf_count; i++) {
+		const struct dpu_intf_cfg *intf = &m->intf[i];
+
+		if (intf->type == INTF_NONE)
+			continue;
+
+		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
+
+		if (intf->intr_tear_rd_ptr != -1)
+			intr->irq_mask |= BIT(DPU_IRQ_REG(intf->intr_tear_rd_ptr));
+	}
 
 	spin_lock_init(&intr->irq_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f329d6d7f646..6e0d0188edc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -17,6 +17,7 @@ enum dpu_hw_intr_reg {
 	MDP_SSPP_TOP0_INTR,
 	MDP_SSPP_TOP0_INTR2,
 	MDP_SSPP_TOP0_HIST_INTR,
+	/* All MDP_INTFn_INTR should come sequentially */
 	MDP_INTF0_INTR,
 	MDP_INTF1_INTR,
 	MDP_INTF2_INTR,
@@ -33,6 +34,8 @@ enum dpu_hw_intr_reg {
 	MDP_INTR_MAX,
 };
 
+#define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
+
 /* compatibility */
 #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
 #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-- 
2.39.2

