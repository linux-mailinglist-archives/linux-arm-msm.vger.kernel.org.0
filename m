Return-Path: <linux-arm-msm+bounces-47215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6725A2D20C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F8C816A3B2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847FD15278E;
	Sat,  8 Feb 2025 00:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0WZ3Zxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D91465A1
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974441; cv=none; b=jdSlVk8BEQefWRUB4ttS+H8zxT1qSo3Uv2V8XWDnhHL02QGPygTIfMX2cDGo40hQ9d0dJ25Vet34FolG/tdEfFeUVySQ0p/j/f7blRE5H6pR/0N9+mNE3ayildGveBSke9DWmXBPe98kpBldCIg1B+6eIe201zDE3gmU799B/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974441; c=relaxed/simple;
	bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jx7+38nF1t1wZzITS4m887SCfGa87WpHT97wBukArf63PbP4Pvr0y36NvkPatKnlR0GDNicFAEmE4SPtx+jklQ/h8zMKRx+9OGa67sHUP2EDPjoAF6jnpVQYeiJ52zZ2wHbGopz5sJ5BbU9XQAUt2fCtl47wsZ8AmZafW2RwDRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0WZ3Zxh; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54450213957so1457307e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 16:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738974438; x=1739579238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
        b=q0WZ3ZxhoyKJMbYTfe5Iv7XrObUJ3GlwYtOkxAWVDZFbmwv01Zj4vFgsxuUoxTCw1F
         Vd9OpUGHzxMuiYHAbNSFxVqjGGmbdrAUStEpYoMumzsj+cQ+TD3h68Ya6tKxI0/0M91P
         WjGbE71WG5z9HoHBvm0kj2bIAXcBEwgeDkirBKxbuTVrYfdaGBSHbRIj3n+D7gMqW+Ap
         SwWs78jIBnpWZGdhdjhw4P8Yrw3N93fbNCa2ZIjceodQeVzohiSZD96W+Np2HaNlmGT3
         JGYJQqqePwDrBYCcD7+kVxDu/2MOtQFYa4owkubwKiEbLRHkLa4fBDbUDBS9gdHSuAw+
         4Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974438; x=1739579238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
        b=oY9uF9ux9qPLKZzvM1iuuVHCIqNpc4Oq6IyJM3kDCH45jK0FF9Bvq9/TNxIzcdbGa9
         UOISqix/KfkJKLALxm5GE7P6NtB3LhUgonbGMavWVuFy1Fxq5vDMNCE3wMMVUFIPuGCp
         NfR5RmaebduRW8M0yJdwVY90XaBq9p20Jw+e7GEEEu3bDZEyToIMdHeoIygB1XaDzQqv
         xBNsAuiraUtm1sda45tlvXm577f5Vpudtm2iCsNIT067TGIL/88Er0GaAd6NBo5ALuJp
         12H0LodBdzIw+HpFSrvLVLkjJXPRvYzDFCGIAL4qdCgzPZFjptZvwZ1aV9W9K8ZdHGim
         1BFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtcSAPNl+Y1eWFoxYb8fqPB37i16La+e/78cs5f8JJlmbRnSBpsuWYgA9CYnPy8O+JWnQ/RKkJgA+YnnjO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2q1R1/vtz7UJ4i1qkB8ZTARgM0SmWZdMyoxQ0wXUHNOUtAYYY
	gUNJhCzqDQ2FKTngpXVGcFuQn/pMc80Phs+dckJltfchTL21aDd2cxNQX8wa/vs=
X-Gm-Gg: ASbGncuhkYbXVB0eoEQ4a5PRCO8AjMf6khefAJ+S2hYG9HWdQ7UG/MlMub4D4rIPSRL
	YVIxKRuZKHx7okKHbh4hGCg3tlA9F439IReG2fnJwVnA8rH2SH5fv0zG3ST4hU4f1gT/JD7cSBh
	gjX7xjTG3ZlNlBmBp8Af+XBbzjqacd7UFcuJgsN5CGjUO90D7QxTvh4NApntNnVsgBZUC6ONfqs
	swgFNXjbX/zvB/d2DtqK+klU8eiKT3NvCXemERyCk9IUMQqe2wMNv+Zw+LmMPtuAXQpwykT/Gve
	qMagOquckMPf1rN1k5tjk54=
X-Google-Smtp-Source: AGHT+IH3Y1P8IibRE8PimX3QdIBB+8KzPyv/64NtH7atJbAfIgaIwZ/7O+qYGCTF7buvXpdwnAV/hQ==
X-Received: by 2002:ac2:5ec4:0:b0:545:17b:3cf5 with SMTP id 2adb3069b0e04-545017b3dc4mr708605e87.47.1738974437603;
        Fri, 07 Feb 2025 16:27:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:27:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:04 +0200
Subject: [PATCH v7 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-5-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTWrQWEFDbf9CVC9qgdBlK0jVKQGg3SKi/ON
 gTwwoScGaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1gAKCRCLPIo+Aiko
 1cVsB/0UtRNEVP2jHnQ9VOIFCpqTRWZujCjk3DakRH8sGwjX3o8Ui0S08wOopARizocxJmZ1zYZ
 ScxEmA6sj7kqrqFTXVxj73vdIywI5NsBL7yzMuTIUJKGXxgD4T9jkryGkJ3j1PGOioXSHBsN/AB
 +INyVwx7b3sd28sfgNwbvD2UpXCu5p4aHJVpe8LQoK1Ax7uYY2Pr85JyyqNsPfEWgr59jALGcKV
 hj2oVjaGpYIB5BO3CCCpXOouh7oW1fOah/V9XstBTV4QYNPAeplmL+jBwZ24nzhDECikLHvicyU
 z4T02turhxBUomrV4Lw7j2gE1nnyBCsTkr79X5EzFNAyd8ik
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 1cf1b14fbd919e041fd7ac8a0731d554d4468f4f..0ebb96297dae80940dc8a918d26cd58ff2e6f81a 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.5


