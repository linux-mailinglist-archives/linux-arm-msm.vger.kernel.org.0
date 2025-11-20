Return-Path: <linux-arm-msm+bounces-82702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE79DC7550A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BB7B4F447D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDB93612F3;
	Thu, 20 Nov 2025 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="D8wz3VpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE235FF5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654314; cv=none; b=cX2gE4BsCDtK9FonBQDHb0hx4ciS/nGGkGExjR66ryZiymRMRWGi4GUoU2IIzBewZDcwGbuO+RikV3Z90mlJeboKPWQtnRHOMUZ3sYxoEKZ7ZHKz2wOIXjYBDE5SkTOQ9VE/SQmW/MVRHzcwuNUUBuoTvAmN0CXvc3tOF73Gw8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654314; c=relaxed/simple;
	bh=gowrLjtyOcvjBL4p58UCz9xf7QYOPtC7scsXBhW+jFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkbROKnqAyIMsCQm4wcDVEWgzwyh7s6QNsMtbXM7xaIATb+4KG3h1bcBG2y39prvx8ppOf1ru9nv2O6Cch1kpq3EQuTidVUdJ5fOaG3QnJTIaKHT5512UyIOSMUXBULzqcQxqwODbgR7b7A3SriqYHFc8adUHfxB+PnzUWDMhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=D8wz3VpJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47778b23f64so6274535e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763654310; x=1764259110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ru2x7aLzVd5WoKQZeYoG79pGESHgaomXnpzW+QmhDU=;
        b=D8wz3VpJbNwvc47NL324mejleX2FosXoop5srqmQuFpuaw4F1Xa9GgJCYfbOZwVSaV
         icn4jciwFVWJ7Ly5WjKuBU2tRT0jVN1i7AnAAecP2GmXPlPnYj0qWpab7EBuFphMVyJc
         n0ehYARTzuFgF4HbYT3SaJ7ih3IKEsnxIzPRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654310; x=1764259110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ru2x7aLzVd5WoKQZeYoG79pGESHgaomXnpzW+QmhDU=;
        b=MIZOfWLqnbhlCPssfMM56xoTEliZ/nZVh4pqI0vOpwOKMHCRd3F0oelx51Mnb4+4Qk
         yQppOtizt7WOC6KB8lUlJ3YdOLbZEbUetudSnhiIA0dTer3CXOfU8NwSwHa73vKSbrG9
         cKoPHAB7Pvu77prP7zxGpt7JCqVt+1RPfvzBMpqb7GlUe7uH+xUYV4QJJmrT0QVf/dMS
         BAaxiM2AuUcu8h2t8XSJnAvV9sM+rmCJHWdi21B/WRM4TP+LXypLQIjoxoJZi/mqRaqy
         ivUp1KA5nGOSS0wGAlcI2FulujGDvr8zvybZcPTRxSsAeeWNGtcCEC5l87tzALqCp7FU
         rfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2rv4m+4rF4u8vn3fBOJbW3Nmpm0ux7mrKMwSWEDRvzuy/tjCK7DYeKP9gbr3FMKZkPTmB8UvSBQAzC5L+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl2do/okyRaudkpNUqgnBEWhHjIU6/3S1TqvPWYGthPGbdupIw
	TxcJPNQ9c3TVcygfbIJDeLVAY9BrfcYAU5pFHc51SlXpxno9+YlXTy9QCDA91sg9/aQ=
X-Gm-Gg: ASbGnctYNE+irVZdBNU5nDt4lfK5gRsB6s7LCJjocS79UNYK1aFJyeCYYI+3VB9euHZ
	f+AfiNp2f3hmc2JPmFhf58bLTVyoXznWhpFaZ+LJ54r5+K1uA87QAH6iThyMOpEmX+pzpqPjCQX
	7uj/G3O3cRLwpL0fik5zOD2p4yJOvEuXG+5xOhbL8zDd8YRLiksiKQFuhwM+TPbhAiMnnwfgTxc
	3zfWLuJDzEbpUDRErvKa0hQO9+qYKR3PkQpQ/SVj/UmhZfdL+POIoT8yqrQquifa13xCRcsLCIl
	G5hvM+FUSDRY+VNZ+xV7J7Wn3FEWzG97Od7UNZ2vJ+PqEMHUfBYdj398aSM3S5l7kWQ+vFKADal
	B69CQ+L7NG0odrkt8pUP1PLwxlQvBwtUOki+ukDXd0EcV9myxucOtrz2E9tKytPS7JaHcCeFttj
	2Nct1a/jentjt6W33uvlK0j+mABPeJfMK07kX9ELJptoP9r+MD41wD0H0=
X-Google-Smtp-Source: AGHT+IF1vyggDCykNrANwtKViOmaLZ3/x6iQowIS3JkPfpzvxSMEvUjs/y8xWlfNkK9IfscfEbzSgA==
X-Received: by 2002:a05:600c:4591:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477b8c8dd99mr35889515e9.24.1763654309847;
        Thu, 20 Nov 2025 07:58:29 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82e8ea6sm55552185e9.8.2025.11.20.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:58:29 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
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
Subject: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Arduino name
Date: Thu, 20 Nov 2025 16:58:20 +0100
Message-ID: <20251120155825.121483-2-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
References: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

Add entry for Arduino SRL (https://arduino.cc)

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
2.52.0


