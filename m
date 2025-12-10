Return-Path: <linux-arm-msm+bounces-84848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F087CB1A01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0290730D69CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9773823183B;
	Wed, 10 Dec 2025 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TKDHQREs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26922F177
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331030; cv=none; b=FKhJ2qE/Ui0fLhnib3mwMXZN4Mp2mjRzVfEVsqEITCXnNqzVuZaJ0EzfX2BOGUC7dMK2nKH9bcrIe/eOSURAe59T9hDospWoj7ChbZ20ZGPUVwktzSa+DebACBaBGlk8lgpE5RrsEWHGy4H4Q89zu6Nw8UiJ1Jgp/ZnzJC0cYCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331030; c=relaxed/simple;
	bh=xhCXot8hsmFt2DLcSKtSiw4vNTASFIkZ8KLq7GSl+P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4hh/4OaOI5C9of9e1Q3wK+nBIlQGkcPkoXZsqwsZUzSlBCQ5eAoLKLIBN4Rw3IsWBQv65yeZP1EpUltKvuscXDkoxdvnjJadcUHFg5/0NZraKd4jqhAKDYDF4E2c3/Gwr8uMDXT+CFrZk0HKTrcBI0hI21C2khGcqyoR24G2mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TKDHQREs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso3716665e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331027; x=1765935827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N0IBwFgNK9lNAZzgqz99M2zuZW1zwkUP1bnHP+9GJI=;
        b=TKDHQREs54sbkjIhQkuFn/XV6kK+54opSLZ6QEKOAU5/EbEJ2CZTvKFZ8x7Cw63YEM
         k7rXeKv01RwL8bSnW6aKACEBZGLkZspsEGtiFumr9SkkUAtSNR2BxyBPy8oLJnxe9tDT
         4mzITkCSGwMNHrwR6vIA+V+MamKRLq5smB5EnbslbX5XQIh+BcsfiHLPf5UOG7HtMY/F
         p1nb37fs1mHyp98HeRV3h1dmcIAdq62loFtp6G2PVmMWhcHGEsVptY11sEVQ+KzzGpzC
         AnQoGjGyyd171mH7fBbh9SY4KorjMHVr89t3Lj9J4NXw8ZAOmHPZD9TpZ9XppEH3AArL
         3Few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331027; x=1765935827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1N0IBwFgNK9lNAZzgqz99M2zuZW1zwkUP1bnHP+9GJI=;
        b=jDXbB6XkhGaHpeT/l7IMfR+1gPXXLAQSaQKGC7yiqfXZERxaOI03gd1YhxhIDMW7Ab
         bn7qhmIeLpM2M/G88UPoDcWhA5Y1Dg0mno44lk6b/LWJJrrZkUSqlSjqjlOsUioB7i3d
         Nxp8gpJCHoMqmc81nOF6Uxv53KuCFiUolmi3/oNzKwmt6U99sGGYDb8RvJoi6LSI8IOz
         6sxrnQd3qs7cww2yHIt6vyY1TIB6i9W3JKBcdaBNMT+E+WAReRsFo3f3tx7DsV2+Brn+
         e26zOyU6AiyKnOdRbjSeCaJndFwJ3bRhPNRv30vefdzD57Nizp84h+6z/UPc4Y0LIYn+
         wLWw==
X-Forwarded-Encrypted: i=1; AJvYcCWbldqfX42F0nEJQN7NcVP55mPLw9ZMvzQAlOWZ6kEt87nIh9ATfTNmnOwhTeSKMBRKbneG0NDbdlzn/1eX@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAAOLs+3J96f+auIks3fFuG1MlxLgB2YsLaxjGtASiEYjht9V
	UKNoOqHElocGDVWSOA70Ak+kLD1OGAXvV8xrl8ws+vSRbCjtcNroLbgUlr13eNpXlyM=
X-Gm-Gg: ASbGnctfWCdpYN9aBvTK96nyjSdf/4l48IdFDx7XJEAeRBoqZ4CxI34KTOMO7hvyGdl
	ou793j9wvrkRJqrxnnWcCwPuv+Fb2cWTTfafyX4V9WGV9TeKaM9vGF3PfTFRcVc+N6eDuMha9ej
	Vgf2of4MrUcnmaEDwOk3gkSA1M7+qRyUgDXPXHvVe+IgcT4WXRbWDBkwB1klWTNvG8UkZ0AVFrA
	LTypGiayRgL9sUB98DXoLR7cBCaWGLWjKudFTNbZrNB3B1k5O5FUwqi/ICevqK2y1ORGKGR5E+W
	6tPtydOldDVJZBgQwo1WEN+qiyzYkGyciCkvEYBEVJftO7I39qHDaXjSHmePfZXgYg1kQUDqwSN
	ViDoTVJuPFb9dNa/nAdvHLKoHUDfIRD6lJq0bsvQF2dNy9MqasUVWYcNIlGfahS8d60xuqlWfPB
	lySl2nY4JQwrH1Wyc+cppvZl2wkDf4jFaR/hGjEyRoK92sBVrwnw==
X-Google-Smtp-Source: AGHT+IHIpDjAlaX67+EUBebH5WfoD8XeTaU8Q1moEvenJxA2sXGjjcYDyHTWr5ZiRpqzWMTjThGA4A==
X-Received: by 2002:a05:600c:4341:b0:477:14ba:28da with SMTP id 5b1f17b1804b1-47a7f919251mr23649585e9.5.1765331027253;
        Tue, 09 Dec 2025 17:43:47 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:43:46 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:43:26 +0900
Subject: [PATCH v4 2/9] dt-bindings: crypto: qcom,prng: document Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-sm7635-fp6-initial-v4-2-b05fddd8b45c@fairphone.com>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=921;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xhCXot8hsmFt2DLcSKtSiw4vNTASFIkZ8KLq7GSl+P8=;
 b=uiHgbBzSh/cvk/RRJg9TS9wPZ3NQ27X91ICPemjxsmFWX4ZAsH6iHP01WgSN8lo1qZwesg/1h
 kEnQZwCIdjIAGmxpMUxDCitqwcrIBDFnbc/XAkCmlbc6L36YYyelCEc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document Milos SoC compatible for the True Random Number Generator.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 597441d94cf1..a9674e29144e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
+              - qcom,milos-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng

-- 
2.52.0


