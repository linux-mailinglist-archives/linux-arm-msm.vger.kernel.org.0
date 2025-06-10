Return-Path: <linux-arm-msm+bounces-60865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F0EAD41FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53003A489E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFB02475F2;
	Tue, 10 Jun 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="7Cr9ie0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56A524677C;
	Tue, 10 Jun 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580556; cv=none; b=MQuVQryazTocunPhknwt347VAKxOWVuIYm5bASqe1rTbdvDnqt0p1OOrjOsVLJSAXRo0J3htydTb3Y+cSvJ2b0MNHlwZ71uH4QE3aqrM2mNi2xUTAHttxAzPK52yiU1DtSvP/UAcKrYOZK5AUad0JqSLRkU2oN0M6sOIuy/JlmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580556; c=relaxed/simple;
	bh=rZFdLPo+ZGKAsUatj+pgLkS5IScmNQjzUSmB5bGkfeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1L9h6Yp7TdumoeSSActgDa55/I6uc5kTTLB/UguA/TmgyLnSgz9OB6Yo0qSz6tHdCX77igQ99J9/ISy+Pw9k1PPwxHb7sfwvMGJGHLhZW2kUMmh6haPpeJrlp+A4c+pHsFrtrUBU2T9MFmyH23YGKSpnUEmMWiat844GxM9HKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=7Cr9ie0x; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749580552; bh=rZFdLPo+ZGKAsUatj+pgLkS5IScmNQjzUSmB5bGkfeo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=7Cr9ie0xoWiYzkFDmSYmJtLAHNRimeN5qUlUOEsGOjER7saPLltKsjZgtNLJv1MX6
	 KXY1e9332m4ltYkWFoCY1MECBJOofcdoBfj0jlAFgDiYa5Gk8HoVnNKbeh48M5lerh
	 wP2h3IdEi5wWCbSB5icVuLo4gXHQzpMB4ppP6vBM=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 20:34:54 +0200
Subject: [PATCH v2 3/4] dt-bindings: arm: qcom: Add Sony Xperia Z Ultra
 (togari)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-togari-v2-3-10e7b53b87c1@lucaweiss.eu>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
In-Reply-To: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=835; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=x22XA8dvuCPzsVe35u75L1ComwDaFpm1K9xrGsyaZX4=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSHsGfFXKMDYS3n4otQ5/5icnAgJwcf4dWaROq
 UcGt84SbOaJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEh7BgAKCRBy2EO4nU3X
 Vvx9EADXIw/v21sb5XfotCPZOqtuia1X3DbPUB26c3EDkTYEhn+81WPCJ/kzAnXLP7WM7pLhb2U
 1N0VVkznYm7yM8uuLFxJ3HBX0xq0Y25HDW8/jc9glbfV4W+If7sxGQinymZq5FHvK1j4xrJ+mOY
 16xDO9l3PxvMZOsOmVWkJ+0JJ0yQfVr2yFSIQelH9c8EgPzut2UZ4rvnRzHEkpFe3AaRJRruZcw
 jkjpNbXbLy4LkcGPs6n1w5ZKpGyxTbOoFIbLZTRX+0ZldCkVYk4F79t0vKjiKRTWlgbUaNX3xRi
 +vrSAj6yXG8RiB9flzaHKwo3PhCwjT5FNdCpKm5OLLjGD6vPJ0BshppX1PcikfJ/uEpsYXZiLGZ
 bWY9a3jlMXVjnwrYjqcw8sy1TcylBIxY+FDyyLePStWivEz9krzRLBQmaxbXi+cpaRvLDIXHZ/c
 fJLpgV+N2R5CJZN2JK/VcwnUQTzUbbcUHEbVWMT+XllnOt6Zbi5NSsDZVL9NWrQi8nrFu+gOreY
 NtV5G7+rLkZLOkFFu6cSijyeMRIjO2xpVnbm3u+RN/lKp7UjQ3oAtxc2LuuGsYsNH05RBeZm6fH
 Et5XHnAFaTsFD2IUb8aas+JSRD//jhXRIGztO9I9pTc0SeqTvjMEU2sCSwPnN0cdxL6npNLrunT
 qiZOqNQ5qNhEszw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

Based on the msm8974.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..b14206d11f8bad895da107c8c7da9afe54d58dde 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -209,6 +209,7 @@ properties:
               - samsung,hlte
               - sony,xperia-amami
               - sony,xperia-honami
+              - sony,xperia-togari
           - const: qcom,msm8974
 
       - items:

-- 
2.49.0


