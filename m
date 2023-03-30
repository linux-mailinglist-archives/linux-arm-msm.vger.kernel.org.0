Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDD16D114E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjC3VyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjC3VyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DF311140
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x17so26405881lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iR5rV+aMHVU1JGphrgXACA/+OrxgNINAuIKG8mTtjY=;
        b=TsSPMuXsvHXKFcLsjyn+Buz6LjjyyJp20+9JKWWMTJENAUrtsj3nkx8ZpcBCJUPXg4
         ng/M0UGteKcQP9IjRa525nuy+jwy+MQHxxOa0iupnSbKr+V8tKKHHTK1CMWxpbLjyfpv
         Gq5iWFw60gGtnBMK3ENLXtWtetHuKWSEI4Fl8fMjTOUfFnorXk/Dj1aB2lhKykvTGIMw
         BTRnMMa2Agy4ytzy3OcL45JiR3+5y1jaMz6LOyGPqvg83TbK/9NMlQ/4uPBbcH7Qd++n
         aQ/pllUXJ7sObA5wruCaKj3lA7rONhy5yD5EaHTPDUmUUC8sjqwIS3PdKqZ0CqYJ6nWA
         3PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iR5rV+aMHVU1JGphrgXACA/+OrxgNINAuIKG8mTtjY=;
        b=opf3ZTwOSorU5MQsYZHgvmcoDRmqx1suvlGMqgVyI4Aw/IKCX0cfZ+TjuqxeIhHv0J
         0G7RbP9ZzLMLOFV+qX+rAXOQfTxfvuBTcSVmJ0MFsjmeQO2L3A+bOWZ1U/80eJzHwRbY
         30PMOW0XwfKLZTUicpCf5TxXgrgZCpsivCu39D2OA7jFSqJiuiG9ctwoFSY3VfdbgqPv
         Yb+3+PN+ffG+8uYQfPBcJo+XcEzwyEK68Ity4bRWoL9GraKM3RbHdPM8dC4djjX1U9EU
         jRcmxZmNt5VQpDFL7qrLEaql22KudI5xFv6Wik7sm0pTsvWQ/Ml+MUCS53IL47ThSMRN
         JwzQ==
X-Gm-Message-State: AAQBX9fRZzfLl0HMDIRsS1z9gkQ85rV4EKYobMCBzkocmx69Z0EQ9DZ2
        9T6gf8UokkKFMUJyKyeLgJ5DUA==
X-Google-Smtp-Source: AKy350ar9WojGNbOiEwQac2hyrUaRsbMKx+LVJ1xKOXdjdhVR0IC6JGh6TE6MEgbFJoCA1owIA6EAA==
X-Received: by 2002:a05:6512:3c2:b0:4dc:84dd:eb91 with SMTP id w2-20020a05651203c200b004dc84ddeb91mr7291215lfp.22.1680213254704;
        Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 26/38] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date:   Fri, 31 Mar 2023 00:53:12 +0300
Message-Id: <20230330215324.1853304-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 49dd4a908413..c13df4269c21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-- 
2.39.2

