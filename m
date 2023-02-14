Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4384695668
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 03:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjBNCKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 21:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjBNCKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 21:10:05 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D031ADE5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:03 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id m10so16847781ljp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyPF4fV9UrkLbIUQYS5LuQlyTM5N3jsj/LVS9IPQGPw=;
        b=DI+eNqpXr1eexCl7cJErYSDof4APWXG6OZZhkuafeLv7vzUs+MFFhXM6QhMHaaMKa6
         dVfXbT2WUCU6UH4McFK3F2ZVV1g7knVlOZCwW2WqIf7XmtzhlFJrJ6UkMXxQMvWR72ZL
         3LJXk8dzLfKQ5gCffgohb5vLBLYKxQW7EFIxlH77fp/e8BxCdg18UY21GcdXZ6g4hPI6
         2zRbiVX9OM47qKhxuZAsmIGzsgd+kHp5BXydh3gctzPk9Br9I6xovOvepP1X8/IiA6X2
         /2jwNPRfHMB+/eh5o08X46nrhlUepPYl29K3YKHHzNd5vQ08Xqa8PYSQKFjULnPy98rR
         bdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyPF4fV9UrkLbIUQYS5LuQlyTM5N3jsj/LVS9IPQGPw=;
        b=O3N4akCOXoi1go8KWV/X21A2lwLBhjCjOgbFAB6pOR12MIai1mU+uo2fLQCXVZiOTl
         /f99t/uIhXf4RLXNdgZvDIZb4npUwKOYGs4nywV9cz06QTGInZt7lBNNdvSGWJpNTLmg
         rWxpjWLX77nDqMri1wFajTwHTQvDuo/f7d0dZQXyNwvG51+6ma6xnlME3VK2fpDQjfJq
         crmcx5QM2dF+h75b8YWWfxghiiSKaa6fwYJRZ0Gkx9aSKF8FVe7eucfij+ndbbAnyniM
         eVMeL2sItohUJu8XKj/hiCw1Tr/4HU6z9VR2qaXMW8NFYLBpkDo/VgxP/FmVKU7tWNWY
         lJXQ==
X-Gm-Message-State: AO0yUKVOW4wLrbHXuSMY0mKEl2R7YTwgnPgRBecRUICoX2bpMNDDQUeu
        kKLlXMj4ogTYNkkopwm7Xt8PWA==
X-Google-Smtp-Source: AK7set96hZdPwrH9Kqmpe1j4bCpHeOFennkKvrjYK1gwPSZW0KY5Uga7IGlnFOvzAwYbG8fX6OLxYg==
X-Received: by 2002:a2e:8612:0:b0:293:32a9:226f with SMTP id a18-20020a2e8612000000b0029332a9226fmr231253lji.7.1676340601630;
        Mon, 13 Feb 2023 18:10:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 18:10:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Jami Kettunen <jami.kettunen@protonmail.com>
Subject: [PATCH 3/4] drm/msm/a5xx: fix the emptyness check in the preempt code
Date:   Tue, 14 Feb 2023 05:09:55 +0300
Message-Id: <20230214020956.164473-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Yassine: ring->memptrs->rptr is never updated and stays 0, so
the comparison always evaluates to false and get_next_ring always
returns ring 0 thinking it isn't empty.

Fix this by calling get_rptr() instead of reading rptr directly.

Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 7658e89844b4..7e0affd60993 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -63,7 +63,7 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
 		spin_lock_irqsave(&ring->preempt_lock, flags);
-		empty = (get_wptr(ring) == ring->memptrs->rptr);
+		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
 		spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 		if (!empty)
-- 
2.30.2

