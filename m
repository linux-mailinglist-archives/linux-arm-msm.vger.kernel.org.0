Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA8776CA61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 12:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbjHBKEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 06:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbjHBKEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 06:04:31 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1AA2695
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 03:04:29 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so4903497e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970668; x=1691575468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pz9p9H1gH6Z2qG0n33HfyJPwsmR7261k80eGvXXicJE=;
        b=ix2Tn2myJSxhFqIoer/5iWlas3B0FRrEcSoDHBqKcSgHR+dfxV0eWePnnKTMmG+FOA
         o1VxnhvzPMyVaaVLxIJDKyKqNqS2f8HbLzbKBVkKonU2sEeYGnN9HO1TzYV7NZpQKE1U
         seykqfqVMGXUmBRQ756RYtxAad7QlHjg96GmHh89yJHfQj6YSfpAjzCSVDpw+Mmj9RH+
         krLm+NVtavYO8txFnmXwIQchKh/kc//mW0HORoH+lCKx7yLgpn4ls8QLLozxVgWiYmTh
         IeuzkFY7YbexKOSFsGK++jJtfa0UdiDMjhOO60LPT7IOGxFnPtSf7n4DLJTDJJ320OyK
         t5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970668; x=1691575468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pz9p9H1gH6Z2qG0n33HfyJPwsmR7261k80eGvXXicJE=;
        b=h13OEM5LMI78do77qoDtazkl1kEwFW8kD4vsLgja1UAShPRnB44HbJjZo+VLL9VORs
         hsJfbDb1SCL/MjJRr317tw+vc8Lh5VMDtn/Y5uUbPQRjj7KZc2n82erfiwDLxmE2Xp3w
         J6tLPeq3n7oGZx7wHa0LkoHEO115VkJOLfMunw0EjVy01hf7309mbyIqQC0j8fDiZcK5
         3g1asqjObagmV/CuBkNbDjb85zU1amMvSXLFyeZLtRE338WlRiJwkLMTfQXrHaoYErGv
         yEnn4qwGZGox20lI15FQuMIagw0lkY45VSPNhHvKco/GMxh9yja/JJevVq2zlaKAc3Jb
         O0Mw==
X-Gm-Message-State: ABy/qLbcLjShGb2u7rGmiFlv5vtqfb6xVNeIlkJXb+bSMZ6Up9z1kQxj
        eL2o4LQSW82wFf75PzKefoh/+w==
X-Google-Smtp-Source: APBJJlFtVRVPgbYw1NzWRXDam1xhTvn+p1AKo13hr3Lc0+Jw87f8yJNa7r4Y1W7+jEnmVEOX85Nu4Q==
X-Received: by 2002:a19:2d42:0:b0:4fb:8948:2b8e with SMTP id t2-20020a192d42000000b004fb89482b8emr4153860lft.8.1690970668076;
        Wed, 02 Aug 2023 03:04:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:04:27 -0700 (PDT)
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
Subject: [PATCH v5 1/8] drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit_done
Date:   Wed,  2 Aug 2023 13:04:19 +0300
Message-Id: <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit 1e7ac595fa46 ("drm/msm/dpu: pass irq to
dpu_encoder_helper_wait_for_irq()") the
dpu_encoder_phys_wb_wait_for_commit_done expects the IRQ index rather
than the IRQ index in phys_enc->intr table, however writeback got the
older invocation in place. This was unnoticed for several releases, but
now it's time to fix it.

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a466ff70a4d6..78037a697633 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -446,7 +446,8 @@ static int dpu_encoder_phys_wb_wait_for_commit_done(
 	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_WB_DONE,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->irq[INTR_IDX_WB_DONE],
 			dpu_encoder_phys_wb_done_irq, &wait_info);
 	if (ret == -ETIMEDOUT)
 		_dpu_encoder_phys_wb_handle_wbdone_timeout(phys_enc);
-- 
2.39.2

