Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15C05736A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjFTLK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjFTLKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:10:51 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA9B10E2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:10:49 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f867700f36so3825446e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687259447; x=1689851447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uceOjOeFYW3YrOQKTUQY3Yfirv5mMIrxQprXiD+0ONY=;
        b=ztMM6FNqBkOpSwDiWJL2e7rSNq6VWJS8i56x3Kg1UAKPk0mqK5tp4Z1Yhfj5wkK3lN
         deZ21ZkowskLeiZHgh7zmp7/Lhfuj/Cg9mLEwp6mbEpH5ubKPgFBqZ8zu30Av1kh3Vnd
         VeAmnCDWoFAGVeG0iMCJ5B+MIi4+xOFb86cf62GiET18fIvyiejPMzBZ9Sy2VB7fDrbW
         3Gm9yidK2o2UX1cdMyJMGrSsQ58BFD88ZMrhvX/K9nXFV/grqVT1Vp+mf559E/JD9Dnm
         uFuc/WLqEaUi+hZmZPcLjl3Bq7AHXEwLwxiuccTkDcj9OAGRRXCEHfWucy1MMWyIeDT8
         gzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687259447; x=1689851447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uceOjOeFYW3YrOQKTUQY3Yfirv5mMIrxQprXiD+0ONY=;
        b=f8rsfOOmxL0Ad/4e4wsrr8SrNVLtfHMGceJoqMsrTdVDAxR4r5H22LcAvU97tQsWXl
         Ekbv5/xXieq/iV9A4vYhmmxPr5HXk9hrn9PuwCZBHqsDednnXVQSggHKU1VZoq7iFYKy
         Llq2piypjBpSPNt1SKWx7hdg3icuZM3xxmk8SaDdskrVnSmPYZ2kjNtc1DYjgYsNYu00
         z8p30qSPDV2T7JGrbrO8f0TyOIZseNpozMhWspr+N0sGo4Urv3f552vTU2L9K/OrJs3q
         V5KIlS5JccaJ1HgCU100pmYixxtOSl7URNWwvVcV1rH2vg5iSPf+XiYnT7XepcXz3q8C
         vOfA==
X-Gm-Message-State: AC+VfDzXy5CcyBDuV+jE47XAkE42O0CdL7wNQnQCnygKdF8CDUjPIHEO
        ltygUxVwmXZmagi49I5f5bSPQw==
X-Google-Smtp-Source: ACHHUZ5GoUelrBI2jBp22Cnk9kJgAaRVAYUKGa+bVYNEbPWpkYGNAg7M/qz9AWyd4yy10AZApldGGg==
X-Received: by 2002:a05:6512:47c:b0:4eb:3fb2:c56d with SMTP id x28-20020a056512047c00b004eb3fb2c56dmr6884482lfd.12.1687259446701;
        Tue, 20 Jun 2023 04:10:46 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:10:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 13:10:40 +0200
Subject: [PATCH v4 5/6] drm/msm/a6xx: Improve GMU force shutdown sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v4-5-b16f273a91d4@linaro.org>
References: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=999;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HgL0AdZtJqxx0twaid3jHnuqKqCDcBlTAxb3JHJlxVw=;
 b=6OUxqP1UratNBHaIvk/AXKzEsNL/3F8JlTdQ9lFpHEpyOPk+LGEI4QiHbJ5NtMR/bxi4Su24H
 3Szj+ZmchkmAR44vkHol0KW08DCQRUASJZGxokA55rQj2A3CcjObSQ4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GMU force shutdown sequence involves some additional register cleanup
which was not implemented previously. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9929ff187368..55b12a8066ee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -893,6 +893,13 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Make sure there are no outstanding RPMh votes */
 	a6xx_gmu_rpmh_off(gmu);
 
+	/* Clear the WRITEDROPPED fields and put fence into allow mode */
+	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, 0x7);
+	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+
+	/* Make sure the above writes go through */
+	wmb();
+
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 

-- 
2.41.0

