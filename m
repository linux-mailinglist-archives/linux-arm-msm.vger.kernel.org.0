Return-Path: <linux-arm-msm+bounces-81856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B2C5D179
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 800414E78C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B63531812E;
	Fri, 14 Nov 2025 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="LzGDA1K+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A1314D38
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122751; cv=none; b=drYTI+eSJ33nz/nP32RiQVu6KSgxj809O9Wyo4gkBs0kKISZ1t2s8Oc8UcTNBuZQuyLQmapv0JtLCqa1dRzSr77683BofAJu1cu8dmbelJHZsEBRtrTMNOIZ4bCEy0h2Z28dEqJxF4rhD8+1/NTjEWxoum6Edqa5gbfKttSYY38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122751; c=relaxed/simple;
	bh=cEn/dm7a84KH+HW/lEhZma25VfMkOl2dvWsYvkdTdgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnOCavO0bhbL9G4WHItoqt59Epr9qbm9mkzwZP5OprRWBASmmSkTfmrJVqFWJdpXrJYzVh9CQcFGSFyfgJ6LpaxtV75VQ0E5DIw1UAuqrRcLXMzTkcmqeI2bQ4mcZQ7D2ZwwN21IzB5jcRE8+jsfkLjN1vdvr6vBfZUzRltVMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=LzGDA1K+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso3323099a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763122747; x=1763727547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7NX34+cD9oODAkPpm/3FAcCNA5eKUq4/o0KGOvXUbc=;
        b=LzGDA1K+5MXMqWTM+rUANlfidmir2t34S/FznnWmj5jG7XWyL7nJjU7AtT9lZFTDfc
         VwSS6i3XkkfDNYUbE3Ae4fTSoFr4DXhJzsgnKbdgGb+4VoBj1ohmYjccary/XoqnEIDW
         t8ELJiA/sTa2ObcZOvmnBRLl2DmJhALsmPKnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122747; x=1763727547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7NX34+cD9oODAkPpm/3FAcCNA5eKUq4/o0KGOvXUbc=;
        b=LKw0W0goQMzof3pFusASHdFiwgPgDdElTYYvPLmAG4t4rNs7TyY6VzXybXbqS9hcHc
         1ofsxIFhJ9kblDQ7uhrVk1o7qq4U3Xj6tC9KD+2gcLZ5/nYSGPY6vsRdPatnvGRgA+Mr
         /cyL0rey+BaSvU5bLH+DYVxKJ0Ka8+Do5tClz8rXHdTKOhV1CB/6z38o+bkW1SdZ6z+b
         EJ+xPiaPJSHqWlbD4RAaiwngRjeY/mhONRHs8P0JDRr7jBl8Gq58FexdoNRh8EPH9lif
         0lK9j/VfdSArmGVFgx8OwXJGdVXNCl+SfetzLWNodEGvvVYnCZQu6yaHhKPgicddxguc
         cfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW57Yta1T3FiKMH/WhBVz9/wzOAmd9nXKy/eGQelBgPDKX6zprxu0kqBfLn5vCzXI8nSyDtmLEJL5+aWIaJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2B+7xum57qMDAx86XrN7dTXVqlD0/Q6anZZ0yH260zN0BQemT
	AG9EutATI/en+uE0L4HTQB+uF8RNU9Y/oVYdOGQfbJlioo5y7Ya3t1iJv+aG2/d/38E=
X-Gm-Gg: ASbGncu/LXXm9ZUBY2St9d3CC1cr3d195pGPD/6zQ8QBbqGcjzzBbpmFpRtRqp5MV/g
	RRW5/OGCvies0lf1jrk8zoxGIULi0BDjNL8Dbcj1YsJhnsDnWVcwaBigFbnBupun9vJrglxDUmg
	2EDcwc8J56t1P/8bGjD8ZmxjMYu0IQIsu0x0qxxxyYREgPtVh3yQiIFDfSrfinSKa2yUSPmBKPQ
	2vx1omy7KnA85p4A9OiA3J58ZMA0Whx8X7j7CxNdjfuK3EMN2zwAYe9zZLTvCH/hE+1R817uYTO
	AWk6N6NdaXRkN2B1oirDslhUzsppInLF+xd0j14WWQTPos4gYgKE/mA9ufoPD4fHkiV5UluV2HQ
	y0gydY0WDkX3VXuSE+/Hr2bDDbXPOL+W+cZXmW/teQbczFYR4fB1RvBPoZX3FLYyCOa/ytkACYQ
	fCIgyOXj2Y8LZq5PcZysqlG3KbBcFTCbkgo8+2T4+lWuVlpY7tWC82ajQowjWY01RFQ8dzxg==
X-Google-Smtp-Source: AGHT+IEnawsi/KLnq7VI8wePAuKiUvi2n2elPHE4luxBCis3Jn3Wf9okll7eF7OL8bSBg/Qymrz8YA==
X-Received: by 2002:a17:907:94cf:b0:b72:c1e9:5f1e with SMTP id a640c23a62f3a-b7367808670mr284580066b.3.1763122747101;
        Fri, 14 Nov 2025 04:19:07 -0800 (PST)
Received: from riccardo-work.fritz.box (host-82-52-164-74.retail.telecomitalia.it. [82.52.164.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed6315sm375295666b.64.2025.11.14.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:19:06 -0800 (PST)
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
Subject: [PATCH v2 2/6] dt-bindings: trivial-devices: add arduino spi mcu interface
Date: Fri, 14 Nov 2025 13:18:49 +0100
Message-ID: <20251114121853.16472-3-r.mereu@arduino.cc>
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

Add spidev item in order to describe in Arduino boards one of the
interfaces between microprocessor and microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2eff6f274302..d0f7dbf15d6f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -59,6 +59,8 @@ properties:
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
+            # Arduino microcontroller interface over SPI on UnoQ board
+          - arduino,unoq-mcu
             # Temperature monitoring of Astera Labs PT5161L PCIe retimer
           - asteralabs,pt5161l
             # i2c h/w elliptic curve crypto module
-- 
2.51.2


