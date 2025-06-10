Return-Path: <linux-arm-msm+bounces-60724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3CAAD307A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42EC2188572D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6BF21FF57;
	Tue, 10 Jun 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJeqOGkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490792206B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544416; cv=none; b=gh0CispSO8SKOommYY9G8OomIC9FF4TXgLcFExDFcFN5XfeOSOfEI9fKBsU1hJPfBcsiXwTnX9GGJtvwutOQTvZJGmBdO3iThN0O1O0ZJt5mgzc/siLFqsPYNsbLQwa2pnOu7TZ2mdtbAqIZy64LjXIk66MAwFsEOj0Gr2tqQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544416; c=relaxed/simple;
	bh=pux6+eb/W9FN2HoN5vMcC3kEUTHEg5oAoFHBsjMsScY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XX96v9g3Dez0a7sVKcDxsG4QP2O5KXHUNQ6XnXgcrYv29ckhIvULoBhhPJ/ZaWI/kY5lDYf9QwlAwjQMlK0vgmfJe6/wA8xthL86R0FKFKP1TtJjnPo3WpQCZX04fUUMWsNDCr3kV5yS4GurSd5hTxKP+QiEJh4Oy7+iYFbG4tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJeqOGkH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55325956c93so427669e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749544412; x=1750149212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXDUs5/+IldxO7NKXVBzYozOWgACkNjwwUA9PlSG+Pk=;
        b=TJeqOGkHNUqiOE4tJvs+tT66+FmeSoHy6MS4IlIinxIApsc+JABWnhNxFyKw/LK/8v
         lbiRcsjS/9/4lZNSXM09ENZSOTB3G0kGWZiYhxy7osUxWkTWcifhsjdgvde78q9QMkXu
         NmjT+0Qsj9NW08dJqbehZe46HCZ5j22UFsdscZeaOuUukmslMbDRnGsoc/cAX2Y6bsvc
         fA3DaKNuueGcraUxNI5AgYuGA68JY9wjuoMx2O4GzAKjoVWGvZG0yVX7FSZ8DMfQhwr9
         Eva1VDD2S6uw9NEBfBe83NgEN0bt/VVCdbL3GxlyBPIekdVeYcb4C5jaorxErwoqSNO3
         ouWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544412; x=1750149212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXDUs5/+IldxO7NKXVBzYozOWgACkNjwwUA9PlSG+Pk=;
        b=wX8GIkulxMuYMZYLAvDB7Rh8NoJqEs7NOL9kz2D9rpR/6EGuFoeoiTdqZLasuHtovV
         JNvE4rfBBqkQmIymqrzHlBzJoOe9Ov2WStwIkvBh34cyRv1x+4PB+m8Zr9jXOCw1ErLe
         EmHhs4ylgmbr3RqLgFF2BeqJ/1u0EosY0N9iIgzy0fQBZvKpnMLHv+gplgosXChKMLfs
         li+RSsUO9TEYgSImvb/cz6GdL3L4hwnyKkAkdN8ggTTmJQAsC12Qwna8QINixPLMiqJb
         r2S5wWDomKOIpBcrtv2EPU1CPVe7tVpqG6UPq8xEMmO04UrRbOLttHsRFblIMzj3hKb+
         rLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZuVYUSsCpAlwPTuT2nLa3wA+bNh7j0ClXhCMjZBnoIjXcKAThVqV9vXULpvi029qW3X9Vu3d3SeEuC5x3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4bpwsgdoIQozGRNcR05aV+CtUuHB1sWJzrsv50UIkSMb0pT1
	Ii/bdOciMUjsDcvl47W5KVgXTFRnQNUjtRQpDH1iuICwYBKQNSc6HLPExz3CMzSONlM=
X-Gm-Gg: ASbGncuj1HrIBavuPA62rsrlAXgoJpw/JY92U7sCUIRRoWlib6nK2NgvRCbATvdqn/3
	MENQE+8mB8z+FypaW1rABeHHbENtlbdqDRm0dghtQPlH2TmKqdD9MYHQKoW99ut0pKAOKCFAn/4
	RnN7uMGrwCdfoIfZ6dQumC4XeQAHtp3hKO57gEYoxH69PLFFurqA48txO0EP1TmhI3NXb+0bchk
	muoQNQEnZGp2exCvQutzj1vMQIISprwscYsCwEKwOPyucjTMhec1i2kai201bXUhYA/Tn10CmJr
	lSAu95VX4h1drG3JN3gy0dtC0KtfR7Tnt18KtUwsD5MCM7HWRMO0rEeLnfjF9oaQ4ItIKn5/mEs
	+L41kae1JlN8ogVsN4uRLeORb7j+llv+acbiIpbNusCrTqJd8DuTL8QU9H4Ns3g==
X-Google-Smtp-Source: AGHT+IEYIQ2Xi67OSgwXBvj/zFL581W4WKugfySCgFBUviW8ff4ybP4NOKQ1O0rlnOZq1iQ1Xqg5oA==
X-Received: by 2002:a05:6512:15a9:b0:54f:c5e7:8f7c with SMTP id 2adb3069b0e04-55366c35abbmr1383687e87.16.1749544412391;
        Tue, 10 Jun 2025 01:33:32 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b351fcsm14167241fa.35.2025.06.10.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:33:32 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address
Date: Tue, 10 Jun 2025 11:33:18 +0300
Message-ID: <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the devicetree specification a unit address shall match
the first address value of the reg property.

Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/

 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 7d4e6ef57bf8..959cff1a31a8 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -190,7 +190,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        camss: isp@acb6000 {
+        camss: isp@acb7000 {
             compatible = "qcom,x1e80100-camss";
 
             reg = <0 0x0acb7000 0 0x2000>,
-- 
2.49.0


