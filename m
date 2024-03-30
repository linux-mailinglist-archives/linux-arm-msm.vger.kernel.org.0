Return-Path: <linux-arm-msm+bounces-15804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18048892925
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 04:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B3BF1C2132A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 03:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E638F40;
	Sat, 30 Mar 2024 03:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yX3NSfMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470879F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711771174; cv=none; b=oUwO8qPOMOj2FLMt6osSc5KEAALP0o/sWn8AFFrUzjGWH8c73UqNbCcq7oOu+gA49PIPxFALPS17S5gSAztki1sF4+Fpqj6+d0BPvfJC1ULgKTlqepNn9Kij1KIowCBELl4khvxUrYU1tvGCZIEd9Ip2BkqD4qcw58bdnEefeDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711771174; c=relaxed/simple;
	bh=0TS/PBZqHhbO4PC1chvE0gJF6KfO5JaOJ80vREZUMSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iC/waf/a+9mN8Y9xvem+BxJjFCvP/j6seiAiimSbVyVvlqCEjIZimk+BtZeBy1S3qi2zNJgMa1cOYTiaqf2A/sDoaEQlug5Fx8/Bjr/M7867PdVTmLulK1NpLRA0ovML46lyDSpKOMy2lzmWXGDvUsIfQzdRFBWawfpHVkvsdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yX3NSfMs; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-515b43b39fdso2170829e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711771171; x=1712375971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEHv7161rF10nD2iZaJbFgvPRz2VUElIFclun8j93Iw=;
        b=yX3NSfMsc1FZcHp3FchjJ8MZtF8CIUZfs+T4I+f1q2KWrknQJPo8XN63SnHQ9qkRqP
         Guhw0r11Ir2m9OkyjO5PNH8QasBwkp1gEdgzUmlYJGsNP9lcNiWmsDkehzu12lyVQiz+
         p0BIX1Yx+3wCEcSmVcIpp81rd1YBOgv4uSl4HaBBTpKfcXwxChBSCYlt51howHQEj1OQ
         vOTMsMQLBQd5MHi8KmvFyI774h8+5DzVD9oEhisH8uXiLaQXGYzNa9sIgFISlEESToLw
         y52heSqjEaYlc9DgDde1FYb0mcRmdeYgXMFGt0uxjggUK4cyxyPEGRZfa3Z1i2Wwfpag
         ueQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711771171; x=1712375971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEHv7161rF10nD2iZaJbFgvPRz2VUElIFclun8j93Iw=;
        b=EG03q1bUf/CHMYGfaVEIj4ez7vy16Qy/DWFgUTFfquS/xVSL4xSUP6dPNdYEiWdMXR
         PppBF6SanGR32plNNbfSlvVnuozKpQqSz9nzDhXBDyS1r5aO+vVFHHXl2DIqBUE2tnl6
         FWNylHyTsCnokJMbQhAanS3YQStwZrIOuaX8y0SSzfYzWCQv0dga8AGvTPNt+39Z3eIn
         bCfLIS0H1iyocC509EqxuMbwc7R1fBjgJKyw47Gf79FEY4QM8fFObCHgXzr++XtdaumT
         q0ZexKE1tqjzgAitDcmn8NMWqyWYzRi2FwZOvZCmCT7EEfHkK1ANiJVCrArtvQ3i/P4v
         53fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPT+V4ywk5HIXPOUv5ZfRSkwT404itYzCWSdyYBZb09vKKWf+xd19mgafpVhB5C9byS3UbGdbRAdnllkZLIkMtTt+Lb0Ftn+0RHmPhyQ==
X-Gm-Message-State: AOJu0YzfrC7EffgF3OjHcuvjvvMVLu2F5FIM2KYg/D3nOMGloQoZcsVa
	VM+0JDKmlAPlpZeGC20ODxR0n+9ZYHgPIXRAYniy2OEXRdxMUERWHjvBp+5niSo=
X-Google-Smtp-Source: AGHT+IE1ThAnidcAuJUVgaWX29h3ZaFTTmFMn3wvVDDkWWIpuaRfERN6frP0sFDgQn0vjwNXMb6wXw==
X-Received: by 2002:a05:6512:3b8d:b0:513:922a:4334 with SMTP id g13-20020a0565123b8d00b00513922a4334mr1661298lfv.1.1711771171043;
        Fri, 29 Mar 2024 20:59:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id br2-20020a056512400200b00515d1393f3csm423957lfb.104.2024.03.29.20.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 20:59:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 05:59:28 +0200
Subject: [PATCH 1/3] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-lg-sw43408-panel-v1-1-f5580fc9f2da@linaro.org>
References: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
In-Reply-To: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LJ+girYe4vykYjxl7S4n4qmMz70uzdqbzojIgAwohpA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmB44hkYXDEZ4U1NN773kLK8OhcQ/ESozP9fWl1
 6XuWJvjcSuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgeOIQAKCRCLPIo+Aiko
 1YwHCACTsVHb+AVpPFVAJZeqrxDPnebzaXXZ/O+m+gWCihSTksXW7Gac675ctl4z+1HouDBncPg
 c8NqCesf1zSkhB6cZ9frhnjvw0ruayMxBT5Zc4BRNohFGv7Urz6TZ1/++ylmGBCZVpvvvEIiP4O
 1dkz1t1/EH6Vn3l9deKIiHqsVZxErRmZHWU96y95BJJc6Fd3dwlipgy6iSBZJorrrokMw5E2gTJ
 IdnD2wX3506sW1Vq0T80gc35BydEVKi502pYN2itI8nv5pHrMvyeEEnZLMqp9s4I02EgxoSAhWI
 zDqreN34UTlIpRoy5sWYQ2kmxkIVp1GoEnkdCHNr886ueVko
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
phones.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[caleb: convert to yaml]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/panel/lg,sw43408.yaml         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
new file mode 100644
index 000000000000..f3c9c9343c4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43408 1080x2160 DSI panel
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+description: |
+  This panel is used on the Pixel 3, it is a 60hz OLED panel which
+  required DSC (Display Stream Compression) and has rounded corners.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,sw43408
+
+  reg: true
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+...

-- 
2.39.2


