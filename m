Return-Path: <linux-arm-msm+bounces-54574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85719A90F82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55B2D7A7E6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569F424A079;
	Wed, 16 Apr 2025 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ3ili6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3CF2236F6;
	Wed, 16 Apr 2025 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845833; cv=none; b=iHb8c3VpWI517k3BXneqzYFr+Qs+m4K/IcUZOAq/ujkOeSIjjGr1zKZunGPQpjTgQnJrjI0enkMQjLCv21Lx5qU8NGmYxpzKDvdQSMaowoE3zU0FJkcPIpuOrMwsi34gNjPMnvDW6y1Nf4eKyUKfk3iKQI5l/h0fMWVd0GryqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845833; c=relaxed/simple;
	bh=xFXAdQKOvGwUNAqJPChDR2YGBzKehJnKUpfylpkE4aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNP3FIMyi0+eVH4ODlRWvgWEO5xjNYuJsu1UbAg5TKOa9ZiOYHdoyjpZ10rLVsm1YqABohLRZCaa6LWDfz9sZaI0iXrHaARbbaqG61pdLS8AQtllQRnxex4WusXbDKZd2UaJ2s072NLkCIuou0IdOy78v8JFsj6P3ReR/VUa1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ3ili6p; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so9985975e9.1;
        Wed, 16 Apr 2025 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744845830; x=1745450630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qD3fBpI3KLFdpDwb0YjG6WZ4vMuNDI7uLPOA/H7kfkI=;
        b=QZ3ili6pUHCR9pXfAC2qyveCxoVPg9CPB3cjve+DPzlCQs3STOV0RzFzluGsA0H2bD
         Yet3WVZo1jfdShxtJMDL6yCVOhaJ7Jd5txWO/hTmyefvxwv5wc18OLPFFCVv9El84/A7
         wX+cq1YL0yzVe5pbIaPvqxP6IUL2+8mlsGicp6d1jEgl8qUG5hGfFqWyKF7wOP9BJUo/
         RoKzq5aFoMv5kA6P780dDt1zL0ddoQVT5xZbPfUgegq+9i5WoLs9Yl1dHgWn0xvLgYnx
         d3WKvZ14tdV0YvyxqElIl1Eu4XeXVOECY6J/xP9gi2Dbtsdh5jKt7I4z/t6zrPOBHIun
         c4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845830; x=1745450630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qD3fBpI3KLFdpDwb0YjG6WZ4vMuNDI7uLPOA/H7kfkI=;
        b=EGQx0NfZXeUWt8OhctkZB0F8jh7+vcWjeW4CpMWP3Peup0rIJvC6ttCUu5ciVq1s0j
         z3P3PB4vDuHCUA2ulnj1qmN0Elq92tc/0GezHlKUKazG2lQYo2CUgPIB7Anauwr1aAzg
         pHER81tYDOylPvRjGE6zLdy4yb2wqZzFp6GgKytZoVSBVgStKjevK+B0XTH6cno9p647
         mR8AW1jRMbOeZLpjW5b1z6/UCQ8JGjC1mAigI9Xgg5VmsblPN1gQtfnqWXXUE//26IWu
         CliQc5D/ggfGj5N60K8Q2cxc3ttszJNe23vkmaN+sDjhkTxFNZVnqkXPfOhzFxxfCrzJ
         j3AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9xE6mgurJ+n4BUtgTm4xtYbbtZcv5xKEJ1ZeL+oSlb8Ia7XPtttewNpo9PgY8OcLXOo5MW30mhxMuc8cz@vger.kernel.org, AJvYcCUgVMhn5xO7Yf1RzXbHT0ByK3Dt4MLvcekmHv6EMUhwCnERBnVLsaNQpI5AEhVCUDUpiR7xiwsxAV4ZNZPpew==@vger.kernel.org, AJvYcCUyXLszacrho1vm281Th0Y9dvObVZNJi3zhmbPch2gKTYfHzMx0+knkN8epYbMWoB9Vy+vrFg1LnaaM@vger.kernel.org, AJvYcCXzXoyEctTLnU5MyRs7MPvtYvo6Im8irjvp9mE6Z20a7apk+QtXlBbMA2twtcYwCmKroSVeHGxpogN8@vger.kernel.org
X-Gm-Message-State: AOJu0YyzG9i2M/6vG04Vj4FXzl0EOXjvg5DTOF6aJ1LGHdOi6VZrsr1u
	LvipJO3feoDMOsfIDXB2+NE8pPMp7i0N5LNnBWcQ2W/Sx7XXBzY=
X-Gm-Gg: ASbGncvx79pZ0vbZ0yw3EME4zFM6TZNg1U0kGcYEfciWftd8y9k9JB5k76uVS7ejQ01
	O99ya1q9WajnPqTeLElPLW8JTPo6XU21RKY2iwPvsMj3gOED5h92XI4pgKwTXXfj0lpF7xnIc9S
	foYXE/heXu6eOIR5B8TkiE6xHrlvyo6pJmDtWFeiXhb6GF/xYbsYqq+507FA/kkJ9jWOIvDfWau
	Wc29/IjmRp0d0qqqAGUSNHjwVlSGtArum3xUysjmU9fHJC16xPFUQaMOYSpzoCMkRdm3OC4ir50
	74BZo7q+JXqZPEcbTyWuCxM/pH8PQ+oIcqHgz/VCrPDxTGb4ai9b+JHM
X-Google-Smtp-Source: AGHT+IFgcmhYiES+Ud9M0NwV/W94r4pPwsVeh17TGm9X2VxhA3Eo5jjA97Jw2aLRocxgbvHGC7PLmA==
X-Received: by 2002:a5d:47cd:0:b0:39c:11a1:21d6 with SMTP id ffacd0b85a97d-39eea0dd4e1mr514690f8f.17.1744845829462;
        Wed, 16 Apr 2025 16:23:49 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3ac4sm34026465e9.23.2025.04.16.16.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:23:49 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 1/4] dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
Date: Thu, 17 Apr 2025 01:20:48 +0200
Message-ID: <20250416232345.5240-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416232345.5240-1-alex.vinarskis@gmail.com>
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Appears to behave similarly to Parade PS8830. Found on some Qualcomm
Snapdragon X1 devices, such as Asus Zenbook A14.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/usb/parade,ps8830.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
index 935d57f5d26f..aeb33667818e 100644
--- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - parade,ps8830
+    oneOf:
+      - items:
+          - const: parade,ps8833
+          - const: parade,ps8830
+      - const: parade,ps8830
 
   reg:
     maxItems: 1
-- 
2.45.2


