Return-Path: <linux-arm-msm+bounces-42887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C179F8984
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C115C18892E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA0070838;
	Fri, 20 Dec 2024 01:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lu85H6Mk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE746F06B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658126; cv=none; b=D1Wm8IKIyZfVmD6yiyIXTN1manTk7tBMEVmJbtUXiKvjwuqN3jMR3fLb1ZhLENQB8pe/3jFNK5Zj8/m1N35sYQtOjgOyRVeGA6voJRyi85GqL3ltnoNqeMnnG+Q/spa4GjttVpydg8t9hqLTZPasYQdXuaQVhvhRbOdgnYUDyEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658126; c=relaxed/simple;
	bh=i4FVDn+/rOcn2C84yQSmmpsO3jO494mbVjBwMlV07+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVVED0/tiJRf7yXPqCEbJcism/epMbu4k16w6XzkMxKSaQJdwGrvpDpBRyktn1Q3P6SNx3Jad33dc9zF5p5W2hajFDo0t4+nu2zTDGMWW9binM305lkar+rSdW0ZxyDi/w6By3xvgWngQ5NHTDQNk+IfRj+q5ZgS36U+OgeuTak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lu85H6Mk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54025432becso1452764e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658123; x=1735262923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8niegYZnY9morgL7MxhpeF/UQMeeTk6uKDQF2VfVac=;
        b=lu85H6Mkrxc+kvUe7h5mD8qdGqPooPP/4FZcV297BMD//p5gtICKbKgAW/lDvXNCs5
         YCKhTbnslBkQat9X5vCtVyvF4umih5z/JodNBiUJCThI0DXmE+xsy1j/Mbj16kRJfdBL
         5lylyOkfEtR4Kglu6YmVHpvQrkL9fh5jrINLi4rGg6m+lNODi82QnCwkXtmHa67lgTqP
         +7DpnTmcrXvh6j3LT5VbX2GWqxFSCtL2Q5gHK5WZN3XeGPmcjHjAoDki/1UkJ9/05fL7
         0f/GBoY5GFTTwwiXYnc/42SpKloR0EpFejN1MQ6bf1DNTM0lOS7TnFgdbkpIl1nsc9tO
         yZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658123; x=1735262923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8niegYZnY9morgL7MxhpeF/UQMeeTk6uKDQF2VfVac=;
        b=An81pct8Yld2f5+vkg2RRZEwUY0jrj0hxNfNnFx1bMFuE/Wd5PsdFi9EXiauHGCP25
         8irE/zOCNPhKlWIeAytJUF02wEvwiHYp+oW89XnUD2ZY3fWKq5y3gbXufktX8Ap4Lwfw
         Tdfkys/Ze4exXgacxTMQ7EYhCwiyogKbZMH50+GCnZAw03b5qRP0b0T0izSxLrMweKgl
         2Bpa/lSQnR+irzi1OPQTAqQVHqxZUOJwpooZApKgLqJqKYnURwRHnilIMHNA5zfo3HGQ
         YJ3j5OZDVS0zT8orn2TJjrgvGQz7xiW3LeyhEuhiup+cpRN7Xpc9uGE1BevEstiuOyg+
         WSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyuC/hlFTofTv5HrPb89GhC+hyGYgdngVpyTVr2cVGbEAB7D63bkTkPnlWAutsT8ihde8GmsSzzSlaBYqX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jZ7FILigcsZTKFr9YOeD/vTIIPsvJ2vF0WxKhlE13P14qAem
	drqUAvrlpPjM6yj+VSpRNqqqOdDfzXOTc4en77Glq/Xr2kzW0EOFWjiH2MG9hLs=
X-Gm-Gg: ASbGnct3Qie5M/LMe3gSSEOFyVK9uPN774ww5mFHyGcwViRywb2bqcukXasxVc811ni
	ppv0AHgPytr+NEUi0mhB/IUxRsTKCGOWjw1wJkSl75fTGOoVEWiIP2KAqaFIiAKHBVkr1S4pNjL
	ChH0rfkH3IuStiNkXh+ungpx+slcaFYoxp5LVLnTbFO6CSJhhjWkp2qhU4/vAOw4oStcYqcHFxS
	7qQxAuIB9p1IPlt6KvkB+MP4GsOurcsuWsGQlxrbW6pViJ4bRPsCtqRlOHIhbs3
X-Google-Smtp-Source: AGHT+IF5Nq2wfvPB92CZMzX3Vkpwjzw8xyQ2wYN5LaM5HZlw7C5cwQ3Tpe29jJapNts5wwecQpNCpg==
X-Received: by 2002:a05:6512:3b99:b0:540:cc4e:6e20 with SMTP id 2adb3069b0e04-5422958245cmr173527e87.42.1734658122638;
        Thu, 19 Dec 2024 17:28:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:33 +0200
Subject: [PATCH v2 5/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-5-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=i4FVDn+/rOcn2C84yQSmmpsO3jO494mbVjBwMlV07+c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+fZYsheFVecn80/JQlhFbjlEtvUNOb5WRv
 Y2n8WFMVhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1YoMB/4yMWZzpGpG+2PXtT/HTOXM6tBCGMchJ/4CkZavOgbJxQHJkQjxk8vw1CVxJ5U/s20ffmj
 MOkyl9JUAElhkUXb8wt0aqM5r476DzWlXwcCtKsUEvmbZHYzZLGSqYFsk/SaYfXxk5bL/31ZGVZ
 1hTNDmw4hhs4xYpQ87HvCnTrfTbV1T7GaiFXm8fuhaH7M3AM0Z/3/74R5IjdkpTCEbtQui/nNhG
 6vG1agZoeNsl9f02sHLpTgq7EAz3qKipD4X7ddvTwcst7oLxo/vI/KxU35F+pjyn3Hy4pW+vrD5
 Cz0wSqb+t+w5LIESymNJ4Ij5C6mTZdDbJhcZcaBL6+JDg45f
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index aced16e350daa1bf5d24078b2468b5095a40ce07..f7c08e89c882038aa658955ca1202bda3d928e80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


