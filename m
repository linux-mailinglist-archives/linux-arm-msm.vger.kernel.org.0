Return-Path: <linux-arm-msm+bounces-7301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A22DB82E77E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AF871C22AF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0684141C88;
	Tue, 16 Jan 2024 01:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UOptdqcQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A6B41C85
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso9363888e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367319; x=1705972119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GejD4zZZsGDMHwYRtgsSZy6lum8oExkOS46Y7L43Kw=;
        b=UOptdqcQT5WJDc6CE2x/MuBStJwy2Xyodd2Fv7UWOiBU9F7DPP006ebmYPZ350a9ZM
         7Fzuf9Ub7QPk/vFO5mKBk4eeGTWPlb0UteD46wr4APz6rHDklNrY671XYN8mEbDUhTD1
         AfvY/BaZVSPOljTn23nM/DhZmsK1RRsKFdCOlYmRsFaTVGcCDDZnGe2thbLAXYFohSAw
         0ILx034PxDKNo5wShb2HOub+/4NWiSr1XLYAoKMELr9C+BftcXl+6EEWkUzHKQ5ojD+X
         oF47EpkN90AL10//JXnt2WR4COqoEYEgcrRCwHxSQbMu7XJmGluhhDjZDnVfxyX+yqrk
         5e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367319; x=1705972119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GejD4zZZsGDMHwYRtgsSZy6lum8oExkOS46Y7L43Kw=;
        b=eHBFAgRiABzJi++kEQEfAHkhWRoXTS6O1tPZJXUy0wDqi8Onaq/VFkAl+eKda9XyvR
         TVtwlycB7Ys1AJIOogCli5TbL/H/hz+DoCPzm3fonHeUv3O4flM2qubYR72TJ/KMq4qI
         Vj0NejCpgwr+0LpuOIIsVaS03XcVw9fFb0BlGJDMC9diRM4cwP6nE9tkwx2DqdfnQpED
         m2XsM8NSb7M0rNtCScmkJ7YB28CMFq8eLkYURLW4zIphLBz5aImVnVH26ghsA9vApeDX
         YGiqHvdlmvzzMCyGqmZhAWlDd/WcUj0RKgM0R0kLpBeuo9eyUD8t0E2+p/ZCtJ59YLbJ
         exLg==
X-Gm-Message-State: AOJu0YzDJif6GuChaSOb3BGwePbZjqbf0nwtYDax21bi6Ft1eL3cm6Ko
	TiHguWXessKoKL4wEsvy94kKm1jXK1oBWA==
X-Google-Smtp-Source: AGHT+IF4uY2IXXqcFlQk0kE43Q3PU+KiNoFsBavpJ8CtG05uDWkQ8ylL0yG7cG2uDfhV/l7L8wGeRw==
X-Received: by 2002:a05:6512:39d3:b0:50e:70b9:8600 with SMTP id k19-20020a05651239d300b0050e70b98600mr4138890lfu.0.1705367318393;
        Mon, 15 Jan 2024 17:08:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b0050eb2325472sm1615507lfr.37.2024.01.15.17.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:08:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 03:08:27 +0200
Subject: [PATCH 1/6] dt-bindings: mfd: qcom,tcsr: Add compatibles for
 QCM2290 and SM6115
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-usbc-phy-vls-clamp-v1-1-73b2da7691c5@linaro.org>
References: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
In-Reply-To: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Y+5fCr59sQqkRvEhrPMHqTIkuV7VTqZkyNtAF9yAvO0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdcTmV3QAehqNHLkPutAKWHGSN2ww4nuk/KvH
 8y0ySv2OpqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXEwAKCRCLPIo+Aiko
 1e94B/9wqdYVWm8HYtf/Ue6b5mdGcQIQWHHHZMY1fnsWqMaPORGTKLpgJGwJ/EtES8+Q+49LwfV
 Me31jibYz9GVkaujuwN4H4y3EnYd3CWlIj6U44rJ1oiGBSGrsfYaece9x3H2l6PP5pMxpsRbq3W
 zAQ/Zq6h1d/R7BqeTT2B2uhfueY5EHjYmKmayDNi/M295/3b3O/caKdO953L6tGjfcFGfng2cdY
 KT11GycxK9SeZURuTyJzZgZiAxLQPcNFH/+qchs8dIEbDsNtqJmZEjL52sRcxKnY8uoyE7EXxkr
 CkeEpR5hLY1OSqfPZwSzv2dTNq+X6/EfwWy7pnQOS/3pWOup
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add qcom,qcm2290-tcsr and qcom,sm6115-tcsr, compatibles for TCSR blocks
on the corresponding platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 798705ab6a46..b97d77015335 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,sc7180-tcsr
           - qcom,sc7280-tcsr
@@ -28,6 +29,7 @@ properties:
           - qcom,sdx55-tcsr
           - qcom,sdx65-tcsr
           - qcom,sm4450-tcsr
+          - qcom,sm6115-tcsr
           - qcom,sm8150-tcsr
           - qcom,sm8250-tcsr
           - qcom,sm8350-tcsr

-- 
2.39.2


