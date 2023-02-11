Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21267692CDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBKCLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjBKCLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:16 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403BC749A5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:15 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id dr8so20121847ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwtA7XXf/jmW76OxegLq4C6A/wcbkGUK+Xfjn7xbYXI=;
        b=Y4qYfwMG7y0G4SNJ6t/CA5vwOyoQsslsSRMBfjIxxUccm7iyxvmK8lbd1mZsrxRXoZ
         O5GtGuGLH8mwjCH/E9JUQ2CSy8A09OqMlJBxv3Tf3zJgbsFeqzQifVwk1fUb2HjjPDSj
         5C7Sm+WCz31se7wqied/VPysCQy+O7xveewu3FxB2s9wEA8XJix5CPN3sHHHu+xZ/1fs
         oRh2V8fkH/E3GqQtjHAhvR/AKFMZs6ky3H3le16lCdpwaBGSV8B4Z54MyMPmdl2Ward4
         eywVEqlDWDoDVEnoOWd9Apg2olTb7GFYWKgW4AdmCiFOG1qtFqMWPX1kD3OgAYRi7oGJ
         bzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwtA7XXf/jmW76OxegLq4C6A/wcbkGUK+Xfjn7xbYXI=;
        b=xU8n6I2NDIj2Kx8e+/1E5qiQF7Id5fkISUKf0VATgYCkeXx20dFhV9LD9lhsXOPc5j
         Q60iB8bth07r3FadtP9Aw51AKJHxiKLb2SD1ZbQqRKvbTn0Pb9pcVWF2LbUoW4mjw6cV
         RoQSkakeWFQj9xh5XTYHEV17pl4/2tAKau21i3b4tBtp8a4UVUce/3FxJ6Mfq8G7YJ+o
         dD5GgRgDixg1o/JAu/LRRCBGF6vJO2XDwhsULMmu+6DxSyGZdPLZoorTsZmSKIuplMTK
         7Uc3kPnOoJk3mGuaOKS9kYcTU63RtBnV7AS5uYgQfXiNdFnwD0jXp1+TnM2eqh6GzzPj
         Zgmg==
X-Gm-Message-State: AO0yUKWpeipm7VOiVmvfKYLd1lYsnkbswSMcvCSMdJu3/iyUIU5Flfh2
        J1k8mSaD8jl9A1FOQfUKHaYoXw==
X-Google-Smtp-Source: AK7set8SRtdbvPFLexTFLkBldvG2BTYELCfAmQggEzxDFwJxH/18afC+WkgyJGtQfaLC6E529ZQ3Gg==
X-Received: by 2002:a17:906:68cd:b0:885:2eb5:68a2 with SMTP id y13-20020a17090668cd00b008852eb568a2mr15840227ejr.16.1676081473828;
        Fri, 10 Feb 2023 18:11:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 18/43] drm/msm/dpu: duplicate sc7180 catalog entries
Date:   Sat, 11 Feb 2023 04:10:28 +0200
Message-Id: <20230211021053.1078648-19-dmitry.baryshkov@linaro.org>
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

Duplicate some of sc7180 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 074d82bacc28..b511e04347ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sc7280_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
 	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
+	.dspp_count = ARRAY_SIZE(sc7280_dspp),
+	.dspp = sc7280_dspp,
 	.mixer_count = ARRAY_SIZE(sc7280_lm),
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.39.1

