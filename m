Return-Path: <linux-arm-msm+bounces-23783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB60913DE6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4101C21167
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E263185096;
	Sun, 23 Jun 2024 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E0GLX5pC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78918410F
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719173010; cv=none; b=cRwBkdGsFKmDbel+AXpnBmk35F4O3lUnZCJ1H9/gcC84HGB5RbsP3bJoGSl0XWB1/yLszEOFRNeq5PuP6AYSUNd6QpBAj3XJvB3WtPSDUODDQdCh8e2ouUFpLUtLr0N53bcldPJ/PZQoDdJ+U9frRaPdYjR+QlicVzPaQvykwhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719173010; c=relaxed/simple;
	bh=4/9Aq/arFNn+xRSwSsZRPh1izhnXURJa1LwMF+ulWIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cU5eMmIPOtPAx1u3RB/jIsw9M1Q/Lh3sKZbdlQYoBXYzlDyn/fFKPLCMZ/+dCwIvUI2q4y8YRn2/Xo6HyJvSN3jmsIeSz0TKsjadzx2O0x/wDeCP5y1QXr3WKUvMV5VAGC49U5PuiDNvItKHt7qhl20srGVSerk0MNhwLtaXiY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E0GLX5pC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421820fc26dso31216065e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719173006; x=1719777806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRwsnzJtrZqzT+Su1tk781Q5TL7jN+Wj95SuluafSco=;
        b=E0GLX5pCQXaobxqucSlqO4alw44/XygXWGzIoevVGbEyA1A6YDOo6STSqw2w5aefRD
         XKg3NuE67aYFCEF0W3lkj0Gd0iIM4GsJ6xkh7Riv8lnbJXeqnETHeWjVkYMXHj/M81DR
         cfMK+rIpSQCV0NaLCU6dFGS3jvtny1fb/ZQaCsVPIm+F65WXgxvw5w3RQr708rcTJn0Q
         AK0uYSA8hYEUfQ6I2kwJ7BQOGD/EZv2x9DF0nrlX2VeQq0yifhIvWHzjc6DfzB5UFxyf
         PRjl5C+4eyFFtWUDdSvzkMpnHqyFpKBPepKBNs3GL1iMeYQuQGXZYN9aDTcIJ6t/OzpR
         CUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719173006; x=1719777806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRwsnzJtrZqzT+Su1tk781Q5TL7jN+Wj95SuluafSco=;
        b=Lycn7kuoYPcZpdjda+oZQlVw3iHh4RfSsPmMGOXrXZfpYW6nKCdbYakDcgQhVWl9p/
         AjUlGrJIbNA+C9tAm8pIMRwDcPDoYAunUHzeFCo40F2ZQExEom9N7qfyEGzMznG/w1pM
         RCI1R7Zkh5xVUu7bzb7j/tC6Jdig6JJk9Nfn/b+eniYJPQohrZO3xlvKfu9TZ8LvNncG
         6uxnPZH4gXD0r7BQuDzrguDwSUW90V2E4nFKVZiQrAwU3wCK0HStIazqegXE3Wf95y3i
         7qNBFWnsb0Q3fWDs4fJtcdokLZe6UoBBzt9aeN5UCGs80Gsi6UOuumgDAAxKDCUcZBXX
         QflQ==
X-Gm-Message-State: AOJu0YyGUzesWrJMqUB2Ox0Bgch08oDsli3B6/SDEmNz3fpOzbHEvfge
	xXg+nkrxMLmjO3exAvYc4/TQkMrRKJ0UcuaJJNLGumEvHppdUbWGwRTPz/x7rKc=
X-Google-Smtp-Source: AGHT+IFJpv39zP4029Ssli5x6YQ1Ds7nJ3+NECE5rAgHlYqbz/JJirZIdj6Ljc5SlMfSG2LXJ09QnA==
X-Received: by 2002:a05:600c:240c:b0:424:9477:ba19 with SMTP id 5b1f17b1804b1-4249477be72mr1664375e9.0.1719173006056;
        Sun, 23 Jun 2024 13:03:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:03:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:00 +0200
Subject: [PATCH v2 1/4] dt-bindings: display/msm/gpu: constrain clocks in
 top-level
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-1-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4/9Aq/arFNn+xRSwSsZRPh1izhnXURJa1LwMF+ulWIA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+GBCUCUJpJdjHiAhVps4qq/mnaC30VIybMf
 k4SsU1FP9WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/hgAKCRDBN2bmhouD
 1zJpD/4hFM10qme9VeV2lS5WgpaIGfkSCtPbJ9yqeAmaQunz1ilA8smxq8cdUVXE9gLxmFhU5l1
 lQI+Lt85hl+Y5dXEqzVKxzrxeWj7YMdNX//e9a3b76kZPr3OESjU6xFZ8wYcAsFPyTqiKUFh8FU
 hGD0Cy+ql0nbC4mA3mQSyQDKuDymYy55LJjnruaHgjIx8dE1LugaPIOsIbfgU2tC3TMhLBqkvrw
 jpIfJu0wJd2iY7blxkFwA2i3gAvo1FHIlj9k0oUMNo/miPH4Bc6NEux0tDGkDftTKM9gn67wz4D
 7YdaDJ24YV7g1pckorl4PYZS6cLcJ8+MXl+ovS4oYAf3/21eqYYUiPTCYvLvCjDCh/t+gcki17U
 b5gZFIG+X7H5IDDEQNk9QWbjP9fNQdqeMkgyEF4p6fF7j10zzpGh4IllsMEO2bY0h91CXKqG+A0
 Kkku9mY+F7xAWHFIB38ZkRxZFcP3VicGP8HmGnase3+7GOWNG+xSNnkzUdRhwB9uZH/taKN2e22
 v8jUhjV3gEsrLWjXqsrIja17NJDgakeyCKRqJizfHMBJIuE1lkP642irbb2BCnfknwUSdQVhDpM
 EaiPu+ZJ9ZmllVhplasqbS8nXwQoCwCL8Ct9Mm4dmk7Y3SnKlr8mxcNmqB08LjmKjTkxsEVronl
 XRvouwunMTYdgig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

We expect each schema with variable number of clocks, to have the widest
constrains in top-level "properties:".  This is more readable and also
makes binding stricter, if there is no "if:then:" block for given
variant.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 40b5c6bd11f8..253e68d92779 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -32,9 +32,13 @@ properties:
           - pattern: '^amd,imageon-200\.[0-1]$'
           - const: amd,imageon
 
-  clocks: true
+  clocks:
+    minItems: 2
+    maxItems: 7
 
-  clock-names: true
+  clock-names:
+    minItems: 2
+    maxItems: 7
 
   reg:
     minItems: 1

-- 
2.43.0


