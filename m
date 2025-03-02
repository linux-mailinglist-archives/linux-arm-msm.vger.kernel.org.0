Return-Path: <linux-arm-msm+bounces-49934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1785A4AEF0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 03:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B43D16E757
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 02:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355BD146A68;
	Sun,  2 Mar 2025 02:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ij8evwgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448F145009
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Mar 2025 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740883807; cv=none; b=s+61urYmZMJH7d5qgg49CijWmwlUd9Yr1JnzJf9dW90XRYAzhc6AzEUEYuWSw7bhQIwDghVT+dylUcPqaPtXJ31PXMx2vPmXD1sXGZCgiE/eIJk3020PRQ7RUXqbXhiE9oFZ9567940xNu+O1BBbmtmk3q560QKWCpGJkIqdFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740883807; c=relaxed/simple;
	bh=6ScO6d/vD41aSSHc3m/TNsRC6O9XMMje0w18/CgtKz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2pinBtvtA0isqutsnq8978+WleYj1T9OZSWVplGHdppTQDw2G2T4R7kAwKAO9ATgO3rbcwWMZa2lZNzIciJm4gHujwxIiO4u9QT2KeVygKFCOfjQYmu56D7X/x/t3XVXn6XMxT5ONdvyCuFAADriIOYjNLSW5Dw8m22Z94NgK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ij8evwgD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390eb7c1024so1715943f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 18:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740883803; x=1741488603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2dsCl7aelSQACC2hAibA/NG78Rv8OzFHgcMb4grt70=;
        b=Ij8evwgDClxjlp7aRRkY0MPflAHB4vWSlNW6KEJgh+0topDBtTtfND5BKOS/cllZuQ
         KqdfebTv8GJGJsXGuJjTSfXVmOGejOIWBi8hyFd3fZGhPLR+3pwIhX/KpOQ+N9N6FS65
         WD7HBXC7TjOczgrFLhc07tPQWAiveJSUGihDDqxSTE/JejV4jmqx4fR0J8JFXYaIFVR0
         KR3imcQpDZAkxoUkYXXLChoBRKcdqjjlNSfSKa5JwbHsvwbeXALC6ulNqnWtJF83rngA
         BtrCtsAbofZZUBSr3ObVd8gNVWmz8wbDDQQ0JqzfkpsNNDme5TX5S8GRYL4VSwkXz3bF
         BwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740883803; x=1741488603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2dsCl7aelSQACC2hAibA/NG78Rv8OzFHgcMb4grt70=;
        b=LzSSlgqoP0Gw9/ZmNbdbwSP1CAN/7VPVgMEomqZpu9SIwc9FMNDsj4AEuGFmwgSD9o
         gPVVFpbVItVEIF2f5w6550i6KayOeelwBxjq51MFYADP1oWjXrG5lTgpCVaPzqXb94LB
         8lEUAAS9cH3dx26AwhEhkuG/hYbihe1wFfhlMRJ6Q7Y45EIq4Fo1JAOzFQaKbcXtNdoJ
         LwpcoLXgB+z9PRTp1UOK+dMF4nwSzvpzvio3uclQqXrtR1Dl4/DAZI36pgTDTnKpgv5/
         Q6vJVpHQScOoAwJfRrAbZShMJgaV0uJuH2KsUpK8EVdcHnu/QScOO/PKKdigC5g6BFuZ
         hwvg==
X-Gm-Message-State: AOJu0Ywx5WB3v0J3zvh94WdkplJjWNgkFitVEXqWSiWmoUW4BnOQbJIN
	BN3lqpf6m5efAHyoR4CEvmCL4I8J60wfBwrf0sYzsSsV/QYcWFWnS8ELOjb0Z8w=
X-Gm-Gg: ASbGncsk4DFlWcXyMQbA5c/mROgeWsyWwo/0WKsv+GhVi0bT797StfrfMQrTSIUa1HY
	6FHv9PGELFcbwerURLmiojWb7zgZOi79+YhG7SM6R6/JsPeSfwd2c5L2ZLemqMbzHZzZ7Q5hzPO
	obZ+3ox29CxajdFV1KcpiT/xIQQoOXdmEvD9ele+oZqvP3PjO0m/XlIVkIcOjUA7YIXdoRJNsP0
	QiYUeFXuAj11b8HVYIbhi/x4NKwZ9if/JKXZAT2YM1chvUurPVYI3SPrxGIkEPLbhXKfuwFR0GA
	IMa8acRUZeDYNgL/6Wr/6tf+9ZU/DbUC8f0tF6pL97YAnt2RlfcVtw==
X-Google-Smtp-Source: AGHT+IFxHCKQFyUj24+tuV6wSHKQy4LhNfQvVRey7/Nm7Du1PU4gaJP8VBFQeZCerX6w7bwI5hKemg==
X-Received: by 2002:a05:6000:4022:b0:390:ffd0:4138 with SMTP id ffacd0b85a97d-390ffd04350mr1322985f8f.24.1740883803448;
        Sat, 01 Mar 2025 18:50:03 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b0dsm137845975e9.13.2025.03.01.18.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 18:50:02 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Sun, 02 Mar 2025 02:49:51 +0000
Subject: [PATCH 1/5] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-rb1_hdmi_sound_first-v1-1-81a87ae1503c@linaro.org>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
to be compatible with sm6115 LPASS pinctrl.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
index f4cf2ce86fcd425b7522918442de25c836bf24f0..ec1cd684753ad22050ae349a2e7acbb2545a9070 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
@@ -16,7 +16,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm6115-lpass-lpi-pinctrl
+    oneOf:
+      - enum:
+          - qcom,sm6115-lpass-lpi-pinctrl
+      - items:
+          - enum:
+              - qcom,qcm2290-lpass-lpi-pinctrl
+          - const: qcom,sm6115-lpass-lpi-pinctrl
 
   reg:
     items:

-- 
2.47.2


