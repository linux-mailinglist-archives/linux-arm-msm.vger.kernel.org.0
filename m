Return-Path: <linux-arm-msm+bounces-65304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14FB07B1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 18:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C29A7A96C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DDA1A2872;
	Wed, 16 Jul 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgFvHLY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080E2F5326
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752683131; cv=none; b=rVuuFpl5JUOvPwqyGAGjgDr57o5bmWh/18iM5gGw9LD0CcNKstOTCDQ0wx+vLP+N8wQqVinfHs6BPGuRM2Fwus4/2q51z/om6D3zXYAjdPSHdOjnFPOTHmuzvtKSveSxePoweTU5Rg7zLUz7C1yesuiM/UIy6ywMoY/Ubph6Q3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752683131; c=relaxed/simple;
	bh=ifqUWykIKw09YdHBlJDHosbFjVKt99R4kYjqL+6vHWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvfz3zToduVxtVoVwjvlQbvMa5NO5uKtsY4gX72qFP1N1uW3HIlv18KhK9+tiigopKBPJUKNfKhfbImRf1OZp1SN6p6atBVdqGLa0pSgxXJYWEggYNQJGQ9CQSQzZUVkbtyfimZeviQzCuK6iZ6waXFQwTqITgPUIbxc76dD40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgFvHLY0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60fdd24613fso1284121a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752683128; x=1753287928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/KQk61yWGru3067l4BZnwmmevrhJMrhlMNVPC+Oez4=;
        b=TgFvHLY0hT2kvT+89RA0h1KTMJj0eS3UjAiEtPoFdOHkht004sItk8gNtXxZEbDDa/
         k1XAzWu2nXB/zbvAxikyIDBHu0qQ9/R1vYNgdENohI5p4CS+ywpeQzJbfptyvswAXjE0
         S29qHm3KveI8Xd7HvdxVl83KTxeqfd1E0kiflN+YbJzYSFl54mgzbUciMmeG6o8h6gEr
         szm4aFomJvbcr6kDhSzSXjSNuNyVWT1ciKzP1FNKuu0EnXqbMONa5Gpggf5YMNCT41RP
         bQ9BkIIN0BjClQf3x3oLbQ5ersqdTzBOFUTxH59Ei6meRpMxF3nVsJjSVNVkNJKjA1a8
         0uFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752683128; x=1753287928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/KQk61yWGru3067l4BZnwmmevrhJMrhlMNVPC+Oez4=;
        b=wQd3h7UmcFN0HD0ZBFhvcQ8gO8vKX3WZByGWOM+xWXTJqiUlboHB8K3kgn3KO9l2i+
         6rpTQALyOrZvKFTo1KicN1XlO3Htw7jmuJcBN6/SE3DPiG1UOmh7wJvskr7aN5YljmJ8
         YeEr4dUiy8XlPbTX3J2ITtFH/n//XzUx/u+2b/6z2TkxHiIw9/PQCjUT+y2kpIGWZqPQ
         jjlXvS85TspPvWrqVBD5x3dnzhc9p1OApmepXs8fWW0j+5aw80b50GZqRXyCJAiO/Z0J
         gHzoKTXFeyGiTJ3l25jVVxuBmpo9RrrpkkF2ByP8qG/OkBVAFlHh2ewsE+Iu+hJXq8vR
         2qGA==
X-Forwarded-Encrypted: i=1; AJvYcCUjKDISOdOhBt3JiIZu5JX12mYUEHOIYAkfpD8tXqzM11LIHMyd8YjrzkWhyySYJ2BGxsqnmSbmpFf2gyOr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhf4dyMj8igdvK0nG835GdSEjt5bohhF0+WquEe92+d3qSY8xj
	IHoIXX3LLpIiY7eluJ+jYzzI1G4yofcU7U0HJx4Jto7gxFmKTPCEFcLEUIHO22DRD18=
