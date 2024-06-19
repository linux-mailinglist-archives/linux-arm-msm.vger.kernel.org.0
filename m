Return-Path: <linux-arm-msm+bounces-23291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB790F81A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4BC1C21B2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4445576408;
	Wed, 19 Jun 2024 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="BURZkqFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900815A846;
	Wed, 19 Jun 2024 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830989; cv=none; b=sEH5NnMttpRMWRoKZOYTjhD6lb+jTfQCts8w+jNMG9yyBtwolls8YIs4w0TE6sTBlTbnBNsAeI7d4FRNG2v+lbsmCUcCxs+kzjmwiucMxUHHdGqWSj1l9qCTRZQECjC8S/3CWwSdKOuoJqzLNsU0zyIyYdrQocrwYQxWRJiNPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830989; c=relaxed/simple;
	bh=WO1VtNkBXXRa9Y6O24OZqkllBD/OcgL5EnKk2t+/i2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXOeF4lJrDpXDA098HnlhlZBqlmmcwB0NQ3dgugZPWoIVvSAmMxV2/aBvqmLLwK9zzwUPE++8lvPM52p3fUJo+jDXQjr1uOheXhWUgZ9qyj4FfvLfU0gw0ePMZFKrW5O/BpDeFB1aLAs5YKW777VZjuMQm7bgNP+2D6AFhiCQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=BURZkqFX; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830985; bh=WO1VtNkBXXRa9Y6O24OZqkllBD/OcgL5EnKk2t+/i2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BURZkqFXjSUGX1XWc/Db9KW7MMgiMJ4eyRgvPSHOFFgLbKSVcmjDamv0CMjA7IKRx
	 SegZnJzIzcGyNjK7oOAgN4+g84Kpq86vIQkG5+vEl5ZWXqYpYeSMHgzGnAGxsqAFg6
	 WXG8RMlkMHWu3oMr89bwF2LAbcV2GeVevz0LTXf0=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 23:02:46 +0200
Subject: [PATCH 2/7] dt-bindings: clock: qcom,a53pll: Allow opp-table
 subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-msm8226-cpufreq-v1-2-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=747; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=WO1VtNkBXXRa9Y6O24OZqkllBD/OcgL5EnKk2t+/i2o=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmc0eD9srpR3VzmWqPqkGh706sVpVcGPdwajhOy
 wSHvuGOzO+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHgwAKCRBy2EO4nU3X
 VlNeD/9snKtdFCLijgys71cVjFpDCkbgH/urqYWWOUZwJsbaK1BQ9hEQPxZL8V1K+gLTwxupxTo
 tmZ4Uzih7bWkVk5hWr/1MSoOseVETQp+zxoZOigCAkpuG1e6iEuExCZVYYlgOt7SogdG/Fl1uFr
 ppWMaYnXPpxaa2LKVMV4I2lAIygFYi+QD3f3ArnWmBUxLrFwwcrEGjoxlY7t0xK4dbCgiIwyJCm
 k0eDJyMvWvpv6eGXKsGCWExCVJlItnSVT683grVN5FcQ6jsgokMB2Py7sEHYDtqq5epaEMEEfOu
 tX0Tt/v5lBqwyxd+3aQK3o157Tb+swGtQaVRByheTXpJo4/6lQ1IeUrpMCDOAjo4S7avahQ3FJc
 bJrAZxh+E9zkMyA3u4fqKM17nyctMafPkb9BO7AVYYvsWpP1lc/l5fKoXvdpVejUPyyWV04k/JC
 9WDqziQTz6S38rBCoST2IB8Ok3bZpQktU4mDYBvLJV6yjN85hbgbEWPITvN0UH5UQkgHJl6hVZm
 1XC06pVNVTxzscza9dNgINZRdCS2ltBUiLuGUFJjrsVCR9wry2YPutwfqCd1zs4ih05fyGmoDhj
 wFFMUdM3Ni6uM4eJPd43pfMEixFC5xFQYr3GkYmXzHsSX6lXvLRtOcPLMU+slxcHcIqC55lFVMd
 jnRmw/xFUt+nmLw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Allow placing an opp-table as a subnode that can be assigned using
operating-points-v2 to specify the frequency table for the PLL.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 5ca927a8b1d5..8cd73a623ef5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -40,6 +40,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
 required:
   - compatible
   - reg

-- 
2.45.2


