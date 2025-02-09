Return-Path: <linux-arm-msm+bounces-47276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC6A2DB04
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B84297A2C3F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCFD2563;
	Sun,  9 Feb 2025 05:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0JhIudh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408E76034
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077614; cv=none; b=YqeF+YZEoHqTAK/M2LZlsVx0oEjRWqQrcxwFXl6hpzjgM/Zfth0NpEpXc1QtssvTufA4YM/9Iq8KM+2ea698xoPemIQhfASRo9DFoIKF78LkItpi3ITpkr7LAo89tRn3YoeSn4ZOp++5dMhsAaweoJtsxZC06SJEKTHRTahF10s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077614; c=relaxed/simple;
	bh=NLSCP5E6ORI9H0QuM74oVHUl+a0F/vNbAQWYghqkTiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVhyYqm+zR7eEX9S2hD/nSAoIfMry/eq5urtos3izm/WGab7EIQHNe+6/Zz64CsCacwX3hxL/s4rcHTrB2AWN88iMtvOJkDM2yZ+4KM5aOkbmhWWEoba8Q4GLbaLQRVcekHyDlxJHDncy/ibtmt6tti9SHZE2NXhQDdyfBfvfys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0JhIudh; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543e47e93a3so3687866e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077610; x=1739682410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTcdagHfVvJWdpzLDW5hzkEO6YN/7LPqkZiqmOtMZH8=;
        b=w0JhIudhmULBLKKGr9xFhxltuB1kZTIrqTvMYfwXDtrJzcik+WPA92TTLCiS+vqb9X
         XMXuD4riEbLT/EH/ZsdydrhH+uFmKx8mKomxyIfAZOhGdqb7pQ91YhlO0FjeXvl9tBri
         PlwfUXILGrEkNsAAdvBTZEPxtMU1PDgyq8cB1Aabh8GpkvKzCQgfV483qymlVL4Vn5a1
         DRSFX72FpMl+Cb3CaDOInb6NNy3d8DrC6efHt3bopcVRQ1w+BpOlBy2tG8wmRYVC5gME
         NDADXqCpd+6QeULYQfrhT+e4W7fPrRIBcWWqZdK2hrW0WT5AXHXlAzd0xjb3AAnOm6dD
         icNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077610; x=1739682410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTcdagHfVvJWdpzLDW5hzkEO6YN/7LPqkZiqmOtMZH8=;
        b=d1vitgk0of1IkrWLcxR5qnZGqC0RDhPKshIC8CiZ6H/tSNN6Sa0+W1mY4ZavtOzYCu
         zbci3rbb6rJplj2wWsjhZ87RwhJOhG62zpDxDThczZdZ3cqAhfwWSUvggElL7K3v1LJv
         gZpXOghvJPanlv/hKTEcIyod12VV5PX3Zxf+7f4m/bh7eo9zQvIf6V/zTnfCA/lszTur
         RfNxRfxlFyYzSg3SHK1I3H/QeGXD5jHauAdi2t4x2/2iF/6lSvYtqwQN3XYIFK/9XJ9R
         TQdGyTRdIIkNuTTNWShqBmCHadd6yhxf8oTiGscY7aniVj03iXRuYzHpTvT2GF7vjugW
         30qw==
X-Gm-Message-State: AOJu0YwLexJ3TXBixEm2yVeFQ9LSjM+PKLsR8PH+Ntnh0rkKUWEdxd28
	iZY/TTmtjpjObfJICjmc7fAJkvMxOTWKY6XfdUn6bdfP7n9Dt342WOp9ppYgR+KzZj5mVMRBdiX
	/ZT0=
X-Gm-Gg: ASbGnctp/XKeotJQ/SrKLQo/jsICo3EF59gNdeGW72KeM/jrLxdJ8g6/9jTZ801V2nG
	EoJe7/n+/GrRWPIjEohlzRhval7F/wGI0VYRmydyL8zzI/dAPuaqnynYg52Zvo5bkcmITGoiVsF
	/rrk3VNzWznjMOYqJ1tKnnXJ6R14TPcvfsdusNK+f3SbKWyrUj8YzIot05lIpHeNsdcYaAn2ut1
	EkfaPwmmwWD2aJIeByL4SAngO3cxNiNTuZ9lr1ofRsR1FckIufuCZ9OAwJkQLgEd4Ix7Zdxv0fy
	E7oOu5LVTWHyXVoFaOdknMo=
X-Google-Smtp-Source: AGHT+IEFXe5K8k+ix/TTKVKq9EFeSW9km/qit2DCh/DLsirowioK0KDRuuwtMc/zx6EiGq/Gs8hrxA==
X-Received: by 2002:a05:6512:2205:b0:545:576:cbd2 with SMTP id 2adb3069b0e04-54507bfa112mr584003e87.10.1739077610224;
        Sat, 08 Feb 2025 21:06:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:06:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:46 +0200
Subject: [PATCH v4 02/16] dt-bindings: display/msm: hdmi: drop hpd-gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NLSCP5E6ORI9H0QuM74oVHUl+a0F/vNbAQWYghqkTiw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfhYclpOw8R2du6T24MrpOm7QjiPhE/g7GXP
 i/M4vlXimmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1bNlCACw8jnIu5ritWEfsFqRqlft4maCais+D8f7xJZLStAU3zaKpA81oDi+4en7jDRNdsZKwTR
 gggCP29ILVZoZGLRsfYrFUbdVnSjGejPVwCyXS/x4+tby9pkAeheeDOhHxx3F1+XL4FWqUv2sdR
 RS/kMmNkTQI//eK08wp5ld2x+RDs66f/J21yrExwXeahWL9KacJuD1P1PRPUTIQCzsNw834YPny
 exHq0VzE1nH4db6YwrCrf4+h1hoz2IIXXh2LAIjesZE1cT2n426Kv5wR96kCUi0Ovzz++zkiiGR
 uwA7gar7slMJunZwgXtK5+AflEVpxjcM8yBfnXpM4OSqNowq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Supporting simultaneous check of native HPD and the external GPIO proved
to be less stable than just native HPD. Drop the hpd-gpios from the
bindings. This is not a breaking change, since the HDMI block has been
using both GPIO _and_ internal HPD anyway. In case the native HPD
doesn't work users are urged to switch to specifying the hpd-gpios
property to the hdmi-connector device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 7e6f776a047a00851e3e1e27fec3dabeed5242fd..a5ff7045a14be3b8106b3edf0033a8028a684529 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -62,10 +62,6 @@ properties:
   core-vcc-supply:
     description: phandle to VCC supply regulator
 
-  hpd-gpios:
-    maxItems: 1
-    description: hpd pin
-
   '#sound-dai-cells':
     const: 1
 
@@ -178,7 +174,6 @@ examples:
       clocks = <&clk 61>,
                <&clk 72>,
                <&clk 98>;
-      hpd-gpios = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
       core-vdda-supply = <&pm8921_hdmi_mvs>;
       hdmi-mux-supply = <&ext_3p3v>;
       pinctrl-names = "default", "sleep";

-- 
2.39.5


