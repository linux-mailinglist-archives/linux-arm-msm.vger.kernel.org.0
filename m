Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 014CC589DAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 16:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239862AbiHDOjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 10:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239907AbiHDOjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 10:39:23 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8441D4B0DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Aug 2022 07:39:22 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id s5-20020a17090a13c500b001f4da9ffe5fso5477918pjf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Aug 2022 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Cts/PKgx88Htz5bwHRREhUPAzr6ZTtS1ainGsKG4uVA=;
        b=hAXIUG9WD7W5iqALC0lOOLepHnmZpvWo3twoaRhj0Q+jIBtz3GteKACI83VxprMOq7
         5+yZVTPCiF7ItmAV+FqIyoujVNjHhUeKaWpUCOEUAqZHla7BQ4fMmseRO0eZfb9dmIlI
         BqEHH1TQRXCbUGU5NPvt/w5EqnhxXjYDAo3gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Cts/PKgx88Htz5bwHRREhUPAzr6ZTtS1ainGsKG4uVA=;
        b=rDCsmoI/VH68CpD+JNl/LzS64xu136C+rRh3bmnjmdJqI9D66qOT27Dbtwbb/JDHvJ
         w2TElco9Z9N0Zm9nFlVl9CSveXWgrU+MreOtDw0s0WGDYb46xwHmEFjfUvM882m3aVot
         CEfriEUC2DocKXJ5TjAguXu9GNK51RLZseI0vc9mpE8Z1GOh/Vn3e3bcsMi1lk2aMaXF
         lbxyMNeB/S2qucyQkLCVmEuJCmEOdqe8jm4hjxqUo/mWtonPBvRFmOVDbiy9Nz/IGhKe
         5FnBimutjHmCju+u9NP3OYBxBbYzX66fTYE54Jj8sv6a7zGos7c3sXXXEjtuRwdlkUeH
         uyZQ==
X-Gm-Message-State: ACgBeo29L3G89Unq2a5Jygev7JtiKtkxfugzfyiXn6w8Jt5K9DJmqbQn
        N9Ndc4Kr+5oWCB3EheABzRGqXw==
X-Google-Smtp-Source: AA6agR5sBXQVAnukxwGcxzgyspaEhrHBLZPvphz69CDD+sPPqhMWa49dsLI6faFdZtJged8TcAb53A==
X-Received: by 2002:a17:90a:5289:b0:1f5:39a8:ac3b with SMTP id w9-20020a17090a528900b001f539a8ac3bmr2452198pjh.115.1659623962160;
        Thu, 04 Aug 2022 07:39:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:aa71:2553:6f54:5cb1])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902680700b0016a111c83cdsm1075071plk.119.2022.08.04.07.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:39:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] drm/msm/dsi: Fix number of regulators for SDM660
Date:   Thu,  4 Aug 2022 07:38:49 -0700
Message-Id: <20220804073608.v4.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
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

1 regulator is listed but the number 2 is specified. This presumably
means we try to get a regulator with no name. Fix it.

Fixes: 462f7017a691 ("drm/msm/dsi: Fix DSI and DSI PHY regulator config from SDM660")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v4:
- Correct the commit that this Fixes.
- Use more gooder English in the commit description.

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 02000a7b7a18..72c018e26f47 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
 static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 1,
 		.regs = {
 			{"vdda", 12560, 4 },	/* 1.2 V */
 		},
-- 
2.37.1.455.g008518b4e5-goog

