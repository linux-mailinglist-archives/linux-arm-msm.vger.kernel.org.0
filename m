Return-Path: <linux-arm-msm+bounces-46113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC61A1BE12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 22:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4735A7A3DE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 21:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE921EEA55;
	Fri, 24 Jan 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzwKftkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992601EEA31
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755279; cv=none; b=HGisXbbzwI+ZwSBg3HEIWMPerFXOpBMOrJu+mba75WYEC6ti2JamumlldnUNzofBJ0IdXZRk1mqq+zGpnS/NoIYDgl9IHpJNclAiG6ayDl/owCPier/LtUoci9IASCZkDg0TbxDTtFFiMf2CO/DiTRmqpBFRpHk67GsvXG7zphE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755279; c=relaxed/simple;
	bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KufkqKP2ThkwjQSO9skScc+hf+q29Ga8Zgc7m9h5hZYIlqufrHXCiGU5aFgsyf5CkToCHo6xGfpmZ/N8HmLaQRFD5tz31ivxYon0VSiEBv/Dw5drcxzrddi4j90/YkO3vg6pMznve8RO8jV26D62/9YIv2BVpQzpI4S3nd1y8VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RzwKftkM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2632923e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 13:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737755276; x=1738360076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
        b=RzwKftkMECaCFtRCv8VZ/Msx7thz4McxxHsX+zPeF3Y2pdlNVW9GruELNjJtgSL6bP
         q6IMPOnKAgaif8//SBGBNy//uViOLIVDRn0Sma6FIRt/97eTOcNGQzvwmSvPCFTZ3rCR
         ROgrGIS4OCy7ACkIKz+A7xBwtzPtJGSV2Y+zfmgR8Kq54snjrervtmsp+m9WzjdK9Tdz
         T3TZwtuX2FBP0GkB18eFNY7MegHBsxl2HWx+CwZnwnahig82Suy5Jxb7bhw5prHsFSv8
         PAZh9YwzPagPf0bXCmAR02+shldp6e/QoYDnv4oumzqIsQepKvRGNtSXlfARL8nzzoI5
         M8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737755276; x=1738360076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
        b=mvKkf1LDbaw+CGTWSP8fkfky3q8NKgNZi67ttxhe9lWXPZLFxWARv6gVUCZTXIukCm
         rITAKwdTaCqJO6gm2spKQly9+AI1KF8EqJIR42itcpcqZeV6POwB7IDVfEdv6jXJVSFb
         MdfH41hWPnkn3XXNuYLpDCoyRTa+E9It+R5HUMrDV0RekGQ7xxkeAVXy2337H3j1kx45
         /+bYGN2ZPbThE7Ez7SzL34/tvaaaLuhlRHIK4zl/59R+LJ29GJ5+Gi5QNHlzzKoMNDjQ
         0Ayh6Q8C6180gherFNZ03syrCyQ1+7R/9O+eSk3oSROACQS05GDYy+FqF+ZPfHHgSB3n
         +Evg==
X-Forwarded-Encrypted: i=1; AJvYcCUjZQNZVnnzLlxamdInLBYADMdV92JeGxky64CVI4VdoFzjuI8nfMIVgvuHt2iXkk3ehL7k31ZK3t8RcNhw@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNKZkfBgAzf80urHqxD75xgwAn4jcyOIVfs80LvPgJg7dgCVm
	TuETsnBz+CDBx1xDB/jxsK35467SN354aVgIZx41+FwmOw2JP85nmyYULp2KmUs=
X-Gm-Gg: ASbGncu6JYwaWxYRsI1uQx9enwKT+iVVmbhgJOhlBryHuq4dInEGWxusBaQVUdBVF5W
	Ux02lTIoZEJKvX4XLYS9Hlvfe62TwplLyek9sSm2E/7ufwwzF3rAa33Pr5/sC2qhKWIX/pU/5Im
	BRpUyIg7jJ51KaxTpyntLFlJlxfOsBJsVZCJOSvx8HoBkVIu5Xihtz+IH1pqblKXcgD0wCnqt0h
	mdNA4k2G/k+Bpwfn76rTsG/G7GYZaLBFhLbkjr/fZx8SBGsk83SmqhedWRHMsLBmFImsVziWU2C
	F3J92/UHov7T
X-Google-Smtp-Source: AGHT+IFpny/zo/QvD2GXtlBH9/Wtg+ovbNpfKxp+xQf1OkquKUpDU3+qItxFEm0+BjAibqtxEpoQgQ==
X-Received: by 2002:ac2:442e:0:b0:540:1d37:e79 with SMTP id 2adb3069b0e04-5439c249e27mr10731792e87.27.1737755275629;
        Fri, 24 Jan 2025 13:47:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:47:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:45 +0200
Subject: [PATCH v6 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-5-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAqAj2Ty2fi86x5S8vz38vRE9W/qq6R3Kx+j8
 s6w/jwMhVyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKgAAKCRCLPIo+Aiko
 1XyOB/sH/E/XcX6vWytKMOGonps4x1gxBkl4bp3Jc6yHxcVJse0xCsVLRWkTZmGH8H4pTNGlvjw
 0lh0iM1h749lSc96XOQQ8YIZhoKyEy5VXPbZNbO+bXx4U+VLRjN2N7ISWrn49lk7ewlg+DaJ9i7
 fWcbAteWQMWfcNlIE1llxXe66A2T1RZ/P8hohJIwgl8w7Xqw9BPp5oLgqW2XZazB94IRjNxz/w5
 FrMw4/ngqacRX786m4IcsJUIc2+v7SYRgg5QzK/DbiHMa30YHHAIjD1mEp4blSC514ctkr43TWB
 nre1TR8wD6n6w+1y+Z5YqHm+00nzHwYB/eRWUjKRZGsMKH3b
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


