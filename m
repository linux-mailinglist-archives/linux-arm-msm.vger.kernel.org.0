Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF60870A811
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 14:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjETMVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 08:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjETMUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 08:20:52 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5E8170E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:20:13 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2af29b37bd7so12876991fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684585211; x=1687177211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0/N3UhKyosOC5GIX6zF4duG0WOxNT9nlQC/xkc4q20=;
        b=hQ2hixELOV6pHTV9g8I73dQeO+6iBzNKFDq2hboJZvtE8dDkzeDWLXKRbwVWZjQ1oz
         kWiz+S2V+s8A486CTnSMSZryYix6SWBKVu5fhtslimtlxe0MeqKwwtzUNlEPfXWGAELG
         iurxOUS1yK/FB8HGeVooKAe52tsbSIWa1isrIGOYWKi3sAEinn+FIcExOsSqa57xcm0I
         6XtWIwyRc+zNsQ/znuIF+xoGE2LLPwOj1at75UhthmmFE4QMOaZR+RU71ftu9ZGgq8UP
         I08yf8q0rrFDA1k+06mm8xd5aiBvVN+IRyPEdRg7qUI6sqigzDbx+vRV6TZQQtl2jTOY
         0hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684585211; x=1687177211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0/N3UhKyosOC5GIX6zF4duG0WOxNT9nlQC/xkc4q20=;
        b=C4iMIS05PFWcg9QT5YuZmOeRx/1J93mhaC9Ql383GrN/TeNmz7mtt195APAOgWhSiP
         J7cGCj+/WK8TcCnMMaLCZFZSpluvhVP80DNx72N9M9Tahm71HTC0Wl5A9pKJsTQ/d0iZ
         IepNwbKj2WCUwunwwQzVFVaozWMPigUD+9Qfs9bKV5iL7tEz79H8UKaJjEjksb/x0nC8
         +luFwH9/HScReAIM7lRRvvjbWvPzvdO5qe/jgxN4xd/1runlIU5B+Q/mdueDa06eCrpP
         Y0eCCsLMtNTZUlizy++aoNG4Yew1VyrEFVihEg7QVo6vq+6kJlEz8JXvhX13nAcsjSfP
         OR8g==
X-Gm-Message-State: AC+VfDwvPPr6nQ0sX5fozGJxuWNF8lzmAT8CODDgu8jgPHV4GXIdVmb7
        nIVoJZIyX6U/qegYcJdTEpy+mg==
X-Google-Smtp-Source: ACHHUZ6epyhcKzUCAVYZ3n4xjPRSEnE1Ai3K5YzOW2ci78F25R6AVqSaB3T94wZzfOoB6qkhWxs0Dg==
X-Received: by 2002:ac2:5a47:0:b0:4ef:d3f3:c421 with SMTP id r7-20020ac25a47000000b004efd3f3c421mr2066083lfn.4.1684585211446;
        Sat, 20 May 2023 05:20:11 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 05:20:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 20 May 2023 14:19:55 +0200
Subject: [PATCH v7 15/18] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-15-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uKjhc80Jm6KagI3RgryxQkGd8nbEDN7qDXqkFWwfuNY=;
 b=djhvgV5FSYZPoGpc+9gnMJCNWzKm+II36WSU9XC/UIk/xq8RC0p2wAU2mUwY3Vx5XrKFYGjOO
 GKXLFoER77JDkAHm+5jSu5979Rk1nQ1Q46NaBTJeOgNaL2fQyvr11HC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9f296928c249..99bb3d16657a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2174,16 +2174,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
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
2.40.1

