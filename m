Return-Path: <linux-arm-msm+bounces-32181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04B97E68C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E0C1F224D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 07:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915963219F;
	Mon, 23 Sep 2024 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhD9whSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2662B9DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076532; cv=none; b=mgBR3dJYlg57/h2JdofA/3jlkI4/eqIsXbpTMxPt2I8us9AzT1h36/L3EU1mQzcuuHdnGyWCNCKz16tipvChMPplitZ9zhLjCwj3PgdweW7nwzjhMJXv89rZfHVljUHlyWNS4+tZ8PJRiWD3lS7lRZ26a3GjwilkIarAR2sFevg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076532; c=relaxed/simple;
	bh=GBMFCVl+ruvmgzgbNSb6DVZkgbBRw7so53piTEK9a5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5LIfdy/++emaHkum1WJsL14Gl9fgBzHAcFLfw3y0Vr5aVH17LHGktVV3McADDvWRD/6fEhALCXmTHbjF6H3tpCBCdJFtuaVxHlsnY131J5KbnlFnXXnC0TbEcX6TBn4QGSXPIOSarH/86o00Qt/gWEbLM7g9KHyglECJXMDSb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhD9whSj; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a9a9cae07eso45919685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 00:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076528; x=1727681328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maw1oBqUG9ivn260TxPL193386GlYlgFX49DQWFXqUo=;
        b=JhD9whSjQqvMaCuPhhgpEG4HUIyA64MRoxWpeQ+mJqmaUYYJpLnDMRjLA5siO9x2F/
         lcjNch7c+3JUrV54VBfmKfdIbBbOWLwNwBsy4J5S7IrxsRJCdgTuYF7JyIbWSUJociLi
         Dljvv1hlxDTd971Ko6HzQM4fNTKNIJ5EBcnluYOURb6hlhfZDFX/6t4B528ebV8KrvE6
         l9NvwXmTenU4XHRmBlK7d5tr+NUlvh7pWq0qhQmNh+fDaR1v1P+6wTeCLbRTihspHYuu
         muRUHF9sB0BW5ndaoTbreM1TIVSRKsAxE4o/4iDkQJAoIA/cv1emiOLB55j4lKAdohL5
         PjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076528; x=1727681328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maw1oBqUG9ivn260TxPL193386GlYlgFX49DQWFXqUo=;
        b=wHOc2cYEoOOuvJMIIjIrpZyV9Qv+IsYwke3Fp7aYtrCyn6yY6KtsOfnKhadd/PapQO
         LwPdcICdolKXM6D8gHWSKrMMjKLGvxqeCYjfGz+z44PA2U/B09IFxgCkldq1QyimRjoM
         VhK4kbWcjUva4MK3gKacnFTAuQxz4Rc0laAYz9hdWfGEY+KzO4dTRwTeeUfYaJBi97xA
         XPsglb5Rjt8NRuSplmmStxrM14kp7ZDbZlY3/N2pWEi8nd6PgWGUatW7gYbJzwrVThN0
         oNpyokV1ZmNKNwO/MKS1g//Sy9FpIMntIOHqBOlQB6NRFq3TBnsC8jIEX+FKia9CZ6f1
         Ujcg==
X-Forwarded-Encrypted: i=1; AJvYcCXrc//+DBGyEp/kvn/5lG/JKupgp2xbwcRHBsEunCQik8l6I4gmy4LmgPXWkRT+B7xAx8blIC2PFVQJeRhv@vger.kernel.org
X-Gm-Message-State: AOJu0YzXs6xfAQ0fHdEc0aPndy9WB05zibMotNGS5H/R6Z+0Yannp5Un
	38rH4gi1744rKbzLfDlFfC2z6CvcFI2e/BBqS8vShZ7TtBnUEhnqOdEURGu6eB4=
X-Google-Smtp-Source: AGHT+IGMQTpk8PsrjtGdpvNYoG5v3NFi43gXQPbqmuM1yklKXWCnLOKh3RI5wEGdd0VSPBkYk5XAGg==
X-Received: by 2002:a05:620a:912:b0:7ac:b8dd:3b03 with SMTP id af79cd13be357-7acb8dd430cmr582547185a.0.1727076528642;
        Mon, 23 Sep 2024 00:28:48 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:28:48 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
Date: Mon, 23 Sep 2024 10:28:22 +0300
Message-ID: <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


