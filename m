Return-Path: <linux-arm-msm+bounces-4059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1380AF16
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 22:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EECA1C20D1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADCA58AC2;
	Fri,  8 Dec 2023 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUkmJp3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360051708
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 13:55:52 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3333a3a599fso1941978f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 13:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072550; x=1702677350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFdnrYwlBQ1rl9Jn+SrBUNOM0RDnJGbTZYEdwjlsUa0=;
        b=AUkmJp3Q7QFlgvGqnUuOOPd0cbpXznjFpVyo9hLdtqJWokt7fbhAJMs+jZhyO3tkQC
         01el1V2b9VI650kxyx8s6AEtmFo0gRvZNlj+ntMPxPJUJKLAyVd6Yqjtf3m1mYp5hkV9
         cFc18RNFQOwNAUPwGZuxSDhX/GXbhYiXg+aLdFwq9n3+AfpReV3WUf9OekJ3maBEVfBv
         mlMPsZGeycINiY+yFHyVGNYhLF9OFP5LGjpicDMwg7RQcg1kpjKYtPrLZnygoguVM2/R
         59BLKm4HRNxx1kcalixvj0KRX9N/PEuk/bYYswyqtJ83MUOsdvdNvIn0I8VSZQ2DXbAO
         /EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072550; x=1702677350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFdnrYwlBQ1rl9Jn+SrBUNOM0RDnJGbTZYEdwjlsUa0=;
        b=TjmKPyDSjh4sj5eIFj+VeS6UJqQj9a1CrNoysKjr4isyBoJBayC0aG3IuJ/SzTHvRy
         FohYBtL3otgO9djeQQSKEPPJGNfNIidWsRWRddKERCqsDQlwGzOqb7VtZlCyg+mdBXKH
         t8U1OLFWm0kkO+gqvXQJxWC52N1zX5f1goNkzp4wqvGF7rmlYAmpQqTKILtCsVmz1wfI
         7btRhjlS/+fNJtQpDalE8mItkooSrUzvnb1P6UFcwWSPlWfEHW2Lyf5/AM0pSeoclaiy
         W47KBk/UPyyBeovYAgtJAv1AjQwVCOws4Re8GccMcolyneyKzcwbKLgrDgg9X47CrRzR
         MORw==
X-Gm-Message-State: AOJu0Ywdnteia3QfJGEpxtMp6YN21SQpORQU17QQ/9uRSGY/AiRBjTfH
	GKSrgl6/qfnAb0GeW/3OH8ocRg==
X-Google-Smtp-Source: AGHT+IHU/IYwKAHCB7iAsahZ45V6NPX2AnoxI7IsChjqPxB3N3uuuWn+G4VVqzC5+UjzecOZJzneoQ==
X-Received: by 2002:a05:600c:d4:b0:40c:2c36:29ee with SMTP id u20-20020a05600c00d400b0040c2c3629eemr374181wmm.82.1702072550789;
        Fri, 08 Dec 2023 13:55:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:50 -0800 (PST)
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
Subject: [PATCH 05/10] dt-bindings: pinctrl: qcom,sm8550-tlmm: restrict number of interrupts
Date: Fri,  8 Dec 2023 22:55:29 +0100
Message-Id: <20231208215534.195854-5-krzysztof.kozlowski@linaro.org>
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

SM8550 TLMM pin controller comes with only one interrupt, so narrow
the number of interrupts previously defined in common TLMM bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
index f789c7753a92..567e44875c29 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
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


