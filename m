Return-Path: <linux-arm-msm+bounces-55817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B0A9DAE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 15:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81DF5465608
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 13:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E0E14A639;
	Sat, 26 Apr 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fn/4jsZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0415A12B73;
	Sat, 26 Apr 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672532; cv=none; b=IRufk01zRC6vY/FhQpgyQxIUN2eMiBzUKyhHZLGlHaEhSMTsM8sTaXSpnHbXbCHMDCXAl7YPUzBHH8qFeYBjw9BlvCZhPYEw+Tf99cN0/JXEUrk7i27pl3KZb2iqz49JEZb4LmVfZjLEn54QIUXnej1rYTSHTpUdj3oQeTF8QwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672532; c=relaxed/simple;
	bh=ViLnr+YHftclB753UlUBBdyCrCd0dGRtcsAbvoZCu0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBjynfjlL6UNI4axbdsGhMZHf2GpooV8FeEtOuI67eKl/kkepsqnWdGrR4H0VYt4zpomgw9ChifpnwDV99oK/NIyW/zxFy0cDXhC6b0YG892c3a4qWBd4LEf4Pm3zafWl1Nvw04G+v4E/xsqt5xzQVCbnWqdShnf2sYk0bhsOs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fn/4jsZ+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb615228a4so736741766b.0;
        Sat, 26 Apr 2025 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745672528; x=1746277328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ANDUWfNKsZdPQBcng8o3Ct9reMOcOARWKm7ZdwbTys=;
        b=fn/4jsZ+hGqFFi8KRII7UjhTK5Ny6hRjlh7B7VwxAbMRrEKeOQ0bB9BjlNUg6HI+44
         nMF++d5rg6ogVqxAkZT8ER6k/j8+hrrNqX/13CoCeZPq7gL0DMJFSQOF5JKgWFw7E5xB
         QPg7PATSaamTt11aKaQlB6nhNTV6SAupBSPK1vmKO0uzDauJg2EHZ4lytCQ9HgB/6Rf2
         YmjONk5mOT3CsTykOKmWAd94OhukijaKujtmY9G/+HGWxaGfJ8nawpZoWuqxYgrLDrk/
         60mOgJk1Jlbh620r7ftMLixRNYcyaJYlhhHabPup6TmZ9tzxPKZKcFJNQVjij6Z0qx3y
         hi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672528; x=1746277328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ANDUWfNKsZdPQBcng8o3Ct9reMOcOARWKm7ZdwbTys=;
        b=CQbzKoiqk1544NLpJYZjFveAH8TvERpV8K43yxw3hPTAs5Q/6h+MmjPnycgooN42KY
         GqUYy7kq+4Xdd4p9zmtRZHzn8NxNs3SKbvNvjnMpOQjqwcKaY5X76edqWcnuY3jebpU+
         C3DB2InSLFYfUMgro1aGk0s/3ZfVfcNKti2PAWBUPE/VLrYAn/ND+6VmQYckJtVhGISl
         m1xYpNvIuEPQw7ccEdLSLDVFJMcsOllys2UGF2Pwh0dj480w9NTii9wuv7uIaYug8K2x
         44JeU5yhonlE8aUsuGGUMuWd87Pssh1AmLRLE1qWyetSbvqt+L3xt5KunNkLdmAjirxI
         4X0g==
X-Forwarded-Encrypted: i=1; AJvYcCU57+Bi3GXVZfcFGD4ntbfE0S2xYdv7NczwD6zbUNQLTfUKXLX5IID9oZWXtPuBDgYD3DH2tvI8HO7YH7Mz@vger.kernel.org, AJvYcCUStFTocwZY3vmVPY9q2Htb7ZfJgdK34eatXlZZMSeHRnZDlU56/JI9OmCrYVv62HpkeEzQ0JBQPY2ayxFyFw==@vger.kernel.org, AJvYcCVbo5na2/+UsMFTf0w3GILZTh6wKAmtX2wDHdaFiwSlAuoSotEIKz3CQH98mKaQEtgQPjtCOx+D5CvI@vger.kernel.org, AJvYcCXjJREqyhuYXhJ1AXOu4pN5xpqCSnCaI+Y78EvAinlsovLxN84LLV4x6S3S9tY1b0ZVnQKcipPe95K6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1igd5nKLTSA3te0JJ8jN6oh1qbP+kSAdmz0vHklHYO36e7Tk
	WD5GMD6+1ROH6b7QHe/t+RpLiV4FO/LJmkRsgLnRFxAJEuj1Z64=
X-Gm-Gg: ASbGncs2VmoRrEAE1dMLR3ozzjKEJTmN/1Xvrmm+mB4w9vwEBAkAY2QaH4UzXqDeXP3
	S+xWvt+O8+xXV+JGeBAAf0o1fsRzmFCrOzyZHgIX7t5/B6JiL41eqp/udg7z6DiktURqzEjOWsX
	4MRnQ8g4KpjBVkzDXzdFjm79Q6YlcK2gj0lYyy8C2wMgEIVzosfdOttVVM4tCudU3tpkJk3XTQ/
	Azcp4edH4Tk3LMF2QaF08jPZB1vzf8Rhudbgf41NfSMw+bP0gGMjffuNxJ5Y46vBP4ev75UAtYQ
	6rVdoWwdse7/FvSUDQiIdtzKO4qZtkXDCEgSbEks7ZsBXtIoiimkq3A6
X-Google-Smtp-Source: AGHT+IG8NluROvFEjxVfCt4ce0eDdUBumNr65G/RzXVXGoTRfxTZAsDAGcuIRj8Mo/IOeaaA8+yqRQ==
X-Received: by 2002:a17:907:868b:b0:acb:36bd:9008 with SMTP id a640c23a62f3a-ace7339d7fbmr541208066b.6.1745672527755;
        Sat, 26 Apr 2025 06:02:07 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7affsm286452566b.170.2025.04.26.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 06:02:07 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 1/4] dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
Date: Sat, 26 Apr 2025 14:57:57 +0200
Message-ID: <20250426130203.37659-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250426130203.37659-1-alex.vinarskis@gmail.com>
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Appears to behave similarly to Parade PS8830. Found on some Qualcomm
Snapdragon X1 devices, such as Asus Zenbook A14.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/usb/parade,ps8830.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
index 935d57f5d26f..aeb33667818e 100644
--- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - parade,ps8830
+    oneOf:
+      - items:
+          - const: parade,ps8833
+          - const: parade,ps8830
+      - const: parade,ps8830
 
   reg:
     maxItems: 1
-- 
2.45.2


