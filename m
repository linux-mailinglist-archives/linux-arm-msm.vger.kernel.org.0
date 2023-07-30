Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406687682D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjG3Af2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjG3Af1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:35:27 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDF92134
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b74fa5e7d7so49418951fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690677324; x=1691282124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
        b=AG74JGa1Hf05ips8f6FiPJavqxbXWTFcbX+eBdceIb03bMHnItj2AA5qpBweuW+JVN
         R92P+H7Wc8NPO2i18d3YXHiV6HjZ/CsupR3YCOAbETCynLw9g7MPWfUt6poyZQCvLqaQ
         alllCtYiICmUyaLQJxd6zprn06ioA37fJx65cwFRb4c42Iir/gvL2rv+KhUIuwCzDYMu
         jBb/BMdtnCleddjyauRnkRFJrl/GyiET3tNq76itMuH0KeLkw8ARGAnSC94Xt0luYIUB
         mr38k8cz6SemIV1bwQmeHerIV7vw3LEQbm9t2neMbYijHZU3uZdsyenv7+DuABhb/Q3N
         ZxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690677324; x=1691282124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
        b=aF09UImlWNUiJLLPqPEHs8xsMKCpTpFeEg+WIi6/lg7I5NG/dj+3dJ3ls4gBjwyBCq
         OQemqZNAX60LjUyniLAlFbCwjyPM+GWus0vb/i8R6relE88IBLrFCnHJiKlgYcwXWkZT
         it1DgaVCC+lezr3aa20m7fbi3mC/7OMDpWS5nZPO4UmeMBCJwr8tJi9O6gjzrGhGBbqK
         PYOzaCM/TooG/O8Z2BiB5a55dd0kgT93xlbUUz/bBtv7oRHhOCoumm7ppiQzPhLKjCO4
         TllRT+AXPXco0+8eMug3/BONQrHoQElA1XxxmZGe0k5+XcscYI2X7GQVP8QFGHOLz5XX
         Zmpw==
X-Gm-Message-State: ABy/qLYY8NyGynSBkX6lryW0Sg5b5BwXNIx2tURLtBRrPhy/XH75cPFw
        ViWg8x8eTss/9hs07N7ancsCs2GBsko33cwTifM=
X-Google-Smtp-Source: APBJJlGfSzPEpPTzgkD+gzw1wRLxGX1ZDd3yQBOyYergZIMZZz/yi1L/H7ecKkwN15yUH/hkjlZa2g==
X-Received: by 2002:a2e:6e14:0:b0:2b9:dfd1:3808 with SMTP id j20-20020a2e6e14000000b002b9dfd13808mr1014231ljc.25.1690677324737;
        Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
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
Subject: [PATCH v2 5/8] drm/msm/dpu: enable INTF TE operations only when supported by HW
Date:   Sun, 30 Jul 2023 03:35:15 +0300
Message-Id: <20230730003518.349197-6-dmitry.baryshkov@linaro.org>
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

The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
only INTF_1 and INTF_2 actually support tearing control (both are
INTF_DSI). Rather than trying to limit the DPU_INTF_TE feature bit to
those two INTF instances, check for the major && INTF type.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index dd67686f5403..95ff2f5ebbaa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -558,7 +558,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
 		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 
-	if (cfg->features & BIT(DPU_INTF_TE)) {
+	/* INTF TE is only for DSI interfaces */
+	if (mdss_rev->core_major_ver >= 5 && cfg->type == INTF_DSI) {
+		WARN_ON(!cfg->intr_tear_rd_ptr);
+
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-- 
2.39.2

