Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503CA74BD88
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 15:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjGHNAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 09:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGHNAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 09:00:46 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F94B1991
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 06:00:44 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so30759321fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688821242; x=1691413242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm1KjGkHlrKrzQJ/qXePV964b6OsIyDARoNzyXVIDWI=;
        b=D8z4Ss4KTOKvdJHHxs3LqjidCtsB6+HtTuJuIzgV8NBiJwLUgm6u0JFUvzx+LrB34i
         LTfPf+gdDvzE+zMAE1ZBiEl9Ce4tqP7Zyl3sSKfxKw7eRrYPRoqt3tXLt9PFv2sv9m9j
         NYLezds2faxQeiSeBjSiUGMWBnaoYLuFnPDsDLvpX8j6tSJpVlTTquHcMkBen6XpbY9d
         F82xfUcpyJ/29YUgWsHI+PBZ5FdyhUOfu1obaiL+NyGccdklBBWbh+nau4Nh+UmNvFXa
         JkcQvFvmFm+Ne4KgqYUQPL8tmYkCcXFduCfqbJE0ONc83ZYGaxndNQqfegtGjIP05lVU
         GFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688821242; x=1691413242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm1KjGkHlrKrzQJ/qXePV964b6OsIyDARoNzyXVIDWI=;
        b=QvXRPfzSROjltHDWZXQGho2LXsOgEmbEVDXwAFO+FiOsE4UK208owKpu16HtbxNjxt
         L7qC50m0M2RLhQ4AxtRKDd920fsyvzAtHgNKt5cdobvDtkZF3kxHR4Z40cpa95oCPtGg
         sxJK89iTp7LTMQLcHn6grVGkqbrShaNuAkXPmB/GtsNJM6S9RmZrsT5WVNDJZfZEd2JD
         ForPgTqkOtg5fzqwQ86oCRTTYlKHr6dtfK28YWsw6buX2PanfgFFZKaQzaRmcPguyucX
         lfN3KQMlbeW7NgWyvWjqNzuKEnCuid+O8hv0AEiKwnm9LtPrE9wBhjPbjTf6HPO0ATu6
         70wg==
X-Gm-Message-State: ABy/qLakw8Cj09HetrAz2GV4yZ1vh+GGwjuBQAIQm0T70CvYNr7Lj5fS
        lvbCn6r2H6j0Ion0DgicjPANOg==
X-Google-Smtp-Source: APBJJlEeCtPsw5E/78MiWAsmEFeLoaOHSx9CtDtK6CnIsNnvgWYFUmlLt/2Tz4EYpAhCKMSZysqirw==
X-Received: by 2002:ac2:498e:0:b0:4fa:a0c3:efa1 with SMTP id f14-20020ac2498e000000b004faa0c3efa1mr5492354lfl.7.1688821241765;
        Sat, 08 Jul 2023 06:00:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l10-20020a19c20a000000b004fb96436ac7sm1003839lfc.250.2023.07.08.06.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 06:00:41 -0700 (PDT)
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
Subject: [PATCH v2 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Date:   Sat,  8 Jul 2023 16:00:39 +0300
Message-Id: <20230708130039.1596599-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230708130039.1596599-1-dmitry.baryshkov@linaro.org>
References: <20230708130039.1596599-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
0x100, while the actual length is 0x9c (last register having offset 0x98).
Reduce subblock length to remove the empty register space from being
dumped.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0de507d4d7b7..dd2f89ada043 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -517,12 +517,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
  * DSC sub blocks config
  *************************************************************/
 static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
-	.enc = {.base = 0x100, .len = 0x100},
+	.enc = {.base = 0x100, .len = 0x9c},
 	.ctl = {.base = 0xF00, .len = 0x10},
 };
 
 static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
-	.enc = {.base = 0x200, .len = 0x100},
+	.enc = {.base = 0x200, .len = 0x9c},
 	.ctl = {.base = 0xF80, .len = 0x10},
 };
 
-- 
2.40.1

