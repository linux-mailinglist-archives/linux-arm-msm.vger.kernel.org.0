Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F243A6D3063
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 13:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjDALzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjDALzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 07:55:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6D525473
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 04:55:03 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id br6so32194167lfb.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 04:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680350103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcTVfYVJVvyjT/gmTGLxErkT9wedlUsEwNFe3X7+hGY=;
        b=hka16u4/n+DaWI8KLthmzu7abmpNUNrh+4WYo9kw74EijqTQ+uv8BmIc5dC2/0XNTb
         bHWTPITrL5MNXS5B8o+sylcHX20jz0Y+uX+cTZOdirKY5oyr7urEQlInMb3m/su863rE
         9QhtgRgP/fJosWhwYGL8MVvOmRz4v/tekU0+3E3jJLg7ZCywP05UTO73WdkToEWM2aVr
         TmKjintsJd/Se3plcrNqkiJ180wix63MKXEkZ4RtC7cC68WWZ7DISgKkgfTOxea6D9+g
         nv/D5hOAuVMSlgRYnAIdAU3CjxhsXgB9E8Cck4TnImz8s37pdFx365nxpKoVttMp6Gh5
         V1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680350103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcTVfYVJVvyjT/gmTGLxErkT9wedlUsEwNFe3X7+hGY=;
        b=euzucTSOR/SZfjv+v90w2PHBKeiJWTHLz8SB8kj2mfP2orEauKVO5rsoNkDjc0Sz9u
         cz8DnQbQqaogwd3qBarZUiRDUtdfz52bVPegj+G+mvhnV47OaETvwwtyVA47lkVWtsiQ
         M6jo5nuKcKKWsUmfhie8djz+TitjFlaFCUGYLfqxzDiieW8QX8IxETTCapeXshKf2vtj
         g68bYCRNmNDl7Q58mwK7Xumz48m2tHmMluyFKgWLEJsJhVlIrdlu/Su5iCUxyi2b8pED
         72wVljURaEY6tqactFfc/aqJ8koKidmK3Aj6WrOT2Z3tzF7oOibbVX0jCsOBF08C2I3x
         p7Ag==
X-Gm-Message-State: AAQBX9eHVAp5ZffJ/tVRH62PHIrNQSBTZ/fcUQT0IclVqfugSA1Tuvyb
        Ote6ua06JC8fSIwIaWCUytX7nA==
X-Google-Smtp-Source: AKy350Yl4KFVVTWJFWuvgEtM0wVoUGH4cdifEepaRt7ptUVvt8TwfVlOO80MecIzIYVBlstcD8zjjw==
X-Received: by 2002:ac2:4824:0:b0:4e8:487a:7c2e with SMTP id 4-20020ac24824000000b004e8487a7c2emr3686636lft.14.1680350102999;
        Sat, 01 Apr 2023 04:55:02 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 04:55:02 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 01 Apr 2023 13:54:42 +0200
Subject: [PATCH v6 05/15] drm/msm/a6xx: Extend and explain UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-5-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=3025;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=O39lrV4yksGqUskcsqJEvIhhEigi/fA6XvvXYO4w5ps=;
 b=myh8HvfU5eZVgXTCg2b20N3sNNDdu2Vt9J1nGW840mDCgn7ouXLFoojuTVVlFz4Gv+4vDv130JlZ
 AuIMwbCbCZNPiZ/ewcioNX4dUYGWfQyHbeXMSj3a1dotlSrhM8q7
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

Rename lower_bit to hbb_lo and explain what it signifies.
Add explanations (wherever possible to other tunables).

Port setting min_access_length, ubwc_mode and hbb_hi from downstream.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 39 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a501654fd8bd..931f9f3b3a85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -786,10 +786,25 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	u32 lower_bit = 2;
-	u32 amsbc = 0;
+	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
 	u32 rgb565_predicator = 0;
+	/* Unknown, introduced with A650 family */
 	u32 uavflagprd_inv = 0;
+	/* Whether the minimum access length is 64 bits */
+	u32 min_acc_len = 0;
+	/* Entirely magic, per-GPU-gen value */
+	u32 ubwc_mode = 0;
+	/*
+	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
+	 * We then subtract 13 from it (13 is the minimum value allowed by hw) and
+	 * write the lowest two bits of the remaining value as hbb_lo and the
+	 * one above it as hbb_hi to the hardware. This should ideally use DRAM
+	 * type detection.
+	 */
+	u32 hbb_hi = 0;
+	u32 hbb_lo = 2;
+	/* Unknown, introduced with A640/680 */
+	u32 amsbc = 0;
 
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
@@ -800,25 +815,31 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
-		lower_bit = 3;
+		hbb_lo = 3;
 		amsbc = 1;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
-		lower_bit = 1;
+		hbb_lo = 1;
 		amsbc = 1;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
 	}
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
-		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
-		uavflagprd_inv << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
+		  rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
+		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
+		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
+		  uavflagprd_inv << 4 | min_acc_len << 3 |
+		  hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_lo << 21);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)

-- 
2.40.0

