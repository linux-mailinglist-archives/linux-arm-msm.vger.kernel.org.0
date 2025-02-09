Return-Path: <linux-arm-msm+bounces-47278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C224A2DB0A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00821887D83
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AFB14B945;
	Sun,  9 Feb 2025 05:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9wAmLdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D71494A3
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077618; cv=none; b=b16p/gLnOiY/ld9oMlC9ViqcsxEjPEQask3N+ROk/z7ai/t4K0dujvycaiLGOtMAaK4ee22oFQAnqBBZxbZbDI5rQ1susI0cMI0ohvonN4m1pm6ULhGp4uJDpZhparzGxrhlRby73EeUQep0Uw47GrJsssB2FHUU7HT/FiYA/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077618; c=relaxed/simple;
	bh=OUSREmRh8249bUIyNnvM4Q8G4H+YLOauuOGWEq+Beno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZPljdP2HAkcUi7HqD9rnd53lDJYY3wqGc/3sfQeipXptyM0aCHuby51uAgDSmb/KN/aAlGqzqr4rI25+PbETqc1X/JXXIDwcglbvZSdVydcaHzkHZqzVItz4HP1CXsdezYpmjEI8QsdDpEjhqJPid6YDIuq3iiXo6vd2al/LkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9wAmLdl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-545075ff6d5so596012e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077615; x=1739682415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AAeD9frqy9MnpNfuI3r6PeuD8rDrjcizDGW4I0IbQs=;
        b=a9wAmLdlODoVf7ankI6NPYcgu2dYf4M/Ra2dhuwghfTNKSmzYhrYDEYJ5mj0IHycdJ
         /S+IWoFEXZyltu3WHC6bPF+PzGNRxTjr+fj74lTK808LrkT2kUrxUglV61zTmoQfrM8N
         sMA1sjwn0w3iLTpfQU5L7LodFVjz1M/w80NITnAZVIw9FSFh8UIDU+gvw1TeJKtTVWmo
         MABiee2mdnnvaXblVzdiz2Ey40HGQGX71thQYAWdki8/a5zZq5Vxpe0NYe7yxCwj8OCW
         W9gfBxTWlMiBOYS3moWkJDP97UCvdt83kfIPYHUfHIH+xUxC50CskSVs7myQgBlRqa/c
         ehmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077615; x=1739682415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AAeD9frqy9MnpNfuI3r6PeuD8rDrjcizDGW4I0IbQs=;
        b=g9fDFBa8zdzpmMrxTW0wDS5INihsn3Y9ioUTLcfUlsLi+kSxQdNisBYCmrEGODv5G7
         pIACw3lOZza2DEXazw2mVaqVy9SXDSyFKd9UXHBPo29jwxd6HzseHuL4oD+IHMZ6Uf0P
         nMujVWdqiyBWNWLey6Lk4KSWMLQ25E8zdYgXBtknmfLtWBSn2n2NwWtKF/GnFoD7NLON
         uve7UX5GCJkVMIR9jIgWmYpn2oGgeKhdH60yArvb2Hzue7KVOrCZJoF9H+nCPnqLwaPg
         3kN4acKeHVl6u8V0HYI91RgqTJ9NtEk8K9k4SWDbVWx3VJuW4MSU65SvxgyqB8VFqUJP
         82ow==
X-Gm-Message-State: AOJu0YxGItyv3zc9xI1USnGy8QKcQ3OK3s6xU0BO+ln7dv9ShbiTXv9u
	2X1Qyay3ECthDRgE2T790c02ywRMR4IT53WcRMC6yYezcg3AoX8GxQfVip2McAqH539dmAmeeMo
	1aAI=
X-Gm-Gg: ASbGnct0CHeoqLefN4fj9kdh2o5Y8LI8zQbjdSef+6VlNrM5T/h0fMvJZZsW/rPRmNo
	0+If6f+Px1G3VsGgq5I+6Rw/33kQ7HUhPyG4uz+buy61qTFXnGtZM7DAfOcY/uUa+T7kmTz6zHQ
	TVs3GTnkSeZEgH+Gev9U/AIGhWTbJRPQOAZWy87B9Vbpep2cEnSHzEgp2r2uOHmoZU8drntkn0o
	FpShyfEgao7WxGveN6xPnl2Q3usaI270JH0B+lHgw0GhBlnOzmynIOMcHfrQPEKFfUgdAFX5FUn
	/1CmAt5mLKVtnoqR12cxZMg=
X-Google-Smtp-Source: AGHT+IHoMxcCBB3/q2EUvXQ2y3klvPHcidMt7fEpaXFDlyTHpWqmGJ7+95RCxDEc3CZ4CHzL5p6Auw==
X-Received: by 2002:ac2:4bc8:0:b0:545:a2f:22b4 with SMTP id 2adb3069b0e04-5450a2f235cmr130427e87.40.1739077615007;
        Sat, 08 Feb 2025 21:06:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:06:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:48 +0200
Subject: [PATCH v4 04/16] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-4-6224568ed87f@linaro.org>
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
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OUSREmRh8249bUIyNnvM4Q8G4H+YLOauuOGWEq+Beno=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfhWz/CrQ1d/HHvst2lncBwAPX4lxjbBGU1H
 wXo139WGVKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1WjnCAChqMBfU9rKnaYHnLee7/bL11OLC8o/zUyr3P+zOgN+/97oXVe4pOVffirjbqRLHATL42F
 mp3/GOvvSMbiUCMFzWAJdIwnoo04JMqkxdtcRy36uAD9bbe9+CSr2hMFOHieDLRfXNWv5iDxKWm
 wmFhKpeNgShtGZBC8ZP4br6XUjWwzQIStzZjVME2C6843mvq++Ph++Sq7Nyhui5Bgk5CmQbyOVi
 fnGsteCUmKIG8klFqtxfqqxy7B06KDXRz4sdRNe0j5XAQsZHOt/ZNrNuYjSx2FztvJEx7qPZy6r
 nbWC+Z2TjZGdPzCgheIg8736D5bkF2IMNJMkkQwTTCHoCpL4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9e9900882687fa2ae4a734d5cf10b5bae5af2f87..ebf9d8162c6e5759a3780c74354b6c159598750f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,9 +233,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char * const pwr_clk_names_8x74[] = {"extp"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.5


