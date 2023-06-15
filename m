Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E370773234B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 01:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239368AbjFOXVm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 19:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236692AbjFOXV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 19:21:29 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F322966
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f849605df4so965817e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686871284; x=1689463284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL+aFMA9fwhg/LbwUl6UjJh2esp/SEji7J1FzzytEtk=;
        b=jlkcU1bfEJLvocxXC2RxBFFxEakGyR2g4Huz9UGfH01M44XSZfu1mt3O/JGxCwApbe
         LEPX+8XkHbQ2vcesKLM8SZK+oOHjSy/MLt3ZcbqMMrweMD6+wBvchB5sY+Zu+wJ9nzVa
         M1p1E9D9MugEciVPLNoPikUTwvaxhMkjyHiuY8l5zWHaSNVrIXTdKSBOv8zsKk+DYmAK
         Ae0KjlrZYC6GQtH87OoFcZMdOtx6o+Rkbcrwcf4ncAJO67hp/+IHzlO6eCjcPuxE981V
         R1o684RkEZQ39cT6CFT+JbuUxDE4/WmEtmk+qQeGc+GWpDt0M5XVCuVcVxAFaOS05d8O
         dK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686871284; x=1689463284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL+aFMA9fwhg/LbwUl6UjJh2esp/SEji7J1FzzytEtk=;
        b=Db1MIYySNtvngWvjBnThQXw6bTdXVGTl5ikB2rk8SqR0qdcVA7GdKlL8AwI0in+Ec9
         eq2fy+e47TXAFdQzBPIm54DbcXuqiB7b5a28NyfsjukBfI5Ydq+DJrWQOS3GVPBqAoOa
         pP3Wr62L6rtw/zqdSXFkqRGlj92glLdY9wLRhXpCmQu7XUkQ6t0kcTqB3R6UUk4gZer5
         4glD99hNaT0QqX2I7CCIzWlCY3PpLsDgSejkl9ol9IZd7sf2IoExdW8wZ9kBZM8+Rzc2
         TxN5FRopXAMdnaXGxZ2AhOUswUM7j6Ggzcrgeqj1vVIsIXLDtYrHdHqU9t2sZYa/m33o
         v/SA==
X-Gm-Message-State: AC+VfDxI4UNBhS68RPbCdPBuZE4yHF44bh8Lc5NdLLqc8pDrmSrzheX1
        a74MutNiwvC6k6gB2u27X71eJQ==
X-Google-Smtp-Source: ACHHUZ654L+xLoxzbpZrN7wTbIP6nc5g8iVTMMyggUCWw4rPCgIvY/jBK10Ib0eDVRDEbx1IlO2N6Q==
X-Received: by 2002:a19:911e:0:b0:4f1:1de7:1aac with SMTP id t30-20020a19911e000000b004f11de71aacmr95299lfd.20.1686871284648;
        Thu, 15 Jun 2023 16:21:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:21:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 16 Jun 2023 01:20:45 +0200
Subject: [PATCH v9 04/20] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-4-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871276; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iPYRkIYnCMZbHrTlhZfW6CMBHZeM6Q89aR8VM/+J45c=;
 b=VAHlqWYfQ+1RKxETxDudvSOyIiT84B2tMY7nZpZZURe50LpIFLk5HeH/NsxAACZM4X8oHqSY5
 WJSumb2TQlkA2XltW4oKghz8H+9CHPltCT0HZWa8UbhwsUB050g6UZX
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
index 8914992378f2..a6fa273d700e 100644
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
index 4759a8ce51e4..236f81a43caa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.41.0

