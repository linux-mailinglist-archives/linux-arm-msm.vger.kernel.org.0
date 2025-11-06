Return-Path: <linux-arm-msm+bounces-80627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF09C3C0E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 119474E273B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A0B288505;
	Thu,  6 Nov 2025 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="aVM6n5z1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0361A2980C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443088; cv=none; b=oorAYu8iKsgDEzbEb/7RXRkr/xaLc5eY1zlxnW64ah2uhoB0z1RGRt9xaNdNjbJkjpBt09ZdifMAFqQg1XE9Qly3rCtu0k9B0+8nSXw2wnq/jeHDSkfsmzWgHspUa1+HrrDRV1gc56Yg+jQUFO1UJQUfAhyr0DUhxtCU9g1R9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443088; c=relaxed/simple;
	bh=zyGou655DgPVWbvzpRGsIISTwPvEcU+Qm+OetkBFuJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQjlRIvz9VyqDu8ceHclctuyOAo2y2/ZpZF+/sawy5xVHgpw7ZlzRgNsxuxnbCALpTzAy6S2IbEY8N7/vQcnZgbJOVplx+ADr4wX+EPzxhWYYof5QU7Jm4h/Ubp0HTtzz/W0Cny91fIGGmcycOFamYvwkTOWU2P9dF5SEQKCoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=aVM6n5z1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c48e05aeso767829f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1762443084; x=1763047884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdoIcRkh0qAEi2h/VedrLcowdMk122XxoHkRGxzNBLc=;
        b=aVM6n5z1uAFpFgePUg9wHhkpERhSDjziYWcayZ0caqNPSDpvnmjLvg7zjipKEKXReq
         39BbbStvCa8mrwXBgPFvuoi3VFiJN3tpoh5NZNIqJVS6X9IQ3tOZ32ukdawEVVW4QS6D
         oUU9cb9cnVLUkT9aoYrm733298++GTdXiO7+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443084; x=1763047884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qdoIcRkh0qAEi2h/VedrLcowdMk122XxoHkRGxzNBLc=;
        b=eseE2ferv/goQgslbgRTyg6Ii0jYHH3bAma9WzLz0T6JS6rXvD4tOE2ib16Kn8n9g3
         JOuSrmm7RV6AgGbJRU+DgIEHfGryOEDuUPYr/N+lIoD0DHQaQP9yAf7zQPZmSdkIjs0s
         m9QV5jfCtTOHxXlswvcfRXgBXqyhCUd8dztw1k1KL3eeie7tGdr6FdxCUUITGI7xmyP4
         H+2IuSTtoz8qi0xq349KRZdeNRt0tzgHMzelZcIkxJ+lmNHqc892iwETX0aL7fP22wQN
         0x/0Q/YIkyVTpGWzrUb+eJo/rPSOx7SKCxd6Hyhua253Z+4QrMSpcbt7Nk/nA0P1wJK/
         3+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVScEUvBFeoX+d51vY+wqQNWQJX4j8ploTrqUx+eUUuRv7dyp6YS6cIiEgztjn9KAHfNEdd95wA1Hdb56zx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4W6AbPWBg52rsWqhnkFaGwU+CzedrgHuPPgLTLRCA9O0MDl8W
	ZXdlcH29qcvRomX29D0B9W7Ify/sKhi+S+JhI2hESvqNz9ky3Qsvt6hCtIP0/R6Z2S0=
X-Gm-Gg: ASbGncsUSqe6G6ZYR0ek18/LWGvunGx2YQqC3rpZEXoDoEEt3QdmNt4EIOPO1gmOmIE
	2uETLGhrUHuyIUpinEpBtk6ufoD/skT2U0yGIc93nJVfJcwqJWY8ZmAGzT7S2ed4oND+PI5swPN
	BLihlCzcYlDHRbls+Vuov1a4e5Bu3WzNOZTdRS93hnS8SzRmGrnsWlZm1R5m2gdf1Vr14tEeBzm
	StbIggxL7IW9sqFjp35DQaSkfSWJRejgZdlgVlpPCmwLNwW7Lc/F6Y4YS55iaHbCHycu/iukE8g
	3sEwH19MAD5DRrNKc+MQVeMq2+8cxoNJPy9+5QAwpq64aZv8DNe2wlP9xHGhS8nLn2KPPR3rL5Z
	wnSFsXDKzC5/kKXH4JK9MmBH49SumOMKOJ5xBlW7o79Yp27F41WoNY8uv8bZEwyS9ysz+ipc0ux
	mBZOvB4ePQvJp6pK1KyNoEnizd
X-Google-Smtp-Source: AGHT+IE11tqb7MERlvkENeEoJrFa0Bnsi91DGqfmPPudaUG+82H0TbZwLnEcFpdLbyB2kEFZoFWXMw==
X-Received: by 2002:a05:6000:26cc:b0:425:82b4:a099 with SMTP id ffacd0b85a97d-429eb0d7665mr3707607f8f.0.1762443084189;
        Thu, 06 Nov 2025 07:31:24 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm5966719f8f.32.2025.11.06.07.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:31:23 -0800 (PST)
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
	mm.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 1/5] dt-binding: trivial-devices: add arduino spi mcu interface
Date: Thu,  6 Nov 2025 16:31:15 +0100
Message-ID: <20251106153119.266840-2-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106153119.266840-1-r.mereu@arduino.cc>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spidev item in order to describe in Arduino boards one of the
interfaces between microprocessor and microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2eff6f274302..c44fff4ce2e2 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -59,6 +59,8 @@ properties:
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
+            # Arduino microcontroller interface over SPI, e.g. on UnoQ board
+          - arduino,mcu
             # Temperature monitoring of Astera Labs PT5161L PCIe retimer
           - asteralabs,pt5161l
             # i2c h/w elliptic curve crypto module
-- 
2.51.2


