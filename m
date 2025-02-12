Return-Path: <linux-arm-msm+bounces-47830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 159BBA3332A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D56397A2F11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D39A24C692;
	Wed, 12 Feb 2025 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP9yvuqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED77D205ACF;
	Wed, 12 Feb 2025 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739401486; cv=none; b=aeOzLxcqUCPKv8YnFzCTpklfKG7zksyrmH8y8JHvt1hPDb6R83EDULRxShR2Lh6V6hyn6IcGSq8fuPwKN/U3AMqGmBUoXhTuTZhs4kMGg4OuiI2SkcGElaoVnyYu+H/TIIAs3+jLWWTSfoXNTju8TuJZOxGhsY23utTfGpNmEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739401486; c=relaxed/simple;
	bh=PoBx/4/qGynelh/uiB6nFH8WP+X7fpoOY2mipC9UhNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEITX7iDxrboU/WMHHZ2s3XPF4BZLW8OrIsS1Cscm/iWinAUtuxxhsVDJj9mKL9xApkRxTV/al1aDOvrCTG8BMRCP83Rl0b/b3Rfj5uySH5RvobPtRrWB7j8b+yTfMU4ma3NIPbMl4bJsnRvWKHBMK/uwBSXGQEjl7502YJseTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP9yvuqT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220c8eb195aso4226725ad.0;
        Wed, 12 Feb 2025 15:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739401484; x=1740006284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTjaCB1N1ydBQMqBry8fjIhD2HufxSwLUhUWeWGMn4w=;
        b=aP9yvuqTG3kIzvDw5VHuLCDL79ZZJBV3a8illiVV+87RtnrtCufqFRfzf2R1/MN4Tz
         uTfGoK6L6NwsuQZGQtusCW2bAPLeRK+o0JqMczp/BusfOvDNxgRWnkSgBbc+LcI270sJ
         3Al0FQaJSlxuRiAoeIaaUoGUAzFncIheQxK3SNK51/O0q1yuvpaJ96mTqZv5YzBgsUbi
         CmWgZbSaJMSiAWVpD8qcopGbcNibLq3R1dlpcKPa8+pAu0RFpNT8YLlpSpG8DaHUQvDc
         dacvUDKM8unmTnOfjgV2pe0k//vgD2Q6/aBKsR9JzSeYoXVLNCgcsu6Y/uwib5e68eD8
         EeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401484; x=1740006284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTjaCB1N1ydBQMqBry8fjIhD2HufxSwLUhUWeWGMn4w=;
        b=afiS9x511yrk1VsC/7Ye1fXNPYbNPXZOTemm/IIkDaZaWB0SauudKyZDUR/osfbYQC
         FJuu+dKMktRmgXvRrfMLepMbDd6n9f0zl7TFVXihiUag4YBTD4OAxLXzMniviuRtYIV9
         JeLZNQIfw8d+eLCohq38W31DGMewuOjkN95KYkQP+vi0gN8L3ESrsDXlzkx8TYzq/FoC
         YNOkmtUu/VC8k82JdcLgctsDWZ257SAgBsBx0tU/l26gEkiKlnW95Rxniz4X9LUw6aMW
         MkT2UZR08fHaLPapuvYVUvFHE8umGoEGp33Naxl8P00jqGA8ibG6rgWB8QFTHRajH6zA
         N98Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvPrhowm4ea7Tr05VXHDSEB/5CL0xwqmhZIhDVqN8tpMsRZyqrdx6nuigWFeLjE65HohA6q5izcb76ntE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5yoVetdzSCsZNcIIAn+sxaqLzO32oIY4fxjqwdWjQfNh6phPi
	nC6iAuprmaSakkQnaX/n6DtVqFj3DLYnW+5Lx8r1Q2HJTMXXcc4s
X-Gm-Gg: ASbGncv1c2cdDET5toeQ4oWsbPOjJ6yS3A1azxTH4bjuDTVR5qDqjn1AOKU5QnYpCUo
	C7K0HYm06reVCWjyWD4kJe0HtVJh+BAzAbMaKxN6W7owpdztOyLh7YgkFfjMj2KD7188D8Tsi+r
	4JNj+1p12+N/k/Gswd32wxuTwhVmULa/vAqEJ5jfOxAYsjF28mD+ypyXMV/iWtHx+42UVxdydD7
	WaYZte2ISCsiHYoG7iPYlkj4ER6wOKScoOHAcHNsJ2SgjYuY6PWuQvOSyH41P2U1JILHwl6Ui3V
	3pT6ZuLOTiwkvSkqCOzriotk
X-Google-Smtp-Source: AGHT+IGCJuRiPBEnF028173kRiuvUsRuqyiYHzbcY80Rfwz3Vr7Pl2PC2LVpfE2p9OX/RX5jivzdRQ==
X-Received: by 2002:a17:903:2b06:b0:21f:8099:72d9 with SMTP id d9443c01a7336-220bbb0c43emr83000825ad.27.1739401484137;
        Wed, 12 Feb 2025 15:04:44 -0800 (PST)
Received: from [127.0.1.1] ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556da47sm695655ad.187.2025.02.12.15.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:04:43 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
Date: Wed, 12 Feb 2025 15:03:46 -0800
Subject: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
In-Reply-To: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 "James A. MacInnes" <james.a.macinnes@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739401480; l=1781;
 i=james.a.macinnes@gmail.com; h=from:subject:message-id;
 bh=PoBx/4/qGynelh/uiB6nFH8WP+X7fpoOY2mipC9UhNY=;
 b=gJ5JFDtuCFVR/JXUlm0GmVoAyZl6jPM3zN4afSUKnfdEn71BBX5Wx/qHtZs2pnXItrHlC/VTN
 B5dhn5ObKt8B7jzkMlIM28f9raC4LFJm3yLOwZ8jW6sXVY0WcxR3NIn
X-Developer-Key: i=james.a.macinnes@gmail.com; a=ed25519;
 pk=3z+XoIMKkNT7N5GL2WOp/Lcz2ghtr7b8RBCa1usTz9U=

SDM845 DPU hardware is rev 4.0.0 per hardware documents.
Original patch to enable wide_bus operation did not take into account
the SDM845 and it got carried over by accident.

- Incorrect setting caused inoperable DisplayPort.
- Corrected by separating SDM845 into its own descriptor.

Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")
Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973eb..e30cccd63910 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
@@ -178,7 +183,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
-	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.43.0


