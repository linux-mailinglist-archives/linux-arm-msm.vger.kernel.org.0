Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E72696BC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 18:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbjBNRdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 12:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbjBNRc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 12:32:59 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E822FCEC
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:31 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id cq19so15760953edb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYv8a/6OJy8MXb4KukAGuO4KrVafYfuTHns/Kb02ayY=;
        b=DmTOd/wjk7KS04TN9/EsVziPdXoeM86DwwoO0M6up/iMBT9+UbMYH9B1i1n03++RnF
         78wjQCqUU3/LbnAKkws9hcZnmG24rdLdQTRWqzrp/S9iT2tTH0sI663FrVRpPdnX6ZsD
         F5eUwtJ5/cCoKPF2K+KllxHTPtZY8NhSIB/xBIa9E8tpOrKvYe9pPrOGbOa+A71LT7W0
         hy07eF810ArwqBMjxqpAQN3nbZUi09mMJ2CS2kR+3V1Zr0x7g/KufmKlFk4rrg8cXySd
         boesWPGSXS9we+H7a9jvFC4wEFgWWgvX3UU7OZBKR3HnwVoiutPUg+Nt1lw1pcQ79JSJ
         YSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYv8a/6OJy8MXb4KukAGuO4KrVafYfuTHns/Kb02ayY=;
        b=BsKr4sGstc8O1UeFWCAvyCflOHacGYoYDgkw5I3sCDrV4XEhrzhihyHbP4GGiMZl/b
         5tbv9pjZ1S7qwa2MlFQ8zVTx2Et0oJBiV5MKpr/3i2yHjaOEP2Gig2bGNNuI22+RpgxD
         6mqJZUqW/wfDe+Pr6pJh7PDAqQ9YjXMc03g+NnCcCgKCm4moBJHzQ6uC1LiIiABQcvvD
         GIeFCJM/S4lXtmqz9k4B/fHN3Bo2g2VF0zsPTBN30gVRaj2Q09A9OjVOSCtNV/PEDWjr
         tr4F8e4LdoklulvKT2JOdLv3Ks6SDQU8PD8nxWttalsJgzOBOt6+IOihYQIwATIL1HH+
         dl9A==
X-Gm-Message-State: AO0yUKX4KONfDRHheLEvlK3bHVHw98PzdPAHwZELRRVLEFlNN/3NT6Ft
        kJhpGH5Aa9SlPunJQgFGaEYE1jkvqP+gd/0C
X-Google-Smtp-Source: AK7set/QEDbEa8JZMZ5nDsQTEWO9TnlFJPm08a8Wgn1ES/Q9Gwv+FqjInAFWVZYuHtutMT7nwO5nbg==
X-Received: by 2002:a50:871a:0:b0:4ac:b4f2:ce44 with SMTP id i26-20020a50871a000000b004acb4f2ce44mr3371125edb.38.1676395949068;
        Tue, 14 Feb 2023 09:32:29 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 09:32:28 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/14] drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
Date:   Tue, 14 Feb 2023 18:31:43 +0100
Message-Id: <20230214173145.2482651-13-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b08ed127f8c4..ffe0fd431a76 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2153,16 +2153,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
-- 
2.39.1

