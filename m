Return-Path: <linux-arm-msm+bounces-42885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFFD9F8980
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79921889224
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641992868B;
	Fri, 20 Dec 2024 01:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLLv5YCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856B018641
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658121; cv=none; b=bBWj/6teQ5LrFhUxYsjyA+4D1sPycliYpe32kUphlpUFsB1lgeiiHBLNeCTWtPxKbqAbhpKYFIyT+CwEq4oy1Np+KhqtRI4IqSwa+ap1U8Gs7CCQxjR5RL/bEZXnO3MXlyjZMkZLZrhOiNMQGpbr/rSGzDUe5j3DQFolhiiDVEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658121; c=relaxed/simple;
	bh=EPTpddReUdMYZ2WS7Ttu60U++lU0UI8BvSWUbWEeV/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzMs4vZr8loQoKpuzHiUhLqIbJvSrmMOGNmM0NhMuYpbjKj77Pvv6I+Y5EAo4P00naUqIy7QAAky/Jm0gyGsHgsUB7s2aYMspwBDfKQxamUhY4Nf0eX832BK3vNeyHTy/YFovALxP3FxiahAK+4VE3Ia0X543dKDeaBQl5Pieic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLLv5YCl; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30229d5b1caso15944161fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658118; x=1735262918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+IOu8UV/6vM6ydhmIg2O/tJH2Ir+xajrwaLNWIqsKA=;
        b=FLLv5YClzgDjGZ0n6nEzr2+273GXYZirDmxz3W/ZYQzWW/PN4vtaaFAqdpFSEOaFBs
         W51t2riA0KqbPm4XeGM7XM4Y3ZtfsgiXWz4sDfWzrqNF8q5mZL0+eoA42B+vQSPxxOxW
         N6t68S1Sp2HHEfzKBbLzMRs3syjbfp4tAl8tXCzW6nymP/27OYr0XL1mNBzPq/z0XE5S
         bOOLmIROPvpSz672wq8QuWUiwk4YP0qEqR1VInhw6PeQeJKomqOZVCrLow/GS823dgN8
         b6jmykz9QvKi2kvKcduiSOWqIvWFn6JUqZe8+9n8JQkmYYYL93UtKagaYeq5t6hiwNU2
         uOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658118; x=1735262918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+IOu8UV/6vM6ydhmIg2O/tJH2Ir+xajrwaLNWIqsKA=;
        b=uA+0XJrkQSEbL+USVtN7VkioxXcpJPwblfLW6JjKFw9KgP13SWwKdniX8DuZKJetCf
         RK6CTV7zjISEr2dOl56YU44hQCvEmB4M95cqxk2VtaHM6Tva45//PFfcFjQ0gTqpi40E
         0c/6wGl2rtOqQYc5bI32tkt/AKXAW9njuGuV0/0Z3AafcUwhTY1E8eJY9d2c/WacsE6X
         uFFb2e9qOrD1TWPAHkWRIskEFyBwyvv9I6mL8KsjDgI0XUL8ErStKTAjdEhW23BYnaYp
         1HaC5gt591NwN64AEtRUsJ4yNccr7mp8Ude8Yt7Ejs+oFHS3QrxSZck7RjM6HqsrjV2x
         zk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtagXipqETpRRgKEi3UXOi+5nuwAm22TLKEJBQYw8Yehe7TYmu/JsmCks2ASR0hcSkPNBQpJGESiEE+TMr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0qbgL2ESo/y8EmolPfZOzejsJHhvUefVwJRGkLeWtLUnDtadn
	YPhB59otWGOwElNXX9DxpHbnhu3dl8z6vdW59fL/7Y8FYIJcbbZjVTBAKfT65YU=
X-Gm-Gg: ASbGncsoWIqYwHNzHxJMjtU41HczgJB1XZJ9gNixL0XdnH97j/tIve4quzdNcrab2bP
	FmFXbesb4+LK7kxDzdQUy+bTtfxmANbq69Xi5nh36yWRWx2Gyyha65uS5RC6uvDtepC8WBvvsvc
	7P3hafskP/6KFlLG3DruY+DDQJ8HPqjwT1nkKZdwJm+Kv9Te8f7dr3EjVN6dJr+qAJe1xeMCeiA
	evu0vl2xM58BaMl5g9aCWXFTEMoEFZZSGgcnBWE8vga/B7MVPyWY7uEegRqswe9
X-Google-Smtp-Source: AGHT+IF/gOolHvWa7yF/iCUiShP09wS2f5aMQOTOUG5/8f9sFilzuUtqb9Nhi5hK3cHa1R8oVHUSSA==
X-Received: by 2002:a05:6512:281b:b0:540:1fae:b355 with SMTP id 2adb3069b0e04-5422956bdc1mr180935e87.52.1734658117831;
        Thu, 19 Dec 2024 17:28:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:31 +0200
Subject: [PATCH v2 3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-3-38fa961ea992@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EPTpddReUdMYZ2WS7Ttu60U++lU0UI8BvSWUbWEeV/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+ULIs7Do/CbVm2Z6XMut+0mgevQOhJC9Jk
 e4FFOsZiDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1bvoB/wJarARi6agh4POgzBYGs/R1Pm89eSXojW6joFnqCgC2QvVp+stKH+rcPi2Wl6d+0/o+aH
 BdAxxQcwy/OW+NhaRsZexjjzlOncTAtHoKB+we8AoFIM3g3n9c8hwFokeEvb4VhXrOul5w91yhe
 DsyAFaF3+bmiobrYFvxa7bnUgIPGRCkGOQntnBoAZGXpN5cGaHUO/JcJO5wEEtEB8O3Ok8IpFpd
 89rOzGUCUP4i+RKYppwE1gmtJQoprSHu00XVXVaFBWacndtQwQW6nYWE96xuRAzuc007SEFWj1L
 mYri9Rmscfeo9wbdMqO/zbgQx35nRB4C+0VZMtLLzS2Sj4aQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: f5abecfe339e ("drm/msm/dpu: enable DSPP and DSC on sc8180x")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..641023b102bf59352546f0782d9264986367de78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -163,6 +163,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -170,6 +171,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


