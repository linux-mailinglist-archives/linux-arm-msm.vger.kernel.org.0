Return-Path: <linux-arm-msm+bounces-64220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8FAFE819
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 520411C46A47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5952D97B6;
	Wed,  9 Jul 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VBt9VV5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8572D8372
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061610; cv=none; b=jVicy7yOhDzGoUQWWz7PnzwLs+G2EPtEHTAq0cE4V1hn1FaPD4JB9Ums4iXiBvSKF6IMz/e5/jFGcVn/xtAJ5p0ep9JdeGtYeRSBB5E7gX2evh/e9gOOo5p1sW2ENwLx6DGA780czKQpq8gd9hIRwDyx/+ZRjaM+CHT71j8Dt+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061610; c=relaxed/simple;
	bh=PvZsZ3xz+u5VNLl2F5wB5XkOzE0mkB7Ym735VGNcjBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dk5lN82JrGA1lc6AQ37siNxbZVRybKlIV5BkXEMgYGPdsb7F0NPc0S8B3lFpLToVJwD4P28Mp8EAAx+6AL97LN1dwsu3J9f3RmTGndO7MkzOJprrxiskK+IurTc7P+75DlC/rJQmWaEdTYqFDctwj/Z00MnYzSNZpzEIjzCJk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VBt9VV5B; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso1076673766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061607; x=1752666407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EegHvYrrPCIQqgQ2t8JqZ4VMYnZfDGCQ8pNV8iQc7CU=;
        b=VBt9VV5BGjG2qdOtZZi+3n2SISEIPJcgZK2ad7HSrLHG5Ci9UrUZKnqAvEtE8cVxPP
         ioOxHwEmswnyGrTCwSd6mzPxR/fKNLnSvmIdWygdAAoY8r8N5w/lr+nBr0R8S4pDfcUm
         qR/JqiNftu24j76EjMgcegC+fpurN6T8/LWYDAxcmN/x9QmvrRmezMi3+M+a8XW8vKnj
         70MkceQMDFmgJglNViG8V5Z/VQkQE4PvS6OvLriE61c8uYcy6dgkBB6wrgahJbOp67XZ
         8WeJ6FpoL9rnoXGbNQgvM0QbZFr2YdO1z1yLyi2NyShmRS98WQ7kyD6671HGS/ZlKCBE
         68TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061607; x=1752666407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EegHvYrrPCIQqgQ2t8JqZ4VMYnZfDGCQ8pNV8iQc7CU=;
        b=jTHiNaF5u2yo3QSWBuyAvE1hSPiaARLp7BZtMo5i7ace8CLnpq7jdH55f1U+T6riqD
         7FsUtNw7Yc/GUyvZupSmt2FtOQFJV/E2QfMu+HbOigmnlcMBJwCCLt7jlwjPQatreXgh
         xAuPdzrmSk2GR4hH9V5dwv5nc4TnBwD+mIDgv2Ic4VphNAkV4vh+LHrXpBXM1ZTNkJCO
         8UAZwt7oOAGtCk21hPHpr8musqQ/OWGwzRA9k19oQJdNyQY4LThj1c2m+b1GMemtUJML
         6QANFo4uRErL4wvx4VR11PKRHHuVSzarozrVw9rWjEF66Q3whhHMCwhmFFNQN+4plPHI
         ErlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX30ShHSj2pV7a0dFjTlTORIPrxTjztwKZaFAzNyA3k3cPlWeU2olB28S0n4r25jiqQaJt7cQU+ZxzZkC4B@vger.kernel.org
X-Gm-Message-State: AOJu0YxBqYkhlemKAlX+fFKM0ajLs48VpplhSV4wVm1i+KA2sIs/uTJU
	zQAl4LNAWPFj+cAPTHahyNHOU3RxfehEB89c0Ln8lQGKScu6x+UGxexBv92UgX7HjpCD+jvLO1X
	YGgyE
X-Gm-Gg: ASbGncvtJeRD7F5CQP5ESlIT5+qwL9FnmSeb3n9+Sz/dY241FvGz0OtS6a9OYAd/Yoa
	zZfmiD7qZSEy7OmkQi2iQmya5HoAGWIHyJOGw0JFkF/An5xH4+DpxYL4mHduG6XB0e58HwOaP/2
	TRNsuymev0KagErs/MHLGVZPSxkZfu6rYaQNlC8bwZuAdryRJ1KS2yMdFDF0KIG6YQVKoPtGdP7
	q1a2iNedGTOXMVUl9/l0TpP7kUNAnpxTzh79T3UG10IRfxoKwGRINXci3H0wBYZLjAx2v79pykA
	NE8QENAx0ZYfmiBVUT6jMA3iqmOGvozcZFKk+7ZLcp3BKy0Cqzpv6QIpqw4tuk28cWEGixxItYq
	FtlTJpB6Sx9XeL7Xx/jn0R4VncbuBz8bj
X-Google-Smtp-Source: AGHT+IH8++sSptF4PFmgOO2SoVkqa8kWBrD2klC0z8ScVA3E4cagnkpuHMUm8tmFrS3e+H+BAb/SOw==
X-Received: by 2002:a17:907:9304:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-ae6cf68abd3mr244682766b.20.1752061606800;
        Wed, 09 Jul 2025 04:46:46 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:33 +0200
Subject: [PATCH v2 2/5] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-2-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=805;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PvZsZ3xz+u5VNLl2F5wB5XkOzE0mkB7Ym735VGNcjBg=;
 b=+Lg9tCTaCrXGzDssZR84RrQo5jkI/91wtmSjNyg3a8RuAWb1/jKnh/d5ruDCxQ1+jtnzmbuLO
 xjJddmrddxpCCKc9p8vN9KaA1+nGMo2J39cjNnhUTDGOED0PeVOsLG2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the compatible string for the PM7550 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..d0c54ed6df38db82e626ebc0687cd5d3887abc5b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,pm7250b
           - qcom,pm7550ba
           - qcom,pm7325
+          - qcom,pm7550
           - qcom,pm8004
           - qcom,pm8005
           - qcom,pm8009

-- 
2.50.0


