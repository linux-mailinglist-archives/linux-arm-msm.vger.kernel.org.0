Return-Path: <linux-arm-msm+bounces-4060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FC80AF1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 22:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2DF31C20CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F561D55F;
	Fri,  8 Dec 2023 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W96UevFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE729198E
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 13:55:54 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3333074512bso1932157f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072553; x=1702677353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SEeLdU51VRNsuOcRrVYSiWWzAmn1Zq+LC8LhMRr8pI=;
        b=W96UevFXHl/EVdt6Bhj2JzTDPGHKF6qokrUFOQmtJIbu89BRrlTEN/erVkUVOBVjVW
         zuLEQDZHTyXqwpvMMoaDk6Bq7KkPiJXbP+JGUuTCOZNE/u2cfqdvAxArlKm4mjUhTQQ6
         vr0v8PqMl98MgqVmmrOV4ol+P41mxCyC2+ndBEnieC/DLoc1DuQkrjxKOgnuRB5hzVB+
         jKHgPISr/Jlq2xmTbc4cM7BtHtRPNwfmXm0/DXjCI4vz7r3GQ8O/hhgYRFOGQf0xM7Mm
         N7AR2PqUT6jDzhcfBuMVVGcZ18GCsTyySEkKVw+8byJIQT0lmkUXugmRMH7QBkt7+JFE
         YVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072553; x=1702677353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SEeLdU51VRNsuOcRrVYSiWWzAmn1Zq+LC8LhMRr8pI=;
        b=fSj0nZtODtE6HCHtYlhdiQHbdsT1OpR3wtn6JmrZ7vdQwaLlfyUSTU8BMEWfUu9UjN
         U0sgwcqI4IO+B/Di7uTFySl7lQJMVSzAWWIP/csZT5UMhf+2GHD5Jcs9I575PcYXqyRl
         VpwvfTysN+hG+YC5Ja/eO3PccCh7Av8RL0/D6DZplqUsO1A1MpaNR4HYtbswJUFoh7TV
         hVTl+Qc2DEzea7sZt6e2vuiElVgfCVaFG1admymVZ/As9gyncgszUPAgdml6Jj3DiM8j
         Dww/mADYooQcuSiBlbgnOjHQOCcCmiKGkq22oB4ZpVFTrrIZzQ/Aq16wM0o8GMMYfXz4
         Q2Tg==
X-Gm-Message-State: AOJu0Yxt4v99czGgumvEj/dNJPB5734FNU97nKNt53tIiSsGpXKCuuZ/
	Fh3RZUt1MSwyAddD5rq+rbN2aw==
X-Google-Smtp-Source: AGHT+IH2YxIlTLLK4i5DS0Di7M3Nby75kSR11nKAeqN1WNZPe7dcmtNKoTml4velulZGPfOwezFslA==
X-Received: by 2002:a05:600c:54c4:b0:40c:3984:4985 with SMTP id iw4-20020a05600c54c400b0040c39844985mr215151wmb.79.1702072553351;
        Fri, 08 Dec 2023 13:55:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:53 -0800 (PST)
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
Subject: [PATCH 06/10] dt-bindings: pinctrl: qcom,sm8650-tlmm: restrict number of interrupts
Date: Fri,  8 Dec 2023 22:55:30 +0100
Message-Id: <20231208215534.195854-6-krzysztof.kozlowski@linaro.org>
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

SM8650 TLMM pin controller comes with only one interrupt, so narrow
the number of interrupts previously defined in common TLMM bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml
index 30432be8fb07..370789ce934b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml
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


