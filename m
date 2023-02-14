Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296E4696BC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 18:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbjBNRdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 12:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbjBNRdD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 12:33:03 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DB92ED6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:33 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s11so10765345edd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0vTgl+EwiBhnrCXr0xxuDMvxcNALHuFiQR0A2LHsl4=;
        b=KpSDfORbK5xMEx3J9DXPweBlRqygeygWbj66ojKQIxHJX1NhsS/7gPQNL9vUkLT3Nk
         hb9ytfdnr6ytmd02E7BR3qmCIfaKbwSr0I7gOPLzvjDJlN5ASoUghASQVk7FsXr4jTHg
         VjjLTuBieats9SsAfjKsJ0zYmVrK6GCdD83nQOWdHqJirPNUCSBD1aEb+EqL8CTyJgW6
         DEchlnZ3zlQ2yCiezRgbj4sfl1oHVyH6IjiWfnqHkdrr0x+XIxdmtTwUvA3XNwZPdms2
         BcTPy/Q0wNG2cgcQDflriCzAeFf3Sste8iXTxb/GTQU+2r9miWT6fONfju4tbEUNiJMH
         YBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0vTgl+EwiBhnrCXr0xxuDMvxcNALHuFiQR0A2LHsl4=;
        b=K7wNbRILkUtaAvW6/aLOi8pBKLCbbqoo0w2MNIDN4bFekqxRhQB9nyrQfkc2YJIn+h
         Oiur6MYxoahp+4AD9eyQABZRrUm0Ckeix2ik/cOgtr8PPjU06fuiMArSLSc5UXETQjQT
         BGzXi1btx0S8Xp/I09n+aN5tFadJYB6nE/6+VU3ruJ+rdKC4fOMcIqWpJB0Y1/cdUsIJ
         K5z+HI1VwNgsUpZmVpmefWgtdZYfiZ1mbhf92X26rxa9eC3e77yBCrM8otFAqDm+FqSa
         fg++aoAEiqJOyAmJeHeAZM5RuV5rSdKWNeW7QzyfjYkpmVw2fwAHDHztajb3KLtGJqJ8
         +EeA==
X-Gm-Message-State: AO0yUKUv2xAd0iiqdRkkl29C2avj61teGsn7Vbtajlbmf2bbhQiXRuIm
        ANMggnrd1q2knxajJrS9is7T7SMfB3TgLoy8
X-Google-Smtp-Source: AK7set+iMh7/0xs5Je24xhYvEfrZM9zSRunoB8VJFdJYFur84UjwE/0wpeZrccB3cySw9r+oiNMiyA==
X-Received: by 2002:a50:bace:0:b0:4ab:4cf0:4ab3 with SMTP id x72-20020a50bace000000b004ab4cf04ab3mr3470812ede.38.1676395951540;
        Tue, 14 Feb 2023 09:32:31 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 09:32:31 -0800 (PST)
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
Subject: [PATCH v2 13/14] drm/msm/a6xx: Add A619_holi speedbin support
Date:   Tue, 14 Feb 2023 18:31:44 +0100
Message-Id: <20230214173145.2482651-14-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
index ffe0fd431a76..94b4d93619ed 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2094,6 +2094,34 @@ static u32 a618_get_speed_bin(u32 fuse)
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
@@ -2153,6 +2181,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), rev))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-- 
2.39.1

