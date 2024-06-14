Return-Path: <linux-arm-msm+bounces-22672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3543F908005
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 02:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80915B22F1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE362D28D;
	Fri, 14 Jun 2024 00:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jE7Rcqrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0184A1E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 00:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718323354; cv=none; b=crRv5Y5D5EUkQCzsuznwCpPYDBesHIDN2Bm/3T/yOB6qcnsmRx2tfpcEtJZ7ZWiAbBeXVZoTrXG9aKBdeQoMzPPaLe28yXBcC/D/TEFBdkrd0NVQc3OOuN+rRBvcSjjdSBy/aDqwfGj2S12IFqU35LmJIcCeyKp5/7fzVfvP3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718323354; c=relaxed/simple;
	bh=bwFTYS1LXMHaETrXdK5thhWhFT5+sEKZ6Z1fZtNY+wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwzZT1fRYdr22AyJqqetH0MUupPvgRXrwLgcL8WPT1/ctQfEKlc40zU214UTJsebmJZd3dJAeqTPQTqbSMSXkgH/Bnp+v6D2nRuD0auzfxB0uZRgYqkON/URNblRs5d7UACjSBnkNdEjyhAeuPWgsa0vWo6DkOUusXDLC+OPWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jE7Rcqrj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52c819f6146so2326115e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718323350; x=1718928150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6Pigrl3YMiYV0L2puz2MCBrwA4BsCn0v5eH3hYPj3M=;
        b=jE7Rcqrj6do1piaKkNk6EVfv7wcH9EHSEVRbooOO88hdIBYuI6iYVjCXaEG5dif+CP
         1cWQ5pDAnrTMPXQSjq0CVmUK9SkfFqcsfXKjpoqSQcOAfZMNXxoRyx8invgZfnBagHu1
         AxNQm44JXlm1oD4DUyAd+frcyACb893pA+Izk1yADak6XfrqQ4OA9pSt/IAmt4jn7Nbx
         0MDZZV8nKImTrXpyxltLLtN3iabiU35NzQXNoVuqxWDWsrywyB6o3yGLoW9AiGs8HHCJ
         x+QDUa1X91SlM1PhpA+1OYya04nBH3JmhYUlx/Nc41x8Ga+u9zADCtChpLkVA2Kmboq4
         LAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718323350; x=1718928150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6Pigrl3YMiYV0L2puz2MCBrwA4BsCn0v5eH3hYPj3M=;
        b=PmFCMW/qR6fBNEvpXHNw2UqPbf4k3y7dbWseGrvaFTo2vGYo1YYlc994q+PAjTE4f3
         ll0j50Zco5FVrFbDTmuc8Y3v3lxCglS5Nf5418uA5r01Q0SM7znZVaHVLlVVlo7ql/nb
         AJmWkdoAPUOhtsY/QBZz56rwD9CZVvCnBhczF5OubjFcKRwK716KQzLVKrkqhDQ2IEgl
         xeRFjraxKoR4yIoxaqfY/qk/Q4HJEmIK/6btMZ85RPbGLSVQ00xdu3RYEpsbFluMPzcT
         8JfPg6S1EtIVy/URGPwJlPr+FQrkA8v2LkH4V4dGt2ZSM58hr2ZGut9rLQCOxed7LmI7
         ziEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8w92gKEyRc2gheUkCoOoflzF8SlSEBviAXDR5rYqBIlob3aKtJXcsPNZR2lHJyESfOzTOlNXiHaUyohhiz3GZzgvhBHTuLR/Hf/VbFg==
X-Gm-Message-State: AOJu0YwnwJd1gAGFaebG9YD63CbDebVAEDFl3L4jta40lTGoTyAKQw3I
	eqXi20DibSFDfGSyG2tCa0F9K1iEYEv57riq/CYtwiJ0hraGrdw+O44/EzSTKQg=
X-Google-Smtp-Source: AGHT+IH5UIwXjKfdAlrtgtsP/gSAJqsbdrJZUJutPq0mL+YKqAKX7hdu9dO+j3gNoMNN5f3Ra3X8wg==
X-Received: by 2002:a05:6512:2204:b0:52c:8a3a:fe2c with SMTP id 2adb3069b0e04-52ca6e9418bmr803193e87.45.1718323350643;
        Thu, 13 Jun 2024 17:02:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288804dsm374797e87.262.2024.06.13.17.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 17:02:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 03:02:21 +0300
Subject: [PATCH v4 2/3] dt-bindings: display: panel-edp-legacy: drop
 several eDP panels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-edp-panel-drop-v4-2-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bwFTYS1LXMHaETrXdK5thhWhFT5+sEKZ6Z1fZtNY+wI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma4iSZsRNQHJbZ2W+MlzIjjpWcJvGuGGSRSBPl
 oP3J++Uqg6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmuIkgAKCRCLPIo+Aiko
 1c4ICACTV5xKxTeR4arRjMWq6WVUa4a11qDoeZstp6WyrpASyxBgyXbvip2HW1SwbJxXFOhuUlq
 E9kJZMdQp1ENLl3oO482umdp3DMsEXlqlivUDazOSuVXt9NffF6tL5L15vxLd+eWSg/7USAY3zU
 xRlO66Y02jrnuYV6WJ4/xBXZl57y0rKQeFcQqSbQ0eYq7XFgq5TCN6iHB2o6k8/gUagTxdUEk+b
 BkhTxoZ1lYwwqdZJV9FHijzdRFqpRbZcyvfh5eUVs0BTlyZrjVBw25iEpaVLtjPNO6E6FXlt2Dw
 sGW1cCncmCkFnU6RVYWKZjaqIKIcLifZev9xXLuGGabDlJUb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The panel-edp-legacy.yaml includes legacy bindings for several eDP
panels which were never used in DT files present in Linux tree and most
likely have never been used with the upstream kernel. Drop compatibles
for these panels in favour of using a generic "edp-panel" device on the
AUX bus.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-edp-legacy.yaml    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
index 9e5864de49e7..b308047c1edf 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
@@ -31,13 +31,9 @@ properties:
         # AUO B116XAK01 eDP TFT LCD panel
       - auo,b116xa01
         # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-      - auo,b133han05
-        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
       - auo,b133htn01
         # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
       - auo,b133xtn01
-        # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
-      - auo,b140han06
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
@@ -56,8 +52,6 @@ properties:
       - innolux,n125hce-gn1
         # Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
       - innolux,p120zdg-bf1
-        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-      - ivo,m133nwf4-r0
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
@@ -78,10 +72,6 @@ properties:
       - sharp,ld-d5116z01b
         # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
       - sharp,lq123p1jx31
-        # Sharp 14" (1920x1080 pixels) TFT LCD panel
-      - sharp,lq140m1jw46
-        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
-      - starry,kr122ea0sra
 
   backlight: true
   ddc-i2c-bus: true

-- 
2.39.2


