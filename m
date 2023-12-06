Return-Path: <linux-arm-msm+bounces-3538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D7806F31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEABD281C3C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82157321B9;
	Wed,  6 Dec 2023 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3QqQYRs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D4C1BC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 03:53:39 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bf1e32571so4450875e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 03:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701863618; x=1702468418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79i0nr6Mx6SDbEcWLjAX+WhVuGqRhzWJkAvdfcMiEaU=;
        b=p3QqQYRsXWnbie5anhv/gEkVbmXP+eNkMWIqF0qOZJjof3kLrph+lqB5F0Bc2Gxr0j
         rxNHvLYAXfmdFv/k886Unc/++nB1yCsa4Vqa4nzO8FQvKJmZibNRNMndsIdVX+xGQ0xP
         vdV+nkfWmR1PkxvPyJqGoKkL55KqdzYfSOjx4WrVeBIGQo6Et9DXfxqvwnkkleQYHpLT
         iFda1dgJGvEzAMxnF+YZmGxfS0uMNtExTzbV78MjzsbXGEn0vtyZdh2nvaeJJdJ9Q02b
         nN6aR0Rto3AXzUVgE7J84UMxRFbac2QfYTed2E8Yw1HtEWDvbjgUMb6H6RFRTxDKPTGA
         vEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701863618; x=1702468418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79i0nr6Mx6SDbEcWLjAX+WhVuGqRhzWJkAvdfcMiEaU=;
        b=Te5vhyoUUUmQ4GnZifxOGrfCCTCgfg6NzbOltAj6bzqKuW5kOpzJap0Sa3BYg5RWCP
         vnNz6gPtskuuDyuLKztyQg01md2cMMN183Su7NZXXZtEiKXDFJyi1m+CP+DEmbFPv6am
         EPs/jBn4CPor9HBvOS2D+ONXXePcRHZUlFFQURo5f4kHO4Tmj+S1S59SB7FY5PEZrAeA
         828KdZxbI6ijNmKZEROu5QeVvTPL3+erYIEkkSp41H5ip+LJcjciP/WLNXAcPugnaHYF
         ukHn5nI9FVsXT0vR0cIxJCCL2k+DK/TN0pK0cTOotv69cU2u5haDOBx7UjYqlSwgWSoO
         u1rg==
X-Gm-Message-State: AOJu0YzC3WU/CPmzRZ0IuyrBxyaTw4B6o/zrb76u8HtMWBBqO3UJ33em
	50huCM9jOr6ulBGsoj+cVstjZeIm5Yv8BSsiRiQ=
X-Google-Smtp-Source: AGHT+IE2TaPbtSnOjycRibKiMQ7n6YkJuP7QLfBLSQHgPk0U78Z5dIgqJ7F7+2AJZOkjIqFCKRcb3A==
X-Received: by 2002:ac2:5511:0:b0:50b:f82e:6d54 with SMTP id j17-20020ac25511000000b0050bf82e6d54mr496504lfk.20.1701863617804;
        Wed, 06 Dec 2023 03:53:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i13-20020a056402054d00b0054c4fdb42e5sm2337326edx.74.2023.12.06.03.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 03:53:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Hao Zhang <quic_hazha@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: arm: qcom,coresight-tpda: drop redundant type from ports
Date: Wed,  6 Dec 2023 12:53:31 +0100
Message-Id: <20231206115332.22712-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206115332.22712-1-krzysztof.kozlowski@linaro.org>
References: <20231206115332.22712-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"in-ports" and "out-ports" are defined by graph schema, so defining its
type is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index e55f69c2ff38..66d291b56019 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -66,13 +66,11 @@ properties:
       - const: apb_pclk
 
   in-ports:
-    type: object
     description: |
       Input connections from TPDM to TPDA
     $ref: /schemas/graph.yaml#/properties/ports
 
   out-ports:
-    type: object
     description: |
       Output connections from the TPDA to legacy CoreSight trace bus.
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1


