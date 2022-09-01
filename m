Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24C25A92E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbiIAJPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbiIAJPc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:15:32 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D2BA61FA
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:15:31 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z6so23492110lfu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jNM+5myziriC40IcLi6KZeIacAr+ajJ9scGcT8bKpzo=;
        b=TPU5kkYcJ/bgeVpCEiOlPxfeLqUaaCPDobVW8KvP0t4ccjSpwx+gYAwldV7QaklzxM
         YUPO6qjo6OEi/7l1GhfjVE7Cr1igB6CdWJgTTi9HpjS4QT84noyhAXEd9QLaJl5h4M1/
         GoAueKnl0gIsq6AjZPXF1rO/kQX6sRaTq4B6jeCkc4fuIVWEcEu1NF6Vg/kn2PQ9V3Dn
         hyPSkDhVH3aLmX1e1Hk0ApD8P3TFuIT/lJwxfF16QivYZfYsrD9sXF8WjNQb8fxmuDOy
         yOYvEnlvZEWp+LVI7Cw+6XmzXhhB2Rphl6NsmERJvi7sgabkLedAVqAa8hbJjEIlur9w
         oQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jNM+5myziriC40IcLi6KZeIacAr+ajJ9scGcT8bKpzo=;
        b=Zj6be8I9VRQ5gj7wnJpqiNiZp6EXEqQzj6k/Dt/zau9yMptj54x7MTill8G1Sh7MOG
         hqrhx5MzMmfwBLy6Kkdyauti51ykGRXXowKLN9Iq/6taZJfH3S/4ONHdZqKG365nPzJp
         rrPDVGh1Lfv164TMPhIdl3WsTPW+XP1/1RueEp4XJYJEN7FnunqMa6kPGiSZojcOtdC8
         4CxcpdWg6/iS8g0gVqvXXxjwDlbhK2fYJnI9+tP4D6us9lnXxj08QdgFUhNQC8gyVSn9
         HKOCj+8KIUwTl7vpkGgcBkIwqc2zCGH61MiGu9sLqMr4iyRc7iawHT+yRDtSbDCXpKXO
         gTvA==
X-Gm-Message-State: ACgBeo3qpO7mdgOfSAoPM9dw/iLL4hZS7WHOi+QcMcjUToSgvIMxvGwD
        4w9EPb0zxpVqAiNIa4zqGh/k9w==
X-Google-Smtp-Source: AA6agR5LX8WMcaeVD4ENclbBhkqZGs2/l0DYGO4bc0F6WTraZHk3TbrLnXaw4WnOMwev2kp1gk7JMQ==
X-Received: by 2002:a05:6512:2350:b0:494:9925:f734 with SMTP id p16-20020a056512235000b004949925f734mr965847lfu.97.1662023729618;
        Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 1/3] drm/msm/dp: fold disable_irq into devm_request_irq
Date:   Thu,  1 Sep 2022 12:15:25 +0300
Message-Id: <20220901091527.1992208-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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

Calling disable_irq() right after devm_request_irq() is a bad practice.
it leaves a small window when the driver doesn't expect the IRQ, but the
hardware still can trigger it. Use the IRQF_NO_AUTOEN flag to prevent
the request_irq from enabling the IRQ line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aeff3f0d..3173e6962a78 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1251,13 +1251,12 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	rc = devm_request_irq(&dp->pdev->dev, dp->irq,
 			dp_display_irq_handler,
-			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
+			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN, "dp_display_isr", dp);
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
 				dp->irq, rc);
 		return rc;
 	}
-	disable_irq(dp->irq);
 
 	return 0;
 }
-- 
2.35.1

