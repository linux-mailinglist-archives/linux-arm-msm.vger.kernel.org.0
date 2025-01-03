Return-Path: <linux-arm-msm+bounces-43861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6BA00853
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 436571884710
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3601FA140;
	Fri,  3 Jan 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EuvVQut6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2184C1D61AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902729; cv=none; b=Cl8OnniVN4TifpLWLF59BQQ0Qp4JCppm2SG2uK9ad2LF5x45tNRDDQLvavbFecmdOOTmMP4UcV4HZjDe0I0GcwB8cjNo/uz+QjU1zAg/rNeFHML0uEXCAbeP9zEWqq1xzn1KpHBEzUD7OJD90KvOc6uAHjfRKHj0i/yqj2m6kEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902729; c=relaxed/simple;
	bh=k/+Dav64Dj1AsO7AF4e4/71hUuQR84tXM9wYoKmRizs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zyp8O+QMZiSyUJAZ3KWjgCLUss8HSNqJKyHw03+DGZ8jX6iEfywRTHvFqq0H7igKhTnEy9Sbf+CvksENqca0zd3KXCgwBRbNZQI9f6UbeNAdMk9lmMMloA259TGJdA7lUMR0Q3+961Ix91nM3drgyowQvMiLbiF6iGJejZX8m0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EuvVQut6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1906327866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 03:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902723; x=1736507523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GFCGdANYwwTIqvFtakmQcQllvWKcLMcYfzvoNYCAks=;
        b=EuvVQut6OEwRSXzGBNQhIXLG3M1ppZ6s1hVyQTk58JE3023kiXQw1VEXUEKZBM+rDQ
         Wdwo2Wf5LGFXKmuxzo8RAqCBLarxFq+orjrQbPmjJMvlYDNeSg1fWTys2Q35M5gWuBgB
         FppIKw29pH6aXIszwt8QjEvA1zEc1cHfM1dc1OXGIYRm5lrkCqP11KeeVXCwQN1LAp8M
         m8HmMdF8Eym9cnxjlzZvLdyu6B6JMIOFoFsY1J1cjaJS9u7KECgqz6/VM2owcU1D7sB3
         NY+CcCgKKpSHwADMwBNLuMo9Iq4wUjbP83LzRKo0wtXtQD1W4o/cFiZK7Z5EwkzyRVqz
         dq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902723; x=1736507523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GFCGdANYwwTIqvFtakmQcQllvWKcLMcYfzvoNYCAks=;
        b=Yt4EGcx38OKNMxVR5XDxgNEZ5UwGsDX6FQBBiTeHNJMsEWtLc65HncSYqe1g7mhU8h
         VtxvmhJ1JSfmiihFRw8ePG8p0nC2OlT5GJXxgtDBUHWWQoeak+aYHRu7UyXVINAc1d4r
         Wc1ofUBNyX9/tYuR/3qyzKXTG++/QsXhNPQCfpkET1m0iNVQJJ1D/HGzCc4nkIriEwd8
         w2qMOlIo4Db+PxRd5k/eGUqSiMhwjO96TO4H4ZjJ4HNiq8kj6sSX4apFx3KTWe+1zkUh
         9PvTB7Hq3voKM9P7ltdfa6jZdmCU8bqQ17rrSc1x/40QCBhtjHi54s4ZRg3QqPuu7L32
         FM0A==
X-Forwarded-Encrypted: i=1; AJvYcCXxRLh3ekoY/H54kKh3+19vqMIuu+iO087bwCQ395kMMdK8Er0nE9ZBY7coaulTiWCws/hUO3AMM3ixEz7/@vger.kernel.org
X-Gm-Message-State: AOJu0YzbT3fVzBlIrNH0+zlggPkB5PbBDWg6hXr+7FkluxOr/lK1GRd8
	bNqzAXXGWPOz1wuy2zq69nv5TeWCR26k8ucqpmilS34CbUDCneNbtZteueYm+Vk=
X-Gm-Gg: ASbGnct5ix1blkhCs6sHcesbu3Ef2ABGelb3n45PQKkmquxiqe74XhOysIAip27Orjj
	ch8cBkPIBcjrmbn9UQxRrvrgYWixjDIvGYy6t2qb29caVNW36qdIQY3YllUE5KvmD34PNaxdQli
	PR5tkT8ZshnazOZQ1Fxjl29YYS8wRCU0ifIqtq+vNj3Lf6I3WrJQzTmxhmZTEMqmLSEHmY3uqJD
	vEIYVXQVLSKQzJyRFckXwbP7C9uSNrHQVniTEnLl2m1UP6pbpXl2r8Iw3Hd5gvxTzDkW03V602G
	UECrhZudTD//kIYrL9SE/f8saw==
X-Google-Smtp-Source: AGHT+IGxXhlOWbNK7IyXotx6Xt07xXCLWDYVJCz7UEJajTpXBFKX/Nmbz6mqm9dh5HVCwWU2AoE16w==
X-Received: by 2002:a17:907:c10:b0:aa6:74a9:ce6e with SMTP id a640c23a62f3a-aac2ad7fa23mr4318970566b.16.1735902723018;
        Fri, 03 Jan 2025 03:12:03 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:59 +0100
Subject: [PATCH 3/5] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C256C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-3-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the compatible for an 256Kb EEPROM from Puya.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index a2970c7c8f27600ad0d495a7e14875a3be611c03..c9e4afbdc44809c21fe4c073f1a2494e899dfe0f 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -138,6 +138,10 @@ properties:
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128
+      - items:
+          - enum:
+              - puya,p24c256c
+          - const: atmel,24c256
       - items:
           - const: microchip,24aa025e48
       - items:

-- 
2.47.1


