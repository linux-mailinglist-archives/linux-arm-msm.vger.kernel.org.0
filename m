Return-Path: <linux-arm-msm+bounces-54735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28049A93780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 14:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B407461FCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 12:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74F527602F;
	Fri, 18 Apr 2025 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vz5KydBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC91FBCAD
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980980; cv=none; b=gj8wXzJ8JNBAn+x/vKSjbn10LvkJGILdLHvN0hBrgKmXf8hoLTEToPNQslU01jasBZwADhfJeqe6lqYYNXbqpkjMAXfuzIBmc3NBdztYux4ebwUorOPEZ1ZPiSLNWQSund2R3tn4bf9na/ey3n9j8WrchGHpdidHIGtnylnW1Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980980; c=relaxed/simple;
	bh=QxBStM653qMk3zt33ESZg7QC2ipeeh37FGKF/pH07fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f6K7OW/NCE1pibgiTVAEsgQgxtc2xRVJpBRRGPQpCeCbsiIencY3DBJzfFbHOtJeBjFgnT3ksxYwewpA0h+hsvXwciqn7r+R5+16TvafxrnOHKh3kTFNWXVfqJyYSz0+B2+0LrHl8izx233ijgT79JLSXtvKPpbhqBekmsTuD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vz5KydBB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so15594655e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744980977; x=1745585777; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwW9U1zOxpNrw/kpyRdt72dH90TWTeKHCaa+HyJpTYg=;
        b=Vz5KydBBpT8pK85BuKGKM/6q8tEJ1zH0J2r+57UzNzdnzKkwlsKlp+vcv8B/GTpLx/
         ZOoMQzXXebKiC1EBvU6rHIzwC708vb2k72MJ71k4gaAfKmaHEoj3pViW/vCs1xRHA8qM
         0DfzRgIsrw9vVLEPVLewig1dvlsVDP2rUUY7tneS0FuNeP1rW8WyYNBw9tm8o11x1DCg
         hArWFa3nHJOA972xiLqta0ehCCMaOixfM0t8qBdZd1P11oy0qVi+gXUoQ3SH37URz0t2
         jsH6DrS2u8vrW6Z9DshGgK5ekrF07x/ZlznwaHEJyvbRi7F/tqcXkIunsDN0ejFddpz4
         Fzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980977; x=1745585777;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwW9U1zOxpNrw/kpyRdt72dH90TWTeKHCaa+HyJpTYg=;
        b=iaZpCbtMh8W198DsHumjzuSQOwgX8XP87BNTUX9bMIM2+2lrs8V6SflczBJyksp164
         xFf2eBTVhIE/JvgelE5aB1eHEeqnKZqU9wOgrwjmBRjR0UGHiJ5/ugI1IjSwZoJsLdps
         eJlHMHkEL4EaWTgmYXtZtZ3SXkDFK+eib7S42r6HBNRH+ourtEDbO2FyOGO/9r/y6gwP
         Wh+EzvyYpPMoVcdZkMG94NvcbytFXhhZxKdeGL9NeMaH/o1v5gwBZyJTzbN6zPgQ9shS
         BNI9KGMfh+PkVdidUfVVdc9cD9fJ1poB+96kUaa/Db3svXw4MRm3nd2rnscFaInUOnH/
         PxLA==
X-Forwarded-Encrypted: i=1; AJvYcCUpgkZRT7pQfc/9MZMqjY6VZ4Zk9C0d+6kPsTqctoGwGbqCbq6gWFH7HOAH510L66Nv+Lv3OKVhCsRbjAfz@vger.kernel.org
X-Gm-Message-State: AOJu0YxxG8to23YnkWo/doCFECYqg3Km77TVaw+cdfxi3P/KTOw2utT2
	tHBwdR5NE9fIKIimRChqavIB+oYTeUTQ7//HqK0xDC21ABQQx5WYXC4IcHCn59E=
X-Gm-Gg: ASbGnctb/NQLbg0dtqrcpZH8LfrbO4OE/7zjDwaNN/FRaE6JbXC8kdIlZRg+MVwzDMM
	slO0V3WwC4bni6lwZmKCB3YSnqsaGu1uijfq9Hj+LEU7+p0zr9Oqntp+DkMyRUnBX7jQ89Mu0fR
	LmgdIuxSokOVeWczv/oi6Q0ZIxDkSCnc9e79MICHUV4TqjidoLVp4OCljO2q+y4HoqBu4O7Tatt
	RWC0WU9EXVsLsp5Xqzltm2UTEHvPvLikZsVKim/nXO1MLcAWwhm4qRp2/1SPgBZaV0lF5wuDpmD
	NsNgHmUMhZsyLmnBSQ8a0y9I5bn5fWLg6o194Dfmb2OQH4e2QF2RS/ATy35Lc3f6br8Kg64X
