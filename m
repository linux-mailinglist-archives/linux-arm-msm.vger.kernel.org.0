Return-Path: <linux-arm-msm+bounces-36341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA81A9B53B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 21:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2B91C223E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 20:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5374B209F2D;
	Tue, 29 Oct 2024 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rga5CBmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14C209695
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730233719; cv=none; b=Ize7gdAZYyBonrzYqLxrnDszfPjQo5j1FGrzmV5bh5TBTQBjXxiAlDpKMyBMiN9dQqUpe63CbBWwD/wp619o3iiDFOg/XWuX13q7+GzUB6VuDjmH68fxda8CeiWDP49R0Mb+uVgWp6btpc0eeqBOOC6KILv0cJZwnt8KQ2hj7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730233719; c=relaxed/simple;
	bh=0CfbxTye5gSogyDuujv60SUYTMbj7IHTroKhJCVLqZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttJOmszZlJ6dK9bPWukAXFLeXBcScCRCK8Q6Il7LoZYDeDMxxspqVh7uh+vBRpFbA3W3g0yCKO5UYxFYVhlFNeTENd8PQm16WtFPxJlTrzGk4dFtH9b+tRnMeIpppdFJ95HbMomz2cCfceWLvbtxIwCWbkzFlROdtJBZOBOd8FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rga5CBmz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e6c754bdso5349454e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730233715; x=1730838515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEtPoch1KoR98uLkD2M/MwAujNigB9ri8LwRUBc+TqU=;
        b=Rga5CBmzEA9IJZO+XSWNB93ZYRwcR9+980gIrbM1u4AIqVfkNzIjtcjS0q3qw46ftf
         SmCM9ZVGBgw1EEoZzHpkzqMP/pZH1qvb0tOGUp9nBtWZdw16J7zRYPwC48fF/Pa26n/u
         J5JXlCouq/tTpRw63pjaz9b+X0AD8RfEjosP2S9/7QI7XTcZ8ZyljhDZOnFWaxP5nbsI
         ZeGVNWJBHNFNGq2feZQjRv/qYErZdAdSN0YtLZs9jYxvKRwVoCCsbq0mTxP5tEooq0L9
         DWViO+mZ2UyyVrnllDiBWziH7ikK/Q/WzlbrMYPWEqb0ZxkzdFGrXDUaWOlZxaar48Ap
         WSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233715; x=1730838515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEtPoch1KoR98uLkD2M/MwAujNigB9ri8LwRUBc+TqU=;
        b=TW1NaWQJCmv32+U/Kalk+FoVcH5LjsvtoG3CAL3tclQoTd/7FHSzg+zl1Bb0RH+936
         S1U+VWnRnKZ20BKhNGlQIm9btWKEfSVz1jOPz0ZaHon+bsYH8P6op2JZCp82JCCFlmpt
         1V5QLp4gMtHGY8Fr/26rEJck5CY/fOaAPyE6GL7aljqSS8lEElI0y0dsNTz4PJGxapB9
         M6dDPuZdVIV1UgUPDR/3blFbxIhm9WLNrS5nqBgjKNPFS5pNeqqjU4GMu60NQyFN0sJJ
         Rvebsgc/xcHwKd6d34IogMcJG85h2TWNUvVRQ3L458hOsz6Qgl9BljPs8EKTj3e2X6UC
         JlZQ==
X-Gm-Message-State: AOJu0YzRqm+dKWjQOc2/MVwSQy63/aw/o3EmqOGX4MG/pcJDpDk6EenE
	wzk312zBiwRgQRzWMDOxm3/2iKVJ2hhCA/MP90zcpSXFT7Obc1i7g+gIHKfZfp8=
X-Google-Smtp-Source: AGHT+IERcizDS9gxoPr08iGXhgpfd8+mcHYlosMRiOwuvcl9jqLkC4m+bfUVOpVFHaRSyvQMCWY9Zw==
X-Received: by 2002:a05:6512:1310:b0:535:d4e6:14e2 with SMTP id 2adb3069b0e04-53b348f1399mr7054410e87.36.1730233714555;
        Tue, 29 Oct 2024 13:28:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb81a597fsm46449e87.96.2024.10.29.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:28:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:28:26 +0200
Subject: [PATCH v2 3/3] drm/msm/dp: tidy up platform data names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-msm-dp-rename-v2-3-13c5c03fad44@linaro.org>
References: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
In-Reply-To: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4881;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0CfbxTye5gSogyDuujv60SUYTMbj7IHTroKhJCVLqZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnIUVsQmH5ZyvBTVveOX4cpYYZmmle+02lT6ir+
 LVDzfff9taJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyFFbAAKCRCLPIo+Aiko
 1U93B/9aUs8eRWL0sH+TrGv6cp4qJ4qgz5KlVwtLFTcx0c1vWf2ymgh2i5qdzkCQKXKX7jpzBEM
 P6rEmCdUBf+qStZ214uuiq+SrpAVndKKqlbRCway/G4Jynbul0P3KptzufTPAEbz39JzXEbFvVh
 V+OS7amu4cGdjEnf14moA6HSGl82rOauaXzZJe5FzzCx7nL5i3XTN2bnYJEH+j2rqDad1fiWg6i
 zO2PR/jZh4ChFnMp2e0bWg/ca4yG0YpWd5nFmqykGNtICOsnf0z0fs1CTj8XAYnG9/OK02yXNGb
 3X/5RUhfPLXO2iekx3tSsiOPF/JH68lDxRjJYegZDSZMyqnF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the established symbol name pattern and rename platform data
structures.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5cc349f672c0..aba925aab7ad 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -118,7 +118,7 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
-static const struct msm_dp_desc sa8775p_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -126,25 +126,25 @@ static const struct msm_dp_desc sa8775p_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sc7180_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc7280_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7280[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8180x_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8180x[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8280xp_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8280xp[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -156,12 +156,12 @@ static const struct msm_dp_desc sc8280xp_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sm8650_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc x1e80100_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -170,18 +170,18 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
-	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
-	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8350-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
-	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
+	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
+	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc7280-edp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc8180x-dp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
+	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
 	{}
 };
 

-- 
2.39.5


