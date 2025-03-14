Return-Path: <linux-arm-msm+bounces-51413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB5A61345
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077D73BD322
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E77200B96;
	Fri, 14 Mar 2025 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNfeafim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF341ACED1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961028; cv=none; b=cRZBFR5hl9YSHf4K+JKBcSiTQcog1URQHUzJ0vbZzLT6+SGuBNcw9lejTTtHEsfSckx6eKJhr87GnI7MwbXjO55C+f4olGwatQ55djFNif+zcnDgn49CMw0Y892G1MlY7OraoWEgmrBvNOljbC8Buwl77PvKq+WHlHFqOZE4nBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961028; c=relaxed/simple;
	bh=DF6LBm7oBQoMFX+SLpJBlp0Dl8XtrOzdWQmhNfaOJK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dpdR6Yy+SmsU8HqGdanU0WkP1/qrQOSwq8je4zWnln7Nds1YF9Mi27UhUXKqxy7XoSEZ/aTnp0ZiL4GxM8Mv/K2UfFGU98HWJUFVmfjPcd/F153l4wFetWsvdSaEq6wu8lhqaC35B0r2OZ64eNCLDFlszzesUgGPKez34DYe0ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNfeafim; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so19243925e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741961025; x=1742565825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mrs2pi/IR80jSTZMZiwbcMuogKUEOta3sRCRaBeIlpM=;
        b=FNfeafimwnGu5ssoT3SEsr57SHzKNkcjq1lAdEM5gRkU/jBp4JC4EmdPvKamcNLP6m
         iO8G/xOx8kMTGLlT5ahCRxaeFecV8URUvTcJ3KdQ1gTrwPOywiqNlHy/7/B4H5O6tm2R
         ZiizeUXFNvb6C+PCpohoo3LfnhwNwimtCL8pAo/M/FXCnLtKKOZY8UdQMNgrN/ex+YYk
         Oq8EZq3dn3pieJ8W2bbXHhsNzxUk9nlbpAZn7g+Z+lDxxHx41d7XvZ27h4EDpoud8hRE
         BRBIxQ7xqKyOu4mejKt7geOIuPrrlUdsbVNEPHeT/tf3Q3K/MqEoVeFr/2dJzWJfnnjw
         ZgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961025; x=1742565825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mrs2pi/IR80jSTZMZiwbcMuogKUEOta3sRCRaBeIlpM=;
        b=EZX6NguUpmtvd2uzBiR692z7GCTb7uSAds/VKgtFz5liOr69UEPVxQl6TGkAVsFr2e
         9Acq7iv9MsoPu/ii2CB9qkVSVjufmYpgB88iBMP13HK6h/swK/QVHWzAug/ficJsFlZc
         1RLJGjHUtMdtTOG1Wa+U1JaR8JqMqHaWZYOU/f+al8CRWdw8TWQCF9C6y7xsql3OM390
         ZPRRNLK4MrJ2Kp/GIyo306G4pTTOFvr/MkeeHAY/taz99cN2TYZMuz35Fh2hrQSmAoDK
         6f4VWuKyezaVFGsKwtoiPMigeCMxPMLgn3Z6Bbk08kySiptHxVYVVag9CmaIhgo1YBlU
         p8ag==
X-Forwarded-Encrypted: i=1; AJvYcCWceWbJV8dKtMMVE00dfHMOcNt2DClqYUsP2gvXSp7ntkFXt2wAsku6nYmO9S8XH18ZoCiNstIPbHOkZUOi@vger.kernel.org
X-Gm-Message-State: AOJu0YyeuntDJfFWCiRGvykoVY9AdtE4ryaymkStmf6rU9Ee4C1dhdux
	DVRGb3kqWlyOK14lNznyJBV8/NZkDIOFRNgmWPT3xr3f3CzwaAjKNnnVsu910mxhhZVtryffL94
	4
X-Gm-Gg: ASbGncuBppj2pV/NAXcMbC+SWQdrNbcAK/pp5By0Pl1pud8/XOneqgeEASuKx/8TY5B
	Pzo4o84A1/E3BwsjHyoJSFTClRAQz+98pHTHDW76bSeRxq7PtudYxbkihvX1HARynOAhMFu/Fze
	BBZMoxJxHeaB4Q0sXzjaMTv5ZxKwcJAx6GfP0sB08IwolW9Ov5oOp5ZWpsqfUog6vr/ZZ06N6XN
	uuXPafIQJrgHCAS8oQ4tS86IvHtLkcoCeY2GXoW3aopARjeaLRdOkBgG4rGnoZlrHHjT9jJRXRR
	CBOxJ8wIb4Jb2tIVLM81aVC+1xKf2cWeUvcfs3GMmc4=
X-Google-Smtp-Source: AGHT+IE5MmqvNVK29oXVp5YU+GxENy/l3KYf+hYkaIt3jW75ricplBKSUTwse/i4MPM+8TgKs3dyZg==
X-Received: by 2002:a05:600c:4f87:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-43d1ec82c14mr33789905e9.18.1741961024508;
        Fri, 14 Mar 2025 07:03:44 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fae32sm18156455e9.31.2025.03.14.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:03:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD and OLED
Date: Fri, 14 Mar 2025 16:03:23 +0200
Message-Id: <20250314140325.4143779-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314140325.4143779-1-abel.vesa@linaro.org>
References: <20250314140325.4143779-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to the difference in how the panel backlight is being handled
between the OLED variant and LCD one, it is required to have two
separate DTBs.

So document the compatible string for both the OLED and LCD variants.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1..6260839fe972 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1123,7 +1123,9 @@ properties:
 
       - items:
           - enum:
-              - lenovo,thinkpad-t14s
+              - lenovo,thinkpad-t14s-lcd
+              - lenovo,thinkpad-t14s-oled
+          - const: lenovo,thinkpad-t14s
           - const: qcom,x1e78100
           - const: qcom,x1e80100
 
-- 
2.34.1


