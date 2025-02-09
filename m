Return-Path: <linux-arm-msm+bounces-47280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9EDA2DB10
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57985161A30
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9067156C62;
	Sun,  9 Feb 2025 05:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nKLBodXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040671547EE
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077623; cv=none; b=CryImV8APeNMxJ7XnHZJfzO63uK1aJNtTdOdwpM4k8SjF7UkBCU1shm3EkGsfqdssJvKm7kq18MWAUCUyzi6hovxW3feAEPSy8cpKR3/7ttz37CZTMXYFU75RzCMbUa7PILYBz2nhJEYlvI5LJPXgPyjr20UtV/qXF48FD7vhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077623; c=relaxed/simple;
	bh=WW4ls3rpXG1GIIqJFaRsd5YlkFmkvDhOcZwn0x64Row=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X6ks03R0prmcE53hoamhsUhUCb9Lkt1Bvkp3L+sj8VYAM66BpkETc7MOB/EpnPGathD0eJ0aU9gugwVaVEB2aj3zvdRXJQf3GTuaBy7OuoeaabCRDLVkReFXmB8fJvDF/utmjFigymPNBt2OyCYJuj20qHViHx9RMyr+lJrPwM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKLBodXZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54508b026d1so258957e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077620; x=1739682420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgMGbXHWLKVnTij1NafnBiRAE4dpvWazdfcr2GGjsj0=;
        b=nKLBodXZIA9THby8zc+M2ajq8kuF1uR37VexjXeE5H1zK6rmOe49sg5Nv9oO3AoAdF
         xnRFWUBh45NVRzs42ULvqnxWTbQVJNFnG6f75xsHiCRG9zTKNDE1N1ysC5+udGBa+oyZ
         7TTxVyhKGUHCJ48XmzMKqqnlUMNAIVZ0RDTije5vvNXMI2mD1neUeO0i9SuW7Wr1riGb
         CC/6nKDtvNXaLbjtB3UdYcdM7ROzNCpuFuvXe1ghfx4IVVlb3hFrUiRj3Iamd/fVjM97
         RpDEK05THX3+tnnz1CKTVUpIG2A9gtfQkObECm5Yj5A1APnBsvau/XDcfvIl3Hc7DGTJ
         wtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077620; x=1739682420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgMGbXHWLKVnTij1NafnBiRAE4dpvWazdfcr2GGjsj0=;
        b=SDDeZ/xn2JvRXe1/nMtNy5Y+jlUuChubJgE2sdlGcsurw196OiVIFOqaDxFc0sx7R2
         XNELp+BfSLkuUg2AAxThCMbd8He8x0ufg4wMV+Y0xlOxnT0AFaU+HdwfyYhvZ+om9Qp6
         zDLUlD37Y2Cx7SbKtd/PStO570UDQ02FlHmCxQXhe/wpYYqzjRrmXuGXCpnKpIkgPIvt
         JxUuDIPf1GBUlOCoawooyi/kJuz0Zy+dCP1kikPA75er7rJFa3xloEhvAju5y7LO31Rw
         ISzPa70EoCCxtYohKg/P3uR1Bmk4msNElKIKEzf5IRaNbiCj/B3UNLO7DY46InrDs+j6
         9cMw==
X-Gm-Message-State: AOJu0Yx6qHfauHckKnAVz+cltgN8dreuUxWKlS3d7CD79v2KdrmVv6TC
	ODhxXvGKIX/hxoWU8XoSBhC6nrOVONUbuYH+3aKquyekK28Pepu7MGLf3CmxSNYthPY0RP+uGSf
	lcqg=
X-Gm-Gg: ASbGncskShhsfe9YsfxUuxok3UYD6Sj5fIpRrrkrbb66bITtEJUneMGZcmwNmBmOjaE
	5wtcijdW8z9g2Ii8T7vX1a3+OA3OTkgBkFFNWI2lpC0k5+FSZm/nI4VtyZWMgukTtc9r41W2qbb
	u1AVUYZDwSH556ez85F+oFkB+TQj/1fbrAnx2ikF5zt+6eYdlYz1pY3rClBYcBFiWNXiSpCrxtD
	HeHYs1ib+opbjzivPiT0z/7sSwXnicmW7mHR5LV1yRKcR7oKiXsXqunYM9Oj4r6gJX1mKIpHdo0
	TFZb4682EdFm/Yv9p/Z37lc=
X-Google-Smtp-Source: AGHT+IFx+DmPcZu3/NRsEkP+OG1M4uAJloebIpWaEr4zUGH3IBWnTxGpoo5HkK+ek1VL2il6g5ZnVg==
X-Received: by 2002:a05:6512:ad5:b0:542:98e9:63a9 with SMTP id 2adb3069b0e04-54414b0b605mr2844776e87.44.1739077619881;
        Sat, 08 Feb 2025 21:06:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:06:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:50 +0200
Subject: [PATCH v4 06/16] drm/msm/hdmi: drop clock frequency assignment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-6-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WW4ls3rpXG1GIIqJFaRsd5YlkFmkvDhOcZwn0x64Row=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfi33wWbfpM6mTVM/ftWIImACMnz11kBEOqC
 blNTd+M/5+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1dSWB/40THgJWOFA7FwOHcFPelVVnpKYNOhfQuyUuXJy0WLW2cSHshnroZRXNnjokUNm0oly+fA
 dPJtLOBh52GIUcac13awR+mTeDNkso9fhOR8aONIaah9ZyYwZixqaImkB+Pya9N4Pp8S0FMZEmQ
 AuQrEaRpREWdNEYbEBavp5mnhNQsYK84xs/boE5VkJUrAn1c4uHVymlQxMc4H6beLXKwVlBrfGi
 4E8BJJzCTBIoNOAMJ/HeRM3gNw6N+RfKoG6FD4IrrD9R56rPo/c9ePXfvC7edCfmsBiCOXDC2rM
 b29yFFfR6iQHceT0T/LBylCiPZIO/Arm1BEWDWfhs7v6DikV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The only clock which has frequency being set through hpd_freqs is the
"core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
so we can drop corresponding clk_set_rate() call together with the
hpd_freq infrastructure.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 104f9cefa14834d04fb957eb48777e605d1e29a5..6f09920c58190a9c195de0407e4c2dcc3d58b30f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -234,12 +234,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 3314bb8a09d6bea7e34ad9050970bf43c64d1558..e93d49d9e86936cb6c1f852a958398de2e134ad4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -93,7 +93,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char * const *hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa3541795a076b433566a3cafe156120b15..7ae69b14e953f0ee6deea8a216bfa9d3616b09af 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 
 	if (enable) {
 		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			if (config->hpd_freq && config->hpd_freq[i]) {
-				ret = clk_set_rate(hdmi->hpd_clks[i],
-						   config->hpd_freq[i]);
-				if (ret)
-					dev_warn(dev,
-						 "failed to set clk %s (%d)\n",
-						 config->hpd_clk_names[i], ret);
-			}
-
 			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
 			if (ret) {
 				DRM_DEV_ERROR(dev,

-- 
2.39.5


