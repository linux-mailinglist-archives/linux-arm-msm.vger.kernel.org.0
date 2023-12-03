Return-Path: <linux-arm-msm+bounces-3069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF4A801FFF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8861F20EFB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1B619C;
	Sun,  3 Dec 2023 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpTaojXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC22103
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:24:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bf26b677dso113971e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563078; x=1702167878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf74TgVE6c89NJ1rulWkzk64cOHHD6BUQbdqtDGbung=;
        b=rpTaojXoKx2osPOylu84TOVRH9vsG4AQIsirbvat/JzQPQ9Ewr0pOcHnzngipumLUY
         uOkDeq8WjjX5jM69PtUQuTwoDxdsqn5vIZUe32TCyPo5R4z9QdOpvr74yOe1CIm2SYVV
         +a+7ksgmulbNSpssc77T08gMz4BmFzDoywYRo6mrI5EToagmVNEEWjXcK77H3+HFBXkx
         aG4GSpSfkxO+EXCkkIET+X+o9N5UGc2PQi5WLCpFLXDsbKap0Xg9MneefGS6aTohN6EY
         hLLqPYfnkJJVxedduy6zFPtweOWfffCdH286+LEq8+wfsvwd0oJbC7C3tRLMxXwiUgtW
         XmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563078; x=1702167878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf74TgVE6c89NJ1rulWkzk64cOHHD6BUQbdqtDGbung=;
        b=B3fY1VzsOe5mXlNG0zderglvF/kjEyjPyB8E249kGW8kos609xVWd9BJJDOGFNkRAK
         pj0DejOtscZ3rtgZeCFdx/SBywwASfFY3ILgd1ESpv2CTe3Rb9Hff2IhNG1MzfaJT41G
         iprg9cAipMalqVZHVJezF68fqD86wVhgYvLZpsueN3fFhjL7QK9trtH05YyAMvbFmJFI
         jMk70ubJ1Nb8xOmkyeoW1nA/sto14aRh5F8qTE77OGPx7VUh9jwMbDs9/3fib3c7Sxmj
         OIMDACfOxb8t4OAw+PM1YbkApxD/EGFZ+g58NRZw3k9ZAHSGbt2VJBPw5iyaSMi2UTY2
         AYUw==
X-Gm-Message-State: AOJu0YyzdtcMPelDB9Mfg95RTNcas36A3FaZCEr306aCQH+eCauRrXv5
	ZgQn0PK8Nqv/6su4H7d9f9nGP+re67EzTiOaco4=
X-Google-Smtp-Source: AGHT+IFI4QSUqjokUeyuXqYAWJTZ39ivWH0zvZ6uP5+mw0UBfmb0EYoIPs/r3tGyF/WQjGpLfrFb8A==
X-Received: by 2002:ac2:4249:0:b0:50b:d74e:d487 with SMTP id m9-20020ac24249000000b0050bd74ed487mr1337931lfl.78.1701563078340;
        Sat, 02 Dec 2023 16:24:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q25-20020ac246f9000000b0050bbc100b90sm837615lfo.146.2023.12.02.16.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:24:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dpu: correct clk bit for WB2 block
Date: Sun,  3 Dec 2023 03:24:37 +0300
Message-Id: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On sc7280 there are two clk bits for WB2: vbif_cli and clk_ctrl. While
programming the VBIF params of WB, the driver should be toggling the
former bit, while the sc7180_mdp, sc7280_mdp and sm8250_mdp structs
list the latter one.

Correct that to ensure proper programming sequence for WB2 on these
platforms.

Fixes: 255f056181ac ("drm/msm/dpu: sc7180: add missing WB2 clock control")
Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fixed the bits for all three platforms supporting WB (Abhinav)

---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 94278a3e3483..9f8068fa0175 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -32,7 +32,7 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c0d88ddccb28..9bfa15e4e645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7180_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 15942fa5a8e0..b9c296e51e36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
-- 
2.39.2


