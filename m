Return-Path: <linux-arm-msm+bounces-16008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2978949BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 04:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 537A8283D6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 02:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A0413AE2;
	Tue,  2 Apr 2024 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QHx9HrT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C8514A8D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 02:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026643; cv=none; b=gyiyVIGKrWtaXkyZgju3Rz/sd6qbInEpIqJWdmZnFg+K/9vOVpCZg+l6NW1AEdxS4Xk7jGn5h0+KNdGtO/UdhVDy6IQQvM7Xsh36FwegP+IZ1iQNLFixB128wesBY+dMXOmQdUXhdv6FnvpQx2cni9wcW5SQrM4QFPpOcCuiwtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026643; c=relaxed/simple;
	bh=6D+VpatekHG0iKrzMnt/4fCsZT8ObGcVWTTczmuUXIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7AReWAX74oApwNE+y1x9J6iMpVAsCd9LJhYa6R2thz5sUemUb3ltePP5TF5bY3uEVekLBk38XxP8OQWZZX7jWp0YpuoKT8RAD5CokAO5EY46tNWDDjLAMQlw4yH/Sf3KYD0LTCK3h7nDroZm4vpM9IwgxazXCnSlg49t0paybI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QHx9HrT7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so64579191fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 19:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712026640; x=1712631440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WClQaYoJo0OqeAHKNbfYy5E7bDA6T3Yefi4QjiZ/Icc=;
        b=QHx9HrT70qP8U5wTT1KDIlwevf4xwiT3NzvccgRxgaFNk3vSMo9IR6f4rLwDlSr5wH
         r55djx/o3jr+2ok6wRO4fnKei/hR6353mpQnbyJNpdU3KnRyGk5jvlnP5RCV+0BcPlYU
         9hgUP3Tpv0NrtYjlgOYPXh1E1+gRgKzkfi6LMfXJ7PKsbhqhW9HzF7+nVX7MTwBTfXYg
         H+TBeljodDNuwcz8JrXZh9+DpkTyYFY4nIzg3hqMVo2I7O4xFsgKk4O8omJtvoFCjsbh
         nGpjP/3xK/q4jZwiy/sTk7yj8Lvzh+98tTOkIhvB33iubUMFELfZm4ZIBB4Phk99oOsJ
         U5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712026640; x=1712631440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WClQaYoJo0OqeAHKNbfYy5E7bDA6T3Yefi4QjiZ/Icc=;
        b=XKrwklfLQJbrx06Di2fvZB0VDehaE7X0N6inZ+MsX48MNPvK3lZljL+QuKZq9MsH95
         55K9ryArRv4g/jTy82Rbqs7/vZ7MXyU0LEmw4wkcqEVHM3wQmGx3l63zfSy3gCNfnEPI
         Jq5NVQ0SjC8OgLOLNjFgQy4KT5Zqt/9hbS671micw6vOEzLW1WTyxMa/ka0GpL1cHRkN
         qiSKGx7q+Cbn1nZUT1edrQbT4zxPAF+aIlpcxgxkQFA8USF6BjGaThBbaSje3QEINBO3
         JBg/kSABZva7q04c2CpgPyrRO7O7pjnsUx7Dedd79yuM1yuS0S+uSKEu7+vZKWxlvUEz
         IMZQ==
X-Gm-Message-State: AOJu0Yw1IzTuwMRSQ7HNxhJxY+cqWs68VYiVNRAc2I4qJfGj84B8wvUI
	5XYeF6NSBTs+2K6GaYoisRQ76HNXz6+MFFG0YOMjG3fi7EXRwZc+iyDQsJiNeoY=
X-Google-Smtp-Source: AGHT+IF66hRKxlIKruz0z7xXyICUFCnSOcGo50o2hV2HVegL541sB+XE0+lVuk5faltdSn+D/dwOSw==
X-Received: by 2002:a2e:848e:0:b0:2d4:67d8:7bbf with SMTP id b14-20020a2e848e000000b002d467d87bbfmr5982187ljh.47.1712026640319;
        Mon, 01 Apr 2024 19:57:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 19:57:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:57:18 +0300
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc8180x: add dp_p1 register
 blocks to DP nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v3-4-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6D+VpatekHG0iKrzMnt/4fCsZT8ObGcVWTTczmuUXIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QM5ZGzo66Tx0rLjxtUWubhbhfbsftWEv1Zq
 XDOyxGPBwSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0DAAKCRCLPIo+Aiko
 1ceXB/kBWnbXOxX/eppym0Ht8AyLMA2w8Pvs6SxLfAmY9uABIMKNwrUB8AQvSHD02xRSB3y7mst
 jjC6AFj04rI98pLpus6Gu9HNrENvPJyfGVowLhAh8PmXbrewLHZ9Od1J3WmvqPYAUB4zgEHyBrI
 r7XG2lbNPPVDSkHuf3oRXYu7TdgLK7dCl+kayU78pGl8zAcTHsHLIuB3Ud+Vp5WFSlntcRTxAPj
 4kJINCWfnjL3rH5tWqRu5hD/qSdmatIotTZYlr4ivaf3g39MVvynI/UGtZ0zLuqaOFvPM3bkmK2
 I2ENv3aVBkn7VvND5FGlrtmFUeBTqr5ycZtysuR8eCS7nMcw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

DisplayPort nodes must declare the dp_p1 register space in addition to
dp_p0. Add corresponding resource to DisplayPort DT nodes.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 6d74867d3b61..019104bd70fb 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3029,7 +3029,8 @@ mdss_dp0: displayport-controller@ae90000 {
 				reg = <0 0xae90000 0 0x200>,
 				      <0 0xae90200 0 0x200>,
 				      <0 0xae90400 0 0x600>,
-				      <0 0xae90a00 0 0x400>;
+				      <0 0xae90a00 0 0x400>,
+				      <0 0xae91000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
@@ -3105,7 +3106,8 @@ mdss_dp1: displayport-controller@ae98000 {
 				reg = <0 0xae98000 0 0x200>,
 				      <0 0xae98200 0 0x200>,
 				      <0 0xae98400 0 0x600>,
-				      <0 0xae98a00 0 0x400>;
+				      <0 0xae98a00 0 0x400>,
+				      <0 0xae99000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <13>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,

-- 
2.39.2


