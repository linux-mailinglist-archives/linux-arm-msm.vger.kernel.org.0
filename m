Return-Path: <linux-arm-msm+bounces-70192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DBB2FBAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5E6AE6A5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C312B20B801;
	Thu, 21 Aug 2025 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pv/oNVby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20520192B66
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784414; cv=none; b=jhmqo9xc57G7VYKLJgqytmuiqCJXQpS8kGm6F+AlECU9+5PX9W3S3jzGj0QexKgAtqHzbaxzfPnD9VP8/tedlu7Pv/JKkt2E9xiaf67Zgd7mag+mQjBf1TV/kWdIapWaNhjEbN1XUcyZOtXkroydgZOSAbV2tm8zGGIRU+GRtiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784414; c=relaxed/simple;
	bh=Aq4B8ubCvdna8UpVPGeOGxwN0aFnE91nXSAPqGRX4oM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ibt8Fqy3L4W3ZEkVoceff78Szb3XZqtHV//4EI6BAlS/L+k/QWRhwvS3jR6boH/Klr7d922vO1kVR+suQd1nLl9M/PDObPpjpNies0BX3TbHsJtvuXEGH3NjoMpFVesDYC+R9ZzRvF/fBXuIDwbtFpwepgeC69n9WS+PJ8ncFUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pv/oNVby; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so6913205e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784410; x=1756389210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EIBQO1Gz3enJDEIRLN/ppBfRRD6TDZUCn9XNdLrwEY=;
        b=Pv/oNVby5CIy8h/e3pVCwo3ru1S7A8embIu4p8VKRYDyuL1v0oOsHijZJiZDFaX75E
         zbBAX0+nCxbJV3LIqsS7IvtCGoN60cKGDokXzZdimhRIrlGfqumgtXvtZTEB9WhZrCo8
         NIx/TLsyzNV30fJ3gIf8Qb7q5AzaHXskOOw9oA7+f0l89R5HLapShvwoBkYuJ2oCJuGE
         JkPwkhEBw9SrTJmcgyI91Sn8odCIRkv6MDqegntEQXf8Hq3grvwpkoq8l0JCk1ud5R9E
         XVqJnVUwlMnSpLta8U2ga6PKjruIFdaY2fDWDSA7g/DUW/lCHlpZqxGm/hni2T54E1pe
         cHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784410; x=1756389210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EIBQO1Gz3enJDEIRLN/ppBfRRD6TDZUCn9XNdLrwEY=;
        b=qdBeLGv9HJwoxEX1Q9uG33ywDgOAR1qU8VfXD/gKi11ce99x1Wv211LOWLm/pKvL7r
         7Gtk2ScbXG/A8FRKqXAOz4z47ZYkUvkZJCZuAX1MZzBxrZvs4Qz151QGmggtrztX1SLV
         QTO+3Ouxz4Yf7Ob7nCSnRuVBiCJLkwZK3skODw7kmePNaPXkmJ8WzQroTn6ni53fC+N5
         UWmMhvRATrYm3SMu5bbZnJ2aFQ0FC7SDohTlOORoaxCEdE//D1vqsUX5Dn1zp1kbw9gD
         sbRjozcDbcUaM23Yt35oH2f5s7choEPgIZM6uAbW83Uku4rX84HapN33AcKT6Bb74p+m
         zinw==
X-Gm-Message-State: AOJu0YwjRC2BYpHUqBVZdqdjajKNusk4yrkVQC0NY+XA4oFaWn28ERms
	FZYfbs8vAyInhhfkAChOnVxGYqz89ZWlp//RpNXP3WMmSLWlDxrK1HxCVHTNoH339GQ=
X-Gm-Gg: ASbGnctzLD4Td15O3sAAOUIB0xZHemlC+KqRDP3Hvff8wGOfAPRvMUGoEVQMe9jxT2D
	7mP+PLoCyqk+2S6gIOBegBC3mRGdYxhH4Kysgq7xZ/SGOjdnJ+RKmlN6io2h1a9PQX0s4fOEOnZ
	zsHhhLS7wQh1nGT+0qAnZY0zLFinuarJ5z4Nbz47CAZCGZnt5LsA/i2+WdMwCGlFhswDZvW1xO3
	GLyB3ysXMtfOiY3/Z8TWmYOdcPSlBcSTl4sYRpRTYGHYwJmje/zCo/cHRkCChG+JLrI47pHG+1E
	KQooOq71D/+jY33TvWiEU4MN9R8osxieT6DzUDmGXbsLpmXgP7/TiQ9i9QkGl+oyqnGKGz45Bdv
	n97T7P+C0ttHn5jyiZFku4NzuixpDkrVHMX5RVuuOU5iv5aWn6wpxqQ==
