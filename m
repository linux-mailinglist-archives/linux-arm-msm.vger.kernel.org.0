Return-Path: <linux-arm-msm+bounces-49440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED716A457C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE3F216BBC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0641E1DEA;
	Wed, 26 Feb 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVIYU6Ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260A258CC5;
	Wed, 26 Feb 2025 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740557473; cv=none; b=LDEUU1Up/dwYx/xrfrMqKRovOLJ1UzZi8aXsl/mIAL9FmYhEP6t5EgoPXvN0UTxrC6pFL1czk8NLnkPpWZNEIMmSxHQwKADRPLr1tYQBt4IrM8CTO6E2sOrEKC4XQGuXqFEfoliahffLMTwIiwmfjYhdekOv0iDaJgr0KSmuSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740557473; c=relaxed/simple;
	bh=6qADMEIKsh7J2eRFjYqmGuEakR6/i7JEApIrRN75iDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0r6u4TVZJUfpMcIjzKZtOQuxje7ob0tEnmnU4QLjaKGDKoyEABAGruCvstcLX5Dn36PXnHf1dEp+0CzU6MpSRT4vePi6xr/8IzepvEcQTUQPzk3L3c3cp4jUbBofm8GVl2rdoRMprra/Rs/FfO4s8KyIW4UhMM2+q+KpFhlgr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVIYU6Ek; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220f4dd756eso137936845ad.3;
        Wed, 26 Feb 2025 00:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740557471; x=1741162271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9Jf0Oagwebj9ZNm4C2QZYgumEwK2jQg8IOtslTiQdw=;
        b=fVIYU6Ek4RGUinvTGeJvedh8lsPEpk7LaYTtyigJHFB9tE8UlFWkUoO6iK3Bbt7cvO
         1Bs99oHGJR8CN1gJ6jEKocA2Ks6y3IAqqSicCB+tjjpg0wRTH869NksvNA61ddntKvKp
         njku5P4aPtvUINhdbQozZk9j2hjZrbK0hEVcyX2x1ctjFPHm97C8xlyZ944agY9nPbET
         1ZC8k6VoQWCTwcjV3bEJbrSAmm/0Aaz9Ks8shS3Fc2q63CNNYOkicJIZuK4MFy0dTfx2
         NiEtg4BsIktPkoa21iqPkcZ5O4we//2pGYlhfrH2L09gRYiks0AEGGGUtmGIs27uMFS9
         ObfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740557471; x=1741162271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9Jf0Oagwebj9ZNm4C2QZYgumEwK2jQg8IOtslTiQdw=;
        b=ksrDE+/LuOkV7FyF4myPNv5C+/JJsM8FkGoyCHvuQAzGa6AdUiPLUhH0ApdR1MuBkO
         Qx7v6poH/iusYBVmTMKgLeBPbtR6Aq2sjWkPHvpBlxoGJxOidpQYhOy8JV4+gPrUxzmd
         E7d3zV0LJX4Nuhgrw/cFEBvxCFiNkqXu11s1R6vKlCst7thOqL8TB22AS/kOFtOOxWWJ
         X5iFBK1ufmfZ/UyRKvUauv1Z6ZY9WOjq4QfzX+p+q8mTxw2dKHYi3/TL4DuTMymPPBe/
         K+/lcDW/om5v17oLONSpS+FWikQRzvK/D1FgwGAhg9PPYs+HYU1nz589du337+cYbJdB
         EvQg==
X-Forwarded-Encrypted: i=1; AJvYcCUqlnmmXy7V53QbGixUui+SoWhjve+f2Zlhj69DKhvmksAmqSI/yC7+wPzs5uvScZkuXAUX+FAH5gN6@vger.kernel.org, AJvYcCVYuAMcfckH+EXEsjxv04TMJbXw3VjXlPN132wb2R+4RQh30HS3ghgY4m3OB6vzAQn1+1h9BnkOaFdw5DyW@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6rntXyszpkD0OKzDV9y0wsXAhLisYwSC5nkjHK0YQFxaB6dS
	S9IDaaKyPF8ovI8861iwZhFbnxPskdlbQngD7ApNblUIqeQIVsBUq8hLqe41uRk=
X-Gm-Gg: ASbGncv9mEylFYwWY7rnFtr70LgbKRH8sko7FPk8p7kwd+LcVO/mgU6+79jWuY3eHIq
	yY3LiIqoeL3+F+WIqpdO1FIjzPTYS9Gpsf408XPq9I2r801+euYzJ4IOQTBzlzvCJ2ir3Kuz3QS
	okYxwVBmawqjX/lp3VHtROjfLGcgie3PbdLberypBwggKShNOyThMmZek0vsFc8PlxdKIrnfxMh
	HLnIlLQuimJxh3gviO2xNUM4b3s2Qe9Xr3JvWN1SNM9T0JKESu+I9ZHcsAZVsBzXteY/lnhky9T
	PtEKpXlOj48DRK71p4pkrSbgqL8=
X-Google-Smtp-Source: AGHT+IGfqmu8oRuB/dsyDzar4naCLpNaNyE90KPfafcD6a/4xG+4AaYPw/2sdVcMVYWpywcORUbNOA==
X-Received: by 2002:a17:902:f54a:b0:221:7343:80f5 with SMTP id d9443c01a7336-22307e79369mr95313845ad.53.1740557471111;
        Wed, 26 Feb 2025 00:11:11 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:3de5:6339:3d24:b93b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2231fa8a570sm10641625ad.58.2025.02.26.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:11:10 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Wed, 26 Feb 2025 00:11:08 -0800
Subject: [PATCH v2 1/2] dt-bindings: nvmem: Add compatible for MSM8960
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-expressatt-tsens-v2-1-7a4ce3a91f27@gmail.com>
References: <20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com>
In-Reply-To: <20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740557468; l=777;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=6qADMEIKsh7J2eRFjYqmGuEakR6/i7JEApIrRN75iDA=;
 b=onftaXTmuw8prIC4ijs87P7KV1mDzyCedR6NnlRCLZEj9EkbcijIoXei2Lf2nTqqMWJWFv2Ee
 ofgo4YF+VIoAmZL2ktQH8gbtT3950NcmP60i068LgVi3Ubx4VuGYsc5
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Document the QFPROM on MSM8960.
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 80845c722ae46611c722effeaaf014a0caf76e4a..37282e89c8ad78b088f0a447891cd9301c750db2 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,ipq9574-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
+          - qcom,msm8960-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom

-- 
2.45.2


