Return-Path: <linux-arm-msm+bounces-43177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF89FB937
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F001644FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3D314A617;
	Tue, 24 Dec 2024 04:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Do/n1NUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0FA1487D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 04:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735014325; cv=none; b=QqfuCp7o68xr2AGdCELgaG3X9xI1cz6fRDPkMswNhHW6mOVuOEqX7YPvSqZ111vJhEVfGTSLldWlVwX/BCg7dD/1ZqwBOJlHTkaY+vrK8EwTuVYpOrK/TSIx7TbWIpVUCR5Y4hQWGhUfFLIaASwkABgggDO0bHq0ptetEno9GnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735014325; c=relaxed/simple;
	bh=lTr2DRIVQ/vw/WOccbgEKc0Bgfl3SUf0BOqQzdNe4NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNSYckDKv1riB50NXboUmd03x/wOKPd41QmF6Z38gitqoaMSZCEUUapDwUPZe7/zY1wCZNv0J691QXoIBCvgUaRMfeeBsLba3qxeqxG6jw6k4mXsRx/GOtJvTN7i5NXAE0+IuRZDWUxF/IVhteJz9rvE2XUP/vt04p0n4RdAevo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Do/n1NUJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e384e3481so4450788e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 20:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735014322; x=1735619122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxKRLp9w0TqXczLTu9OC4Th0gSsjMx67iDgxXuWVgpI=;
        b=Do/n1NUJ68/d5IjUoOvlMDqI7d/u27pJCjMUs//pQaq26gU8LdLUyRIKGNBhM060LP
         zt3N1Vs0rNIsSE2fobmLssN+EGVwMbxU71C4DZqYhhWk5S5lly0xxUBwWelIdWnE8SXA
         pg7hbxEXERtiVrrwcxtapXluAKQu4Dm/IsobTHlW4dNKV2EoaMuUg643P7hCQDjQyBYd
         viAD9oCjgcAzpgQ5GzWs8IFw3qbYnS5+s7iU5bOxnjQPKuawq+pZeZS4MrnfiZ8WWzFF
         NCNwRXaVGWS4icTt/RB8MNJYmPN2x0KgCBRvA0bs7ss95ICuK/0hMiwjBUJR7a6FFqRG
         p14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735014322; x=1735619122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxKRLp9w0TqXczLTu9OC4Th0gSsjMx67iDgxXuWVgpI=;
        b=uXUNXJk7oDQSWAVpVmrrD7HNW47fV7xH7+lQritIOP+CT5hb+ypJEFgaRzTsB534TU
         4g3kzAKDUuEoo2v/l6VWOeU3RyiK+9cx7hx+gWidUkWdM5tiBcgTi+UvqfsQypahO27q
         +8WCRKuBcRH/wrqJST0tsguYywV7nEZXlskddJl9FFx+Fvg18x4y3rE1vWw5ZmudWzSL
         aKVLlB4BJU3Umk/UXD8nhZLzi2oKuW/HLWB3YlhWcs/BSnf6Hk/8ZaetuBIq7ov/Z7ds
         kee4zd6KORJgBzZ/exvFKHm8KnI3hujk0vCQxZGu+wWBEcyC97oa7ivpBx07SM43I2Hr
         HflA==
X-Gm-Message-State: AOJu0YyQpWniy7hUDMxv7FH0+ajMPTUe00TQ6fotwd56A2VTzdfmW28j
	rIFBI8p7ptCOUw9AoK3BtP6b/2bpYhwI/oOBKwZB1u+lyFIWw275TnjN1PagfpuicM5LqexZ54b
	L
