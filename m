Return-Path: <linux-arm-msm+bounces-20548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A198CFBDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A913282422
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2156613AD3D;
	Mon, 27 May 2024 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ip6aD4TF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032C7EF04
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799369; cv=none; b=XQypEz0V4AuGzpPcfDqiF+y607ATy1shVnor58Ogmwyao3unLFW42k7APbpVFq3sRKpyLNQQsUsA7Mr6xwcZ7uuKYk/jW1vfbUI9sC/gIngzZOBp/VJy0sO5K6wxW2k/nYgerDFMegL6BkWMT4QjI0CX6/7YMwIsLy0tO1E+m24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799369; c=relaxed/simple;
	bh=FSjR/z57MPpK+sFVQN3f9Y5HY3fXrry6aEHjLvU6BMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BonwuvHTmnfj3d1R3LAGgwI8cWnufFi5MAjZKN0Qjk2iovg1NWSBkuM5vmdsa/sKBx9XDVCXt9RNdAPQ48IQEuVzJNXbnQ87lJMLszx4zbkJx2+zVKaEiO8fDAdElTd7FfQPrXGrUF+s7W5UQRqZPZsxOizxswnOx1D5WGqgGWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ip6aD4TF; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so38586811fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716799365; x=1717404165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYVqqrufrlU4tP6uYGCro4lra2OX39FvNlNmisAjzCU=;
        b=Ip6aD4TFAy3QRpADw9fijpETJx73qabS5Tr8Fi/sjvsRgXMgmw6AkGPR0yx/oHWgKk
         ch0MXKh0834kyzDPiI1HMLW61FIj1mYWtipaMtBER8EfGTpWSrSpshVTQ6zNR539l7cZ
         Sx4v/PfZdBXRXnBKnLzjaO5XhYWUx1vVIq2D8WKG2/SXp6ec1I35K6Yq0G4aHaIflZ+4
         cJ/ftk7izb6ejNkkE+swdwwV/p8rFoSHKndI42sfZpojAcLR8VUVy210+U6JLiUwu7y3
         hBWW8sPCkZ4RqwKh3mwibBYrhR854v/YSri6DMmlTgS0NW0ZXaGF2Ub2eQ2YW1YoDnBc
         NdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799365; x=1717404165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYVqqrufrlU4tP6uYGCro4lra2OX39FvNlNmisAjzCU=;
        b=hFLkQLDI82cuCqkjKbYwtnPCIjGCaXgGirBoljP4UYJonZpvx/9ptTmzSLFBpATUA6
         2oOQe9re2PL7bN4UYNwhEptvLvggqkWNbGRdqHaNunB9P18pQezP/n6CfRXn4fo7sW6m
         Y/L8TtyJ6FuLqUKp1Iu0cGamAt8ZA3+qMhCertJI5G01kPd5X9Q+gn8W8h0jEulhUMbH
         +h3wSEvPeZxy6heSMHcoTJp1T74IKZPO/XK3pDFZ8FbPLDAWCB5uKPfY4gXgZVKZpP/m
         z0NfmbjgmlzHNUOxX4rpYk07QJBnhuwc6WHj4eHQKii2ZP1DMCJKX7Hlia35aJ00e255
         hT7g==
X-Gm-Message-State: AOJu0YydR+yCnCe33zywRPx1MkW8zyrM/ae9Mv8dyUUId91ULf1xPbn3
	n2GuK5tJslvayYIepfHxzwwk6+P7mqBawl26T/KpygtPu3PqUuHYhYEAw81Y+jQ=
X-Google-Smtp-Source: AGHT+IGqVjhmpV6P5dYKIK4bQm7p4J/a/8bHzzCxS0JX9QjuVHpgXeL4JdCcI+kWd/pi8uJ22Nc/vQ==
X-Received: by 2002:a05:651c:1992:b0:2e7:1e4a:31d3 with SMTP id 38308e7fff4ca-2e95b097761mr98346481fa.16.1716799362952;
        Mon, 27 May 2024 01:42:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3558889fb57sm8447292f8f.114.2024.05.27.01.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:42:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 May 2024 10:42:33 +0200
Subject: [PATCH v2 1/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp:
 Reference usb-switch.yaml to allow mode-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-1-a03e68d7b8fc@linaro.org>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FSjR/z57MPpK+sFVQN3f9Y5HY3fXrry6aEHjLvU6BMI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmVEd8GmfhAqkq4Fqoj88/8nK66iClT54YKRfYfb0P
 0PAPK7+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZlRHfAAKCRB33NvayMhJ0Q0nD/
 kBMcULAeJSxBGlLBsUcLneHOfYhQd3mHi+3AO40RXHfYiJ/HadsPEmSIK6u5QxD+p9eKXY6IBqfE+L
 IP1psTwbYV59r9PQclAq+evAa0bpzxtlHXIt9tH/hncy6Lj5fSYImp5GvMFdLZy3hgPcZtNfxmgDc+
 obFtz6z9+9R/5OaKbFf/gofv+/Djfw1H0V1zX8r1gzws1fTQGUnPqXQcuV704oKNT8k3Lcbbhnm72A
 SJgbW/jT7H98OM42FjJQn26g6MOdrL4bvCVj9htpoNZIEgv1l6U5wEWx9VhnfTnJjJKUO85mOXqGeo
 GT55odHIc+yy6nyZtlk8sCEVWb5Tc2hY9akaeF1HL6iYkT8OUGOETN4YqEs5F6B1h8xEUZf11F0lNI
 +KbxRgq9nb27IapqLzD2RGKRl6E4JJGG+63A2jxZ7mhp1HHddOTTGXnCqsvRQuY+jyhCLIx/XqpNz4
 MsA6SocfppaHs2Vse1Om19Xsbvl/yXqmw5PlOPcp7UO0IxWywKVhZp/9EgJVI8WdwRpps4fkDgDBtu
 MJ/leX8S5QAiwCCJxz/sekNnBmYC07ILgdMkmMLhgrHoZAwmoAbo/HaA65JV6Dk2LHyMtk4aYbfOJX
 jO3weNYZlRKf/xhplQ5j13g5oi/kTsfRzIpOO3HztKCljQIj2ssFvsNPWRzA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY can work in 3 modes:
- DisplayPort Only
- USB3 Only
- USB3 + DisplayPort Combo mode

In order to switch between those modes, the PHY needs to receive
Type-C events, allow marking to the phy with the mode-switch
property in order to allow the PHY to Type-C events.

Reference usb-switch.yaml as a simpler way to allow the mode-switch
property instead of duplicating the property definition.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 2d0d7e9e6431..5358d3a6fde3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -71,10 +71,8 @@ properties:
     description:
       See include/dt-bindings/phy/phy-qcom-qmp.h
 
-  orientation-switch:
-    description:
-      Flag the PHY as possible handler of USB Type-C orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -104,6 +102,7 @@ required:
   - "#phy-cells"
 
 allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:

-- 
2.34.1


