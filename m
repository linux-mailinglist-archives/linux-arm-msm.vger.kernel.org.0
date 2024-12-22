Return-Path: <linux-arm-msm+bounces-43080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6C9FA7F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 21:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CFF4165AB7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 20:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00CD193067;
	Sun, 22 Dec 2024 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nw7RSGHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC39E1925BB
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898456; cv=none; b=QT+28jQ9reiRGwMUcuzXlkoAszFOLkzvjLWf6slLPhAYT2G/OgsVAI2aPaDfJ392KtSCJO5a8h3asV6yq0vhtUpd6sJZwsvqBRiiVg35pc8BcvlBoORb+Nx03sPGekzpyx6sZDXvQ///v5FhtgVNNqbVnSv4B63TMXJQ9a/Z8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898456; c=relaxed/simple;
	bh=pwp2kwUxVvqIf59YFiuScbWDIyecIHnjWcyoreyeCFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFNtDglzy9UUeVUCheXGEgSiXyxWszHqvc3QY3K5wUDolQVx0P78YAyxAwGc6A5A6CXzpvU6DSE6N9z55zUP3+vEMdeFGwPuIadsPIrybHshxmjku1HXa8HXR7bas9S7f+8tE7FPSpY7gAaLLeLOCcCICwFqDap78NJfnQRGOaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nw7RSGHG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401ab97206so3618305e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 12:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734898452; x=1735503252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfWsP8zJ6Bd75v6qXHtg0PPjaDnw7fwLfE4CLjuKSrI=;
        b=Nw7RSGHGPdsSHcpLIbSxpqGwfMp9c5Gl/rL8ls7B6QcIv7F5bDCRMvEYsPv/WacaFa
         3pZxbsi5if1Z3YvulBM/3OYguveXbTDDHiva9Y/rWXEt1gmCFz23LnnFfob80fdbEvJC
         qArcnVIz4KDcdoJKP37D5ll1Y7ODnCMh+SFD9NNyt4ZIYCIojD8VAyWWJoyXvavz3RA+
         hV23AbpNjEqvuwaWKjC42DnBql7JzOBMqJpiRRUGRI0hj2/UU1nG2JXVKPz6tyAbx3Yc
         qO39jcsA/3aRDq5J0ozv1qjltCkcr68C3jSq9nU2QqJ9dbyKTf75fQwURRIiUqyo8eTM
         jRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898452; x=1735503252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfWsP8zJ6Bd75v6qXHtg0PPjaDnw7fwLfE4CLjuKSrI=;
        b=XiQ3UfuzSyiupi0LYqOXs3uSA9eKNjNPPizgWWAULgt/nmBgVlb3RV3x3/AKm/pjGc
         Dey3ugRpgVD1alczCozEV47HkV/dyfaazaYEfvOtcfdtQbMTCaSHGendg2JGPKkZPQnw
         LyekSndESSHEx0VrGK4tD4MtONQtO1UbTMrGwB6/0MMnGnqFq0eXoyjhlU3vlArDTXMc
         h+VaIBYMce/agPOsov50TbJz1/1Sf7hdibQKWMu9t1/Uhp/h2uOqiKMTdsWnqH1KN0RF
         cIfGiVZX79ha7WCh8kzdXjVPGLCV+Lh27Btig3sVPTfGMxup+4aC/Fh2tVTaBsw66sPd
         WTwA==
X-Forwarded-Encrypted: i=1; AJvYcCVUs83brEeUcpWrM9qprvaGyikd35pY6un60r55qnvJQM1jK2M8MOgtKhdMrOh9xFXJUmFtTGvpSzxkLooj@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2RB/vhnrH3Dr2Y2H1rXnQfenou9TGPChhWzaqRKoZBFbNeYJ
	EhIf8jzKJ5apuSyMS0FDsJt6pUu0YJq2oWYzWj9mYUAUWNHuHclaai4Cupi7V70=
X-Gm-Gg: ASbGncsEDZwYw2kwQ3LMLmQo4no2iBrCjUva/jXypmairnLn9jID5a7ZL+tCwy9jZw1
	cPMovi2kI4eJZ42KFGwlePBMtZgEgCdnPJKhb+3z9iFJqz+h2y9EhQ3FfisnienfbMC8rmEhV8I
	tNWVAILGogm6XcAwqcQeMmMsioh/q32JFz+v6uBSt1T7Duwx6XIIjJIXyLf2vU/Zv7ivcR8xraP
	Cjxg5jEg/qasmf2NMYrYc9t/xm1gRkC7EgclgBwahoVPF1McZHvA/T33KmMghXN
X-Google-Smtp-Source: AGHT+IF2hs7U2IOGhzcx5YpO+C2EoTCBdCFGQtBxCnmoWVldzG+ujthX6kCy1bdhismRsdOvmBoXIA==
X-Received: by 2002:a05:6512:1309:b0:542:2934:71a7 with SMTP id 2adb3069b0e04-54229532463mr3380150e87.15.1734898451761;
        Sun, 22 Dec 2024 12:14:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:14:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:04 +0200
Subject: [PATCH v5 01/11] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-1-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pwp2kwUxVvqIf59YFiuScbWDIyecIHnjWcyoreyeCFc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pGMa++0LZ/1XryNU8XlohaeJpOvM3S5L286MlyAQZzM
 eUHs5Q7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARpzz2/zGXWevjfXwYtV1v
 /PtxeepZydq+SV2PPRnclXoqvzWumxjZ9VfvBl9PUJSqxO/gxtC1wZGTPrEsdhEvE5tyzCnxgwl
 n8keNQ6tOhhl9dVy7I6IwymqR8dYnLe8m9NdlulcevWrxJfPo9zUiyrnXznYKdq15mx/2ao3JX6
 N7yj+2XxPNfHVoIuecZdeLD5kn956Zc6jztUqWYkEE5+HLcWpxR/x596zxb3bfscvKljP+8Zltx
 yL/cInP6UyP7uVxjrj6dQbjN2ZGgy8b4lNbvip1T/lwXUwgU21C4Yk791bVVUT2C+QzeYmkM5x8
 c2udCLOeh3qUzfyVUsvV7V7wtrgyF5jvuhy+f+OCKyqvAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
driver gets DSC support, it will handle that register in other places
too. Split a call to write 0x0 to that register to a separate function.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..4f80eceb6ae19f542110d7379007f57c2ac16a8a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -486,7 +486,6 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
@@ -1039,6 +1038,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
+
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9c463ae2f8fae916661fef1c7e225f55c1026478..b9c461fee96f8fae9259ce03a32e1155b42d17bb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2011,6 +2011,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
+	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
+
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);

-- 
2.39.5


