Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF452692CE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjBKCLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjBKCLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:21 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FD27404F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:20 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id lu11so20240955ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiwbM5jVpZ/ScUiqOgdJmFOTHUE0umLQvB8ZcggfPGo=;
        b=UvKldGRp2CcamB4vzqSNr7sTW5JhdhVqfP9T5peJuhY48brILNsWEbloqMyysFkWRV
         wuliOdKKlLlQen4WUNtDA+GcsllLfBnEpBgF3eyMwQDe6X0fcyK5QTIIgl7BW1dsoDZV
         eoeuOVEx7DeDss9AuIips2K5iq7s3Oqn03lv8ua8DMataMbcDHMjzCStWAzjHpoL5Nxm
         Tic//MskCZwFLLdrVtgQ0RF1YqJdNQeOwiB9xEzufzggHA+VaPZGjuFgOyuMZ8RMaHlP
         YOuzNJbtwrx9E1kpM30vk2fM6BKdQ8RjJWmMUv+jg8UB+CltYhiKEkL+/yy/Ggs5qM2Y
         dmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiwbM5jVpZ/ScUiqOgdJmFOTHUE0umLQvB8ZcggfPGo=;
        b=TACq9CzpyAlOrIeFilhbOidcCPzX/sMwHKpbmrXK9BVDSECN+xCw+ZZbQKXqeU8GvN
         BPxXx/Rf7yfkCpZzODBenxDCKgUs+5c4m1SVitLf9+2Fj27KYvROeYq2cOuH3cC0l3Nw
         F6sXkMxSiprhvIAhVINsw63z7qeUYOJyu9cDzU/HDkCM/Y0ypQEiKKgcLZjVz86P7pFk
         tEuwFMQRup8ajgpz5GdUGU64XlAuPRzk0nq96mMmIuxeSOwDk6JD8hJslJmYAw8vPzMG
         SX7hGn8YUaWI9ZS67uJVFKpl616LD4ZVIKuRxKdyIQcprALxIwDFtu6Y4Vfk+VbUQ1//
         QwKA==
X-Gm-Message-State: AO0yUKXciJVLCdgRmNg1q9h6VkD5LasLOwXf4tu9UjBnMMUs0CybBcEZ
        Wg34BCGSbVaRX+6YESoL6VebWQ==
X-Google-Smtp-Source: AK7set/baO+bEqGhAd4fSPtG1MetVoNQrqnKWIqhm4eMqmlHupto06Cfx3rz0a6AUsADTq28uLMk8Q==
X-Received: by 2002:a17:907:7f8d:b0:8aa:c2e1:6a64 with SMTP id qk13-20020a1709077f8d00b008aac2e16a64mr18548744ejc.61.1676081480442;
        Fri, 10 Feb 2023 18:11:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 24/43] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date:   Sat, 11 Feb 2023 04:10:34 +0200
Message-Id: <20230211021053.1078648-25-dmitry.baryshkov@linaro.org>
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

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index dcf47ff877db..432f47d1e33c 100644
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
2.39.1

