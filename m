Return-Path: <linux-arm-msm+bounces-81855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA1C5D161
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8372F4EAD0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33ED314D3D;
	Fri, 14 Nov 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="PWE/AiHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3822F76F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122748; cv=none; b=WIdD2HnX8tmihpqxDMJCrgXSmMaxwNTqT0wujOhkaPMCiXAPq0O0G8rIXLBF0tAw4Ft0lTrjQH1Y+iOArXVvEjgcbxwaGCjwH2pSYX5yFi7scOM+Ln7QszIKZ0OnJscOZbgZ+fZzvL9aKsXg16Aa3M9lJLPkcmsSkYtAf/MGZAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122748; c=relaxed/simple;
	bh=8hJpcHQrq1WlSpHUFoerPHpeHijwN2l3PQGmvu2ZaR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSUsEjOE2d33HYK3/tipLDpv4axvuaBScE7TPV4xko6aT6ecI/4w65cGcOloC9mqivyeduPtEERLrT+c2hRFH0bjhB3Pv92BAOE5YYJPoDZgjQ9MYeyOHaNuGPKPWyrS1DwijTIINZ9rYKrba1/hILTU55duG73UUXtVnefQPRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=PWE/AiHx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b736fca06ceso60662466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763122745; x=1763727545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V+ZvIG5EFfPVUmOq4TzkXuM/WpB4BMHn3sJtW2UJNE=;
        b=PWE/AiHxm0RMBWRHYKmHKsRdAjDKNN5eOJWAgm0uu0lr5dmtJ+ECZ2Cdf3Jvnb/QS4
         4zEOxYe4XG/gEiqiW/Z4qXFeUXk2Ko01HAB+wEde3Hiu2rTro/S53kn991czB2oM5lIy
         g0oa0BcXjzE47OltYUnNXmZZgDrhJipKsTpVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122745; x=1763727545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+V+ZvIG5EFfPVUmOq4TzkXuM/WpB4BMHn3sJtW2UJNE=;
        b=U03KzPbqR+kWkTZUtryEWOUj9giFS+l2Qx1YfT8L/Y3qPVrwBQOi7slbo/OfkzHes6
         JfcKnnM009COWGa7byF+uhbFjNl/J5T4if+UmdZRUr68RD+l4WDS3LzjEHQSVkAMjdjY
         gevt7+yldIPP+2dbEyl2jhRnGZmUR6h9Yu0uyGRGyOqOOO4W76XQenWpOwuJ+Q5HFZZl
         ELd6d33JqmzyZuaVYAP8rrvdX8QRUKDopoRBNkXfbfXshgC+hj2UWrQGi36zpp4j9Ltz
         3e/opuHGTHlJRgJB/PHkR1s2JsKWWPUOQGpVsFwJ6rHhbnEUON6p7B/A+NmzkaVEdyD6
         Dvsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCo/EmsVCMBoZ3y3NcAegT/CyL3On79mpfn+oUetGT3K2olb9ApUSTRNRMO7Tz50k3shUPL8ctzN5l64Ih@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn2vj529K8RiSG+PZgo/b5Y/XisV2LVVSWiRyBWtVPrikuEh0Y
	Kt6b8AZiWwQdFcbMW24KdC44FIv4UaCLWHo0Y0pppYdGxTUP7h3McoByhl46xJkVH4Q=
X-Gm-Gg: ASbGncsc++K41uPP5nNaqd70dNZidg17p9+MKHK+0PcNdEO3AB1XVbn16ORP0YTMLfj
	viBw7G2yQH0Wa4nMsvLkvLMObGJyTHXr+A0yF7UWCLXibjQswYKgJApZTIMJRBJJjTQ9sK9TWj6
	EKp9VMz8D/vmAxAAiGKmFiXPS69CwY1hq+l7cOv4idkACNjZDd/Lr2o2v815+FzocOVBxhGUQ68
	mrtMoCnmNJhqedsUqYqZ1wMaGB+MZD4EfjUCXw53oZwwUHgIwFBlTmuB5UYMErz1BhBREdMAUJK
	P/9Uqoc5+tlJGfTy1rojhdkI85rDoGAQmOW6HAjJ2iXcwhjuVmoLcxMI3NWsfFcRr0pkRyYPcZ/
	kaMZz/9cPBSZ632OfgEb8B2y7CacSwkP0XIq/obY2EsYk9ji3M9vZeVhob0Y+1TAhi2eePODiwu
	9C/B9J9HWN7JG1kQ6MXbVEyoQjUv1sHQi7FdL+xGGC2B8L7181v6ZAZ3qDz/s=
X-Google-Smtp-Source: AGHT+IGp6/yIo5H99FIs0TSP0/qTcse3avxJmiIaDDcLjedaK2Z/WFNPRyyMTJ5VxQzJ1aHlVnlu8A==
X-Received: by 2002:a17:906:4885:b0:b73:6e0d:4f6b with SMTP id a640c23a62f3a-b736e0d5e13mr114394966b.36.1763122744938;
        Fri, 14 Nov 2025 04:19:04 -0800 (PST)
Received: from riccardo-work.fritz.box (host-82-52-164-74.retail.telecomitalia.it. [82.52.164.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed6315sm375295666b.64.2025.11.14.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:19:04 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
X-Google-Original-From: Riccardo Mereu <r.mereu@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	m.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Arduino name
Date: Fri, 14 Nov 2025 13:18:48 +0100
Message-ID: <20251114121853.16472-2-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114121853.16472-1-r.mereu@arduino.cc>
References: <20251114121853.16472-1-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entry for Arduino Srl (https://arduino.cc)

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d2bc0ce027..07a285c9387e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -158,6 +158,8 @@ patternProperties:
     description: Arctic Sand
   "^arcx,.*":
     description: arcx Inc. / Archronix Inc.
+  "^arduino,.*":
+    description: Arduino SRL
   "^argon40,.*":
     description: Argon 40 Technologies Limited
   "^ariaboard,.*":
-- 
2.51.2


