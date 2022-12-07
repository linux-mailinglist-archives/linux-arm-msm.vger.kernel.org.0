Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E709645C9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 15:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiLGO3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 09:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiLGO2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 09:28:53 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D283557B72
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 06:28:38 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j4so28996201lfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mfAGwvefS+g/9R3S0STarHhm4RzC0mvAwecKR+y5y0=;
        b=sXvtNEG0QvjAEGWec51FWMzEbiRXBOZg6CIdMOUyy4HlNfdmrbew2erT9yzEn0JYfN
         nbMQLrCIHht12nA3k2enrA1O4X/mOg6xh1MYvirfcUuoX+SucCm9Hv2V6/dzhXRduXkA
         NgWY9l9UzFxP/vqU39+8oIwXSDIT5Phya7qYDZJZ6fXHJywPw5+o5M0/7EmJO+UDpOIr
         WGzDRusisLPpJOi4AIGphoQqETgtSCdzeAS76nll5+P1rxFBvqAPeh6PPfFgPlJb95z1
         6E/UyNdbMA5Lfah5pAxWT4tBQPnfX2uiMza7PnLKMn1nbqVzrXmSJvx0R3z0y/ZbGIaX
         1y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mfAGwvefS+g/9R3S0STarHhm4RzC0mvAwecKR+y5y0=;
        b=arRsL7gwggVm7VvwML9t5FHuypEqEgHPfy7VWPaq0eMZ40wOeGlnRtvUtyPRfDiHS7
         Vdr4ESrLe1HKKwxkVfE7Fx5EvOEwRJ9Y10NbtRjwsDb2uNChNq34A7V/sg1Sd6In23+2
         /HCdgb2d9oXxKpx0DdJxCt33/PusOPuk0352ZswvlLhcb8cxGfv8T9eu09o4PuGHradC
         fldiYDpU3nNj1ItK9ZFW64eR4JIWXgE/+rAqaqSSBUBIwovDgvqSl4oVriFFIm5h5tIs
         GLv2CDwO7d6VOZuFsuyUOu4FvmXtlPnE4X2i4kOlh7OvkolOaL4XPsTsBIs9ofy/2aqb
         xbwA==
X-Gm-Message-State: ANoB5pnqdmeDqzThYuCOYfAEo3LXd/mTEfJZhOckj5e9PmZ0aDOqTBCU
        pgK4sQZXmkFRprrw4g0bhyy78Q==
X-Google-Smtp-Source: AA0mqf5maAfH+bw6f92BY7BtyIgmYJn3CtQGZlwA+JBxaNZ1iDwwhukTfbxfsy0Yk9HLyHTqnflYdQ==
X-Received: by 2002:a19:7107:0:b0:4a8:e955:77e7 with SMTP id m7-20020a197107000000b004a8e95577e7mr23518267lfc.573.1670423317240;
        Wed, 07 Dec 2022 06:28:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:28:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dpu: correct the UBWC version on sm6115
Date:   Wed,  7 Dec 2022 16:28:32 +0200
Message-Id: <20221207142833.204193-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
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

According to downstream (bengal-sde.dtsi), the sm6115 uses UBWC 1.0.
Change the catalog entry accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b4ca123d8e69..a1b52b9b16f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -335,7 +335,7 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
-- 
2.35.1

