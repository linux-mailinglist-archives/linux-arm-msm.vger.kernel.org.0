Return-Path: <linux-arm-msm+bounces-19064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EEC8B8DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7838628261D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5353012FF91;
	Wed,  1 May 2024 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUnIjXzB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9A130481
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580385; cv=none; b=Ka0OP28EOgLNj+EASmubs19xU8Yrq1skLBDmNbtwvGaA83ARCMvZU5XPOHxAF3LNBFZng8XdTm52MLnY217VATOiDsSCy/J3bQkk+KVQCoxxQxp0UMcNggFqreygQeAxWuUAnNeuJGD9ZM6dZVjRnp8UiHbpvBjf3h6qqFPhZFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580385; c=relaxed/simple;
	bh=bHPVaX7g1ojgYmJfgd+Xo3j75Gojgjju01OfDQ+hGiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OriMw8fClkdJU3bL7jzuIbHWe+CYhcDV5v9NCQF+dOcsNSE6QZBoQkXe/qAXHn5us961SGN29pMFZSWiWiZh9VkFKwymIT0RXSfeaqAtkA0SboJy5j6uxhvjcBXAPsUhIQgJ0mGwCZPR2YrflyDVsSGMZ6b8E3hxPF/L+r8QhUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUnIjXzB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5171a529224so8837437e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580382; x=1715185182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k66DwDazgxPIlwfE9lr0x/khAGuHbXzCOFh46QZYNQw=;
        b=SUnIjXzBxG3vnX7etJnLy1myJRc+NMrwqEi1z6i9x0hSBfLu2Iy03Lv1C1wxbGWZxd
         ndhSqes5H2JQwrGZY+kjEnhJ1J7lO37F39tCPiqyhimXTbC89/rZ7aOGsHaO4H11WRTH
         KYLBC/Fg+Kn/BPsrD0rTt3p0NCku6a07UFLJ8Add6xGIbZ/J7QAcEhJ1BtEKU0XatVWG
         IVF/iICJNatxw5MnM3PiELU4oUeH7z+qbPEkXy/VQBR9VQ/XLOcNNDNJ9ZfsGFPtduvB
         iBC7ghDU9SBXCAViNWc/2Kp+wsDB7xo9y33kIvxYpgXmFMw+lrXJLd185NYeH0wVYME7
         THOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580382; x=1715185182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k66DwDazgxPIlwfE9lr0x/khAGuHbXzCOFh46QZYNQw=;
        b=SaNU060qUcnymFPCldFrx69sWZ3hVYwQ+h3lWPWs9kO0S5RtDRvEVSGjwU5+ZztJZ+
         IJZILpP50+V0jsqpLww+42tYpUMkrd4FwvUQPNqox3K1oM9xrn333Zw52qlAmJvM2+2R
         OjB2FLmMfv9PqIvBM3nFON42nQyZ9j1dWhzUS0LJCMgprWKqYRXl9u+Jp/PWiqpOaDQr
         QrWWV2WsLs3CQ0QhD8lBYLtMSZ2LtO3SrO8sawAcRAenFa/GSBoCinVAJh0jNUY0Le54
         GlDQfA6slbPJA5ssI9qNLhvLu9DVmo04DFivRqN6bYazhe9SneupPym51pI049X9ljKW
         j96A==
X-Forwarded-Encrypted: i=1; AJvYcCUTwS+EV2ajH1W2V3uKU8G+7dAIFL6/e+3NxM2PMc8KO31f2yVODBKzgNxIIFWa9I3N2VrcP90gktnr1ytQLmf4qmT5guOGWLACWg5OMA==
X-Gm-Message-State: AOJu0Yyxpwrxjvbz+kugDXAa34cjt4MD672j2cRd3YeLh0EEzv11DabM
	afJbKYI5uvbvJejwdn2nS0apMWbev5OoyF9hgQcbrkaBIM5ID6FpdLBgeldk0WU=
X-Google-Smtp-Source: AGHT+IHMwZPdU6yvzS7oQ6zjkhi4uk9YTE2D2xn1JB1jRQ8/UX/d/a/3+DaTH6Cmc2lhms+iawa6mg==
X-Received: by 2002:ac2:4d14:0:b0:51c:d528:c333 with SMTP id r20-20020ac24d14000000b0051cd528c333mr1612148lfi.20.1714580381827;
        Wed, 01 May 2024 09:19:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:27 +0300
Subject: [PATCH 01/13] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: fix
 x1e80100-gen3x2 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-1-f1fd15c33fb3@linaro.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
In-Reply-To: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Wronek <davidwronek@gmail.com>, Andy Gross <andy.gross@linaro.org>, 
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bHPVaX7g1ojgYmJfgd+Xo3j75Gojgjju01OfDQ+hGiY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmuYW6i6tD3pxOn9MhzjXJUE6c0xF8sREaioL
 UwTJHP5oiOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmAAKCRCLPIo+Aiko
 1Y2RB/9nIv/KsMCJ40k/VRUMsZFgk21ukKZv/QKS1BnRorGhrkrplN5wVz0i96EIRjHwStOu1+4
 RCjg7lFa7OPPuedtvkaBr2iAryveUfHEUEtdWRNWu+twi82EGnrmeslw5H+auM/QDlD2/A+5aES
 teE8NI5fNBHKnt+Mh6t+ofzVfGb132U5QvTjyWLAJ/lD7Wloixh8WaCIjoAp/iv/ZlqYSk8zXeG
 gEaCn1zBennqUdqekB5eFvXiC7TD1Jj/X3O01tIXG9Ia8IpWi/YmBp3dRHzBNRdyyMxS25DLYGa
 +jTUnbZNSUvkbeXUFldlHuLqvlgb63B1CuOlBlOhKpMyNQAR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The qcom,x1e80100-qmp-gen3x2-pcie-phy device doesn't have second reset,
drop it from the clause enforcing second reset to be used.

Fixes: e94b29f2bd73 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHYs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 14ac341b1577..16634f73bdcf 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -198,7 +198,6 @@ allOf:
             enum:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
-              - qcom,x1e80100-qmp-gen3x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy
     then:
       properties:

-- 
2.39.2


