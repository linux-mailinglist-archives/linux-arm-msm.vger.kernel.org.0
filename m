Return-Path: <linux-arm-msm+bounces-35117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B993C9A4F58
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B021C2222F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7724152E12;
	Sat, 19 Oct 2024 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFN7q6yz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523318B48B
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352703; cv=none; b=qBSeG4CV3CZwUfT4FjdyRstqN8r0LaYtZEL+Ppocp8ErEkWtiuGcH0Mr14a0KyTmZmSyY5HmKipOaUUuANv2sVfNLcOrhl1JbaTwp28E1Y/p23P4dwzqnVLHyWERx0qHTX44CHrx/15C1XrHOoh/ZzaSWXeuJtHpG3LSuf/08tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352703; c=relaxed/simple;
	bh=7YeWftVlP2Q/gQUZRfbjxaxvlZtz7wnpUr40ZoRjqrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2kp7u5gYK8RP2F18yjWgBFAtu5r9Q4x7KGqjZCLbm5OvPDSL28lqX5zAgD58cvAVpzMx7dWfwMp68jMNqSMjinMk0sD1W61blRrZpd2TLEmbrJ7uCMdxJx+NuU+hDiNhZCcP1F1H/iHaJdKVLm/HLSJVv42IBdOLPqD9V1X+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFN7q6yz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e690479cso3394533e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729352699; x=1729957499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq+HZX/YrY3XCimbXKEs5fGXUV/6PLqs5QlWH/wMocE=;
        b=HFN7q6yzZWzdFilb9hOQthzWu9FW8561gi9/02egZCxkM6NqAa/+4VPe3jweYyIMi8
         bM9H9bDhcQ5AxuOXEiC1xneI3hdg3kU1+0VgLwTOBtjnFsPF093/i05vmV9Um3J5S8f1
         dnPvss81kEmctMQ4uBsssCgLlIDCnL3X4RbWGwVz5aHcsZvjrsKihTzTZwMayhFVGTNq
         p554LWjJVDjgLK4q8jRUAGVP4+7yxTMMywFSqUX0tEXfhx53niSD/bKdhuTyzaPigtUE
         jvJSRWi5HkJ6VoYD6fgirSpMrw0IDfRTwf6f7Rg8bSYuU2GeIXe2ahGK8BtkYAnz92fM
         TcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729352699; x=1729957499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dq+HZX/YrY3XCimbXKEs5fGXUV/6PLqs5QlWH/wMocE=;
        b=Y+RQkUOe4rlcl/extjcrUsaJKWwfOGU7ZSs/qEXUSSzoZncxxWkGUheaGGwmxqrToR
         vjAIbMesTSTLBPudrXqd2YCOgTIBH8F4FSLsScQKiVBkzw7eqzHRx5SyUw3PmVysMc7D
         R3zuIBC/pO0DEjUtNnf9A0jDXBXqaYDMg7W8NrzGuxj6L5jvxXz23MPNivDkoJrHKKto
         GsIqtxuSXVJwjkHwxGZ4S3L3VnhVGDtG6x3rkGZGN63kZN/PzpkWKly9JIfHQsvk9AFf
         RtnCKks2tSw48reHE938+IvxkZG/kjAa0ayacXBSElXRBWNIu32nUR2CG1dHiIIOZxtm
         QB4w==
X-Gm-Message-State: AOJu0YzPjaCvrtnVMKiVmY+DaGYRSLM2BkI1HfNCxBn9gknZOU20xkzY
	v6Jt5ABI4fZoDZaNvvzZ0+3DfRxLDe2/Ffq0O6EBOj2JnjLC5AWOyergVNHs90OIyGMAvvfKagL
	4Q0I=
X-Google-Smtp-Source: AGHT+IGhXVBdyhEztuYCChzX7d60nxxES2ujUzXYN4+7ENwUA6EGV+gwyxeXar8eIhGtAYopVVe84w==
X-Received: by 2002:a05:6512:6c4:b0:539:8f4d:a7ca with SMTP id 2adb3069b0e04-53a15507f82mr3258338e87.50.1729352698584;
        Sat, 19 Oct 2024 08:44:58 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211401sm562854e87.249.2024.10.19.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 08:44:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 18:44:50 +0300
Subject: [PATCH 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb32dp: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-sar2130p-phys-v1-1-bf06fcea2421@linaro.org>
References: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
In-Reply-To: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7YeWftVlP2Q/gQUZRfbjxaxvlZtz7wnpUr40ZoRjqrc=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnE9P04c176Lp6PlkKHTtQNcyBZlmQqiRmS90eL
 BqCRp/dG1KJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxPT9AAKCRAU23LtvoBl
 uLwREAC/Rot4b1mZDwpJkc19mL9TWbVb4G7FYdhmYx0lS0TPeLkuKAF5GGgvRkUz+Gw98ONtcPL
 x8FMGvCINy4j4Rzklsp3JhvEXwWB2DnEEQ6AJR8JQcjh0y4L8aV7J8f7D5tfh1iT3O0KFndwwCJ
 C9asvyApUBtYVNB8Uc9zXApjrRwYSKsVKQpwSSNERy81HZUGpHAtNIixGk4DWZ5snbeHrCEdUcL
 V5AsyjvJzvnuaSIAbziYxNBleOu36T1g6Dhp6PcnJqjY6+xw99sfVAeQO3LtJGm+cYvn4UTl6mT
 S8l768DGzojR1qt6sITTvpuLYEKHHyR4W8JJzj3izsQke9HBZpI7i+I9LgLhscwRVOCxt0TGYBG
 O5pdm6NA1IJRN9kipSwYSo89tTJjsC5LztG/YhncjZVBVIBk/S4GpogN6oHpReeTGK2jpgIKZSp
 9mxiKSc27AFg0y8HaD3Fx2PwSfLec6KC7TOSQRsIjQDRNBk7moR2BpYUop0VxWco3MZOUDfA6lJ
 iVzKhquWsBzHZiUxtTX/1ZCjkGB+mf8xa3Cr8vvWDWM73cA9uyBCSSsw23n0ncj0N0+EpgMXf0v
 2egTt5NoY9Gvrjdk3dqM87gcYXQd2LpPsf3ULsmUJojY7c3xLMeJRn7e0Cv2mjvpxcxOCkAIr+v
 lpNUmQvwR/pEssg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the USB+DP Combo PHY on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 2d0d7e9e643117f5ec625e49270ac94c70603e7e..358a6736a951ca5db7cff7385b3657976a667358 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
       - qcom,sc8180x-qmp-usb3-dp-phy
@@ -127,6 +128,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy

-- 
2.39.5


