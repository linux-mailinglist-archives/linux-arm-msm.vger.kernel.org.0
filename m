Return-Path: <linux-arm-msm+bounces-3717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEBD8088F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A238C1F21367
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208ED3FE5E;
	Thu,  7 Dec 2023 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LbfK+72G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D1A10E7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:16:56 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso10566601fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701955014; x=1702559814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rk8qsAP+TFlPc9+aBIEsrkcMIIW7Ca+8Wo1Dz8GCExE=;
        b=LbfK+72Gt2SbmJoOkN2vsWmUvzzTgxk+bPDsRFvAAnWQDrs1YLLS/nE/OgphH8ZnY0
         UC6RnjxS2kceWabXUSOkXvFlsLFdJ9kQD7t6Rqd7UHXVMtdXofMyU1K+B57ULbWaRCJN
         BOsS1jJyDUQVTvR21TR964oxekKsYD3Ci107+rrtMc+igYxctK/lgrhgFl4Dc4h5FEm0
         e6ZAiZakelMz+FL4+KXLzDU/GkZDzhGQeQ6gg3pGvQnf5WWiuMIJ55jKjC1ZvVefoJLL
         M4YEG+XpOJ//Kqd8F6O0AAImsaJT36HdkyEzVMzQfodGrNZXMMmy/Cx9+f8Ddwjg1hSV
         JMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701955014; x=1702559814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rk8qsAP+TFlPc9+aBIEsrkcMIIW7Ca+8Wo1Dz8GCExE=;
        b=vE9BD+ezuMVSaQ9vOJT+5CQXPmsQpBwcKKLUgvpG/8XEs4iZOja5ZdM1VbUTAvMj1c
         RO7uU320y4FC5rsyZrd37ld+6ORdPgoVaLdfsFO9MkCwnlG89vofvAH/wxANqQVT3P9o
         Af5YjeFuToAePqcTxwvj2jIyrYDwGO2MigU3YE27zOqwCUMDs4YcTAl3+zeByiswAHmw
         2pHnp2VVGUrown/fDASpapUS/hR2a+hkvNCT662i/WjGo/j0ewQYMM7uTmXMgI6Ui8kP
         DC7NMV2rN3C5h1uLHL1jROSjpsQ/Uq3sJm/E7Fg06dWxsc2ldjxf4dzcR90CS6C57j6y
         J4vw==
X-Gm-Message-State: AOJu0YxE/nVXaT0i+OobHnK6JPvL6nG0XkJJdupRBvSrrRNroz5f55CO
	XMXD63DXg+TNWrtFaSkX+QnOKg==
X-Google-Smtp-Source: AGHT+IFGDrNGI3ZLhjzr4c4hGQgz6xvhbmIM3ZCtrclnigWgEf/f2pmFXpCsGhKpLrzQPADENTmIbg==
X-Received: by 2002:a05:651c:2129:b0:2ca:2425:e069 with SMTP id a41-20020a05651c212900b002ca2425e069mr2075467ljq.85.1701955014160;
        Thu, 07 Dec 2023 05:16:54 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906040800b00a1d01b11498sm815233eja.24.2023.12.07.05.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:16:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 15:16:41 +0200
Subject: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-x1e80100-phy-combo-v1-1-6938ec41f3ac@linaro.org>
References: <20231201-x1e80100-phy-combo-v1-0-6938ec41f3ac@linaro.org>
In-Reply-To: <20231201-x1e80100-phy-combo-v1-0-6938ec41f3ac@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=+KllDdHtSqAPF3nrZrVao8XwpqtX0txm4oMk2jjIl7w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlccXA4kvy/jYG73+UFQnfH+xstGVNl/jY15osx
 9jCCD09aIeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXHFwAAKCRAbX0TJAJUV
 VgN8D/99psDcOee6DbE+I1kLhwpqH/rhcAkgSWsOMChYH/kkP972vTxtQZhdmzH39ZGuM5DDjy+
 tKUhmMICnG3HRw5QqbZWZMQmUi5e5xhO8wUBF+uEFrABJyGPlWvoFqBzv21SMmtMyBTGlT073kd
 TTrfZHTLlNMBB1ByIJ2ZVfUKiV6m89E4BBfOs3Fl3NPEIYkKI783FxsB6iu+tmLLRRcLHCevzCx
 x3eRCnPwAUld1PHMGKNykTm50AZ6HN98BugWJX++Y8Y44HqnuwVwpnytwCNHJbjFby9lX9uHEwT
 AhFuwpx9ptyFHuDbVk/67ZLAtC2t36M8W4EzJDCW8Jebz3w4UHoeQvcKTG9SY7newf7kCJ2lV3r
 FZ+myR1Ejhe8iITQnJECwIoXrWxcOR6j6/4GMVZZ4NdMfZI/4Mw3w4AdPGzV/SMqxlckATQtvLr
 EBK8IlOvSDWhPqTfb7ZIgps1+znnnZDO6HfbxgDMEZZap5SjTIErUAIXu5V7p/KuW5hzTKX2tmn
 +GLNiSXhCuCf57PG6WW7ptp+o+XMJxOOSobstX/6v7VWBLbNaYlTeJci6I94neFaJCmMKZhzNGg
 aZLB/qXKjQlccB6HjeCC6M+Lk80en4HkYBHj9OM3H5BtOmL3ofFslIDiaOVMycA9bulguFUJTGg
 d0IHYQAOT5pArVw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the X1E80100 compatible to the list.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index ae83cb8cb21f..159a4a37dec3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -28,6 +28,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -130,6 +131,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:
         - power-domains

-- 
2.34.1


