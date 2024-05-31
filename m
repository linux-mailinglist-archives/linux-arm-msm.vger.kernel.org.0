Return-Path: <linux-arm-msm+bounces-21283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D548D639D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B3C28DDC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F87C178CEA;
	Fri, 31 May 2024 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hID6YB4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E711761BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163574; cv=none; b=L3i15WrJ0Vv5tinWGvJDS0GAQUiB7drY8SPnffehvT7o0oc6t4lssNxKQm7ueupYMCN/9Bi3NiRAiE2eaPmwM17OrbW7A4HToQcOpy51lWVrVnpiaLPIN11sh1qx32MhGmpiWeKb9mBpII7zI1LjkoxaISFcUJynjHlEsPHbsFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163574; c=relaxed/simple;
	bh=UNKu3DIt1gZGv80xJuvgVBGGuUlUFj0kW0OgPa61sOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/8CrGw/bBIyVdarnAJi44x+elBwQpN8GQzUcR1gZImYRhTncnyCQCdQ5QtY+LlhuH8AnV1iI2+Ig67JBjSL/vEMQvNAFhavMLTQcmQO7VfQPRdncP46KZI05ZDGeT4cdgLRrWGS7btNTyVOm8lktxiBfVXPTy0PfX3oA48m59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hID6YB4S; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ea9386cde0so11036821fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163571; x=1717768371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u23uUMqdStYJwVaNGCuAcKhTTJXoHvb+6dE14ZkHq+U=;
        b=hID6YB4Stou0OPe7qaNZtCwWbX70sa1dwM9bBLJJyQI0VzMKpGTvom1ICL7E7ihGas
         QplTVXrjOaVI3oM8d30C9G9wM1jQdDWo8V2A33AOoGdpXatD2fmT9xHeoXAc1KfxWK6h
         i2tWgJpbq5SJeHsWXBK/d18KjU2e+zdMx6IoiyfCXVO/BLpzWyJizdVrDA1+ppiTA4ft
         lbsPagxgQsII/IL2tWeWpkYwF5PuwnuVWNXv1iSHbTEl8bR7meL3MjvnQkZ2usqlE5IV
         6T06TLRmg2rGNI8l8OIxtUEeEuS8jOmrfX+yUsqprQOHYeuffxwTaJH81Ozfd/hFmwgH
         yNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163571; x=1717768371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u23uUMqdStYJwVaNGCuAcKhTTJXoHvb+6dE14ZkHq+U=;
        b=nnRmj03nFomUfNi6aM55LBkzZWFbP9CQ02lgXTmksWiOGVYlum7yCmuQDHnlMHmTH1
         JnUmGMcc26kwt8sRwSvkBp7lf22MgQwNJWFAelWVKLww2bqzk9nR7MdbyKCRC9ZgAwJ/
         LNyApBNKf+KaQ7j+m2aq7LDaNRdsVeouf2OODV7IERn8ItdL1pThG4UQT2R2Z4I+Eztc
         +SbrrRATB024sfxI0YVP/huFLjFx1hxMQEYV7AffK9dqWRpl+uRNoKmdldypefHpwTIV
         0IdRsLzEuCezJAOPw8YlVGKLCz5/OOjA6S5IoV5LozeWP4gUWl2C4IH5OneEGUyQJmWZ
         eLzw==
X-Gm-Message-State: AOJu0Yxi+uNtk+c2K7zdEpb+tPkf9pzGvSKYp+vkjHWqVuZ0Dt3CKEa/
	rvmaspMAOQPeSr13Z1rqnOqYD9hY4xyfngat7rpenzyFaVWJt0nK8JLO7FLXr7U=
X-Google-Smtp-Source: AGHT+IEdQPHGJBhlO9jsDnIBJXGjWMxqUCXqEGIMwk/tJL+jzBzIN9NGR4VcC5F7PGGtUepc4TS3OA==
X-Received: by 2002:a2e:838a:0:b0:2d9:eb66:6d39 with SMTP id 38308e7fff4ca-2ea950f66e8mr14582391fa.19.1717163571216;
        Fri, 31 May 2024 06:52:51 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:23 +0200
Subject: [PATCH 05/16] dt-bindings: clock: qcom,dispcc-sm8x50: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-5-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UNKu3DIt1gZGv80xJuvgVBGGuUlUFj0kW0OgPa61sOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYaCLShv4ukIl94Gb6tMudUcTmj7zD/7iX+3
 OIEtlHFVBWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWGgAKCRDBN2bmhouD
 11QUD/9n7p5x+BRQDmj6yY0J4Wknao4Ji0kwaRVbNgWTS/B2hrZaRVGYCFs0vpZAw89NJFFSVoP
 MwtnX+drlq8/sTd98r+N6nSxcyN1TEtJsj8MnW0lMDX9NULqxPhfLIfR31bDHFt7HLRw/yqzOgT
 uIVtY3NziVdW0DLePah7WkU2Ys3oZvNjy6+c9moVcl0Gv2uBEXzeZQ1wGLfo7PwRKu4MeKi1KQx
 HJJS6At/7a/QK/KSmrc6078cpsTsqFeUDboI907MAj3EWzQq8lFfrO2DjxHlzmRnWYI2+ADIJBW
 +nyroCpVngBFtlczQXsloDmG4bkgU2wog0lLi1+QS+UMwdfAm3AAMdlBxL+BT7iG7xZQqfwG6vK
 KET8uB7B4M5hampSv3gbaGuz81cq5YPjoWpP3brlJ1ApNnF4gvQrkHiBZywAvY9WbgFATChSSzu
 eEq9/64pmUS3oZO0KfgXQqhPA3StoPssM6RrRkbdZUTLBJrr+ufLTa1IbZKv9GNX5FEimVwmZx8
 wbjOpCsuaGSsP5Cx9XY2pbx702mGZ7uiEa7jrfhOcWLqk2yxluwfItoSHvpXfgVQ9IxXU6ZaWf5
 PrYRCYxsFEHXaBTAisbJciNbhegzuOcwIB7ap6LnIka5yj8vGsgMOGjqwGceemrXiMOHYqzmJSg
 7aVyPXxVXhVviGQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SM8150 and others display clock
controllers are also some variant of standard Qualcomm GCC, so reference
common qcom,gcc.yaml schema to simplify the binding and unify it with
others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml  | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0d82521a5433..53a5ab319159 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -60,18 +60,6 @@ properties:
       - const: dptx2_phy_pll_link_clk
       - const: dptx2_phy_pll_vco_div_clk
 
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
   power-domains:
     description:
       A phandle and PM domain specifier for the MMCX power domain.
@@ -84,14 +72,12 @@ properties:
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
 allOf:
+  - $ref: qcom,gcc.yaml#
   - if:
       not:
         properties:
@@ -105,7 +91,7 @@ allOf:
         clock-names:
           maxItems: 7
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


