Return-Path: <linux-arm-msm+bounces-30990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE66196DFFF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79192289325
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28621A0737;
	Thu,  5 Sep 2024 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQy8+2ew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757619DF4F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554514; cv=none; b=kENsw1AEqg7E+vMASy4mN4niXqap+xouUd/Roz9T1w6pVvKEIYyS8YUxhkBaGbtW0eMdmwMvJcO/5H3zReyXcEQsq6/isVU4FUa8b7u8j9Uhk3r1xqufQUA6l6Pzld//aS3PExf3v+0gGDtTFhNCMbMtFtG/BlmkrY1PWA29FDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554514; c=relaxed/simple;
	bh=EG/xT1bWYZn8WhlWvDy1MIOgdlyQcCVYbo0AZFAPAFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSbs2BT9ww1I2R28R5WZyyiFoa+lHVXgx9OXAkJ8lSDlXCVeRLZUpAUHda8InFyplNyEp/O0BPHSVX+9CPwiDm3MCPdFvi4UzUganY0MoTZtViOfNbBOxQS9LUUFJR+UUZtnaJ1O+Hxq3Rvs5/sImMeSULj5QBQTwvaW7yCCafs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQy8+2ew; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53654d716d1so81939e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725554511; x=1726159311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10ybVZVKbN8/FmjH6XRCXh0VAd5m2pgfvQwnT1Z2dbg=;
        b=xQy8+2ewRQGvIxwQ7moIrVWZeauabuclL4vifnoxotqfBy0q6YS80UovnqPOuPX9Hw
         tSZhzz+5iym7uAsxAmq1foapjDsoD8Sm5/HUfvvnKXib+zd9m98Iawy6sMn+SE81xJwu
         yuKteUHTxNasrLFyILfkDL112ebBpAkQu34P0kP5vH2sjF1CzYb5vMctbWmOv5c965S1
         fPJC46txeFcanCmW+TuJ4xcN6CpjgomYTotcv2KsITVWSdWB7bOQEQ49TybyH9pWC5We
         6PWsnqtNNjwRbzAKKnUCyFAKzRAvrL6W0rSvaf8dSgyTGY+LZlC1C8JXgXKSXPkMGQdv
         ouTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554511; x=1726159311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10ybVZVKbN8/FmjH6XRCXh0VAd5m2pgfvQwnT1Z2dbg=;
        b=C3J8yLS9Ygbr9jpqWyBe7f7fBuEbnLFx/CeCBFt2F69zlI7wofyyXbCUQpLPjo3PyP
         gn87555MnwZO5DBgccb9b2K0FCYH8SPTmS2+1FOUE9MXXWeTSLypgtU69OkV11tJjM1D
         gJPVECfEMJbG+xNdfPJ7VJ8KhRrZV+FAuxMzLaNDvsiU6fEZ8A/9f/GY3RbiPLXjOvJl
         5C7culnTny4sde8fxdG39hkVkee7ZCJlxGR3Btuh8ewch3646asbwj5NnIX+3A5wo4Hl
         li1z/NgQyPXD/5rBPhsnQMrha+Xelu9DgHShZZQ10djgpZgXI+loZ9zfncb+jwB5rCol
         jnNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnv2bpp+teGq2Js87cP0pyDHpvFLwGE7ypYJ2M6ZsyBcRGOt4K9/hMXXrhtlagv6b2SmSWwOBsUl/7YTPZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/7fPfg9SHO03K2qa8xmgfOjwnJfXLFtAavQhQHBHi502L418
	XJZzzz3xqHwq8hXB/N8LxIpIQjy0A5e6qDWW3q/Y3+FcLYRPC5A+/73dWxXk+cs=
X-Google-Smtp-Source: AGHT+IEqSoYXcZR5I3WEYMFo9B/EEd6FM/epXubA1j8sxHpuuxnWpu8yQjf8NsUjYK5ux449E47pFQ==
X-Received: by 2002:a05:6512:b0d:b0:535:4144:bf90 with SMTP id 2adb3069b0e04-53546bc7ceemr8077256e87.11.1725554510922;
        Thu, 05 Sep 2024 09:41:50 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655182c91sm100674e87.306.2024.09.05.09.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:41:50 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] media: dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
Date: Thu,  5 Sep 2024 19:41:37 +0300
Message-ID: <20240905164142.3475873-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the documented example from CAMSS device tree bindings for sc8280xp.

Fixes: bc5191e5799e ("media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index c0bc31709873..9936f0132417 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -328,26 +328,26 @@ examples:
             vdda-phy-supply = <&vreg_l6d>;
             vdda-pll-supply = <&vreg_l4d>;
 
-            interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
 
             interrupt-names = "csid1_lite",
                               "vfe_lite1",
-- 
2.45.2


