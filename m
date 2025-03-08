Return-Path: <linux-arm-msm+bounces-50673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B4A57777
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B0A31789AD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7399215E5B8;
	Sat,  8 Mar 2025 01:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5LLJGD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4429713D28F;
	Sat,  8 Mar 2025 01:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741398186; cv=none; b=QMVxh5zlUQbjuKf+cw6jXMbeGKc16ugwftAj9y3mLhyIfqCvNGEiIB61Wif/c1CrodLxj9vLz7FEKg0TDbBXe+S4uESaVGtPrLEV3U/ApetTa0j8HL9JWXWs91d1w9iBucLTbMN1I+xMOkBVeXihqi+abt0NMYz/qSseDWbXE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741398186; c=relaxed/simple;
	bh=2D0mactFOj14u8gSqC96vNkY8H1lUrzV3X/QcoVcSqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXpAmM1c+gT/F/XmD78ot0sFj9uH0PSiPDCKegKDUMmzlDS6rEiuBVkw04ADXQxh55SaVBORyS00i4ifHSQ9Ko3/GyGPYGnwNk0U+dEljG6IX/dODoxwD7hFHAP4eznbc5/Gs7KY2ggNMwomltQ7eFaNCYAKfAjUKJJoM0VptzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5LLJGD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C700C4CEE5;
	Sat,  8 Mar 2025 01:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398184;
	bh=2D0mactFOj14u8gSqC96vNkY8H1lUrzV3X/QcoVcSqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F5LLJGD7OaG8ziwJMqd+BrNf711TNDgEJsOku1R//xTgZ+gsCZTkjCEf2c/a8Cfhv
	 +Rg4ZotbsnkgBZmyx6iTxvOMv0ELoHRgIjm57AwFwEA2RsW8My+7ADzvhiUIWJmbZh
	 VdyHQX62d2zYfTkO3r9SZf6WWHC0+RSLX8Pvmm0elSbEdzPuSsh8zb3kqh3d+qFY1Y
	 RB5Pojw5snfFjLgrqkAskRqJq+gS5nBts0bSspwhIzrJCElbtxrZjGI17ZzV8az5uX
	 3PgG/3e55hpl3oikGrVJFhaAyns7V6bXxjGEW2fupXmhfVBUQfibIAGbEv9N9hp+Ic
	 n2fRM+WBW9z2A==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:24 +0200
Subject: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vamBBACjk8tANq08hvJz3G+yfor78/Ii5rj2IDuoZiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/qznHG5lCxb7ywFf4TmMXgesSHLuwznEDZ
 eU7l9i+pymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1ZffB/9PRWd84GsU0grE2P2LUTDFWCPDs9W7Dx+VgVad6tVqwot8UkEIgQhTMW8+Xhs21PpFuu1
 Ip1ALCBLDpLofSPbNVuD7cSTP3bxmbN7CAWWsAo5FWWPTuDAZsHUyxZjgKxjIQ6tPYRZZRgzJTO
 fEQTIM3UIIE8tkwmZpbLrhjz9fevECpxDxP9A8efbj4TiwfEMTEW+vBBtnX6cVHXjyDPQFc4Fz8
 MuLmmgEB6fNY0PQWrzN9hv+xCDFBbPVRRWUp2RJec/XhpDtB8pHRsauGpyLHj7nIx9veKc7jNW2
 icD+QCrNgjJY4R/NO2zXwXIjCCxQoYsjQkDLJIq45rlfyaBq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3e82ba0885d03107d54eab9569bb4c5395454c7a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5


