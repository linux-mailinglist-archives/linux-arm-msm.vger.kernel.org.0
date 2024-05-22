Return-Path: <linux-arm-msm+bounces-20192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0698CBF8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 102E6283900
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CCC82871;
	Wed, 22 May 2024 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMUeZCxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26538249E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375064; cv=none; b=fBPjz8tPHh9IuUWDnK2MylW4UQ1/0G8Qg291JzmS/CLLJIQ+nx8cedC1pf/VIejY8mSS1dgWj5UEiJ4ECur5q5sjZz5HzF6wOV0M3GxOS+OYlWhvY8FGEWWB4L9MfOLX/uZn4+qMxPyYA64/d1D80w8+OZJ7zdsUNsdxTEyElDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375064; c=relaxed/simple;
	bh=v9IgZbEVIzCU//v+7Xjr4VR0vD49EBefgZxRpj3Zixc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0+8B1UYvncplbxBnPFT2abYMWU+wDJJ240HdAIryCv+jb9xDi6YFQxYbhigBbBotzOajqr3r+XqC8NprBx50DbRqx4JWv3tACs7Z7bwr0bTXQ0e3O5K3TAg3CI87c7dDNhGXiJh8+N1Gjh1TiYgB+CyGbO1wbrb6p8yAhO/qlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oMUeZCxD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5238b7d0494so6428332e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375061; x=1716979861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cpewU7AgCBeUcebhA/squE/VnkWqKDOhJWxtD0Wziw=;
        b=oMUeZCxDlmZY0BipfZBye8cMd7mS1uOpJiXforiOXxfT7WARyXx5lhXfqEeHHmlUzm
         vZNLRkM70htEyPM9IvXMPITKkFFMs5wcZSbGFOS3bUbaq3B3tadTWrr1zNOZYWk2U8+T
         J2+pAQp75r807Idmk0Gk0WpTMEfzzXGrlsO9TdHDIoan1tU8BS0J9JaH8yKjbSR6u096
         ZKJ/huwiyccSUhQiimk0n/UcSnrpbD7qBUaMCUt6cbkwMU05i6mcVg9doiwLNDhIHPiS
         b8oCZWEZYWGCW1auJTx6Wat8OElZf9NK/Iuej1m+dxQvepW0EmVHB7ncAjWPc1yc81il
         HVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375061; x=1716979861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cpewU7AgCBeUcebhA/squE/VnkWqKDOhJWxtD0Wziw=;
        b=gU8llgxg5bWQFBjb0UVBZsF76et1MDlMc2/hJuHS0EebUJKfF0xvunERMtIGyMg71i
         w+KTy20KygHDqGVxnNQGUttQwgldbEWgweZ1dOqhQFvRMLggJg+I9f5vSN9BVdOqL/Kk
         1CGd1J7DDgcM46nZHszh5oyqv6RNqvbn2ByVo1dVZJQnmRNlHreeE1wUmTVjHDfL0+Bt
         AN5Bs0AhDdTKqFXGkkuzb/xqHYeBZMRxs2ev1vTh1nfa5aL6nxgto07bwk7HRTJO3Ydb
         vyhTmQ5q68FNzQjy6fkbsvKC+KovinLx1646i5Uet6BDR5Jd8b/jqqDa3mr083F3t5bd
         g+9A==
X-Gm-Message-State: AOJu0YxZC1Sf8llM658PVGXyE7w4MmQEap+9hGPWvRX1zqHaF/Q5i4Ab
	8IYpFI58NGpU+q1oZ6CNnL4A2CETdkLQJRBPM/ZYcFRHcm3ao1+6Q6ZzeHIeMeI=
X-Google-Smtp-Source: AGHT+IHA746vcyQKIF6ARQUrKclZUZ17SOeurs4Y7bb5zbXhpahNcHMlhYUZc1enWJkGEceoCKPVVA==
X-Received: by 2002:a05:6512:2030:b0:51d:1d42:3eef with SMTP id 2adb3069b0e04-526bf82d08bmr1528410e87.29.1716375061315;
        Wed, 22 May 2024 03:51:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:56 +0300
Subject: [PATCH v2 04/14] drm/msm/hdmi: set infoframes on all pre_enable
 calls
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-4-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=v9IgZbEVIzCU//v+7Xjr4VR0vD49EBefgZxRpj3Zixc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PZtDbcPARHAK4vTPyxmPCjneihSIWI/DGZ
 yc1CddrMImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1QuwB/9C68k51MnziXzY9cD980CHlYfmEBZfzN3HRPuRudP0j0YzyHWgbm6wN+ZIQY4jaqGVNXV
 4T6y6ytqk8N1gNtMxki5EfrFIiQDKRYxXyAYrRgiTzzjI0g6vBAThzSgKlJwXnBzu3LZJ0rNPBD
 gRrFHl1GehF5mJ64QLav5u/c5z7EuAX5ElXSH0DjRsfdnMsGeTyD73KCyNw94bk7XeeGKf6R/bU
 6k5iRyb6YQLYbv3Nkgy173dvexu7PNVkL6FDi3yKAUfCG+i9b0RlqKDbYT8r+VfvR3bMX+n5dt5
 wCrGSQLNLCj7cHogLW0nFCKGhkFBzo3TPJ2i9qjyMejciR3l
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In consequent modeset calls, the atomic_pre_enable() will be called
several times without calling atomic_post_disable() inbetween. Thus
iframes will not be updated for the next mode. Fix this by setting the
iframe outside of the !power_on check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 3c6121c57b01..fb99328107dd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -133,10 +133,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
+	}
+
+	if (hdmi->hdmi_mode) {
+		msm_hdmi_config_avi_infoframe(hdmi);
+		msm_hdmi_audio_update(hdmi);
 	}
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);

-- 
2.39.2


