Return-Path: <linux-arm-msm+bounces-42313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BEC9F2BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE1427A1C7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD942202C47;
	Mon, 16 Dec 2024 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehPs5aAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A3202C30
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337668; cv=none; b=AvXJs/3oZMAZ1OFrIVXUZGbv61b2n8x5LdqyNgPXlQGJzDGGwHq/Vt+ZTJn+EokjeWRPdQDg6+xY2YoruQbQ0w2gAKE/t47PKbIZDpk55YW3eMrjc/URS/MxB93dH3WDQb0OqtNEUaWD7o4lBBXzRN76PL8PrasFEAnehAb9VPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337668; c=relaxed/simple;
	bh=onC/sZOCceTmvl+85uTb+5rs4Fex+BwK8WACCKdIkwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxBbRrEupW697g/j3fZFk+9yvj38mr52pN2v16sNqoRlXM3ZzVRu8bHmPxLzc6v0jPxxN7RfDOu+VrETcnsfPd6nVI8X+jJ7Y/JVhb7soja5FLaTN6oqCJAHSsSj+cCV01dTMrMzTix3o+4XVJ6Ha/aaYO4DAJxdXqaHW8wkWZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehPs5aAv; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227ccf803so41984031fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337665; x=1734942465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFueXj50GklXs26URhroJEyDlIZhDwWcbd/CoZUqrUk=;
        b=ehPs5aAvH2aAUZHR8Yf4J2NnCiDtk2wAoik3pm8Iipe4j3feqJly1gx8Qu4c14khla
         w3xJZBG91lnNJBCiAuC666pXE7E0rREANt4KCI9zT7NJfzyiR65pFwliR3ZNb8XEuHxP
         +jbKXlMkzSJt/2M8tS2K9ee4EpF+3NBJ8zo5v0/SWEaRjvAIaUdiqidMp7ce9BJPKBbo
         dDRC5lcKATInFlo6J5z+0rMBh8DbXtfGfvJ6iMWZiDlhwOUm3uWTIU6m7IlCNtluin0V
         DDUt3nFURfA6et0VNDgNiBAn6pLpPZJuQS9ZZ1jg6OoWpdLIgRkgrI95sX9CV2WqV7Mp
         HyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337665; x=1734942465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFueXj50GklXs26URhroJEyDlIZhDwWcbd/CoZUqrUk=;
        b=SDnrDCdSUaMMld1fnd7UlyE3fxm8Xww1UU0MIFf9dVviQE667gUCCe0kx1ocy2uMjQ
         DPEspSMx+EvN1JegWkf1C69/z9de/+lqR0WEJSBCXqAGB3B4TwRnd0uEWG2zKPikFRoL
         baFmzYFa9D+AxXhhx6DZpw7JV72/LdmCAJU0JxzfNDPC6m8F3kBXMEHFkpt3cH5ronEq
         FGU/NJUcvcB5Eo2N584ONnY+iNI9NWZrUSAOCUMCkxvs8bmkzjU8T+ORMoFQnSf4oVnX
         Eio8jk8zjHrIH5CYfp3t7Pp3xUxQRqfuZDiMDe1hl4Hu+UmoVllpqgNHDimX37uR40Gg
         rolg==
X-Forwarded-Encrypted: i=1; AJvYcCXFi9E6pY14NOWKHe4QH4mZwMVvNwqKbCjpEfYVe8FcNpo0edLxwRlRqs0rzlEYrG8v8jMy+77cHXiw6klO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ib8H3cRXrYn5IR+VcA70eu8Z7Twgv/i6sUA08ftuWNJ/AWeb
	m6JcB2eke2/UizeUs71gCaAjxSeUVFaXQN6gsY97/PQui/1kLK1isLzORITV/nI=
X-Gm-Gg: ASbGnctlz3M0O34FH651eRKqe3WABKPkqFQgG7gLPZ+UyT4LMvU9pVE3iJPzSIfpcGu
	SEcTtWfbW37hVs15+Ya6YQXgvk+ev9oHgb++3iNK7I8lbfLslOhMtvGLoLzNUcYHS8XcmMfcP2g
	U94goyGhU456vZOEOOOIargyv6TN+dCt33T42WOSNHpInY03s9PxgfZOE1370z+m8HPz3TvbFSe
	krd3xNiDJ9PcSQN17i85LqTU1ZVNkhL3S76Gy6jf5s15uXVb4GlkezLvMt/hvzt
X-Google-Smtp-Source: AGHT+IGsrhukEvweE+kATGZLKV7abTQp6BM2UyFHz+pdJV3ZnHx5w2xQCWTcZUPlJgEfT6lvq/IlrA==
X-Received: by 2002:a05:651c:2122:b0:300:1de5:59e3 with SMTP id 38308e7fff4ca-30254521ed0mr38410041fa.2.1734337665329;
        Mon, 16 Dec 2024 00:27:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:27:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:29 +0200
Subject: [PATCH 8/8] drm/msm/dpu: provide DSPP and correct LM config for
 SDM670
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-8-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=onC/sZOCceTmvl+85uTb+5rs4Fex+BwK8WACCKdIkwI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RstmAKkhUgDFSMOhulvZdpJWZcJyZTinijT
 6Z1u7es4gqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1aAOB/91xjMOv0FVK7azVd6PO2iTLH9oMN0HMJWRapBLHclS/S2HRw4THhS0ZTXl3SQWdRSKTzi
 wIF0W3NfZ7im9NKZR6BNny0YHjrC4g8ctYty0aFeoGiCyAKdHSzf3n0ws09fsYYKkpKTxpvF+pf
 +u1+U1KJN/2e8b3eUkzrdnVy1naigTtie8j7011s4SkhnbTbkF9QIn0ky4UqNxEaBzuCNuuLUVP
 xb+A22DDN96Y1ASkC+ta8ZI6TQR+qyUccvPAL4VKZOVLA8kHl1kNPqUNGLVncSzKoEvDeWa6mVG
 sOV3h9QmLI9X8KpCwJYjMA9uHtbm2rAZXondZBSxwraOMne/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SDM670 the DPU has two DSPP blocks compared to 4 DSPP blocks on
SDM845. Currently SDM670 just reuses LMs and DSPPs from SDM845. Define
platform-specific configuration for those blocks.

Fixes: e140b7e496b7 ("drm/msm/dpu: Add hw revision 4.1 (SDM670)")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index cbbdaebe357ec4a82a3c3d950aa13792a1fb2d6e..daef07924886a529ee30349ae80375a324bbc245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -65,6 +65,54 @@ static const struct dpu_sspp_cfg sdm670_sspp[] = {
 	},
 };
 
+static const struct dpu_lm_cfg sdm670_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+};
+
+static const struct dpu_dspp_cfg sdm670_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
 static const struct dpu_dsc_cfg sdm670_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
@@ -88,8 +136,10 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm670_sspp),
 	.sspp = sdm670_sspp,
-	.mixer_count = ARRAY_SIZE(sdm845_lm),
-	.mixer = sdm845_lm,
+	.mixer_count = ARRAY_SIZE(sdm670_lm),
+	.mixer = sdm670_lm,
+	.dspp_count = ARRAY_SIZE(sdm670_dspp),
+	.dspp = sdm670_dspp,
 	.pingpong_count = ARRAY_SIZE(sdm845_pp),
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm670_dsc),

-- 
2.39.5


