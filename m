Return-Path: <linux-arm-msm+bounces-49586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9556AA4730E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6AE1889780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 02:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D901C68BE;
	Thu, 27 Feb 2025 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqFNocb2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5B1B6D1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740623125; cv=none; b=DUmNTVc+bIpQH+9Vj2XdY8wJ9afZuSW4WLIZs8fE7Us740yxD/Pj4/Jzh8Ov3F/1DDQ9q0Xt5doX6grC1RAxeV6VhQYB0AYX0+qFmzSanVHkjoP4L4PKeonGps4sC+s8FA7kWyoBTEqIcaub1A/+wDOhj8FreQ/Ql8AQCJKOQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740623125; c=relaxed/simple;
	bh=ydZYZoA0TUi+Gh3S8eUOrsgEJcPFXVh59QDIeik/wpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFXzTPubH74oINYNpPTcBHsKmPiMYn61TQwjXGS3mYxKwO54XAOyVDa0/L1Zl01AUBmUMFN7JFXEy/bz/p/qh+yT91HZEX3O7HbIlSfWlpLdGLyqgBzjXWmX/jqo7oHWtG6MP1ixs1p9Z8NTAnI+yaKqanxBo2vT+oisbEu/cmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqFNocb2; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5461cb12e39so392092e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 18:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740623119; x=1741227919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwMJpPPmQJzExGwtrw5qRSd6mRYkoPvcGAO5V9qYYKM=;
        b=ZqFNocb2k5qAzVZmByJuPIFHSjw2eZIPbxvu1rNlAPYMP8hXE4keqpJJ6FuYIFqA1n
         /nGRl1Kru8avYqAD1/6Nk8WEV97HATzBpzhTJ6Nx5OxxZzDL3EKjLJdXDvXL+hRFgkOP
         Uxs7YQfM4T+/z6LiCdSom+NPhNts3EXINDA5ke8+cgu6UAUBT6bzoD7xsNvGVrVlbDvM
         gKGxn0QerWfl+lmR3uuvrOXWzXaKouLGzZL9flQdE1xh32bXpZo/SRJQ9IancZUJx3r8
         47vx21wDdO+d9zz2VdR0bebTIjTs1YSBUXq4H/PibrJNwEN0ZImn5UYjY8mIviLk8SrM
         qYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623119; x=1741227919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwMJpPPmQJzExGwtrw5qRSd6mRYkoPvcGAO5V9qYYKM=;
        b=kGoz5fn7AyEZHIQ+Q/Ol7fkwWu7+TpvsuqcuYtgiR5xCVRa6d4rQ9EVkCyyRhee8Lx
         amiTZh1J0mnnj6W3H0VPEqlBu4pR3n+l4iTFXkV1tJHqEYG6ESGvN2zbStpB0XgD9eYV
         Uj2N+UB6m3ys8XuWqn5HAWG3RnBLvK/szA5rNjT3liMfdtf97pHSfc8Nk+lBDR/Tnn0R
         iaAJKFBBBKQ4/GKyCnDQGvKVR3d+BT8mqO+T5V/EGKnN3KKHup5B59bW2FEZPSvAuUh+
         OASDoanVP8K0RQP1CYsoVNvLEvPZEpiOV7Gh8mhuOqxVtSnVHRUj8+0P9gXPaUhLIwyn
         QX7w==
X-Gm-Message-State: AOJu0Yw/umsTTmV0nTXZ4nKkGofoS76fbeap+nBboMFkpQZgqbjuEYc5
	VlsnCybsBH08udLY5vyOFKiQfeTN6U9RiV8XbPdhXkESa4R7gnFmxjof5Xi0Wyk=
X-Gm-Gg: ASbGnctfE1AfIhvw+6qaP15AUAvkVfUkdj72kdv9KzrGDtrG//B0zmcqM9n26AfL0W/
	+ONjIqR3bOtmJ7x05UNGs+N/9SXhMYMP+OewFVqEQ2ihrakTpK+2Rbw9H4m+bOoArp99thY92Ex
	cuVraGl9L+3E0ZqQVDWGAUdeAMQheD7nME0G4ZrrlKpcWkKltLJR9k3huo2eRVcKpxO2gXvgBih
	nNdixJwmcWwg4dzBaNlTvvl4wbM5VOxy1GwyBW1/Hln6F4JsNmrm06s4kumMzAjyb3NbDrrYMhe
	jCtudxCP/iuktcSg9eoPuNSQEoAGL57aZg==
X-Google-Smtp-Source: AGHT+IFMFzSt2wsG3oOm+5w5wwMdb2DuK5Yp/Au+CFco5T/pzSUdUvjy0J4YD00jtRalqEX70RhAkA==
X-Received: by 2002:a05:6512:200e:b0:548:794f:f9dd with SMTP id 2adb3069b0e04-548794ffb8cmr4463137e87.10.1740623119107;
        Wed, 26 Feb 2025 18:25:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 18:25:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:10 +0200
Subject: [PATCH v3 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-2-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ydZYZoA0TUi+Gh3S8eUOrsgEJcPFXVh59QDIeik/wpQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80GyadA2VzNwTHLQ/rRvBiE8jpMBgAfbiyde
 YCGRYQ0O/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1ZDVB/90aFrmR5KOT95tmB3pWLZEsq87+yhuvUptiF1UJSOURslGc6sVg9ydUx9NCix6I56zEbW
 3GyGXkGhjaQdfQhmFp7u32GGTj7dl9MzYhy+0vcprVXVPn3wkOfwYoL+ZP8j7EKEO0azkfZxNBo
 APuBMtzFjaX8PRcgo7MeQMyxLv5di8a/xaX5TF/0FE9FPAE3vnL4erAXNQvSqw1i/dUOr6BMqOs
 ysFDUPsAzvwcqlgqBgJav4+a2KJLzJrt2BDDeH+wsQ+b0SJ/koY1jFvs9pQR/VQ73GVc9rsWqjo
 G5DuZIKjsVNaD71Is+vFt/CQYparpNF4JOOIxVg1hnWhc2bD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5


