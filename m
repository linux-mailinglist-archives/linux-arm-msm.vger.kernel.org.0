Return-Path: <linux-arm-msm+bounces-21720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8A8FC59C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAB741F22810
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23336194120;
	Wed,  5 Jun 2024 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anMiIVna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4DC19307E
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575019; cv=none; b=OHW2UkTFINX1bR0nvwoCPqIkJauCycFt0iAu8Qf0dySlRDYj0V5c8a5dLhU7o5kN/5E98y7kS5l0pWJhA7O2ACvFEzrTyuHJx2QDF2jv2rrzfkHQFYab0l+zjBBjBVwrIPituXAkNBmI/H0xZ5SqQHYSb5tVfr6x+wpCfHmuHnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575019; c=relaxed/simple;
	bh=gMEKGPflIqCjaO+l9PPn7yZxSHxALsYaFe7PstYkr/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCXMlsb/f9yNpQY8khw4YsbW7QaO1NdH3Q0pFF5bYAeX04mC6pnektHVWfSH7sAW6zSmMW7C5d1oNAzm40q+6pls6kmSpRRTh+jF4ZaR5YMSuNdV4Pi9GvxFVY/aOEVIvDPlXKVNjEl2IkJYJkJkwTJaEDL66g8ttTdwHxd+DBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anMiIVna; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42158db02c3so2133835e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575015; x=1718179815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfhNEnf5o8BXbD7wykEOovpUrRELyWO4u6WOUhnWdLs=;
        b=anMiIVnaVXbOaR8MplN221xSpe5ljaV0G6KdYCCxJwNcDrTNbvPduze1cl68s1wNz5
         HQ4Sav4KPfehMOsv4JcdnCqubUA8RZvacq0DVCjOeRnfnBhn7eod4liKKVHcjgXn5tOq
         omRAdkAKdL+q1ZCPrE9XdX3g/pmyuG5Dae1iLzY+eFDN/Uz3IKPazAPx0b8Ubw1PgimG
         w62cHfdVh0giQeEtUKdvdjpUtxVVnJymvBnLGTnHXaAU2SMquBCen2nINF+9E/7BoBXs
         WvxYn36Lu5AwtVJ2DP2psKUoTgp90c6lllh+aF1h2eqH8T80ZtHVr6vRyC7ldq3qujfK
         rUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575015; x=1718179815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfhNEnf5o8BXbD7wykEOovpUrRELyWO4u6WOUhnWdLs=;
        b=LTP+RdwhhFPBGjPXICUqyYD5ZmwWiqZNjiwJ0ag6Eyyi32BSnBk3OL6Si7H9ot07At
         v4yRAqSD10kiPpVnNJGpJ7PPWBLLVfRK6wlNYO2jKUSvNxV1IZ+D8XVNOIY3KcuvV2jn
         dpfsz672JKLtEh5vppSRN47jkWoZTZass1gjMLO9sxD8BojxnUQua7kRCLKIEjOYuXOU
         4aSBB25kx7gvEXN7rF009KHgilFSBqM6bdDvuxcEAE+nYXhCWxS6hSqE20pgV/Uo8ObT
         coD2naRPCx1hexNK/VB0NXdmvMXZR8dkbLy+fhdLbuDcn9UR3bBTWOn1j8wOAC6lJZVC
         1hzg==
X-Gm-Message-State: AOJu0Yz6oEFq0yh/B5M+x4F0en40px41OwKtGb5A3FDKt6NSxmZiOBS9
	mkXpVRtPlr9+A1RkRhFaYY7x4A4OIUAcGAT830hWM1aionxyFK8Nu+DLfSz5eDw=
X-Google-Smtp-Source: AGHT+IGIUr7Zxz02Lt3QSBl6zf9bVxtDlWQVd2opMVpiL/5zzJUcEzVsp3MmdF2PWOxCjjTwIOeAYA==
X-Received: by 2002:a05:600c:46c4:b0:41f:b0e7:f299 with SMTP id 5b1f17b1804b1-421562cc205mr13598845e9.9.1717575015664;
        Wed, 05 Jun 2024 01:10:15 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:37 +0200
Subject: [PATCH v2 10/16] dt-bindings: clock: qcom,sc7180-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-10-f947b24f1283@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gMEKGPflIqCjaO+l9PPn7yZxSHxALsYaFe7PstYkr/8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1QqtdoGglpiSZRNLy7kfnyA1ngscWrWk5bq
 5b293s683yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdUAAKCRDBN2bmhouD
 1zKlEACJ3IX7UsNUP4JmEMm2KDa+MxA8TpxnRgnxZkWWmGhZuXIuOgzdJLNj93rsDsfOp02GGJj
 mA1qCmTFsZybyBVbZb0I59fdw9hsdTni10qPXLybyN7yHwzkrYzthh3oFs4AHNq2R7r3PobdAq4
 HHUjCdvHWmcXoVur0HNMzZCSTgldLXjlFc8V3luA7waY8FqrOfoiv3auP1OV+QWGNyK5CHrOBwc
 1L5GMDcDrnyGCqnHUKf8HoImratQeKMxUxsoLRd5xrb6kGcPHRaZTTorjvtxOwAS73t7ozZmUXS
 UBr3C2WpCjMobY+Ovs4gWYA9rynmoLliko5BZpwjHfKKuc6k7H+c1298KhBpWYspBWUj69Juruz
 r15eYV0jA+nRE4SHObHHfLNcasfprnl3/UG9z8pYeSTeC7JEvWw+MsM6j8QjwtVePrTBcfp38i2
 ZYmI8MiUXHY7EkDlLM+F4dtN7pCIJEpOIDiPLFAODAkpnndW0sW5DoVu8wx5XGU4002X+Pxlfvv
 xOpPVMGY75H+hFDMAyw0l1FHbWQt14syTcxsOZuNUHUD3495VVMn4oFo8867uGXk+VPTh3wknAc
 6bspxxV0ro2PQY8tY4t3S7b6KOJFktXJXMOCqjThMySnLtzgjZiS0HF/LLGhJkzyQG6OEfNk4lH
 ybl0uBJuDDPL1hA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sc7180-dispcc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
index 1c9ce300a435..0d8ea44d8141 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
@@ -37,28 +37,16 @@ properties:
       - const: dp_phy_pll_link_clk
       - const: dp_phy_pll_vco_div_clk
 
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


