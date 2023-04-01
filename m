Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E89A6D305D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 13:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjDALzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 07:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjDALzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 07:55:06 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18D524AC9
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 04:55:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bi9so32196614lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 04:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680350100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbK2MVc1rKgyfPXfQElwY/6uPFFij3UrjXWyfn1dhPY=;
        b=fjL75dISZSV4H+8N12RUuLPgkvtiebKr+6ASoAkWxwfNiElc7/ojpiwwM3yQ/36c3I
         vWOXBYewl/m36ml0HT2/EnizqK63B9YCoSQR3Kavg8o42p7YH/4eRrbrgz91hpA6uuUk
         HYesEBGnCLJbbBdCmh9RDfmpPYX7LdT0dEH7vJdDF8brce3qbgqiClPB1Ld2JlKYNVsB
         GCBaziPE/grDFbX/NVENrq3jFeW6tqRDdlOkW0SGUiB3oVuMWVIcG4thFbLKAP6Sr7mh
         3QiAlOsUfwAv06pIxXMAgIz+lnbnd+KQ6gVDFzqSJaWl5wpvDSzBZTUGDf65sbOlEOYh
         7+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680350100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbK2MVc1rKgyfPXfQElwY/6uPFFij3UrjXWyfn1dhPY=;
        b=qfT2153WKY7wyGhEXZZrf3tN9njtrIyg7RlVhj3EesjD/0X0z/ztWgtjcF+xmfQu3U
         suo7C+uN2PPgE6mgaHe69oWJ9G26T3tfEZNSLTLGfV6bSmO68g344w7CjpKAOmPuoQN1
         +5WmhkAmx1Qp9k6FHevf9r1Fmo0wn4XnEuf7d/Ef2X0G6UeCHBF0SzPSAm2lO5NR1eGx
         kUgOb9qhaIBrAENoDwWLyY4LnCqoQKGwC+a11lsr6ZsjznCfzjJcG0SczQjh/j7pzFCr
         pFnCvbFvaln0t86FhgBxrmD9VN9ZfEOissYujFXeP7ADp6KmIM2tLMw1uYd3tm9rbT9n
         PKQQ==
X-Gm-Message-State: AAQBX9eeZgkts2ZixUswaLQohBud3IBzI9Ta4nLhN+JFINGZ43lJYMBN
        jAl8esxtezlF+JyAXLBIhAq2bA==
X-Google-Smtp-Source: AKy350ZikYFxTM1MU3eUgc0PKcoDOOnyTT4LYLXu9S8Wq3YzPlUdOjbCAo75MJyxQB8wUCG3Wxdftw==
X-Received: by 2002:a19:5510:0:b0:4ea:f9d4:93a0 with SMTP id n16-20020a195510000000b004eaf9d493a0mr5593306lfe.34.1680350100305;
        Sat, 01 Apr 2023 04:55:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 04:55:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 01 Apr 2023 13:54:41 +0200
Subject: [PATCH v6 04/15] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-4-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WpExda3PhDQwvsN/3DDBnvG0Z5wUKLMO4vx8OFJgLF8=;
 b=75IfQDAr9WDnfiDmZMmGzjEjaJNUGRJAMt23AHzSA5NWTjC9aPCa0S1vDW95VzrXJKrvjMNy/KHm
 ZelYSLzJDnopySv+ciDpRcmx/KPYBt9AILvfACq9ERo1s71ICFme
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..87babbb2a19f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.0

