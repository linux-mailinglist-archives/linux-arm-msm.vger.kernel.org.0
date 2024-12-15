Return-Path: <linux-arm-msm+bounces-42277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 500059F26D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 23:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A7A2165075
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 22:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046D91CEADD;
	Sun, 15 Dec 2024 22:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+qSPw9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322C11CEAC1
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 22:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734302670; cv=none; b=RtLtxTPDR0s2t5fyWc8iIG3ELS8tUZp2P04HiMrj3+7omGi9OGfrrnbDtFphBJLD3J8fqq2SdCaWF/eVVrrHZRHZqYdTrDR2pzGS/htxAJ8VHWCUjRfyvuEM0K1/dt8XCCaKNM9Q7Xfvx2LIUyUyUq63Z0RSDlrcyMy+JR7B2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734302670; c=relaxed/simple;
	bh=uGnZRrKJoZhV4YQRCG927L3JErIL80muN9PIVthRAy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7/xFVeQJFhJT00zll3jE3hgnTdzcm4649yRberBvRlv/SMDFCY+OHf3gEqMuuxnYZNUC47qeSDVYXibcZZZxYZ1NDIM+Wa9Zh8iiZA9L7K4De6BSbKECWR3ItF3mTpeHhvDtCZe9gvN5uaJVuK0zKusuIrrsmTdnfOJniYjBFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+qSPw9p; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so32368251fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 14:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734302667; x=1734907467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mux+X2T90rARK9K4me0bLNJaTeYIMJC1kTPXh2h86DA=;
        b=H+qSPw9pMs6blVjAQOMEWWLl7qUiu6UjIhktQQcE67OVr+Jm4TViZHyTfVRgGYeAz3
         7M4oC3WCFNBPPBlyxLwYJWuPDYBrvXihjZr53Ar1F4zu0PG4KxJ+0Pk8s+o3yd5ifnWw
         EvEPqiTRfNOAkZ0r5l1dmxnuK8S0lJfnDeecVZbyhEdzlWn6To3vEsZWKpSrLqnHFon7
         iySRCkeiEocFbwy7/TYWtN5F359Vh/zB405dHzHSawFIfeaPJ/dfrDaiLrPolUiMPZAm
         Fc/eAdIlctYNJHchZCh62FE44jh5BsyB8jMXVXuHcY/scWqj6mtIBwUmSnjW6HNuE8f1
         Qjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734302667; x=1734907467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mux+X2T90rARK9K4me0bLNJaTeYIMJC1kTPXh2h86DA=;
        b=Hxic+dEWl5vm6FZT9PLEqG5eXycx5U3COUnBVDNhL7l5/kw/eQOhwhszV6hGMb20/j
         IRjvChcHjF6t85J0stN+TNE0M2CUCmFhqbvVjuum4Ws6Jx3PdM3s9bDMqtJJi4K9BGIL
         TcROCR3reyqQDb57+G/mexANOU9xsIHQhmnKsYZJaXPnk5mA2yPeiC5rR3CKQWQ7yMi0
         az+BdmXfci1i0OXYUf2q5znySrIlHJrCklE7kSWXG0mEJquRA1M9SgzwHrorlkXqIfp7
         Fb8Nvj7J2IxP1zXgd9qwlr5CIfzRsdsAlkElDxM6H6ZR64GawO2MBrhh9T7m9W0vBDVj
         ZXbw==
X-Forwarded-Encrypted: i=1; AJvYcCVwZbiTDpOrarP6JmxPIfn+kpogGOx56m+TNpjuCwrY+s+ClIv2MQnfVa61ZQV6B4o5Wr4FC4hSNI9EIpns@vger.kernel.org
X-Gm-Message-State: AOJu0YwukuqKqkyueU28V4IB0E6DO+okew8htCG0Qzyt0JElb9oRZat8
	fjc9l8pfOpJczhmx962+0Aji6UYWz9WOnHxVzdJDsmzDOWCUW+2b0GgmTdYGdiY=
X-Gm-Gg: ASbGncuitR4YoaZn7pfO6P+e5x1O6IOU0+57Fxzwp4+EK/yoebPiy6cxGDoV3oCkn08
	WhUKw1/hlDq8tv9KbtLaFmTw5cCgASKv4DKFrr5VKnV/a5Mq8BHmuJanRa7tdK1HzbA9ieXGug9
	FvSaDY3GGLAHotKT3awkBKWaZJHGQYlp0KBSwNnoldNjN8+9M94R83aVCgq7whBwxrHp4BFk4ho
	3+0GQT/k0ofElvm8VCflthCBNqIpGFmKcHIFdaVtvX5B8eMfTqTNTXRBuVmIZuU
X-Google-Smtp-Source: AGHT+IEq3ZSHhSfGAciD4CoixAdrzoly+2VPI6MLxX5QrDDkNWHI7duVoDIS29ql4JE64rpxz9bIzw==
X-Received: by 2002:a2e:7d18:0:b0:2ff:c242:29c8 with SMTP id 38308e7fff4ca-302544e318amr26962871fa.35.1734302667392;
        Sun, 15 Dec 2024 14:44:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 14:44:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:11 +0200
Subject: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uGnZRrKJoZhV4YQRCG927L3JErIL80muN9PIVthRAy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u5s2V6HYGYWdaq0LWCQVdXUekZ49Bda6Fml
 emCsVBina+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buQAKCRCLPIo+Aiko
 1SHzB/sGEuMbZ3IWUbSZECISEc6h8hHaR6+noAaxl5hFc8WULW6Tj05/3XRUn2Ttbbxt+E3K1Zx
 JLsnwDQisJwq2SKAh1QXWGKzGB/ig7CULjSUfHkIva0u/LTjWXcotaqZCqsCN/Q2e+J4F9O/Lfj
 X6FvFHU7Zeac0iqTCXb1P5zglgQuTJTTYv0sxbuTpFSrZZDmkkz7som662RzaKnuRNUTR8VgfbE
 1SLZxlRk49Hy3Va6DlUxdYEQkGbyiCnVwzhu/Yi9SvSBUIWfcItU5Kw/Z+nS4f7wc1x2LRNQXBb
 ZqW7kCjvnCB4tYe3/T9XWQ+fqA8Sri98Ph0D64z6RF2h0o24
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
driver gets DSC support, it will handle that register in other places
too. Split a call to write 0x0 to that register to a separate function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..354ec834f9357c4797fc08a4532e69acc67b4317 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1039,6 +1039,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
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


