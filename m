Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9D0589DA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 16:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239891AbiHDOjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 10:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239862AbiHDOjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 10:39:22 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D779032060
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Aug 2022 07:39:20 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id s5-20020a17090a13c500b001f4da9ffe5fso5477846pjf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Aug 2022 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PA3kdzp0DUZo8PrDClSQDuXZX1yQ9lusrHWUmYvCDMo=;
        b=BVptfQRoOHu6FZ8rsi1NQavzLV2IA20Fpnh7YJzNgLMxtoBPLuXS6Hp0RpP+DecnB4
         R8fj7DslXRB34nLZ6/cLsyL3amdpi1jAXvEciouLXg5tqIdfjCETM81pz+Wl0heT66Ji
         K+wgZV2S+g9Mcn6/94IJhRCDVx+QFqlc4+m9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PA3kdzp0DUZo8PrDClSQDuXZX1yQ9lusrHWUmYvCDMo=;
        b=tiV/sT1C66F0so4eqzlNYgoxAPl3KB6t2Ss+BGOb4BSGlRNONAAxrQcR865LDWCz8J
         ivbcSmxenIE20tdsEGNpFILP6YWj0z1zbsQSjDy2+ysc2IXR8/FTmxse5zG/LG3Ootrg
         jQkfdYtzeRqkWRmBg1VCbDsPHFVaD0ERRa6vJydT6WnpPX9Yan8scHuxONCxetJxe7TM
         eF4JQgXD9JhA8JgK/PREZW93r4+sj5IrcHT2E9Wyh/8jz5QTrblYhJrSKia85NKobjnn
         NcllcUWOXZ5WDpXi8Q9EHc5lKNIIGj3iQI7stniiZfrUzsVzov9pO5N/QvKN45/wuvrx
         dPJg==
X-Gm-Message-State: ACgBeo08E07ngND2tp0rN9esssvnMO+4PBqslDqUDg6Ogu70MaWqQxxh
        HZdm0N6EkZq7IdG+RDFyOuFW/A==
X-Google-Smtp-Source: AA6agR63hMOHGikhLbXTYYdvm4LNQSHi34vIoHbXnpbRhGi/VAt/tgAf4ZFBeu0xQWLLoZj5RldzdA==
X-Received: by 2002:a17:90b:350a:b0:1f5:6a5e:5d12 with SMTP id ls10-20020a17090b350a00b001f56a5e5d12mr2899279pjb.46.1659623960338;
        Thu, 04 Aug 2022 07:39:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:aa71:2553:6f54:5cb1])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902680700b0016a111c83cdsm1075071plk.119.2022.08.04.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:39:19 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Archit Taneja <architt@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
Date:   Thu,  4 Aug 2022 07:38:48 -0700
Message-Id: <20220804073608.v4.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220804143854.1544395-1-dianders@chromium.org>
References: <20220804143854.1544395-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

3 regulators are listed but the number 2 is specified. Fix it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v4:
- Use more gooder English in the commit description.

Changes in v2:
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 2c23324a2296..02000a7b7a18 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -109,7 +109,7 @@ static const char * const dsi_8996_bus_clk_names[] = {
 static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 3,
 		.regs = {
 			{"vdda", 18160, 1 },	/* 1.25 V */
 			{"vcca", 17000, 32 },	/* 0.925 V */
-- 
2.37.1.455.g008518b4e5-goog

