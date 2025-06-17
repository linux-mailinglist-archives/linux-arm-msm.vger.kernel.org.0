Return-Path: <linux-arm-msm+bounces-61569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645DAADC67B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987501899C9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF3229B8D9;
	Tue, 17 Jun 2025 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG2LpPlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35929A9ED;
	Tue, 17 Jun 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152642; cv=none; b=NTCTd3wTJ/dYJZ96ijgyWKprzAiircGi1KREhw9SwmPnvMWezK9ysspsYL+XsLMk4TTOzeeWbneQYaFJkWnfdxJIJsGAH1Lj/QOnJj8RDxwtAt68ENw1rUNMgRxboRZOeWAv8hFx9Nqk7sXXHp5Zq/c1JelM7erml0lVCKUSonQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152642; c=relaxed/simple;
	bh=9xQsne9GSMDLL/WRbZGXifZmwJoyh0DZFua8btj4XoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+jWlpTooOqwLAhTTkXJZqvgXU+FQDomWhpqyAzsDQhNiGzQazy0H80I2aBbSRm8NySTMDb220qkMX9inh09QZ5aiwt2YAL5dBzHwOjBxH5XBzaymkvHWOlzGx4BrNRg7VcLAsITMiOiQonXbdVlcMOqM9tiLJXOrVMp1UFHiUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nG2LpPlF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af51596da56so4877142a12.0;
        Tue, 17 Jun 2025 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750152640; x=1750757440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uF5Bna+lHOFudtzymqm817LY3dKww4cMPcSIGpegkAI=;
        b=nG2LpPlFpNzPpdXOAXE04S8pZLkxqHyG60PzYqN9XGv+Bny53rPR16JtEsi11tR6Bc
         +ELsl5XQVGmsUZ1BQ9FK4pUuseEfGRubvSAv1bS4uHtz7P04c8jLNnEsl9goTwIbFrmN
         hWcZUUWdboEmcsYy6rqdcWob8BXnzV14R/djdFCd7lqiXYKhUHWMnbatSu6iWX8DHPQC
         VooQQdKVLlKToE74zSoZyaU8j1AmjApEIQGNdDZA7hSbwNZpqPK5XbDwLeQlxmyRC24X
         cVaMty/Yichgk086GQbVr0l26u005Sp1f3bvHPK5masYWrWNNsy9PYMqvi7psinjg1dn
         nPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152640; x=1750757440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uF5Bna+lHOFudtzymqm817LY3dKww4cMPcSIGpegkAI=;
        b=MBOFkNpMjBmTkHYI/ERL5nFE/MSF7wOXvZTy+LNEUO+tnq2Y0F63r5ueOz0mUDDwNe
         XM32Ym4++jqBK9gi66FxpSHQlLQddXU4HNYLuKmTaYdpex6/CAIQ1zfIOP38lQgBRYyW
         cygrsdw397oUhCZf93WRf5g8WnjLAmoo9M7kx5JLKK3oDxx8P0YfUcd7pIjCAdAmIjv9
         7iB/Lk93tzHlWa+BVkeit2NetflxlK0aAxrLSy345ggd9mfVhBWll2Xa0fuMtmoPEqLm
         9GdzsFLVZcR2qLuiIU/BszdgUEta9iCGh1wcx9RRGa9bn9LZS4JR/mvnM04RlEvd/9e3
         6E8g==
X-Forwarded-Encrypted: i=1; AJvYcCUwhch3IFHZjHWG2LkiFO73pNhqeCBPkTna1HpvF9hwaVsj4BDLs8Ye9IcQK29LNXAQ+Dl709N5GiovSevs@vger.kernel.org, AJvYcCW58CHEc1R2VKuvCSfFK+/iRP2I4KmVr0xQ9hb/dbxWaIH6RE24PrX5KAnGxsXSJUWqQUvv5ByjbKwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8SEg/AXDsAFylOd43LYi0JyNSJCbo4F3+k+Ja7R53hC7ZJIV9
	UakEaLQ9MEwBAEaz6iIcJ7lTpbI8SVi22EbTLQdD1DlNOmAe1O8H53kx
X-Gm-Gg: ASbGnctw8k2sQ+8sl73sWAq0VhIQNoVFWMao8uylT5ruEygp04I9GhYvulWUYeEYoL9
	gRYCTr6yV2h3p9LDluUzmR4UGg5kdUr2HYw2f0qzrbNy8Ow22D8MjZFoRNnGMazyAQbU/JH0wSK
	RBa9BqyL70e4gEQQs01KDWEt2LAmxuWjNyA0avYDJPvLzUD2hgx/gHcTS85XF0944MIlXT0cejZ
	YkVy+MHK6rpQcrUy5J8Uk0Q6skyqdGockgQCQY2jwJaJBNU84DdOobC6/MrcUU5uteEFuvArPGT
	feLRP1LiZm/gCEi9zXNCMebAhKH9jEWLukMVNCx1EHJtJAO5kXcv1J/S2ZJD
X-Google-Smtp-Source: AGHT+IHDM1WwPrSCUMsN0nugvtXjDvjQgc8tDKCWAzLWCVMTvM1TRTKnVB3aKaCj6+nNVRu3HF5N6g==
X-Received: by 2002:a05:6a21:158e:b0:204:432e:5fa4 with SMTP id adf61e73a8af0-21fbd5598admr18662542637.23.1750152640375;
        Tue, 17 Jun 2025 02:30:40 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm714417b3a.57.2025.06.17.02.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:30:40 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Len Brown <len.brown@intel.com>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add Ntmer TW220
Date: Tue, 17 Jun 2025 17:29:27 +0800
Message-ID: <20250617092929.1492750-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617092929.1492750-1-mitltlatltl@gmail.com>
References: <20250617092929.1492750-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP
platform. This device is also known as Robo&kala 2-in-1 Laptop.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b14206d11..e17435e88 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -861,6 +861,7 @@ properties:
               - lenovo,thinkpad-x13s
               - microsoft,arcata
               - microsoft,blackrock
+              - ntmer,tw220
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp
-- 
2.49.0


