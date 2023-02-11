Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A16692CE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjBKCLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjBKCLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:18 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8461B73942
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:17 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id lu11so20240812ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAyHGaDbUvnZaJs/422FMQxhR1BogLL7c2eoszz5Y9M=;
        b=D6HEfRvoOpaxex9v1krQ1wp8qvPl6WuecC/NPoX8PhCzY1Gijey3uoaufuLIPUEdq4
         kytaonjp54j1o9QW6U26zr4D0huYvn8h/p6iYskmco00ldfcyv5IF1L2DGRvSOrqvilW
         28jdOD7kgHJ+CpokvHSs9qxsruNAfSTqzcyo96Z310sWReCcKYeFjJOt6XoGUyk2qdKk
         0PU2Vzbz4VKzZYNqK/5W0DjrsGsApj9SW/D1Nh1qtdPK2GybkOKxpw+b8CQ28YcO0brk
         bxIb68XX8k84E2A7nJFa1florbBDM96J+RkABjdFurIhXG8yatfj/cDlzH8NoOj+DEC0
         D+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAyHGaDbUvnZaJs/422FMQxhR1BogLL7c2eoszz5Y9M=;
        b=Exgalw4E4jVkxB0VWHN2sK9jhnJidL5EFGJ+sM/imRHbU31U9Hr8fnSH+il+ond+Kp
         1JIgISclUpI4nDHuIYnLFDFaDrEkmAz+XRcLXJtuwMJfG2twaYedlh8TUXbifGN/KU25
         IASvqUU4DtcmTSAskfoRNsCss/nt7PKfKFaPNsTtEQgbsHSMrnb+w0y3qz0IlAmDY1W7
         bKEKKD+gIpP+SQttpeWXpz6u7NpTRUlaEx2pzEtAfWbXdiJbMapp+ugaulo1nYK64Vhu
         d6so9RkQPiCoGGKojs00uaLAHZYBFaz4keZW5X2XCSmJxVfy7ER6hZTaK2MqNcasTf5K
         hReQ==
X-Gm-Message-State: AO0yUKWKrMXmLFS3D4fgzy73BVXoTFhXqT0hLmNjtcePiorxCpXjk4e7
        OtZb5SV3F9nXiKunziBQuuwuAg==
X-Google-Smtp-Source: AK7set+YBJY3WUPYQjgrE1AM1w0HOUTIsonJJBnP4aV4KjSrFm34CZFYgeX9JnM26p8ceKVd8cEEzg==
X-Received: by 2002:a17:906:68c1:b0:880:c284:8436 with SMTP id y1-20020a17090668c100b00880c2848436mr15898863ejr.57.1676081477172;
        Fri, 10 Feb 2023 18:11:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 21/43] drm/msm/dpu: duplicate sm8350 catalog entries
Date:   Sat, 11 Feb 2023 04:10:31 +0200
Message-Id: <20230211021053.1078648-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

Duplicate some of sm8350 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index acc5e3789cf4..9e2724ff6b65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -136,6 +136,12 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
 };
 
+static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+};
+
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
@@ -191,8 +197,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
-	.merge_3d = sm8350_merge_3d,
+	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
+	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.1