X-Gm-Gg: ASbGncvxP0oBg34V7viYBPkimpCBJAxSAt4e4cK7GagA3T2gLrLLC/j2Z3IGJrDr2SD
	DTVBL1TQiq0HdclKCoxIozcKPFvAf5DrPUKn8M7yQxeUo4vIF5YxTYOUUWGwoRUWyRAGTMClWDE
	WHvAclTYWku7fNCGXUmwJi0ef8oyzyB8RcwxCJJOWPek8BYY4b2f5a1Bj2vDP4VqxHWw7g4H/Nf
	tudKZAtc9y/tOcHcUKHHxwzl+72iBgGj562vLKecX21R//bAW9ju9ZYCGvEPjhr
X-Google-Smtp-Source: AGHT+IFzxPw0Ov30kcrG02IRmr8rlFm7Lw6T4TOohgvTbpNyR56xqT24steHLGTW/oS4XtQSq8atmA==
X-Received: by 2002:a05:6512:114f:b0:540:1d37:e6e with SMTP id 2adb3069b0e04-542295434f9mr5272634e87.33.1735014322233;
        Mon, 23 Dec 2024 20:25:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:25:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:17 +0200
Subject: [PATCH 1/4] drm/msm/dpu: rename CDM block definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-1-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lTr2DRIVQ/vw/WOccbgEKc0Bgfl3SUf0BOqQzdNe4NY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qW+dpHrnUxh0Nl+RgLv95RFm5tUP9bFPP3Wn3i9f+3r
 vJ3mLzrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEDsmy/zNqEvt0e6HcZ81F
 Tt55jqvjfKRtuNZ8WHfnkajEImbTHqtMlcqwbZ7fGn9nqjvmbJj8fsu/CadLUvL0iqvSjbkv2y1
 ft4LT0tZlt6G3RILHnQU529rKdDPd/vN1/O0y3VN7x6VQYuvam1x1oaxV643LAwqeHD3RGmkSEx
 nIc3Ra5VmNyez5BqstN5TlL960sXfTtUuWjNfMo2W2X/3wOzGmVMf0ynJPK4HQvqXTDN1CFCMXa
 81fcvN7vsgEmbjEiqcLBJyEeSIN/qXU9O15E+a5UuhKUrCIbFnE1LKwH4IGiZwiCwRn/Ysr0dzS
 oc12YCVLalDHheemJm4lJSW/rxS07Rdb7yL3a0b75GUA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The CDM block is not limited to SC7280, but it is common to all
platforms that are known up to this point. Rename it from sc7280_cdm to
dpu_cdm_0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..b04375e18d07ff2dbbd7187e139e9cb8cf9c531f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -384,7 +384,7 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.mdss_ver = &sm8250_mdss_ver,
 	.caps = &sm8250_dpu_caps,
 	.mdp = &sm8250_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8250_ctl),
 	.ctl = sm8250_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2f153e0b5c6a9e319657b99aa0954d9b190fe724..7dd423ff76a55e0828b8a859ed91deb4b189061c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -248,7 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mdss_ver = &sc7280_mdss_ver,
 	.caps = &sc7280_dpu_caps,
 	.mdp = &sc7280_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 907b4d7ceb470b0391d2bbbab3ce520efa2b3263..99e3b373a8a8fe823a79916a65955ac5f611afbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -458,7 +458,7 @@ const struct dpu_mdss_cfg dpu_sa8775p_cfg = {
 	.mdss_ver = &sa8775p_mdss_ver,
 	.caps = &sa8775p_dpu_caps,
 	.mdp = &sa8775p_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sa8775p_ctl),
 	.ctl = sa8775p_ctl,
 	.sspp_count = ARRAY_SIZE(sa8775p_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0b342c043875f3329a9f71c5e751b2244f9f5ef7..0e386875c9cfd00f6f3b20edb2d76a81b38b8def 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -507,7 +507,7 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 /*************************************************************
  * CDM block config
  *************************************************************/
-static const struct dpu_cdm_cfg sc7280_cdm = {
+static const struct dpu_cdm_cfg dpu_cdm_0 = {
 	.name = "cdm_0",
 	.id = CDM_0,
 	.len = 0x228,

-- 
2.39.5


