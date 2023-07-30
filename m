Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9F47682D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjG3Af3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjG3Af3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:35:29 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DE21BDD
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:28 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9d3dacb33so23400941fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690677326; x=1691282126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r2FiSGlv7wgOHOoRALy8oCegVMW4sXhzSkAM1IovEg=;
        b=GROdoyKlRuWljLB8KHIekVjEeq0Q2Ju3uiX/hKMLsgxngB9dzZdhqke6jhR1W92tkx
         pNC3oPRC5E0hA0A5Si1HTwbVRhopLNnnTjqip8q8mqslbWvKobePqegs6ZtVNVemNEFY
         wYP40DFn4hLAT5fg0VYnuPkcmhxeupiYjATbeADSObs+h2c4xeoUbGORJstNUHccGmep
         klHoeQIYRT58QrUWbd1wGVnL3cJgJWI+HWuwj+Y6rp8u+f0h4J/+UyDXNHS3YQfqW8ND
         yg/GegJRkYHRv+2NtQidLvWhYdRsoznTtxWO/ekd8tV8kUBu2dQp9lhkDEIJzaG6/nql
         WKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690677326; x=1691282126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r2FiSGlv7wgOHOoRALy8oCegVMW4sXhzSkAM1IovEg=;
        b=AZG0+TAGzBm5XXPVTeG0mghknr3AFL4eWMHh0UTBohVpOWmoq3qA1SG9AgLl+T42x3
         f1cyVNQ75UVX+N6q8qonK5QyMKgPvFhA9U4YxSK1tMghxUTtekV10yX/aCOdXd7DHoQB
         aHC8ROCVSDG3cjpllpEp8J81NJjnIscbH956zu1V6rjUK7UZ+KTU6zGbIR61+NmMhazM
         smwIgi398Xx0L2B/hf5UcEwRDOtdQv44DTAENqAhu4V6rfPSayDNmc5ocb5UxdTilASJ
         ctaVpjntHpWvPyjt8flYhthZYn7+gVUwgxFFS8Z4lOEp2iSdA2Xdz3m68b4NrnitPp2/
         mcfQ==
X-Gm-Message-State: ABy/qLbYfWsO1oEbDHkbEjV+wawka53j4jtakL+AGcpWeFSSt3piQGa1
        lnXgmKs6sd80Mo9t39Cl3LKpMA==
X-Google-Smtp-Source: APBJJlGFk1AdL7l4gkHhV23P1a7mPsidmxanhP10JTAKOA3wm0o1TVM6xefwy4Uzdl3hz7tMW/4eIA==
X-Received: by 2002:a05:651c:84:b0:2b9:4324:b0a7 with SMTP id 4-20020a05651c008400b002b94324b0a7mr4245966ljq.51.1690677326436;
        Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
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
Subject: [PATCH v2 7/8] drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
Date:   Sun, 30 Jul 2023 03:35:17 +0300
Message-Id: <20230730003518.349197-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d1f309f45fa1..012986cff38c 100644
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

