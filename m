Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270D93C2BCE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 01:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhGIXxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 19:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhGIXxS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 19:53:18 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B862C0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 16:50:33 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z9so10639435ljm.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 16:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
        b=pGXH7SAhltogfutLQ/zeZfz62JPmTkJ/1LApDK/tGH5I+dfu/VPri77jJFsBx6qljU
         ohFqHJf6nt6ZnSz59BxmXeKf/nb5F4GqEBVWvMPo5TZXe/VvH8VoIp5pck+9/yZXAsIk
         Kkm2sSChJ/N6c7XQxBd4hoqYSPxCnOFx05VbddU7oSHQmNiWQUMIWBUPKZJG/TyYAYRK
         BOh9UwUXgwSVouoRKTy3HSNj+FEU7TLBI3Ak+qzOuqes8bApRxMADc20X3sRbZh2now8
         mokMI9kuz5B+371uu1CxuDigrcXbgVDUpSOrFYqxtrBj+ojUq9FTklfqZ+2sPzPRMWdb
         QRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
        b=PKzUSHESJ/3C34oVqssILr3Wa8yPfnFeZdJbAotoXb0dUQx5G0MfJr5WUVxII+4pBd
         78kuEyFU8wtVe1l4S6s2YS/jRfSbDhN9O6gbq236OSJq24VjMJyCqR5/p5txnXP+dQ1m
         Zgtj9fVw1Hgf9zBMmvs27JS+JzV/p5LGOCaHXoigA9kbZvVI24b/c4niA8bwHARo2/3A
         RYUKeguVq1wUUg1HUYd43Y/TeaMdPy04kyH06MfUrFXzJ3VJ5D51dAVgJ/wAH9/hM2lI
         4zFhSfxBdPrbXb0j4nSh6rNhXHeBzbKwDm5xgAsRjC4++tMbjT+CSeiY3hd9endSt4eX
         9oJg==
X-Gm-Message-State: AOAM531m47libqts0+aZDc3aCbo2/ul3ZwDMOpyu2z1IkiAbZ5VOXu0w
        puzSSPs99Fl8ns9xfsBJa2mIxw==
X-Google-Smtp-Source: ABdhPJySk4bNYi9lDVMKK3/g4W2wWjseacmtJPphy6Gp3sXceQXGIOfFkILwTY3/QUcvU0Q+24r+yA==
X-Received: by 2002:a2e:2e09:: with SMTP id u9mr5443219lju.322.1625874631652;
        Fri, 09 Jul 2021 16:50:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 16:50:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/msm/kms: drop set_encoder_mode callback
Date:   Sat, 10 Jul 2021 02:50:24 +0300
Message-Id: <20210709235024.1077888-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9484e8b62630 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,9 +117,6 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
-	void (*set_encoder_mode)(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.30.2

