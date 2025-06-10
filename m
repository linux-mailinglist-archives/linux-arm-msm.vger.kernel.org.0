Return-Path: <linux-arm-msm+bounces-60867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A82AD4205
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BDD0189C178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CE9248F59;
	Tue, 10 Jun 2025 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="u9aSaxpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711D23C505;
	Tue, 10 Jun 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580557; cv=none; b=N7gpJgoKSI0BSkzEwHd9HV8gpUpmbGp8aXaLORdVwKOZovINiOVZZ87VudEGqKcNpRQyIDEdDptIR8AlTm1VyuA6OeCL3djltqnH40GjVktRj5wd80Z8Jx8R5gJf1As5hYl7rj8f0pn9XvkSBxJk2iW7LjVx0aFiqg3OYjdww1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580557; c=relaxed/simple;
	bh=v60N7PQZ0qEhAwT2ZoCBLsiw1TXfUlnbvUIkPV9Cm0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QemsTHDC7qtTSSLNZmclE4aZZn2pDA7po1eS+0pvKK1MKKK2oad6zNDSOARQrcLNN5NL+aRihqYCT27uQ9YgnACDZH6FmU3PzROhC/o/ZiFfbwpwPu2DUrSbzBBbMbvSINmmo/iZfQQoEXwjHePNR/OBvZ2pHfCazkpK4eiFUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=u9aSaxpw; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749580552; bh=v60N7PQZ0qEhAwT2ZoCBLsiw1TXfUlnbvUIkPV9Cm0o=;
	h=From:Subject:Date:To:Cc;
	b=u9aSaxpwyBU9TISkC7WrXfmFcByt5EpPtmBpqpDtpX8PDHEWNlLB8eKINQJSrHD3g
	 Wi7Gqd9mCqMmvf/KRFJgaDuE4803a4IHLOw2+Ffbjzq9GNgE5L44yq+ih+LmG5iqU/
	 eewHsNOeT3PfccxTTBRbkWzMk5Tzefxv+8cH8lQQ=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/4] Add support for Sony Xperia Z Ultra (togari)
Date: Tue, 10 Jun 2025 20:34:51 +0200
Message-Id: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMt6SGgC/2XMSw7CIBSF4a00dyyGV0tx5D5MB4jX9iamGGhR0
 7B3sVOH/8nJt0HCSJjg1GwQMVOiMNeQhwb85OYRGd1qg+Sy5VpYtoTRRWJXj97YXlqlDNTzM+K
 d3jt0GWpPlJYQP7ubxW/9I7JgnOm219x3xqhOnx+rdy+klI64wlBK+QLwv772nwAAAA==
X-Change-ID: 20250419-togari-bcec79829337
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=v60N7PQZ0qEhAwT2ZoCBLsiw1TXfUlnbvUIkPV9Cm0o=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSHsDg1KBTYu27aW7gSs2w9FD2lRK++JLe+Rbv
 9/V2KW+1iaJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEh7AwAKCRBy2EO4nU3X
 VhYLEACn1Xm26fCzQi3G92Myb8uMO/W3MYc/n9+tP9yNLIRQUpDVQfRg+JYFu6WN0sx++NmfkuK
 SpyMvx9pUvvTmGFg02+z5y22N2xxwFK0opDcLIcWtKg9aU+bZyyXnsOMZbY04EQqbInHcLl96Z4
 vay9MJZwEax/QO0BY/FUBLsO0ogDG5XOYy3Ai1PP1PgOx9gSq6fKJiGeBsHyrBHZRW/0oJFsWiy
 vnxDtJ9AJwgEpxuUm++A7VAI+jOJNoq2C15XzBBBEaNxY+JEyD7WrNMGypotR7+al2GHt3sXAxL
 Hh5FSXyBPopEibwBEAJuDsjkzQMqpQkTA0gOKhCgNUM3THqAF5ZXjWsoOW5faT/a3lm+VWG7PCw
 GCxAi3qX0GpL8PHcEmI01CIHCfMse5VMSFyfydxyf9kogqpr3c+gmsuC6nwL+2wosY6MK1/BFbT
 Vmp+bjH94WZ/SqTUZM5ckKJRqYtHJhHB9JoH46oHD+vdHj6Jtz34g7Y+j3fQTTVp7YADJklZwIX
 OuqbhVfv6VBfrKjAphdtgt1EuGD1wUBUrPS99NqRZ09/zYGyGKMy1EZy+xJfw9cHsXcH+wB9eWm
 L1I4SuK8ShgQLHjB9QUw8vH0wdg4YYJwft7o/97kjMDoa+ABgj7FZplgEM/MB2xdA9hnrP3Mm3f
 ZnpWWa70B/3mOIQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Do some tweaks to the common file for the devices in the 'rhine' family
of Sony devices, and add a dts for togari.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- Move non-vendor property first as per style guide in first patch
  (Dmitry)
- Add msm8974- to commit messages
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250419-togari-v1-0-45840c677364@lucaweiss.eu

---
Kevin Widjaja (4):
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable USB charging
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Move camera buttons to amami & honami
      dt-bindings: arm: qcom: Add Sony Xperia Z Ultra (togari)
      ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)

 Documentation/devicetree/bindings/arm/qcom.yaml        |  1 +
 arch/arm/boot/dts/qcom/Makefile                        |  1 +
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts  | 16 ++++++++++++++++
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts | 16 ++++++++++++++++
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts | 16 ++++++++++++++++
 .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi  | 18 +++---------------
 6 files changed, 53 insertions(+), 15 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250419-togari-bcec79829337

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


