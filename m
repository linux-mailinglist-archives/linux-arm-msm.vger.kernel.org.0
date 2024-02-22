Return-Path: <linux-arm-msm+bounces-12195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC185FD45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 16:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78CC9288338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9D5155A32;
	Thu, 22 Feb 2024 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DY0XJ066"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1015530B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617327; cv=none; b=HD/rLY70O4sYKkRr8zFmqE9xtmKMGdvraNHORdNy85/5Fm5jKhas6xfVT37/Sxylse6gMl/9XqFTrApohkn57toGJHns2tI5D4bHFLTz1PxKgR29oLwR181ZMgMFdVYTzB1nQFVGL497fiI2V4ljLw8xZIH6EeuIWZyIW8mNGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617327; c=relaxed/simple;
	bh=Dgy4bpUuD1DREK8e21cUFvAnpbWONI5ldnxfYKMR5OM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oE2+s6EAe0KqukxZGR3cXKDAlsupl3i7R4xRyX49lRzYFDqR7KSUxlOIzsLmHXGAbVe4lqQQQ/1eZue+4y9Q8afhQnJSGPx1EHEvXlPAgyOVg0NqZuQtLcmztTPfznA0KzWnAvPXt4kPiyB34sR/ZTEVWRplMJlcdwZcXcMSpZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DY0XJ066; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so1915119a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708617322; x=1709222122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/qRBGuntVpmUEzLsJY9ZgDe9uMSJ+xK+pvUdRKBs80=;
        b=DY0XJ066AfvRj3f1eMJAXQcCxwcKgjOtNikrLXir1UFMYpBEWxvBsDYpBelSmii40b
         SYE6jfOuNq8NMN5H2W2Q6m4kmMND4C61eWA4ehYmeWVGnYiGZz0+oHmHDsWuAJ9jBudX
         DyY1wv05QTFHw9KxcmYzu4v0zBFrUHYJOwltx6HGhSf7db+Y5OcZHgz/sIEXTxLBX4bH
         uLAaxiymOeiP921f8zBDVXGv6kC7GpFrGJjGWvk4id4bdWsuYEKIf2uA8vPRM+bo++Xx
         MwRK1A0v/N2WYi4OwZUF8U4T1e/rzbs9U4HZplcISABxrCfCAQJRfZ1CEak2slesLTrn
         Fsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708617322; x=1709222122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/qRBGuntVpmUEzLsJY9ZgDe9uMSJ+xK+pvUdRKBs80=;
        b=tRvp4ZCSHmcNOMyfzsGGLNYqv/hwe1tQY4ObTsqjugofwW8AI/jo15bTo2s3OHfxI3
         qQtwfJJC06ZBzJasO8WRfVHJeceg+tXc02Bi5sR4TVAlM82DcjR9kvOeHS+ArGY+HF7M
         QGRVFjDkxAeeHSR2GnaGc754Oz2p9OQDVGipyeCJK4isOQH6ABOwkG908uZpVhU78Rah
         7KxAlIbtSG9k7mT2gQZJmF+jwJ/MGTTYsP7jA6VS4bLU0HmfJ2ecOv0Ix4R5GWwckJOu
         hPfafr2+A0y7RK6Uc1wCfuv6yRZovOWITeIyBQIGEgfcccOmEboGayyImgcAADHhuUse
         7uoA==
X-Gm-Message-State: AOJu0YwEQk6nbkEed8Tmu51kqdyb9/E9NmrZAlTqCHqV8+IADADE9q3a
	YAq516fj88BoxMVVxGRDOJS2kjpbz8WmclnaGrBQ0OzQe3dihYbopIZ/bSOo2cw=
X-Google-Smtp-Source: AGHT+IEM79QWygSavS7FLc1eJs7WoqOaYvTeCTfGxzrVhMHQlzTgnwR6V3UoG0G+3SBVTMXxL/v3qA==
X-Received: by 2002:a05:6402:2021:b0:565:2e3d:d019 with SMTP id ay1-20020a056402202100b005652e3dd019mr2162738edb.4.1708617322526;
        Thu, 22 Feb 2024 07:55:22 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id v7-20020aa7dbc7000000b00564e489ce9asm1924247edt.12.2024.02.22.07.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 07:55:22 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 17:55:06 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
In-Reply-To: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Dgy4bpUuD1DREK8e21cUFvAnpbWONI5ldnxfYKMR5OM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl125jCxw4MKZFiUZh/ZMZdfvjY3Y2ijItoeR8X
 VZAumqDoGKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdduYwAKCRAbX0TJAJUV
 VlncD/9HrYnh9zrnKbDIebEbauG+1baUus8l4qSrbAb3Ntl5fGjkgkHqpD0pJVXqSEEjIfuopAk
 OLIagSfkQ190FupimhKKkBGDvpAVfTolpJufGbLXwcfaZ424E6QMJX4oaCklqX8b06EfyGF9aMN
 We96I77voVT4JkfrOyCAT8G/sCjah2cpGEO9nYywBm1XvKB5wFwa4hqHxgiqG/XjHCDPhIIrQei
 Mqp8WclHbx4jmx+jQc8ylDL9ojoPcBaqsRF870nfQl8kSRDE/BUhI+E0Rt+eX4hDu0o9ILclAzT
 pyDbEm4VkcYK6hQaK8Juz7+tAM7ysu9C2FGghCehIutP6NCafWW9JYuMBdZ3EV4Ha+Ia7QDI6Vt
 CLGQesCQwn6fXf9L5rjPvbbGKj1CpB/dJDB6yE33Ox0+6VyQeQ6V8Unds3DZ7eY7LKWnhvqqVb6
 kAiBZ0mtQYB3b44nQ9Gq+gQbcfsXCQAZj/anTDfqncIblK4rWG/jIegTi23oZTK33r6UjD3Pl2T
 39Wy/JhacD0bK8ACs4kXk0nIcR2/lNLiTUh9N3rRhT5wt8NUJoj0tB+wVf2Yk5Urs8EBYvRj1Ne
 XhniW6npGnqpE5q60USEHV7Cgd+R/i/xrSGqCgnd3fR5ZAWsL810t0lsC2RdK7OAap+JgQuHxbn
 tt1FGK0P8RVK+Qw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the X1E80100 to the list of compatibles and document the is-edp
flag. The controllers are expected to operate in DP mode by default,
and this flag can be used to select eDP mode.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ae53cbfb2193..ed11852e403d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
       - items:
           - enum:
               - qcom,sm8150-dp
@@ -73,6 +74,11 @@ properties:
       - description: phy 0 parent
       - description: phy 1 parent
 
+  is-edp:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Tells the controller to switch to eDP mode
+
   phys:
     maxItems: 1
 

-- 
2.34.1


