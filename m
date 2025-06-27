Return-Path: <linux-arm-msm+bounces-62865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18AAEBF5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35F01C461A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8839C1F4C85;
	Fri, 27 Jun 2025 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXuD8baw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA419309E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751050828; cv=none; b=BG5zDDud+Jz1ab24TQCpLLz7Ocr2CsmG3awRdkbJ5DtDjRgH0E2xwsmR502H5zU5Dw0HJJh7nO5e2r8hrnOys2/71OuhgATjE0nONkSpNJigK2SeJjvjXDn1z6qepKVcwkMzUNw6JK+oRQbrSrOzXzcfb1HI79fxIlaNXlLjqO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751050828; c=relaxed/simple;
	bh=ndRWdxr49e/jXxQYWjxwHuoYEIrfH/0Wj+KnGgJHgrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBjBl6eqWFPShAeXvKDaiPn4MBoe0vsGZo27adUbstEz7ttA4RErsOEhgrCjpSfXcQSsXCiWjFnTnckWY20hGwU0oKJ+Z/T4QA7B6LjuAtaLErV0we5IO7Aq4fTyVeANs+D5O5u8owY5a5mpPy9wHlAPtlEp0KbChmEWC9J9U3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXuD8baw; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b3afec1c4so2055561fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751050825; x=1751655625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjZwMJhvPU4TchnxBQBmlDx0CKx7+6S3ru5N/9YysgE=;
        b=jXuD8baw+V291Eh8D/XwcOlX99utHuuVxKsY2YqYDZvrcAcdmn9U8RAqWfNytbyhdO
         WMRwHJc5uV7Tb8TYwdWwmZ+F0XntssMiU4YuUX50/SbYJo6H2K9K4n1QJo02hP+uIAiZ
         lZUbAmQhA4wqfmAoSceh9QPzn0e6KwL75SQlnAx08w+/QTJecXTJLl3jNjPgeA/1to9b
         JR8MgbK1AuhlMWQphfmJpWucAf1t4l52vnE1W+5KMCFHonptTfZ8cpC6XZKip3rhoz9K
         IDOF/BkOO+tIqqs123zW7liRL6Rg5jA9eu+VAIseiv6hnNZuqjzMlg1BDTQf2HZuu48I
         km7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751050825; x=1751655625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjZwMJhvPU4TchnxBQBmlDx0CKx7+6S3ru5N/9YysgE=;
        b=PAbFjtiShkYnDNy5zf95iBKrUkGQPcUbR8NBKW2dWzyziuliMVPDEBXsIcdcKd/Wyo
         9HA3E/OPAaMP7xd44gmWY9nF0D6BwTwxpszavgYaqgryNsl3t0SKOnS8j6uVKpxPS0VG
         Tz3rLbwv6ycvDNPnNKxHoKoAKJOfFcOntjwvF2OMua05u/7T7TR76NHP7d38EOQj83qB
         rre+vmD3PATCTGu5krs06+7eP5O7MRiwWg1lDI2rFNnzI2beisfkEva2C8IVOOPhjVH8
         OnA8oUmG+Ce1Vg5IA0yhBh/HTCnC9cMpl7nuKkaEklOiKJA44Z9bLUYCZkowdD/9DbxL
         jYPA==
X-Forwarded-Encrypted: i=1; AJvYcCXt9zZOuML4NeyH0p77P2scMKpYx0nJoi7tpbjpZnTROCgddiPbB/TOxmYfB/wr7uUIVYxmHLlv+ecanVEe@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNo/s/ynqWxilQBAi5dZb8p0RgWpXPphYJzO4Wei/Z0byTeNu
	SwlbNfIGlk4BgcHfiJV/y6a0uFKFWGJ9fHVjqh1clLIaX+//2P+vWOwjcwbjKWSUydo=
X-Gm-Gg: ASbGnctXQhlZgpixSFx9pibqfoODLOQL/aRNslYbnYOR61CBWycOwSuDefPMr4o2d28
	eMOcCylpp43+uxeLlUctwaD1yWnpyI2Xmx9pQaXa8Ci6VKrKq0dxNbm1xy9EhjxkidyPVilBJdm
	/MB61P/vpBiEHrVac5cXH50l7aNQxl4bfIpiPma2T1FjPBWeZpTiT7Bggzx7NfBlmtiDBK+l0db
	0qCkhEV7hOg7JjMIkURvzVaQx1VJ6fAxi60Sk9Ek62VxBQnhUVybcTUQve4TbDpJpy7j44XPZ/X
	f19IVM7eq2yTq0448ZxJ8fV87piWaGq5+PICRZPmnV3HpSiOhgH4kQRPhZjW4d+4BWAJhSZ/31u
	yY8O4XzKUmrK51TSqOYFEF1L8YgNzA6caSTQSXnhoUDkxgxqKbFE=
X-Google-Smtp-Source: AGHT+IHS7/YUdVd9N78mZEq7odVLeFh5PX4g1N6Q7PSq9p1Ya0HmgAlKpprzVfyGeSWO0V84ErR5iA==
X-Received: by 2002:a05:651c:4098:b0:328:423:cd41 with SMTP id 38308e7fff4ca-32ce6d66fdamr406581fa.8.1751050824938;
        Fri, 27 Jun 2025 12:00:24 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2c2dbe8sm6312981fa.0.2025.06.27.12.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:00:23 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: media: qcom,x1e80100-camss: correct description of vdd-csiphy-1p2-supply
Date: Fri, 27 Jun 2025 22:00:21 +0300
Message-ID: <20250627190021.139373-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the given description of vdd-csiphy-1p2-supply property,
it shall indicate a 1.2V supply.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a99..b5fbf7476da9 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -124,7 +124,7 @@ properties:
 
   vdd-csiphy-1p2-supply:
     description:
-      Phandle to 1.8V regulator supply to a PHY.
+      Phandle to 1.2V regulator supply to a PHY.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.49.0


