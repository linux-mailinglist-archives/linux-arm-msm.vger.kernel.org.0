Return-Path: <linux-arm-msm+bounces-22126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD34901281
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3872A1F2217D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD8A17BB04;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkGEdCKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5169017B410;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=s+CC1STbyAFLjoVKkLwdf7e4uGxLFWX8XNw1LVVgtJh3Zm71boc19u39p124/qA0CracUtmTi+e2KC4B+1oEIK2FtR9osQ3CdsJ16lDHcjCGPTQB3pBr24f4mwNfXFYXf5a6Nx7Ef6hYwpmWc8bgZ/yrmdgV0JjKbLdlZrZDPYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=1PVqbSEdTjzNUNtNb5nVf+8za+2HVUfuQBw5ji4FkkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBVpjGGLbkX+InmZLyu9EOGjqHCQENTyE8VYigQOMId9cuXstCMogckvM3aPwrkvktxs5AvEtwc3AQZbdKV1lri8o1nSSV6O6c0his99kXfjRcqp4NSGLaaSLM4vOUGfoTs2j7hPLlliIdE67P1gWl7I3WFoO1cFhtH3iOoWI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkGEdCKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4801C4AF0E;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=1PVqbSEdTjzNUNtNb5nVf+8za+2HVUfuQBw5ji4FkkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JkGEdCKKaAxXwMSPoCmHPOgQWdxzjHOD/26D2+dOnwpJEjcR/xulIhLDzG/sbt3dC
	 GVQYF35B7AVDJ4QwsnvdO/OoSO6B1AGD4rVbolR4XiIieJ1ib13eIiCuziGnW8In/m
	 RYy/9r2POv1kNQDZBV8LXqO91Dh/QT5B6V0hNOr5zxEy1e/hjSieEhWPjTyqmGGTtS
	 KvWBolM5e3XPoCDr47lLmk+BqRlce+XaUydHO8CFeIxJwRFTYARsEqm5jfegXl8JJV
	 JWlWa/I+V/iGgUiNEQiwsab0M+nkcn4FAkaN4FCqpiRNrieLabSaVYN83llNL7Uwl7
	 yzmU0X8QBf9aA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRU-000000003Q8-0hto;
	Sat, 08 Jun 2024 17:57:20 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 08/12] dt-bindings: mfd: pm8008: Drop redundant descriptions
Date: Sat,  8 Jun 2024 17:55:22 +0200
Message-ID: <20240608155526.12996-9-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for reworking the binding, drop the redundant
descriptions of the standard 'reg' and 'interrupts' properties.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index e1e05921afb4..d71657f488db 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -19,16 +19,11 @@ properties:
     const: qcom,pm8008
 
   reg:
-    description:
-      I2C slave address.
-
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
-    description: Parent interrupt.
-
   reset-gpios:
     maxItems: 1
 
-- 
2.44.1


