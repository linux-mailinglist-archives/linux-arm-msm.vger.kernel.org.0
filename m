Return-Path: <linux-arm-msm+bounces-4061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACC980AF1E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 22:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201231F2118F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC5D58AD6;
	Fri,  8 Dec 2023 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYRj91d6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E85A19A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 13:55:57 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c05ce04a8so28480945e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 13:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072556; x=1702677356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6LTNwuggOVu+lap2ETuWiVhYhZt32Ct7VN+rbmpRFk=;
        b=FYRj91d6mKvLUMYcHr1YnMzQMfdLDexOC1gI2Eo+vCHmcUbfbMVhRWmPfRo5HbjlZd
         j6D4+axb8PaD4UOwPKO67N4xtP6X0KcNke3ih8+b3NJEPQ5XDR9t4CDngIh1S61O2Mfw
         F7+Kf73tNw9qZNSKX/IrUKJOD+Wwv/EXW6t5CjptraUd7lFBs5wpz3Do22u/JQVuLD/b
         VTcpX+wYc4Xr+JB7mOv5lGtBjoxC4DzK/TXITMYdgIyPfHT2K8+bipVyTrQNyI4pf30D
         i2yjtly0Z3qiOFVTUcCoNdfhyFMtFS1bTZp8uHrrF4T9gABh1dmE3GFS3bg82WbnglVT
         TSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072556; x=1702677356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6LTNwuggOVu+lap2ETuWiVhYhZt32Ct7VN+rbmpRFk=;
        b=s/ovvy1VdkvgFs17oD0B9HeaLqdJTXaTpE7R+DD1SWJxFaALN1q9TWr5UlOWhIun5S
         pks6PYA4qdmD3JabsmL1xRu9y67ok9B8CVu5Bs+rcOcYqVasltTfsmxx8qSDE5dOBzux
         3JLIWHfeSGdn1IR+k2z203NQ8Fq/oM6vNBP9XCzf6BdjmrwCKqHXQtt+KZRW5E/U/nCP
         N7i2xAhn4h3Rg+PJ5X4KwwztLaKLueOfSvYqYV2U0pf1ovuHRoOO/7OjDa2sexcd9j+Y
         K9/onqEs6cnm/2UPledeDULvsruaDby6w7P6lZBdUjYPClVLJtBnVRFYZkkisTHoUhlL
         p13Q==
X-Gm-Message-State: AOJu0Yxxm2mCmn2FhNEk4SoOX7jbsFqWch7Byt6fBSVOy1wQMWGu3bTN
	Z9YD7+Ppq7GzryOMI0E8KmTW7w==
X-Google-Smtp-Source: AGHT+IEWfQLi04KhsOKfk1C7Xg7hp8O1Yu6kutUmlWu1o5Q8+ki5ONIPzOECHLhbr+eLPm1DSCf9bQ==
X-Received: by 2002:a05:600c:21c7:b0:40c:2878:7adb with SMTP id x7-20020a05600c21c700b0040c28787adbmr165191wmj.58.1702072555791;
        Fri, 08 Dec 2023 13:55:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Shawn Guo <shawn.guo@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	krishna Lanka <quic_vamslank@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Iskren Chernev <me@iskren.info>,
	Martin Botka <martin.botka@somainline.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/10] dt-bindings: pinctrl: qcom,x1e80100-tlmm: restrict number of interrupts
Date: Fri,  8 Dec 2023 22:55:31 +0100
Message-Id: <20231208215534.195854-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

X1E80100 TLMM pin controller comes with only one interrupt, so narrow
the number of interrupts previously defined in common TLMM bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml
index 2bde8845a31e..3249c63a29cf 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml
@@ -22,7 +22,9 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts: true
+  interrupts:
+    maxItems: 1
+
   interrupt-controller: true
   "#interrupt-cells": true
   gpio-controller: true
-- 
2.34.1


