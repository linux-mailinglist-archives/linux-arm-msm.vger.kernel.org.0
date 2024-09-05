Return-Path: <linux-arm-msm+bounces-30818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124B96CCFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E412A2859E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0225145A07;
	Thu,  5 Sep 2024 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aBYe0GCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A471422D4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725505708; cv=none; b=bOo74cjsZxgG0IXj5vm7W0NHyRGdc1hvlMVGOzki1I9zQws1QWOm3Y1rg1d2okyvqyCVsOwh8JLxWxSwq4aQTDkfJMecNKhj5WYG+o3vQF4Gka5IRqXajUc2JWmesf/gW4hhGyrgiH//lQss4AUfooetmH8E53VlJtl+eqeFEx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725505708; c=relaxed/simple;
	bh=/uc/spJSdC+Q0uOvIRVDDGVfhgEPfChpAlvRBCMAkJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZAUkRwYACRvgpfpDs3AUrSj/sMuk4fAom89CYwkha+oaQFp9AkgiOLRxegd5L845mYviSmHL9NWFDFbEjJS4CcRimcwtNxazvGRmBj+qeyLPfqidFqpdusA8VijLQIK5iFxx/X6NHDq5BGykTumOLdJOqNxWtlfbvoLuKjXpfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aBYe0GCo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso229485e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725505705; x=1726110505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCUd9z1LcLMx6hSjP2k+xgb3eFs9dKtX8QI9QhSVFF0=;
        b=aBYe0GCo7NICxWqfVblVqsbMYUI9GOMQzTwz+trBlzc1OK4z+skkAtcVyei33UEuqW
         PYxV7/FyR8h4QIXN2xdPHVQZE8t9O/bPv2HugXPw0mUwdhVSG/dIUXbOoZNeQjG8XszH
         kWHTyTG23HeZSjDG4XXjj1+TS7tYKalRum4AA4/R8aftFM6oTzN6cUIxwjAvsDJ0JZwb
         MLEuW7AFCuydRR2+RpId/8HsiBIlxb3+OYYwYOyAzZDy78ttTgULIhi7q4Hbp2g7OmqS
         7XTQBu/tBiU/1X85fHgwZftcwZ7aUkZFECfzHktLqhpiq+syDEp5NVEpX1/U+0+kww2r
         ViFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725505705; x=1726110505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCUd9z1LcLMx6hSjP2k+xgb3eFs9dKtX8QI9QhSVFF0=;
        b=bhJHFlubosRlVhG3tOONiopVfWdEmaaUWurjzdjnawru1FuWg1NMVnrQ9F8k82T3sJ
         qvcdo2Ps79Qbuj1LkDtC2Uaa53O0PWtalyW9jQVfx7zW1medp2gP5FGL4HXdassAiLTw
         LmOr6Uy89EFLAGjZ2BCnE0QCrQM2EiOGESFx5F+LY0hkRzBYBIHmL6hw03hTCDaNq0FB
         z0hqOoENlZe/cwRNhQUQCUbn7o1rcZINvmv+bJlnUmRGEK085YVa2lK9PwCD/AanmFbo
         WPOK2pFlZS0qiGmBdgROfdq97/6/gShh+IFEnfFdoA/AHDokDmaA5iQqSM8+Tbz9BJKC
         P1TA==
X-Forwarded-Encrypted: i=1; AJvYcCWWQUa60YxHuZbIEyX7KpbLSnzitgWeASL2m/5eecV5x2aZ0hEE8TUHKNwucZ9gqBxbe1/q2RWv1e0svvBB@vger.kernel.org
X-Gm-Message-State: AOJu0YxdL/9P3zxGXRlKobITx1ninI6Ca9hbiUF+q34X0YF/4Powkoww
	WPxzegucaM8TZAlQwLbUpLgI26nbxo2QfHxigEYRV2n00t7Acx+hde9a2ezRGUI=
X-Google-Smtp-Source: AGHT+IE/2jE3CvFlvvIXHzJupYuHbi2/1IhdOJoiEbZkzmE63Jt8Mh6dMcluwOLczC02VOgLi+O/ew==
X-Received: by 2002:a05:6512:b82:b0:530:ae22:a6ea with SMTP id 2adb3069b0e04-53546b91ef2mr14631592e87.40.1725505704199;
        Wed, 04 Sep 2024 20:08:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac190sm2485277e87.96.2024.09.04.20.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:08:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 05 Sep 2024 06:08:21 +0300
Subject: [PATCH 1/2] drm/xe: select DRM_DISPLAY_DSC_HELPER
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-fix-dsc-helpers-v1-1-3ae4b5900f89@linaro.org>
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
In-Reply-To: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/uc/spJSdC+Q0uOvIRVDDGVfhgEPfChpAlvRBCMAkJQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2SClH3jAjsQwXueRbupby/Qyxo1pNCBRE+FYy
 TrQumjDJhWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkgpQAKCRCLPIo+Aiko
 1WUdB/4mLKT7toID+4EsvnWOp5TQO7a7GiChrUuI653sWs0XNN89QO+aQlpsdo+wgVvTcrvWvBO
 C6i8x2AwjrHm9cSIn5uu66DDhCRRCiCelWh8vwvtQNgwDP30tOt38PSkFuLdZhEQfeJZvBPBC/u
 JS/Y5Npl49z2KqrYk9QbimEg9oy0KI9Aj0nva6UW5rNWFw0ZBy1d2taaUr/KBPdp1F2VkUtoWtx
 ecBErdsaSdt5CHrTfB4FXFE8eVr083nB6qqd2UQNsHA2SdUD3IFLJCk0zqUkbyZ0UCXzgizmuf7
 vixPcb25txPAUaZD+YKZIsHQ2gGnzMPV7x1YmszSmdjXVpUA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Xe driver shares display code with the i915 driver, pulling in the
dependency on the DSC helpers this way. However when working on
separating DRM_DISPLAY_DSC_HELPER this was left unnoticed. Add missing
dependency.

Fixes: ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409032226.x6f4SWQl-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 7bbe46a98ff1..ebd0879e04d4 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -14,6 +14,7 @@ config DRM_XE
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER

-- 
2.39.2


