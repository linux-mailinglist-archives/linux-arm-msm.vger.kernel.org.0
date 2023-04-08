Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C93B6DB7CB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 02:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjDHA14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 20:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDHA1z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 20:27:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B22EF97
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:27:54 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id o1so145995lfc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680913672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6txo25Wu2LginmNBg9i/jzko9c9Q+UvG1RiqkPryuNY=;
        b=Sud1ba3V80zlMu15MHeHOKh+IoaK4BTQoaVu0tJmIvHs/v4vfeZ/ZiUAGnTizVOaKi
         9PmZ/Zz5Wvn2H5B3ndPeh7yErarwikM1hcuA1xgJ/MgDd8lzQfU9en/k9Vi0hBtEkX8J
         XJvvdSScgpEWHdCp53B4D2uDxeOeEA9LG3xGOAmv5oy1yTZ+OddY3CqHvyHoh5JrkAhz
         1x8xvsc84P0HvXOULo1ckIPdllyHe50x2iH5Zn2CcpsqmkgoEG7g1fwH3HRhKn3+XyND
         r3BzC2GIA1LDRjJTO3iUTpLIGHUl212Qxe4X9GxFFY0OnklODn6BoYeq5y5katg0cK6E
         hUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680913672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6txo25Wu2LginmNBg9i/jzko9c9Q+UvG1RiqkPryuNY=;
        b=7jVEQICKP7m8E8DbJMA3kJPEzbWSYoBA8sVe4r6dpD2rtWdC6qAIOBN7lIK06pYAFd
         GYfGv1ggyeZ9k2PkDtDwMOQ98wbBY8PWdEB2Xh6RCoJioMJfZ34FOZXiZcn6UT+XZ/py
         zoq6C454YmfSzXYzj9au4AqAkVp1ej1tr5aTLC6NppSjqvWIX+Dafl2b7SmMLrjTnZIG
         ltqa7W7tx02wE0T8W3+AS7br7jLlHzf58LeNM4+ldwHB34EzCAso/h2SAfSI/vIwV4rn
         3XB3CrVqvabTET1zfJWlyxcrJWqTZFB8/lRGK9FAO2r3/zW1/DRR4ml75qZI3jiQM8XE
         jl5A==
X-Gm-Message-State: AAQBX9eautwDtS17ys3kbTJnRWtEht15uxuU+NrSB9KICKwvmSfgfqZs
        Z5EPFP70/Hh+wx0N0zC0AGcp2bhDMSItqLzQojE=
X-Google-Smtp-Source: AKy350bSxb9AOIbCsP14Uq4g851N70Ma4fNxTBfkT83qLqUK5dF263XCV2Dyv3fOfpiZXi+t3qFIxA==
X-Received: by 2002:ac2:550e:0:b0:4ec:61b8:9480 with SMTP id j14-20020ac2550e000000b004ec61b89480mr94440lfk.33.1680913672461;
        Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 2/4] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date:   Sat,  8 Apr 2023 03:27:48 +0300
Message-Id: <20230408002750.2722304-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
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
index 02a259b6b426..e111ca1f4bf5 100644
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

