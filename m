Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A602B76587C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 18:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbjG0QVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 12:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233524AbjG0QVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 12:21:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E56E19B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so2010024e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690474873; x=1691079673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6RuNhMjGuYTebSwzychmeBGRpmSV/TMmOX+Xvl9+Bc=;
        b=hWh+ClRXxKBLO8OLzvZ3V78VX/0pCeIMl0m9xrXg86cEgWTcEIMYJA7s10hlvEwYGT
         1qMQZEMJaMFk0/Vurc4KD9x6mXVQBwkNoIcpR2lxBdbvKC2O7oi/qV08v0d5jUmxvf8M
         CdqclkXvmfxFq84AxiEuC7/xmlBUmJEr2LMbvR/GViUvcNRmGv92MkXMwIkVD6dg1vye
         +mMHF3B+ykGgXRJGZWKMY+f7HBH/K1dHTcN91veuxNy2Mye4sHksfa2kzwYVLMoCqFDk
         gu4Hiy2vs80y/3z9rf5MDm13LCs3RQoFN9VAUi59fFa7mnVS7Wal4tU7AnMHmLQuwZQl
         wIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474873; x=1691079673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6RuNhMjGuYTebSwzychmeBGRpmSV/TMmOX+Xvl9+Bc=;
        b=YhKAjWcFM0fGDGiUycvztSpGDQxmBCufEnIcH8PG8hcaslSB1KNJhL+QNzU7SgaALA
         GKqsGm9Iw4GMyW5TBGe35f1XP8um9pnoFqO+f/q31+yK5XAhltp/jBQFDlPjyB54gNQk
         7d5V+7+SCs6P7aPC3WLWWO5ZOyWUfNZElhuhWBF2jrmNLs+7Co1ho/zPG2VR/WK0E3hk
         +juOR5GYOdiQ/Dm6SFLoSOAtvQbKDgaTZu6s/Z1QNywOOh0/CgNiGDdtcdBe8981pRot
         Mct7RhUH+uCw1KAi+5QkzHePGGWG9nbjvbTInTSwLQTX6DcMYnQsLs9xxANoS6PdO90l
         Q68A==
X-Gm-Message-State: ABy/qLaPxsfUp7M61VPJi0ONdrtk6UAPPHohyFixGnDX70bEi7p9x2ah
        BUJtEFcA/DypkDI8lH3EF/inYw==
X-Google-Smtp-Source: APBJJlFhuVF3dar1Q85kZVZI/DnSddUpRi3j/echqLX5rwVYduApQc1u6H+2yOX4R2Vnetdnwj9KVA==
X-Received: by 2002:a05:6512:32a7:b0:4fb:7da3:de4 with SMTP id q7-20020a05651232a700b004fb7da30de4mr2484529lfe.13.1690474873032;
        Thu, 27 Jul 2023 09:21:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:21:12 -0700 (PDT)
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
Subject: [PATCH 6/7] drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
Date:   Thu, 27 Jul 2023 19:21:03 +0300
Message-Id: <20230727162104.1497483-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
nor hw_pp data, so we can drop the corresponding check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 60d4dd88725e..04a1106101a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -108,14 +108,6 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg)
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf)
-			return;
-	} else {
-		if (!phys_enc->hw_pp)
-			return;
-	}
-
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
-- 
2.39.2