X-Gm-Gg: ASbGncsfiDh88jMcYagKpIjdlpIDfEqjl8KUaMFTUclDg145QuldmuoJq4G2j4QKQtE
	uy6f+Z47sLYLNzN+CEvMtF1bp38+unLvlwGEflSDEybb/jRziXc6Uhza8J4VI9eXJ4JQC4bpmAE
	P+tDS9jpRHv+ygqU2NNhMze972Lik0eFMNcvoamdsHOBZs0IaGL/WjxWZLYQFZ2N7ic0eZn3+8I
	HlatpPxpjRUWQstirCZZ0iKrZVUJ0LgVosGiIQkn5//TSgi+Keb+lABS1z1apCoQ7at4yaQsd7E
	sH8H60dEbXnmgfE3M0uq33uV8r8ApyAXNSoYdHcw3c2pEEWsJft17OLRew33g/+KMW1GpbzBS5q
	SbxgDsNXLyBAhG8G9cybhlqpViXQmOcmBDEP2dLD4IRA=
X-Google-Smtp-Source: AGHT+IHRu+EpPehRmNDaTTHsMBmUFIds4t5TwV6Vf+9vzMbgwhOgIMxO5v+ZllAYRRDC1jm7qh/cMA==
X-Received: by 2002:a05:6402:4028:b0:608:c372:5447 with SMTP id 4fb4d7f45d1cf-612821b8884mr1317142a12.7.1752683127739;
        Wed, 16 Jul 2025 09:25:27 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9734069sm8988916a12.48.2025.07.16.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 09:25:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH] dt-bindings: arm: qcom-soc: Document new Milos and Glymur SoCs
Date: Wed, 16 Jul 2025 18:24:13 +0200
Message-ID: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ifqUWykIKw09YdHBlJDHosbFjVKt99R4kYjqL+6vHWw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBod9Is3IFQpmE9WS7TDElgYejbb/uM1v/3EGYMv
 Agge+urKBqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHfSLAAKCRDBN2bmhouD
 16fLD/9RESlWBHNQRw7pktE1Q3UfMJmi+6TEMqrY6r6WOOWjn1p9FeqH0xbgdPaYd3wXwVxVD33
 32KLsTZ088I6iY2fhWn0fvUXgxwqHF1Sxl0VYwvARr40dle3fLOyzb5LzqOn3OKtNcveP5nGy8G
 /RVEiAbdY0PdfcM91S9UK0iuS7OBx/2KqPu58fpdayc45XvrjYV4w1SrhuRbT2fQjiwdLIqE2dC
 NCRM6j25GRbx/G1bWueA02YHzwcXuDMyPw6TX52axGqLIfCAxNgksGXld8U28df0MOLKGTzCVl3
 LgSxP5yA6ZF9LrOBYiww4moFnyo9fWngH7mmc/fP414FxKs/p4UTo0rbJZ1jhE+aUReo02/NkoB
 e85ZsxSwOIOZFDRas0q0GcOmUurrxnINRtkIYHXhbxBZRtZm5aQEv5ndRLpVe7IaY7+6gmpahEs
 1w8BhHwJqi2onCjE5OsmdQVhmFFzZHlvlaj2rpjm6Y8O04Ya3k6dAF+4QGpUiLLhGM+xKltXnCF
 Jx+iXCfabJw7HaKy45gArgWOlonV3gXy4o5mxogPRudr+7u+1uTIeW7Apz0Dvgn98gwT5VVqHb0
 gkptjumSRB3ry8mLk4IBx2jubvlclphYpwEj2W4PYP9wrictwWr/2tTWQoKvyqwH+YRVardiF9m bH+ugEsQq2aiQlQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Extend the schema enforcing correct SoC-block naming to cover Milos
(compatibles already accepted by some maintainers for next release) and
Glymur (posted on mailing lists [1]) SoCs.

Link: https://lore.kernel.org/linux-devicetree/20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com/ [1]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I asked for documenting the Milos name at v2 of Milos patchset... it did
not happen and patches are already being accepted.

Cc: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index a77d68dcad4e..27261039d56f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,9 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      oneOf:
+        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,.*(glymur|milos).*$"
   required:
     - compatible
 
@@ -34,6 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+      - pattern: "^qcom,(glymur|milos)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-- 
2.48.1