X-Google-Smtp-Source: AGHT+IEtQ3+kUGoWlflvNpT36iuQHA8E2I2tANb/xw4Dqj0OGaTP2fa2pBh2QoG3I6k/9gJ1uU22wg==
X-Received: by 2002:a05:600c:35cf:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-4406ab982aamr23728395e9.9.1744980977296;
        Fri, 18 Apr 2025 05:56:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9de9sm21705635e9.6.2025.04.18.05.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:56:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Apr 2025 14:56:16 +0200
Subject: [PATCH] dt-bindings: arm/cpus: allow up to 3 interconnects entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-topic-sm8x50-upstream-cpu-icc-max3-v1-1-87d9c2713d72@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO9LAmgC/x3NTQqEMAxA4atI1gbaqvhzFZlFycQxi2ppdCiId
 7e4/DbvXaCchBWm6oLEf1HZtwJbV0Cr336M8i0GZ1xnWjvgsUch1DDkzuAZ9UjsA1I8UYgw+Nx
 g31imxfmxNQ5KKCZeJL+T+XPfD8WHX5F0AAAA
X-Change-ID: 20250418-topic-sm8x50-upstream-cpu-icc-max3-731ecf2a9402
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QxBStM653qMk3zt33ESZg7QC2ipeeh37FGKF/pH07fM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoAkvwifxZrr8v7fgOAmy3xR8mz1YwLLAHXPIJqGPD
 qqrutsOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAJL8AAKCRB33NvayMhJ0YimD/
 4m2g/DVnkw3HtvQp6cOV3xnwB34lAFeTWuxANyLRoGcW2DuUBqTBerK7fQYp8WGGsxaZB/2ZYoa065
 F6dwVqH/jMfMIfaQZ4OSfUmBJOil5Y6iggaxitTAttvL/uy59Cz06shLuxpXuSffiDt/yQaJa1/gHN
 xM+D6vIlPnLU/wi8Rn0UKff5R+urBihW3vJsRpFucXQFupdi3u8prBmCXK1qdDTuak+9/0RBEJP3tk
 DlhDNEUc81Eb5VrhSPsr4ePszPwe2b6MBMND23Ig8BG0CmzS/EBvKOAdlpngUqHh/ASVSuT7sDGuJx
 O8Aqfx4XOaoJAtOe9ntocCugWIbj0XrUHghdP+1NAIYMrU5gbpno6F2j4gF2Ojn74c+FSJtT+8FI0R
 hdXGG+VYGrJrvrwXqxaV5jEKCJFZ+NfCXFAETnR5F1QXIk8D/DjIZetyDRevIH7x3mCoGPaws9Fl1w
 pRmzeO+K5ALxl3eewexuuHsgKqxD4kuzVeTfVynHaXF1Xg6hETtA59YqFObiy/3jA6d1qMJ8H8r2Go
 daxSFfP8YXZPBin9IEsyAhEb57EFxcarDbx3otGR/wOIocIyEFzYlCh18VI9YSmp80n8zwP1hIXFAZ
 U9tyTq+p38itx7iUzXbSIvO3wgn8w1t97AVH5yVwlCPtqjxwCYx2BC9wzWWw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 3 entries as used on the Qualcomm SM8650 CPU nodes.

This fixes the following errors:
cpu@0: interconnects: [[7, 3, 3, 7, 15, 3], [8, 0, 3, 8, 1, 3], [9, 0, 9, 1]] is too long

Fixes: 791a3fcd2345 ("dt-bindings: arm/cpus: Add missing properties")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 3d61313ca00ea4fc50f07f1e353be49ddc2377fa..f04ce5355806e6bd575aa1f7c0a69d0b3b605fbf 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -301,7 +301,7 @@ properties:
 
   interconnects:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   nvmem-cells:
     maxItems: 1

---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250418-topic-sm8x50-upstream-cpu-icc-max3-731ecf2a9402

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


