Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBF286934A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjBKXNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBKXNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:06 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6440126F7
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:04 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id qb15so21887695ejc.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eQWc7eI/NIpRQi7Qva/GfZvDk9Cu8nShwJ7yygm8aI=;
        b=dFNTRKfQS7S4LfhHi2LOq8JQfSpDvsIIocP8Eu4vawaExKuVexO53U690q0JP3i0r3
         dvOloP0oTEJw+14qN+pH3c5a0lMCEC2Oxy/cDTeo/kmrafMzglSmAljkaVhZIyN7nY2P
         OiOoNfiyQzeCeW6FEuGOE0i+iZb2A9inJnsymLfKjbvOJaHbeeGjgduNbUcZt/6fGLaI
         olMxQ5gO1xX/BadzroA2GlUKMmgBE1GBrRe++jdH1Gb8D+ZBiP07rzL3tgD3XclYoLlh
         6el3j+So+7uGTJDK/1Mn1VfJDJgVxsJRiS0UH9We7A2/H56O+T0dETc0Hocqv06z1GCi
         E4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eQWc7eI/NIpRQi7Qva/GfZvDk9Cu8nShwJ7yygm8aI=;
        b=QlbtcOqILJVl+sU6fjow20PVHnOLddEkeO4DQkppJmvbsWaoCg1A04hcAHm0OF4Y7B
         GqoBtvFOESx2ki8zusqWXglX1Ctb5Ja6ojG4kjB13MplSqqghmxN+fnM+4tWKlywXvG5
         0HGLr+A3YSdyXG7AEW/ruTH5NGbNcXpbEaoDgDhsE4z2wsVozzLKwsbZiQa52OyHgWQw
         GRsRB/CNbel/wiC6TGS1t+BILiPcWRknzluu5V86+dz3pNSY4zsq4L+fXwpFJ9nYsBPk
         jZjtbfbDf0XyNS6tc9T5IaLPaq85O+jmWjwUrV2SwLFaj2CV2NcWDCbyP6yVnk4wQrQu
         f+rQ==
X-Gm-Message-State: AO0yUKVEAbKfhOpfJVmhN+ywVHTbSV7F589eO5Nud2M+HMqyO+Gklpie
        nGZshkOwctdIJZX7TSVahRBSCA==
X-Google-Smtp-Source: AK7set9TVMrXvkpNzaYEiWhyw+iqutQJRZY9qc0yOzjWuwqsQ8eDlhKLXhRXfsZnBm/jciCSLxkE5Q==
X-Received: by 2002:a17:906:2581:b0:887:6c23:193f with SMTP id m1-20020a170906258100b008876c23193fmr19049761ejb.44.1676157183440;
        Sat, 11 Feb 2023 15:13:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 01/50] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
Date:   Sun, 12 Feb 2023 01:12:10 +0200
Message-Id: <20230211231259.1308718-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

The SC8280XP also has a black hole at the top of MDP_TOP region. Set
corresponding bit to disable access to that region.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cf053e8f081e..84d974458e0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -696,7 +696,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 2,
 	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
-- 
2.39.1

