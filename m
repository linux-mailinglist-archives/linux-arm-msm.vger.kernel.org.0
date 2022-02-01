Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE954A62F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 18:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiBARtf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 12:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241735AbiBARrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 12:47:49 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213DEC06173B
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 09:47:49 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u15so33549497wrt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R75JAp3M1abKRfmniOJ5Fuzudqh5/VKktmnzYEpT+SA=;
        b=oc9p+IVnBHLB7LZf1r+Ni3OD5gI1bzBxGsS5LT4cHBQaWFBb8jmm09tcie0gM8UUXm
         ibm81fKzJqBSY+FMLvG73EWI84K2BM1YX13xch+ZfGy/lkyDQmUlKPdd5ATMe4tP2qAY
         q2LLC47PesQHEdn+4fhjytGJiJ8lZaxKwWYKNVKC7mTuna62YxR4MvheG0z2k8wcTm5P
         y4irdy/vhh7Ze/iNid4lRN7TC6PRVv/3sRnZvxcMK59xmIrHUgLW9gCH7CvxL5r6bJsZ
         846qFCxExqndxRykCeG3S3C3H6tO3V8aBmYYve9TYbeFxWYiQ4I32VVGSXqXVIdVuoOC
         Tc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R75JAp3M1abKRfmniOJ5Fuzudqh5/VKktmnzYEpT+SA=;
        b=cvKrILt8pQW6b+bXo4yyl1IsITG64KFWCkjOhMzmc0xYIbMs6b2e4Pj3TVh1yjfN7M
         k6TPCxXsVxwdfjL1azmfYewQYfzwmXr3TF4tnydpQVoeUgkqkc0JJW+g8lSOZfLmST43
         PaWf6DaIBQ/gmwvI0v/YiImKF1x2buZ64s4TBnMga1I/LKOah3SPyjrDd39NA0/fByQe
         +uhFA6loc9tDUbNn28OHthBO3rNITTeKTbvCIQloh1ZVI6X+SPVbBVIS+ukX9Dc5KCPA
         fxBF1tGCsAZgc2BBTGKdjfzlWc5mWyPPF5zMNDj62kpNarL/kYOnlJBQTDHNuqrQyO2W
         i22A==
X-Gm-Message-State: AOAM530sLnGvRnIMx5Z6NWp6RwVnDkGQ6i9+Ouh70Sy30nMFcJ+jUSwG
        YBNAiJS8NkOF4q3b2NXvTfCqvQ==
X-Google-Smtp-Source: ABdhPJz+0uF1t9U/iG6eoJW1NBuaJp+mrqnVdnHAzVxmlbZS8+iIV8r1hEW+Y3SrEIxDg2ACIbSF1Q==
X-Received: by 2002:adf:f141:: with SMTP id y1mr22073899wro.104.1643737667624;
        Tue, 01 Feb 2022 09:47:47 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id r2sm3392332wmq.24.2022.02.01.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 09:47:47 -0800 (PST)
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/msm/dsi: Remove spurious IRQF_ONESHOT flag
Date:   Tue,  1 Feb 2022 17:47:32 +0000
Message-Id: <20220201174734.196718-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201174734.196718-1-daniel.thompson@linaro.org>
References: <20220201174734.196718-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
which need to keep the irq line disabled until the threaded handler has
been run.". When applied to an interrupt that doesn't request a threaded
irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
which it to disable the forced threading of irqs (and for "normal" kernels
it is a nop). In this case I can find no evidence that suppressing forced
threading is intentional. Had it been intentional then a driver must adopt
the raw_spinlock API in order to avoid deadlocks on PREEMPT_RT kernels
(and avoid calling any kernel API that uses regular spinlocks).

Fix this by removing the spurious additional flag.

This change is required for my Snapdragon 7cx Gen2 tablet to boot-to-GUI
with PREEMPT_RT enabled.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6b3ced4aaaf5d..3a3f53f0c8ae1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1877,7 +1877,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
-			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-- 
2.34.1