X-Google-Smtp-Source: AGHT+IGAIzsMBvakvxJeKR4kacsmerciP2sEoorpYm9uAOK1lVz1iyXKtDjbXi0GfpWXuuUcYEAuhw==
X-Received: by 2002:a05:600c:5249:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-45b4d8de696mr24534735e9.3.1755784409986;
        Thu, 21 Aug 2025 06:53:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm14825015e9.2.2025.08.21.06.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:53:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:53:26 +0200
Subject: [PATCH RFC 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document default phy mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-hdmi-v1-1-f14ad9430e88@linaro.org>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Aq4B8ubCvdna8UpVPGeOGxwN0aFnE91nXSAPqGRX4oM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyTXldbpm4aBJ2CsjXkwQ24ndf393shGxX332QEv
 OXcBGm6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKck1wAKCRB33NvayMhJ0cV9D/
 9Ki7JcUNOAeH+4OzoHkHUP+vqAWxGIqz0PI1mKTURjsY+W1XGqbumr63HVm10/uPe+ctdQpVLJcfuf
 P7Zlp2uzHtdNuvdNHUFWiFP2jIOxEK1HkwmTMmw04jj7RMUxj3Wd9+cf4pJJ+1DFLxkM/wCkuIU0lR
 MMhrQWmsHBgI6On5U/7nYJr5EMepeTV8P3nyWYklErdKvijuWm1GRgjNnl57Ff6gNMu+2tmn7Cz5Ct
 8oJjm9W7Tx99PeMsMx2ypyWeLqMpRmOTpxSRN5WerUHcl0OJ3CNkuapZ3JLT8IgF4rU2KTKCE0Z36+
 CDoahhIPvFO17Tz7Zy7jk6vqQMXHNi7SJKyFST/kGfgtfuM/9SNI698IsBScm+pLMxvtPCSB1FUqQY
 oon8yBV31VcPp1385R5sJHfckSgYKihZDz1iAKFMbVvtKFNEEwqgGF8WJR4/VXBbmVaKi+Dif9hFEP
 2bB2O/nFsHUGhu8EEv3ghfexcSnnYKoH3Wydbwal/eXBmPuN1Kh8GPY4knHmqO8MrbbwXfyIgEOvsq
 nDIXQLPzsOzvQHY6XRmSL8bb5NRdxqYBT0dVa/VXLHVW5WsJPHPAArX5opq+p6a/vYUQ9e+y0zRT4S
 WDm4iqLuQx9488Xz1o0C46fbw0xJYmU7qt4CgLdUy/BaJHDfyvp1krYTiS9w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

And the layout of the lanes can be swpped depending of an
eventual USB-C connector orientation.

Nevertheless those QMP Comby PHY can be statically used to
drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector...

But if a 4lanes DP->HDMI bridge is directly connected to the
QMP Comby PHY lanes, in the default routing 2 or the 4 lanes would
probbaly be USB3, making the DP->HDMI bridge non functional.

Add a property to hint in which layout mode the QMP Comby PHY
should be as startup.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b5694c8599f475de78679a4438449..129475a1d9527733e43ded5a38aad766f9810fe7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -76,6 +76,19 @@ properties:
   mode-switch: true
   orientation-switch: true
 
+  qcom,combo-initial-mode:
+    description:
+      Describe the initial mode of the Combo PHY configuration.
+      The Combo PHY is a wrapper on top of a DP PHY and an USB3 PHY,
+      sharing the same SuperSpeed lanes with either DisplayPort over
+      the 4 lanes (dp), USB3 on a pair of lanes (usb3) or both
+      technologies in a 2+2 configuration (usb3+dp) as default.
+    default: usb3+dp
+    enum:
+      - usb3+dp
+      - usb3
+      - dp
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:

-- 
2.34.1


