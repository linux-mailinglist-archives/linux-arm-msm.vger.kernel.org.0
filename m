Return-Path: <linux-arm-msm+bounces-21718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E48FC591
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26B91F22351
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005E9193063;
	Wed,  5 Jun 2024 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj+wI5rj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431EF49641
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575015; cv=none; b=hjj++D31bSgJ4ih67T0sHFEDUc/RTi/3Lj+lWmEJm1YYmbDrkYVTwImABb4RR97Obefh5Lne5gJH40YCO7PB6PWwmvJ6vw771FxMykjp9jufhIDRZ/+gaiCab6LIMgKk0YSozqCZplzeQEVTq2dJo7wSIF7UNiUBCAANQo0y/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575015; c=relaxed/simple;
	bh=yP8M04wrYIyG1Yj7d+611FEUHWAcRbT1DbI8zfDWipY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9aTM42Es7q79hCgPN2d6e6sAaA1G4NUhEmU5MYKyY/Qz129c9K0hA/IZyC5xDgYeL7BeV9u+cFotzdUyKM3JvaaJywOMDZAsDSIrcftqyt4XmC2+J0oUjmUGtmqSlB1Yn2HQP4JaZZzhGBT8pS24SKoCKlatiXPwlycT37BWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj+wI5rj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42138eadf64so32329785e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575013; x=1718179813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQp03l3+yXbdf3aPVIbOT/Kg4NL7/SxcDu/zA8lsjOU=;
        b=Uj+wI5rjhQfWCMxXsHzjHdxjAkhaArbsOb9VHsylwxHwFFc9lhxYrLIDprgL1TCUxM
         HM9pq1g2BIlfiQ8eS0JFcBqDvpiOGbLyHaOi4WHhEMH/o5LieeNPW5I9P1+nVTdVpUC2
         DmAJkpFcMlIiZV4K/sV1C0QE1nrqOjGjCqlGz8kb+BjrS7o2NxAygzQtK7VzsRthXVUh
         VqOxWIUDk03bJsFOBkeFUQUSZpS3hQreFDWAAsaBDfVQC4hyyC5OtZZduvstiq0ysh4F
         lPoNdEG8QOY6fHd6BEpqAcG/5EQPBVN6R6UjaFnEWHVG92/Il5kOM7K8wsA44Zlj9Yjr
         H7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575013; x=1718179813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQp03l3+yXbdf3aPVIbOT/Kg4NL7/SxcDu/zA8lsjOU=;
        b=Xav4qpC0yuGvn28uQHK9XVqbgV67BzM6m47JHDXZ6uEOXLVkrS7d8phrUXxzNo5spz
         1PanCN+X8fSjJxtdfrdg4nNB5UnvMQTYR5HTWbU10v0QSax66Cb+t7BBq781kamkfno9
         C/DpIV4f1D2rb1ZW41Hy4u49/mVPk9XtNTsrzmlrjkGUV3aJAenwWLqVB53HKLj7gAS/
         K/pid8bJRcWwvmZ4mDfWzP9aZj5sEA7Nyg2A/oSSrkxI5UFzZfkN5jzjZp79NIY/Qfeu
         SCc7DG9opla7L7U4Ve3w/YCAIMZLbo+RzTKkinrOMkwFmsJtvDMyyxz+ekd3pq24esRZ
         XfNg==
X-Gm-Message-State: AOJu0YwtFRmL5htej2ZDpYtNC8vIw/7mO1kCZ051VGGXsYt2viW8wH6h
	wjbP+uhRb2WMEln+4hqalqdZVtT3y9/+mmJ/RW63MQC2T2FplUqZpVaU4S5BYI11i+1wRmLY2cB
	woSc=
X-Google-Smtp-Source: AGHT+IExc9V+yIR6faUt8kFvInX/OnxLjU5xv4VJ/NzhXwJN3IF+wvDAxyyvJo0rOjAqMWhG8OxsWw==
X-Received: by 2002:a05:600c:4fd3:b0:41f:e7ac:cc72 with SMTP id 5b1f17b1804b1-4215635c139mr12784035e9.40.1717575012788;
        Wed, 05 Jun 2024 01:10:12 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:35 +0200
Subject: [PATCH v2 08/16] dt-bindings: clock: qcom,msm8998-gpucc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-8-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yP8M04wrYIyG1Yj7d+611FEUHWAcRbT1DbI8zfDWipY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1PPRcMzQo0Zhi7k0Li6x173aEYfxe6r7qn4
 aJmw2249VSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdTwAKCRDBN2bmhouD
 10j9D/wOS78WgVCRxu5yeb03BsGKI4v6nUL74N4VBZKYVK4n0XQgowNy/UuhIR4Bn7oWJsh1lx+
 ArPJvNcIYdURQShQIQ4++n1Je29k7WYR5HvsIAEsyMy0EDp/D35/5ZxpRU0eDHTIcWR5pROtTvz
 HqTI024Zwa5OTG0UbGiRz4YbV/kgoNHBimPgitNvN6LUwLhJK8zTRc/wWgnXKzWezGRA/peJfDM
 5E03xxzCQmrt85U67VTyuTDC0XXtQL2lQSmEZc3rvRARfhYr9SRn4G5xbhp9655HoUchMaB4Mth
 fcDTR/gPvrFGSJvv9IaZ4wZAQVBmVnzj7h/Cma/3KcYezki+qRzgloYl+aZno4xs31mrg+AWkNM
 YsA709M0j2QO4dM+hDA8INacqPHUANU0ymf4luuGF4F1CKR/eOFsWmuBxBRxT6JhpYrfX93VgcW
 lFYJCalMXzYLW1TOkGoeXzzHwrDmIjbTt/tIbilPUBH5ZDSyeHrqvRZlFAd5oSvW88/i3eOF+uT
 w7ZXgb+m5mwe8ne7qBV13wMexF/I9s55WIlcHKQ0gKYgmOFn/TcA8RvWeQmmUVdqQgRJJmWIokB
 LPPdyV5iC6rMmml6DoF210bYRRhx5dXg1GBq/Pnu5WRY1B6oyi6r7AvcB3WL+Y6tiMFl3OYOpKV
 WurSsJO2ZEmP/2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,msm8998-gpucc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
index 7b271ae210a3..b9b218ef9b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
@@ -29,28 +29,16 @@ properties:
       - const: xo
       - const: gpll0
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


