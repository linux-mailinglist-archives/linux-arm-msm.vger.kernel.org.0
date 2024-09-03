Return-Path: <linux-arm-msm+bounces-30583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0FB96AC65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 00:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B401F259D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 22:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BC81D5CD2;
	Tue,  3 Sep 2024 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+qMb9dO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57411C9DC0;
	Tue,  3 Sep 2024 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403393; cv=none; b=KYm0rkR3F3unXK1BYhowYh55bRPabbULpVUgL00o7R7TAuMl+XjsqfStl7PUsi9D+h1CMFeV8aW03fmXDh8FQt1Cx9Ja09EgGQGEnW0vc1YENWfVn5WfbSZkw5iD3Mv+wIm1cR0feyQJztVBlvaxM2Kehk3Wy/F/5OTleAoQSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403393; c=relaxed/simple;
	bh=LuiZOgZi8PytwfFBR/Urvw9IrMbLOofHWYr9IX6Y46U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pNwTFFR4lMnmXq9iWNDBRCu5MCbMBb/Dz7HLx1ccDKTFjrnbTS1FLQSrRweATJNYnOT7Kim+EjOuORCamM4ouqAk8SfQ4eVtadJF43OuZ1kDrz87lFjRF0VDnH5Pan4z2JR6lGMmlY0JgqOyGSdLOe3LdNrgbo3yfMcm0v22Y6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+qMb9dO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42c7856ed66so30642825e9.3;
        Tue, 03 Sep 2024 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725403390; x=1726008190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrfLNbtIzyltU3eNfiQxoIy3zhYyGkaG6WyY2wUNYbc=;
        b=S+qMb9dOgVNvPM5yWqOjGNE9s8HiBuvw/8/itICUDVVKMDsDVFnki9QecrfklQu+vC
         6bQoxuemVexN+r1yJo4zW2Yuj3Ex5gHaF3h1AfnHKN26bXLaljOhX8keEB0BmZAJ1Q+A
         rAWiNTYjexNslChuS2hF/HNCAWnD1RUu235huHyb2OuaOK7sDdNs6MWKFqeCxtIOGhdt
         LQYdNI5NXKY6V5g7S+WUhuh/W7ItA6Hxr+RnKritfaC/zBlyk2adlssgfM04Iv69MFCR
         abAQywAQEmvsnWO9x3oy8FB2ei+4a0vM1HqrX2tjPTihpxNUqgZWyReduioTANPVgb/I
         NmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725403390; x=1726008190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrfLNbtIzyltU3eNfiQxoIy3zhYyGkaG6WyY2wUNYbc=;
        b=QLLfTcsGVG3vok4Roj1Vin43N5rTkwfARgIbbkNJps6BrOB+hmBpd3dzbA+XKV8sZq
         O6I2YsrPVVPckc294lJvQNfbli+DalsswW0RXUFSJWtF5MdrT2gpAAU4ajeRHKkb2+rB
         2hxRWB9qAmfLyJmC0DpC7yZUUk6QEA9tTtOpFI8ENT+mVAs+LfnyV2mMqu2lAXjtmAT9
         UXwXTpxfFBDMetcgsfu8pgEU9JhhJJ7GTccGC9zu921A4jwWRWd0nrJpoUW4gmyFZJ9Y
         09VCa6ctJKE6MaE2TwYOuU3B5GDx5qAuODdpBg5bROlruN0rK2el7otIWEQBNTId+nzu
         FP3w==
X-Forwarded-Encrypted: i=1; AJvYcCUusPJDtAjSh44TY8mVgPpFe7EjymEU9/7fIHL+0U9XWl6q5/v+b2iT/nu48nwBmRjS2L3kIbjnWtaNwi4N+g==@vger.kernel.org, AJvYcCWR35vThFoZ/JFOa+FFj2B9jupCayhspt2SvInfFBDduU/Ywof+bdM+xnDLQw2yGP7Q8B6Hakqt1Zlu3Ye4@vger.kernel.org, AJvYcCWchjpK48uf0rj0fs4nh7UszHPuYpH+VH4U/u8GmZYcOEebx6vZETQP+AjmJTQkrhRnIbjsUxGuR+/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMYONUrCvG4wBxcdbKwGIlsQD6Vka4bg212EhFKrY2jAj/cCE
	G/w7uWZz4UzrFuCtNn8FK/HbptT+1+B9MeUQeWfmCHu2OIG6ZkVAHb65feM=
X-Google-Smtp-Source: AGHT+IFSYLVmCg/g/ec2WXfZwAJbYGWEzEnBlLQDoq9+WzvryJI/rFjmV0S1ovRXDp+UvFuNwgnT0A==
X-Received: by 2002:a05:600c:1914:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-42bb02c10bemr156252545e9.4.1725403390036;
        Tue, 03 Sep 2024 15:43:10 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396516sm222955115e9.4.2024.09.03.15.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 15:43:09 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
Date: Wed,  4 Sep 2024 00:42:49 +0200
Message-ID: <20240903224252.6207-2-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903224252.6207-1-jerome.debretagne@gmail.com>
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add compatible for the SC8280XP-based Microsoft Surface Pro 9 5G,
using its Arcata codename.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..114c7f5dc402 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -810,6 +810,7 @@ properties:
       - items:
           - enum:
               - lenovo,thinkpad-x13s
+              - microsoft,arcata
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp
-- 
2.45.2


