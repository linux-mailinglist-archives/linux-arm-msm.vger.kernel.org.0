Return-Path: <linux-arm-msm+bounces-89405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFED320A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE827315F8AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDE8285C88;
	Fri, 16 Jan 2026 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N9Sd73B4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E1A23ABB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570744; cv=none; b=YKDDuSrZL7TDS9C3fC11VZgRsdsbV9fLpbmzPnIgBtm3rzLW1QSvY7iAijYM/dTlF6rEnZrtmbyPvC+0JFfJoPaJt1vcBr+yaSdYQh8ML9v6jJYPs/JKz1iPhW37Rh49xEA+jrdSpJdKEHWJsIJVTR81LmDcA8jxe/iKBh+emqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570744; c=relaxed/simple;
	bh=nEScFanfNrxGNGZLUPFf399LbTooRWB98GdPMPA/SFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cPcaOuj6yAw+7Ibg39QzTajocegQ+uZynuodsy3QVTErtiAs8V+CscshrA/rbuG2/ZETtr6bHhyJmWBrhLUS0UycD64CSuw8KUwRK64K1OpB+K1Qa9nLae7b/GK2SFLDnesVXFIFX+XUHtdhDB2FRJ2qWYSUnqwLtMmZdWNthVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N9Sd73B4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65089cebdb4so3255290a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570741; x=1769175541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVrqa/KBypgPCfLLq+fgBLU2wzSX8tr8lw26pT+PX9A=;
        b=N9Sd73B4NsbsCTmKmEPCjlx8y4kOB1KTGMi1Gv2qXnNEhHGLHb+wPzkt7CJROdy+Go
         KDWuidpU2LlP4bgtnzPCjhTKQiSQoZTBptGSnmZ7ySK1zuFIrs4AQjsAtbiPhrK+cZHL
         XdDsXdizuohr9Q0Nt+/IZGnDZTJYfDTNnEwNdb1+JAvBqNLsRaqPxSLhbHbKXs77CLLf
         KY2A7Ng0AwZuuJanICm2T5KYiD/iJTFBbsxgSWTbdI7tjA3leiOLjMlxH95X2bq3VJM3
         MDJl7ziZJOBjSsrzKXIRgQg/xh/z08YB4w/55eCuTea0WvraeLgshgojbWExWL2wjsvs
         5ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570741; x=1769175541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVrqa/KBypgPCfLLq+fgBLU2wzSX8tr8lw26pT+PX9A=;
        b=U/Dx0H/xbz/JOtRZSV4elLDW6yuiSDu38a19ANvwqJaFNtFd5J6bA+WR5fgtHogYs0
         gxqAhG4O3fablXlvw0k0HPzx8n/42klX+aLgcB/GeFA1+SL2w5WBkKJ5h3fAEioWTvGy
         TVUllb7L/7rmfkbKYfSYWpsgjHM0839KsLat1TJ7yX1EoWqmkfwbIWf3H1slv/qpnQ6h
         j1TneEOkO/36bywBu4RK+cVSmJKQ/zDB8cNiHwW3zMrSbc/hXaT+p0WoG/uz9hDbzH5C
         Lpp0kCL3yEL1zPbTz2Ae1yyatNq0YWRF8ZQUepp3OUkoYjRutgSaOPD/gWICeR6uBmLb
         vTDg==
X-Forwarded-Encrypted: i=1; AJvYcCXqg7kGlK97nno9RfzHwrmwLFp3nwNFZ6ybIH/kQcFc9zuuxNX150r4DX0A2xaXK4rQ2VazX3EOI8v6DrhQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxYRNpSD4Je4HK3ckVFUQDXMfGWwUVWEDz8nkRpwxJah0jKqXP
	jf0mwI1+YuXcvytnOxHmS898wQJHKDxy4iod8BS83oBhrwvPZpKjgsNBgQkHS3tw7NM=
X-Gm-Gg: AY/fxX44IGwwHPzixhO1mRv2ga0p+zC+bHwioBYLTLg30KQZVponBiNQbEjprhwGM/F
	Xx1LwhQVk+P1WzvXheRkMtHx/LKvVmuJOO5oR5uraLh2Z+yGjhsfsLWA6T2SyJEDpbhkVkVo2mq
	/EyxZdSZvStb+npSGFLz66WGvqiqmTH0HQvsYpR0dPHHY531ZepohMDVMC2Iqhhae/PVnTaCl46
	ka8HxonZ3c/oAt8qhSZ92ZL5dDYAkVPHNG0c0H3cAfrNHYab6o1L40P6tfvjbPM+koq0YSgRkzV
	5ukmeKayWtPkolL1e8LDz3R+CUuA8MKsuDAMEMHY6ddNatk07CuF3y3EDpHViQYWxMarr4sqcxZ
	3XG/Ak3yRfyC2fB41ASE1yOX5SH86W+ZOCjk2kEefUz9ksapnEMYysefZWD1aod2R1zZ5YDPN2x
	b5yf2sMAT25VgcACjh/tzGS5jHnxW5pkrgO7sdF5eC2RqGuobbpQhWM3hv5ld3d6yh
X-Received: by 2002:a05:6402:27cb:b0:64b:73d5:e2b4 with SMTP id 4fb4d7f45d1cf-654b945a82fmr2097239a12.5.1768570740823;
        Fri, 16 Jan 2026 05:39:00 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:39:00 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:38:55 +0100
Subject: [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C128F
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
In-Reply-To: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=760;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=nEScFanfNrxGNGZLUPFf399LbTooRWB98GdPMPA/SFI=;
 b=XdrzpSl7fP2WLPzVrTRnTdUYSZW/WnQtQlGHwdOlUDBqE+gTfguxeGO/CffNF7gAQU98iB5UT
 oDBuIYisP4wBXOheuJzocP8KhUpztqwy4K/p70pWAbcMTn/LYMKtz56
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible for an 128Kb EEPROM from Puya.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 95ac2f15f601..ef88f46928a4 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -142,6 +142,7 @@ properties:
           - enum:
               - giantec,gt24p128e
               - giantec,gt24p128f
+              - puya,p24c128f
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128

-- 
2.52.0


