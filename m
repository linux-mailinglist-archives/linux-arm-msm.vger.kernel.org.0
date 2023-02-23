Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5746A06BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 11:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbjBWKwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 05:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbjBWKwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 05:52:19 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341C05A3B7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 02:52:13 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g17so546211lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 02:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=312OV1ExLaf1docfwSJg/DyYHuD2OoIvYCwHKB24HQI=;
        b=Ce/cN8SJNqmnOLGti7C/wIYSkPwOXN+WsO7YJlUi1HVGSsH4IugGMhdMSOArjMUlwz
         AfXqXzfVXH7StipBipyI9C3rVs/AfBEsOlpjoGUJH6oUehAIfEiVTE3C8iOSLzVu/Lym
         /2bcRB2hfvVFzai8oYsySHFBGqcL9QaQK0N/izI0yShx3HtY8Ngi1xEHljGpBafM+oCJ
         SCvH6y3c6LpK5hC/pNqwwIfaGs4EQfZlF7AyG9hek48zBPsI3xMZUy97nqProR/RqSYk
         lJOjp5loyoTQHXMZpg7J2h+5BR/glkMobFjQAxPjq9GGDGwqLeYNFHMwlydmAu+ROLIU
         iwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=312OV1ExLaf1docfwSJg/DyYHuD2OoIvYCwHKB24HQI=;
        b=Q/m/5MH5an125w1LS8u+mpssCY+4fxa4vuLVsRS13SRBs2BvpSnD2h3vV/bnSwRdnD
         4wWnpnLLH92m62XhIaa9YMe4peyuzHy2kywZgtBHeHChvCTho4Y1XhzR8DE74qdEMLam
         8zBWU2U1axERrmTaLCfwlUfKDgdz3Syo4OP1zsRhWGVIcL7uM1qQ5IrOhRQP01gyn9Em
         1TP0N51IUVmMYh3pxpcEkR+340rEgBTN+VK9tX18z+e/rAn1yowuj+pBsSwEt0fiY6V1
         GNsVp4QG7Y40uXxXO5AizxuBegOf3yQZr7JbgowdJxm6BpiGF1DUIPJf+5NeZBk2bGW2
         CdLg==
X-Gm-Message-State: AO0yUKWaH/VnQLg/yDMPMzZTbGi01Ys1GW+I1LZtM4CWOKDa+aLm97hU
        Dnlk8esAzl2UT/Ulgj+yyHuY9A==
X-Google-Smtp-Source: AK7set8osHC1BKuwQhKilzcKra4Qow5sccaKlgb33WRhd1YaD6tJd1VO+rXTjbpXroqZwNqtZ8dETQ==
X-Received: by 2002:ac2:5225:0:b0:4dc:4bda:c26f with SMTP id i5-20020ac25225000000b004dc4bdac26fmr3063427lfl.23.1677149532652;
        Thu, 23 Feb 2023 02:52:12 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id m25-20020ac24ad9000000b004cf07a0051csm262304lfp.228.2023.02.23.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 02:52:12 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 23 Feb 2023 11:52:03 +0100
Subject: [PATCH v3 7/7] drm/msm/adreno: Enable optional icc voting from OPP
 tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v3-7-5f22163cd1df@linaro.org>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677149522; l=828;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Yh6pwT6P3XDwmr1GaQu8MRHxTbI8EpTO/tdF6ItczWk=;
 b=2rrRDrTtljtkMy2NiIvypriRAjz8Zl6PZhh4lLLHUrTd/4LPzZWyfiOavFuEJQnJLGhxCc/L8cSg
 DQgfDp28B0bz+/nmo/25V3K4pnLZVeMgAtqBwOy48QqoAzn8bDYx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
handle bus voting as part of power level setting.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..5142a4c72cfc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -548,6 +548,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(gpu);
 	}
 
+	ret = dev_pm_opp_of_find_icc_paths(dev, NULL);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.39.2

