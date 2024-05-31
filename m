Return-Path: <linux-arm-msm+bounces-21288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75438D63B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C82A283099
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0451717E460;
	Fri, 31 May 2024 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQ3VSxcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EC215B975
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163583; cv=none; b=TyZjOCq0OCqDpxrkoW8AGjq4jiKI60YBuBcg7GpSXN81lCHL57HNcE4HQQcXdCBjKh1VpjXTgjr9N0ei3Pi/NI88DbLXE/uB89n08kfHpLapu4tMTq6ZeuKRVo+sS75xHpIqx2i4c461Iw/VctCQyQGx6G9+pptRilQ5WRVGbpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163583; c=relaxed/simple;
	bh=3ORNC5FiUzzBbxJxApm6hBE/+x/nUPeOAvit+aoeyho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BW4UbourqJdtg7lqAEeQh7vTyJhyHdty0LSMAvPuvGIehdbGt5LV7FzAXefpcAC1tK9R/gpj8jvUHuQ0aeUJdRkCFE9FLnNIBl5+6TcPcdoPVBQQleIWp34P4jmHgxKgq9OJNxxgI1yu95AT0xAmvhqkL2bPIhiKDdVcEK84JYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQ3VSxcC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4212b4eea2eso8709985e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163581; x=1717768381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ov5sxw3rhPai6FMP4JukcZ0OC7y9cIlsN8cynVejVo=;
        b=DQ3VSxcCBFzat6X5rh2riBvBA881jEGroBAOAlpZYLOmAOo3pAJC13WYixQKi6rh5U
         PIIH4f9HwPKkfre0cMna8JtxI2cApPZtDb02Y1Ti3/IyqWMmY6vbPJKwMmsjoxihH6XG
         589K0u/CSBpZTzrjTvV/WIh91IYznLjlSPmY/6lQIR9pgwPs3sPO9TUb4K2yd1vXMJ4B
         0N7fyd2cfN7Rcmu90StXZcJ8s2Mr2gCBidENICW49aKuBQEo944UmwqYd6ZKBpL8ot/U
         tAN0p7cqrwhHs9mYLqi6WJxNVoMlfIkfezqzz9lols/Z5OG27KkuXEdqjrpkMEdXOK2e
         RIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163581; x=1717768381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ov5sxw3rhPai6FMP4JukcZ0OC7y9cIlsN8cynVejVo=;
        b=WiCP2n0Bc8c8IJQ+9ct8tlr/m4vRiRPTW9YIqNvYEB7j+5ASsLKW52MmRPxiBzHSDR
         n1ejdduLIEV6PokmtWg32WFxIL7GawJLAS9Uriq4cOKGs0ceOtssqzpfNiXO1cB0Uxkq
         OoCELZc5XmD6Q3qBAKn3FyzayUf/zV7Gv5M7QpojcEh+B7bALjp5LGxm/7BZHlk2uxTR
         AhWPeyK+c52CWptAmnOHfM6PUEnXeE6vL0HDAlDkzWsElT0GQc8gywnOLMLEgftVoWhS
         KCDnbPW9kxUnPe7Y2pBxdMJD1ZOwzDZgsxpa8c18ipng4RwWmCAOJtT7n3YRZAxyP2ZX
         sxsQ==
X-Gm-Message-State: AOJu0Yx/Jso69YQmUq+w7C6Uc4vr1Zyb4QQ0pz470PxPv+JHRw1hDEG8
	Fvsp0G1edLvX6jSxxhjkxpLutdJPwME/lrLyMas4lVRDwsgIeWYkKLQHvnWzico=
X-Google-Smtp-Source: AGHT+IHLmUnbJcy/tI/aT7k7nBc6TnOBcV2ilW6TEfhYRlR16vQM9PGZwyWxFp6zfG/a60HuszQyNg==
X-Received: by 2002:a05:600c:4eca:b0:41b:dabe:8633 with SMTP id 5b1f17b1804b1-4212e07576fmr14940735e9.21.1717163580792;
        Fri, 31 May 2024 06:53:00 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:28 +0200
Subject: [PATCH 10/16] dt-bindings: clock: qcom,sc7180-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-10-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3ORNC5FiUzzBbxJxApm6hBE/+x/nUPeOAvit+aoeyho=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYfSz6eqWW1CA/IJHmrRjl4xF9UaV9GNRl4I
 l23Ch0JQryJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWHwAKCRDBN2bmhouD
 10j0D/0XqoC4tAKR6RTXc0Wxd7rTaiRs2rJESEi6CGYKpx4oj0gK+p+7i23eyHrzp2bp4f/ok5s
 Knxk6juIAsp+UHTXUSFUqMKd91iLnKH8tkYqQx73/CFcInaespLFvgXt4EFFJ0vIIPHw+Cga1mL
 Vj/BCLyFmuqli/z/asvYGcORPaS1leXikuDtf3/9tlGxya+2cG39mew/y++tYwzgaFi4ZlPfpQo
 zAueUAJdTuraNb+GBzvONJBVLs943kAVMrIEXM/6Kgo/A2QIStdstkdgjMNrsaF8F1CEYRnazpE
 R+G+VakoNjhizom6fuSNs9fFXpTikehXCWbV1PU1cydtBbzkqKgA8z5w/jN6zxqlXyUQYeTjGOw
 H+6wQlj3YUThI/GJ2ZdMI06ikpSw5ycjlub+5YL0z19aN2qwWTvDyA6W8qDbUv86ZtdvNRVShDv
 YGpJI8XYSXi4pZZp1IEOIrREh5cUABP//Tro47zeRrlGOsLsr0E32mXx7rAY7Zy+TQoR+O0yqEG
 OaH5j2yrn2qGZSVByj1hZXglmfYWHPJ5OaqzY724MRMjNLwhnRBe/iL2SqD9dFnfCK6fPiQ6TQj
 0AZz0T4xcXgKwP+JSzSd92rMMPvkUW28TTEbsfF4HTMWlOYTt48HJ4N+rzaKwzL///tVkJBd2VA
 EgmC0PtggbVYYPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SC7180 Display clock controller
is also some variant of standard Qualcomm GCC, so reference common
qcom,gcc.yaml schema to simplify the binding and unify it with others.

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


