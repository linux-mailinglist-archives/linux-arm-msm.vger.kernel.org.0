Return-Path: <linux-arm-msm+bounces-60844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D02BFAD3FEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A147C3A82C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EC024395C;
	Tue, 10 Jun 2025 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="XqzI0oNe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074EB23D281;
	Tue, 10 Jun 2025 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575046; cv=none; b=k7xu56K80mf/sGGhpiIcudGDmtM0bZ5CkXRN2IB9ZjMtCKT3KmWm5TNkySebOXnjTdYlzQ2u6Xo88KRMb0VhSwp0XAeS0Vh+DTu5BLAlP3wJM4hEygGn0Yf1ouOwIgpdg8GolrUZqDLn3GRMTiS8NKxjDV6duIPj8lyxjlrWJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575046; c=relaxed/simple;
	bh=1AiOh2rVXGqO7Ej+L4ZA40HnyCGtZ2GPEvImRwcdzfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0aUW6DdW9AfrfaYUrOjqSMFvY7Z+YZVezEHrFMT861ZRqPceZRf8A+pLiOjYAiPdfbs56Fu6LZga/u/CMBstA8Vvc12m76UwpCvLWfG21EJegNzLTvtHeCXkpQbGFvhpO5vUsR2Hcm5GOrN+1NOXZQx4mCJXFVwuio/WhcgbC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=XqzI0oNe; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749575043; bh=1AiOh2rVXGqO7Ej+L4ZA40HnyCGtZ2GPEvImRwcdzfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XqzI0oNewY9w24HLh+QAmOMwxUWTWGY7ohHoEgz0C905wj1sSvvnYix2tOMZZR5s4
	 ZT0VxyvyXGICAviJK6NhPD7fQxqbWJcp868DAwHiRQFLmRrliSxZjtUYRqyA+vufN5
	 S0dGPr29Z+sI4RbUWajW4rMjODxN9i+8n3tCv3K0=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 19:03:51 +0200
Subject: [PATCH v2 3/3] ARM: dts: qcom: msm8974-sony-xperia-rhine: Add
 alias for mmc0 & mmc1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-msm8974-mmc-alias-v2-3-1d8808478fba@lucaweiss.eu>
References: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
In-Reply-To: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=1AiOh2rVXGqO7Ej+L4ZA40HnyCGtZ2GPEvImRwcdzfQ=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSGWBZWq1HtOiWOGOLUM0fu9yhX69FPSyEZwan
 kCjX2aUg5iJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEhlgQAKCRBy2EO4nU3X
 Vq+tEACk2dc676/C5RbitlCAlAAEBle+cJytqaMSLYP4vsyBUyaqONbf0GESL6fVHODE+qpi15Q
 eP19b8QNgByvXa7euYIkA5/5O5G8EIlfkv6WTxXU0VcbjDIbBQJhI3vMPXEOBZ+g+0EhhZkscAd
 LhmIcTikVdV5LHxdPRE5O9D59XWTekBIcdvtpzHhwJ3zcWga4iOMEo6FgGgyH1qITzDLezw5f3J
 IknwPXfTMoR8PPvtFhQ1BaPpl5Y0GagyzbT+tSUcv9aFyvhM3d0cFwD1vzCRw2cmKFyyH9Ea23F
 zM7TzjwwgFgtrls8e9wXAwe+7ozRpiLEhBv8+toJYWPpfiG0Pt29m7PMegkWsRJTBeR5U1CmUOY
 bUPxNBxAKh+5dY8tK14/uXtfpNCklQ8bStlBO5c4brMWc3FZTswpWAmip5ENrkiVNUtWTvhxx7p
 U2lCx2u+vorYMrEbVu6a3uf/56YH0L6VyqRvGPtNdxCltcQk4XwgOQHCsifYWErGpwC7dDq9AGU
 50vNnl7nIKBiVwJemqwK3MlowrHaTO1UNQYa3PlTn7F+sXxrtv3dCosNWo7fJkxptpG3bnVHQpa
 W2zR16HkIRP/l0Vq251h0YW/t3Ec1G+slv5/gj0rdTsd8CDzIsBNVOe+4fkA9HbJqCBF371n6Uc
 wKVQxFX3lzjcuug==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0 and
SD card becomes mmcblk1.

This avoids issues with internal storage becoming mmcblk1 unexpectedly
and aligns this board with other boards that use MMC storage.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index d34659ebac22e65a511994ef201fe04f12089781..145908f319e47fbabfa8f59ea38be5d2d8487fd8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -8,6 +8,8 @@
 
 / {
 	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
 		serial0 = &blsp1_uart2;
 	};
 

-- 
2.49.0


