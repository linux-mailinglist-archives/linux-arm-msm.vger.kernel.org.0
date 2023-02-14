Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D432C696B8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 18:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjBNRcB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 12:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjBNRcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 12:32:00 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B611724
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:31:59 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id n20so3505452edy.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtwSHEkotufMeTG5DbRKqbem2u4ITIQrgm1+z8QXytg=;
        b=dudwPRcx9NWJxqh2WdbBeETUJCwf5veKvmG4eZVchC9vAVm37Ifs7wbC5kEH1f5aWJ
         8Ai2vSiSqC3wlxDmJB9k155jsoaUX/c3jfT+LnFoegMR73rY05zHBC5/+z8kv+NJWJ+C
         G36TY/dqZ5ze55PSyvYQBPyaPqZxTEcd4degUgHLhl4oFGZ2W76x47HN0GTCga+GJdPT
         2ZFFA96BDrvB2VCI2Qt55oA2DXBBBJxn2NCedmKFpSwY3zV2V3rVaAjphoZkDaWUuoar
         k/ajkp1xaU8sjjmS6n5CK6BdWpEFJSs0+QL/j9qPKAwaW1kaYyNcGCcMkmofvyw/rIvW
         yJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtwSHEkotufMeTG5DbRKqbem2u4ITIQrgm1+z8QXytg=;
        b=R0qKGgRt58Z1pGqt4IyEMcqX6snp6+fwCdaWOIf4dshuwSk0KiniTe/br9xdY6T8M8
         8SSJ1aoDu3q7rLrfMIwBcraaZGSQK6RHquiPR8TjUgiU3A0XSaBDUhZ2CJ0bCvvv3XnV
         V7qaTSbDP8MLvRar0giPtPELqPzpX/NMVF18zeGUL36kyebDZkHQyIqSWOnKDTfNoHn2
         DQeBjJy6CeGbfxMcLgjT0g8ryih7WGvpCg5/wmLVnxsRpM+4cmUivDXDm91e0IMwbkZz
         M6CpDmxV3C6SEDZPKvPqUpKJYCYhv8F5nSS6B9LZFbAq+6onYZhqGZKhgGLG3JWLZfeS
         ZmBw==
X-Gm-Message-State: AO0yUKWnigPSsBAL+97iuuKoKNkZJZqwDi7QtuV3cfy7c8PMBM5fsFBj
        +eWV0nBuuVBsfT06ov6edxXWDYAMZ/Yp7Ewb
X-Google-Smtp-Source: AK7set/+N7w1aYgI3Wl60vD5XAtpbT/GpSI4RIgCIKOAmMKYpmjMPrAUH20T6uuXF7ivxMar4Q7nNA==
X-Received: by 2002:a50:d694:0:b0:4ac:b858:37b1 with SMTP id r20-20020a50d694000000b004acb85837b1mr3740065edi.7.1676395917889;
        Tue, 14 Feb 2023 09:31:57 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 09:31:57 -0800 (PST)
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
Subject: [PATCH v2 02/14] drm/msm/a6xx: Extend UBWC config
Date:   Tue, 14 Feb 2023 18:31:33 +0100
Message-Id: <20230214173145.2482651-3-konrad.dybcio@linaro.org>
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

Port setting min_access_length, ubwc_mode and upper_bit from downstream.
Values were validated using downstream device trees for SM8[123]50 and
left default (as per downstream) elsewhere.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 29 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5f5d0bb3fdc..8855d798bbb3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -786,17 +786,25 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	u32 lower_bit = 2;
+	u32 lower_bit = 1;
+	u32 upper_bit = 0;
 	u32 amsbc = 0;
 	u32 rgb565_predicator = 0;
 	u32 uavflagprd_inv = 0;
+	u32 min_acc_len = 0;
+	u32 ubwc_mode = 0;
 
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a640_family(adreno_gpu))
+	if (adreno_is_a630(adreno_gpu))
+		lower_bit = 2;
+
+	if (adreno_is_a640_family(adreno_gpu)) {
 		amsbc = 1;
+		lower_bit = 2;
+	}
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
@@ -807,18 +815,23 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
-		lower_bit = 1;
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
+		  rgb565_predicator << 11 | upper_bit << 10 | amsbc << 4 |
+		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, upper_bit << 4 |
+		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, upper_bit << 10 |
+		  uavflagprd_inv << 4 | min_acc_len << 3 |
+		  lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | lower_bit << 21);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
-- 
2.39.1

