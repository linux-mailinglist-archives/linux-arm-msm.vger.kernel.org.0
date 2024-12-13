Return-Path: <linux-arm-msm+bounces-42141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1011B9F18BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 506D0188E237
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C841F12EE;
	Fri, 13 Dec 2024 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z74liWCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445841F4266
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128115; cv=none; b=Y/EzfJv2uYos37NSBk1fO1WuVdyZPUxAcnx6jFYdx8ep8fubJFAjoZR9Ps3y3uQqzJk5q51SSj8lmJ7116wfMArfw3h/OVJZJaA/bRxeKMP71yWNolN3woy/i7NI/JRCTz9+BgiFdA9ughF7zdHXAgl9S6rJEVa76FdJQBXaU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128115; c=relaxed/simple;
	bh=ptvBKeUKmjITErU7c/l4IsRxRCXm8P0WXwMqYb/lvdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dyg2suaOu5DLZclCI2SAz/mGdJJS7WtvHy04AjEw5rFjowt1E+T8cbwy1iUdvolzChGQB1MmBQpS/XiLtBvPCQ+DSKSEX2tzmTeIvsIHOEphBm2Ple4bjpnEiTS/qzNPKSGGauHKO00TQhkJwyQJBXkUjCSBFJ1qDlMBliq3X6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z74liWCN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso18583491fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128111; x=1734732911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LifxdqaGCIwaKKWoCGFea03k7mgah7RmItgQGhr58E0=;
        b=z74liWCNCgo5CepovDNZwI3xDnQtiseY+mXnNjSkE9+i4FcGNbPLbrt05WB2yfLUS6
         SN63remCjHDSj89gCEIlHJd231S5r4qyHSaxLG2F2z7J73/Uz7+pDEpooDjn18ECeMCy
         0EVcub4oum6kjUsELI9JCdPPQsASf5qAXCWGENY8qylQU0ytC0/m65sn96tDyHVQmm3p
         DPR1lL+bUawyn2wVHBi9O+9LIRu/wFKgXGFkkJLhwQ6ON+sOcsYFSxEWxYrCZO+lIQbe
         QQf64SfXMlOpfFrh6jYhNu9yhMs7g2AQ77jaX3dRSUnSLQGFAGMsBcu0tUrZRGUWUjUd
         k47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128111; x=1734732911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LifxdqaGCIwaKKWoCGFea03k7mgah7RmItgQGhr58E0=;
        b=OlIvQiTwYXDP8iKQCiQKuR5jX7IBIlu/B25tct0r+WRBV4WKd+AxlzyDFAa+pHD3Rj
         0TkLnejBwnqxvix9foA3zFtEWq8i6FV59o3j1NHk90wfUJ5EIChg3Pvq5FnXfZRhxvH4
         DOhEUnERbeJId3d8Ya6wjxt/mc5YYOJa2/9ODAlXaEftTwjE68FmLa26wqaj4GF+BR+K
         ykNRIwtJkr47R7kOkV+VSVVAsHY04YYE5iukpN431r1nzeBYmNuvs80GrEa5YhFOcNXB
         U/abDOHvg/qI2lvZi1B4K9nz/3rYJajoiwmTvPzrXUPJJ8FXje54VMNfWNi13HOqNTsn
         qGRg==
X-Gm-Message-State: AOJu0YyOhFSL8OD4dtaNlcy6pggyr+4CwF0QoON7RnqgPFKkNH0v2uO9
	bcMEl+WK87BFC3F74VhwsY4FKokbW24Q/fzeTBTrP3ZCsN1erEzWvFzbsSKzXno=
X-Gm-Gg: ASbGncvuvY9DifMkNnDa/sINSa2jOqC7A8PbWKAh1EfMqKBIHTvtai0szhZoO4pq6uk
	1TEqbSqhR7dv/rCzq5BVYBKi7T2RbvDsOlT461Yc8l7aPJLkiMOLZOQlXBo427xT6sMAXs+4UYX
	MVTTIW2oSIQNcTHXe8v3tts9a0k7tlqMWi4jRPCHwRfjxyDZcV7iJOB3Of0vImd1iQOLAniHoLE
	5Lkn4+BmGDSFqZWRLgsJbPQ3b/JePeK7hdpuQUlguIzW2Nmo9cdGMKgf2m9qJzy
X-Google-Smtp-Source: AGHT+IEhOUoLULMBKV5L8uya25ux2kXuioNUid02Slg58JderfXbB5sF3kMUk2XM/AqxSo8NAgyhdg==
X-Received: by 2002:a05:651c:1a0a:b0:2ff:8e69:77d7 with SMTP id 38308e7fff4ca-30254465075mr11711821fa.20.1734128111214;
        Fri, 13 Dec 2024 14:15:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:31 +0200
Subject: [PATCH 15/35] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-15-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ptvBKeUKmjITErU7c/l4IsRxRCXm8P0WXwMqYb/lvdE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHGBjhdX3gmAyoNCRrO8/1x2hqeo+tl3VnN7
 Y4whAeJpO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxgAKCRCLPIo+Aiko
 1f+hB/9bRLBaxyxCbnkaCKe5UqiHtaDZamPs+PzorNLocpDS1iUPpgY6lnIAvQuNGrfIG5cPQ+8
 9vczDFGOC1AHvdDohjZHtKGVRSdk0IFMZkhIN445cnrNs3qDWSsH0PP8DM6pomIiXMRv8ytQlL4
 XrKHEmrguI14W9VgnQXLjTPDKtiZ2U4iejAGiohuUwyRmRiIWEJsGCUBsbmiVJKBluz3FGfNFCN
 NwcF8EP8pARpG74OezSMfhjlx4Kq0kcC4iM1lXfaeuO1gTGIP8O04s9VB4wE5H6uXqLTQ3FI7uV
 S6Sf+UZF7FLH0OoXUPxVZQ7LkcS8k2AgX1cFESZbFVODop9T
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index dec7f2c48d13078b9cda37a563d4e3459941abce..5d8f89f8a8a6ad772ff5f4cb8421cb3dd09cbc30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7b9c77181b14a2db766beb5e36502fd0fc4e0b8b..6c21e1b0ded669b82f5939df748ce267c18d05ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5


