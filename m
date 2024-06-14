Return-Path: <linux-arm-msm+bounces-22715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A39908997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 12:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5897281C72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 10:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB489195814;
	Fri, 14 Jun 2024 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilupk8zK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00296194A62
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718360311; cv=none; b=aXR6VSSk5mWf85z6Bo0W7+R01VwNPD24wWeiWmVO0KumGO+p4wRJ5h3APi9V2+cp0hXg43LLjgwYoLEJHgpojHvO4SDz4Pds7G8i5ojGNIL2FPN7S9cKkqbI4WjlMyKSJUFHl6xK+qVKlFy0eO5DN1O4HCnz1obi1iA4U/43zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718360311; c=relaxed/simple;
	bh=5IhnbDeMfhrQJFjppRaXrqKXHovo12yYiCutUlaZxUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+UAnLJ/gv5b9FA3iK/jYiys4cdL34V2Dd+MuXt7Ze9JmpxiTt/YpwCpTImnOaIyoks9TAME3bFd/pEKKrOEvGc7y675QgP1Tg/Tk6v4O6k8OvYon9bWaIEd6R0/wEUTx8LX51v9gSLgcRMVopWePMSDjFq5pM0oJDuiGiSjGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilupk8zK; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso21465471fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718360308; x=1718965108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9exy3tODP6D6SB8BPoapzrGAVV2VEaTDfn4vpIL8sTA=;
        b=ilupk8zKTEEKfknHfyHltZ1UtVyCthM+LEStI1mOCDuwJg7Rg0obBjrUdl8XSUp3SP
         NH1xa6dYb5o5v/hMSXjjQ0PHLACqolsUq6vlqkWE39eeKCljfoo2UhQkmfo66CdnTodo
         MODG/HOb/FJDpERWGenc6+j5qG5W1GFXRYEHsJRnBasm/DD0XzYxnzXUh6IWY7wRzyEm
         Lh/owOEvf9sWLoRj2CQjZk/gbNcOofrLGax9MECpVN0dGElrDw8UIV/aIbdFSt02QraN
         rG79Xyh612QchCs5vLXkOMjZeT+gTA+fBAsPm7qCGCbWq0EPIIStS661cHWnC3IR9DSR
         Oj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718360308; x=1718965108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9exy3tODP6D6SB8BPoapzrGAVV2VEaTDfn4vpIL8sTA=;
        b=i0WqyrJ477q2pDWuBwsVg/qWG6KtNGlK507rs6rLDyR6bC2NA0F0QsSOhoB5r/bJ9I
         UZW3R1q5Iyr7ifF6zcL7pvItabMTOSsICPOUnxbnVbf1imRumF52MXIbOmcpHBqFzmwe
         dqQJmtER4n/mhT45WUrRNUPCpJS0TWdqHIzULEVQ8VzI8u84VytF/bb82ez8jg5ptI/r
         CI2H2RRJL0NzDKqz9UCX1VEN27jL2JK5ylJAVhsXksqcE6D3ilWGY+3EDk2Ckv4tIcut
         OMCSVmnttmhpwk+m1lMcijsN3JdydAEkr7dIiEnmrYQNFXUTyBkeuDOy4ZO1gUx7dLni
         X82Q==
X-Gm-Message-State: AOJu0Yw6Z6kN9t2mN2pzttTbWdC3yCbfMQXDEH5T39Qwgn/13d1a/lJK
	AxFMYCm280l5Lmg67ZTdNoKyJRzEPqqTS4NL50BRK9tAMsiVG4nXipiDHOBEst4=
X-Google-Smtp-Source: AGHT+IHif8PpMrCNZ7ondZJ4LR6vU61Ku4c2yc3F/h5NwMAY40GaKl1XyS+EGiyfYT9ejdFAgr36yg==
X-Received: by 2002:a2e:6e17:0:b0:2eb:e023:5178 with SMTP id 38308e7fff4ca-2ec0e600587mr13757311fa.38.1718360308286;
        Fri, 14 Jun 2024 03:18:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf44c4sm5000241fa.9.2024.06.14.03.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:18:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 13:18:25 +0300
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: drop
 second output clock name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-fix-pcie-phy-compat-v3-2-730d1811acf4@linaro.org>
References: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
In-Reply-To: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5IhnbDeMfhrQJFjppRaXrqKXHovo12yYiCutUlaZxUk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmbBjxTDpJm67FOO9iMkWmjTpU8w1Er4FyDsrac
 4ANw9FcLIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmwY8QAKCRCLPIo+Aiko
 1Qd+CACfpgWna2AH0ACJYVYlQPpNS9ppWj0l0jeTzfUGMMtuPTeWpkOVseRykJvNkdJyi9OXO2n
 YpCst9+o2wZmeVwGbD7N2VOoBLqgISBUqRyLdBPeUx7kITia9e3sw3JrAPIQUEncPEe8W8y2orx
 Q3yR35x7+Krg+8gd5I0ZoWiCz8naoM32w7j/SxnvP5CYlWxvX5QAea9FjnfoeOoMlItMTCLu4BE
 bpTqwOY4k3ZsSR9chkPswI56MAd/Utbk0aq1NFGoXkQR3haqC6N1LYF7KHnUJq/GVIzxFvS5NEq
 EvVTquA2B6AZds7ZXNfdB9NmGm9kUU5tBgfuaKJLydnewXc4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to specify exact name for the second (AUX) output
clock. It has never been used for the lookups based on the system clock
name. Partially revert commit 72bea132f368 ("dt-bindings: phy:
qcom,sc8280xp-qmp-pcie-phy: document PHY AUX clock on SM8[456]50 SoCs"),
returning compatibility with the existing device tree: reduce
clock-output-names to always contain a single entry.

Fixes: 72bea132f368 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: document PHY AUX clock on SM8[456]50 SoCs")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 16634f73bdcf..03dbd02cf9e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -91,8 +91,7 @@ properties:
   "#clock-cells": true
 
   clock-output-names:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   "#phy-cells":
     const: 0
@@ -222,14 +221,10 @@ allOf:
               - qcom,sm8650-qmp-gen4x2-pcie-phy
     then:
       properties:
-        clock-output-names:
-          minItems: 2
         "#clock-cells":
           const: 1
     else:
       properties:
-        clock-output-names:
-          maxItems: 1
         "#clock-cells":
           const: 0
 

-- 
2.39.2


