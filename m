Return-Path: <linux-arm-msm+bounces-73122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C920BB5322F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA6CA7B20AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E46322A38;
	Thu, 11 Sep 2025 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJGKSVau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB332275E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757593764; cv=none; b=Uk608/71ZtwUQLLukbYTYuKxSYrDm76s1BSUcbFV+R6sbgy8muNPtA1B9ak+v4hacI5OpGrF2656WOQikYA6kUZqVhUYEpwAOsEprYgH6ZA8tO0l1vA0iIHh+Mo+z9OPhjXst8ZbT7ee8RJ8c/TI9QsX9ZosVpvaIOFZup5L8go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757593764; c=relaxed/simple;
	bh=XM0DxWjTAJ/QMdmpyiPJ2nNd+sYznSXNCG3HlohsAXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBk9tG4XARIphAbXqbaWJTBLsaxD6msdehbhRjDRQ8+2dwPqdx+porMawVqSepCQQrnyGvWyx9tZi2XxfwLs/8Re87mQhv5KCdju4ilsYQVVzXZ//FQ3Iz/KzAZthT78FHqQdCHxRu7tHRTXZkti8uL6/fx+soQ76OIZtqQ8j6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJGKSVau; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45df656889cso4540745e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757593760; x=1758198560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qapoM1NTgjIA32q9aq+b/rv3iqgu/0hG4CK+nrUoPk=;
        b=SJGKSVauLubKzgGP8NSd0A5lejBUXC+e0+60uO3DY3/ANKvjExS9Fx8hPQTeMN5DQk
         WsP2AGQVYs00VawMmDOVMKLo5Usvq3jdbp8gSy3rdmIKKgQxCM+2gvzV+o0ujr7Zdion
         bmCO6FPevzt8mjqxvtJQnth7/Z10Y/YXH79WM3OfHXJhuKFAeJVeWwU7iH16gn3vJGYm
         YHT3hJy2nN/rgpTFrBO35JzqCIRmYtU5jshliqxB2daSIukOE8q8vvG2RddfjdZfvs67
         VmvUxg06MjYNidruUmM6ZtcNDTKk/wQPJRTlPtt+C7RYeFPIeuZHGj1aeVUi/Twjpzsc
         T/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593761; x=1758198561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qapoM1NTgjIA32q9aq+b/rv3iqgu/0hG4CK+nrUoPk=;
        b=aTBI9ufmz3Akk9taKfLmjfAAgkM3R44z+g7KBmy5TAnsfpFXuehgpvoQIJxJczQYIJ
         NDWVbCUddMcWgSTuun5RNKeRlaDuthn2BjOG9SYWDTuzIoTOV4oYPCFwe/0doA0DNAys
         fNrqkLam13dTpfDH/Z3H2WGdBZj6Sds0F0ewA1T9aJjzkDpg+H9AXqWblm58kyk6xCbJ
         wk9XVrNHT5J8gQ6/hySiyGn9ftgT2abuhLyffmz6r0AbdnvLK0K9cXhxKmkuFgrAwJZY
         z2GMA391XSYFBQJ/i54/7IC5YAPubIGcvuJ6kLwAOV39oxMlQ24IevEkB2hjlIUalefT
         pQ+A==
X-Gm-Message-State: AOJu0YyDoJ428IeWqvHOc7buC+wGACZEYW0JPp6kbOHk8e6v3GuvrEr4
	NVgdrJ1XUhk+qonYaIBEk2SjZZAuyTSR4LjMekKFWLcQUivJavVElttHNAR+iQZPhR4=
X-Gm-Gg: ASbGncuEtUE5P+ae7stpkqLFGerrMI674uVrhaPMecDpVrM2dh3eULCx2TViuZtoxw8
	udHR5GbO+8spNpFSVOlTYCge0uBJqdrdrgQNV71YEeh6bQZJKSN45XiaWf93ScQL9iZ338/xkAZ
	1VPq7TjhxVM/Fes8wXQ7jnId5udZBp835vthRqTBgWD92Bg4mtautNDx808DDQky0XCg2rUJYzL
	4XlibZGwxDwMS9m8G8gjwWAxjjhFtRKzKxuuzVRn9Acbn5fD8+T6evqInv/+dqMwaY8x7jnv8W6
	b+oLb43RiMLPH8upw4/N++PNIzHw1BlDKaeTk9bzNTdmzVwut0JcO8LvdhH0iYt6/CMExX9inXj
	XkUA0CPp2YjaRw5fC2cLkKvSbHJee7K+u+Q==
X-Google-Smtp-Source: AGHT+IHX4pfnUjM848MfniCu3WyeScBitJ5E/cygTtxz9LQ8TaGkNJ5wnB/S5GwIefVqEvsl0R9Knw==
X-Received: by 2002:a05:600c:45cd:b0:45c:8e6d:a45f with SMTP id 5b1f17b1804b1-45ddde868a2mr175690925e9.5.1757593760523;
        Thu, 11 Sep 2025 05:29:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:29:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:50 +0300
Subject: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XM0DxWjTAJ/QMdmpyiPJ2nNd+sYznSXNCG3HlohsAXw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCSN6o0sLnMqNPtT5EEjzg1K5qvo4uAFpJwl
 PtMKaRuoVyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAkgAKCRAbX0TJAJUV
 ViArD/9NsVtmYH33UcA/4V7iCbCs+ZsbfDbtZTAgOkpKyxqbMP9xeZUPpW+b1Iy0mb28FwWvkWu
 jNT33guP64nucvFlvRk02l+4l2w5H/t6lwtBquxf5v6bjaO7RY2aaaDV7wi7QzQSwC8lxrz/YkU
 Ctpsl62WzkFHPScRbvvhcIdqk9UdEu+jsqrZ0b45UbLhhrZBY62aGwjoh34AXcJIQ4KHDmtiQrn
 uhcewa7QX67tKwrOnuxH3mb71Xna/1kWu/VkvrQ66LwsO3KTd2l01TfP8XHBQ+LkIz1FIjpKSnO
 h5JjQ9PG+GBbZRSdE2ocpDSB9UXbd1/HTbgVMXvtZ0sUVeUA28MMMBMzIBH28i4xD0tfw6V+Ey3
 yH60P1rGq0U1dibXl8kZNw0bgpGS+13lZg+IzTdrPj7lgrZKbZlMUKr8qUi4DOsBGfVSAfdir9f
 KB7xCbP8E7C8mVDLnmHzAhpg6SXzJi/9G7+LNzOZ1ayXoE1gOrFyumVZfO8QW0eSNLA8zPx0o+I
 ihEmIRLcF92GKC65dw1r10UhSzdbE9dCE4G9fHZy6GlwPUKSvGS/I5r5tySVkaV9YNswrWsMeZD
 5WIBhxVpwEfL2CmTVDjL23nXkmL9MJjfCtIbcCAo/ohBhEBHO01CZA2mjUDedQtn7pGJ2ubsGRo
 8zqly6wLXAHSRgw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the DisplayPort controller found in the Qualcomm Glymur SoC.
There are 4 controllers and their base addresses and layouts differ,
therefore being incompatible with all previous platforms.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..26f5043748c166aa44be4e62445a63106edf9578 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,glymur-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -239,6 +241,7 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
+              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:

-- 
2.45.2


