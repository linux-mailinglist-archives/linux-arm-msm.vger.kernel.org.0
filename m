Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2309067CFF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 16:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjAZPTO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 10:19:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbjAZPS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 10:18:57 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3BC301B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:18:14 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m12so2152959edq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDYg2iMsJNzgV0foPqQk3vB8m7SDOB4BjLOoBWAaVoI=;
        b=qVvjUfInztdqE/AezWpCK0M6BGJg5la+DGWd4d54xN2vcFwQvi6VlF2ZxgNa87Us+S
         aEEgtG5E2e/X9YALxs1zJr9lk9jrgiwBT7rvgvBlL/ym/SunFYeb7KZyZs8LKCgvbv09
         hZagt0ehrv52ig82ZzGDMvJUROrTudZdrquCREFSaSP0ahdjrmL+QMZzmWBIx4xfkCz4
         BO+R23wFTCD5571+JPy7Fkqyijwh1mspiA13TyFDV0V1RJsAJk2ooU/nPCTqsxdGcEAY
         thWxI07tSADldODvzTOWrNYjuc9b6qourgxLKahGvir/J++o67mPn/u1E7oHyxYFnAJ3
         IFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDYg2iMsJNzgV0foPqQk3vB8m7SDOB4BjLOoBWAaVoI=;
        b=obMLHSBTxstnTCWExDmI0YxJhex5zuQ9tf7OMlA8/7oOGW3CQ1wIZsIICngEToNJ9W
         cAyv3pFhPdmG9E5utMoFTbe4IeFoYm/5ZK6NHhfXgaKfOjNVkuiA+iWP8tZouaUmFzxJ
         SywveRMobMR78Yw8F4R6aXrhLZgq0ozVsOU9YKw4ZjhFXl7q4gURZS2kmukaXr2SWafm
         O4RxvOZrtJ04eUoHrpuNJsAIKvtpHOgyAz4rtkevOxRWVS979QP8Y1ALo1kU+IgxA2aT
         BT6LYALG4aPhw3qnXGTNRmWIyLnbSyQHvDf3+pxSJ22spvvuzjopoDUmfXEBlLzcJ+ew
         sFRQ==
X-Gm-Message-State: AFqh2kqg2p+AaqAyK82trsCL+B/Jf3yFrJDJrsSIUTdha9nvvmP70Sxj
        ipjQWvMsZTZu4hBzbgN1vHMf7vhqZkFU41GZ
X-Google-Smtp-Source: AMrXdXsEIZft+DpwljWA+Pr+MbyQ9p6JgElB0E6a05OvscCGE1slWGBUcjPnDDSoUeAdIILkO77mlA==
X-Received: by 2002:a05:6402:1846:b0:49e:ed53:d64a with SMTP id v6-20020a056402184600b0049eed53d64amr25296726edy.27.1674746281459;
        Thu, 26 Jan 2023 07:18:01 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:18:01 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
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
Subject: [PATCH 13/14] drm/msm/a6xx: Add A619_holi speedbin support
Date:   Thu, 26 Jan 2023 16:16:17 +0100
Message-Id: <20230126151618.225127-14-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
(blair). This is what seems to be a first occurrence of this happening,
but it's easy to overcome by guarding the SoC-specific fuse values with
of_machine_is_compatible(). Do just that to enable frequency limiting
on these SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 452ba32699b2..89990bec897f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2091,6 +2091,34 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a619_holi_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
+	 * and SM6375 (blair). Limit the fuse matching to the corresponding
+	 * SoC to prevent bogus frequency setting (as improbable as it may be,
+	 * given unexpected fuse values are.. unexpected! But still possible.)
+	 */
+
+	if (fuse == 0)
+		return 0;
+
+	if (of_machine_is_compatible("qcom,sm4350")) {
+		if (fuse == 138)
+			return 1;
+		else if (fuse == 92)
+			return 2;
+	} else if (of_machine_is_compatible("qcom,sm6375")) {
+		if (fuse == 190)
+			return 1;
+		else if (fuse == 177)
+			return 2;
+	} else
+		pr_warn("Unknown SoC implementing A619_holi!\n");
+
+	return UINT_MAX;
+}
+
 static u32 a619_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2150,6 +2178,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), rev))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-- 
2.39.1

