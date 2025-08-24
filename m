Return-Path: <linux-arm-msm+bounces-70515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2FFB32D96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 07:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76AD820683E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55B21DC198;
	Sun, 24 Aug 2025 05:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/0BUs6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04E11712;
	Sun, 24 Aug 2025 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756012752; cv=none; b=sSAm32Yo7m2WCLxw++pmLU1NKlxkkzjNMbwTDzFSdnQo3pHIKb5v3ZsK3W/bFPhG4iCx68AGTgACSKeny00sHcGSFX9rtknmI8wu6dzGfk03kgar6OY3fuV/uuAgm974DpHH5P5kMqA1JFbXkgN4qNHX/HSwvZQYMwFNaHqxcJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756012752; c=relaxed/simple;
	bh=sVALT4CkjPUI3WTqhTXXejCUzdLa7O8oPEU1rFuPm0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tURNb4tXuaeHSlYeDutSceJ/gpSmVobWlAMpKI0BtgDKf3J+UslIMKmpDXAEHJJF89i2WlehEtcgtVYv55VadipUElRKU16AwWe8PMb3gglWwffQL5JApmutZ/NprMogen6sDwFdl2UrXi14+jn8RSbZ1xmHM7m6YD48R/64tuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/0BUs6h; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-246151aefaaso21513485ad.1;
        Sat, 23 Aug 2025 22:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756012750; x=1756617550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GSw6mq0xsgToxzgFyzNv2RrBkOLcDN4o8dsW9/jtVV0=;
        b=L/0BUs6hB5Exim9hTHQgvzrqRA8CcLmfSUzxu58hbHVY6AneaLpgqptKVR5rEPKwMp
         A6ZgKp6BdJcGlWFm0kYJt/uTZE24G9QP+NVlgsihQ6s1Jh4mG6cCIQ31xERx6hHmP1/L
         QdukRLuej2UbKwlsWFqMfJd8y09rYmyET47STBs/wWWHO22EGOU0w9UXZ6vx2JccJ1V0
         Vz5db4O+40HkcwXy/fm/r72LjHMzyl505voar5D4Gx7OXNBnGoTBk3ZKdGyQnO2+dKPW
         xjTU6l+ZKl/S86LEwuQ7scELZYR5S7wUxINc4Hq/JYnl4B9BZaUUVTVvkFr4LuivxYdQ
         NxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756012750; x=1756617550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSw6mq0xsgToxzgFyzNv2RrBkOLcDN4o8dsW9/jtVV0=;
        b=aqukUXD2hebTEvWsNsvKpcJ30uSusm+fwHNJPdyuWOqIFHX/ZPBq30wCLiJDk3HYwO
         xuXk7xwoEMtImtSil2jg7DU/3F6rwvUK2TB0yfEYpnLWUMv1qDgGbMds5r4dBqPj4zor
         nS0cO7iG4O4Rl9A/+yeyumTZGjP47pEnJyvDxAghdy+NpvAyhNZ+Q4txi0jzoPcfK3Tx
         ENd7JRueSTk2oPugVoC6Z+ciKHArYDkSvGQUeP8jFeufnjsf9S27lDPv9ibKt86cyxFT
         rsaFpXzKi5J5LJHMA+8PApjiVtvXPCayDNsI3LqMRG+VYbAe8MlYvSlgNCaRlpKCVN9F
         gOIA==
X-Forwarded-Encrypted: i=1; AJvYcCUMvZallV76PTfH228aIkb05M1HvkwyEGjFFIRrzbna2Pss6GlHzlJgVTt/XoWcQQ/O40UIIxa2HUPj@vger.kernel.org, AJvYcCUW1V/wTQgGvUmEmPDg+bm1bY6BIxvHH9r6Guk0AsXnmux+Imgrpq4TguaS0cogkGw6rMD+qioxPOBSR1s2@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZvJ/hsQ9B/XswKvOWBIGilmCDUCsIGdN9PJhY9llpaxb5RS3
	YlaCRunRGC1A2F1gInaO3YygRuePn0tdCZ+QgPpsaP53fdNaqpsgMFSU7Q4+JryYQ2I=
X-Gm-Gg: ASbGnct1o9xXNTVx+flg/8YYBQrGgF4ue/G9ekR7Jlht73eXGK5h/NkrG6GgKkHgHeS
	VuyKx2Sng59Is4PlJKCBoldIuZFsicTt9kW5ChfraPQSLHd1vm2p9XLm/AkAilQVL9KO/dLJUMw
	btFpc+NbfFIxy2bMJ1m0J1+OJSd6DKVajgT3360PEThiaHbD2WdMTM0vacVvOQqO4wPSY4Y1Q51
	J0hNLMTFGuEDnavBtPSYgbAPFgwPy/vZhFRWwSrrwMSxcPwhQxaTIA3dNwdIFiWiL1MTIbXtfT8
	jRnT/nSW9VelCYc/GIbHcxiyTNCKVkBj9OgYVq3v+aGwS2Xo+J2966xx+H/9akMrBzFfcEmil/r
	8budZLH/40GgwKLv/rHhUJw==
X-Google-Smtp-Source: AGHT+IGUPCfQ/Fqd/IAPaktsppTn3QieeiFv21UhQr76b2hrkfDpz3VauY/SLT3UEp2MtOfkVtNutA==
X-Received: by 2002:a17:902:d486:b0:246:b5a3:134 with SMTP id d9443c01a7336-246b5a3046emr4274905ad.14.1756012750480;
        Sat, 23 Aug 2025 22:19:10 -0700 (PDT)
Received: from nuvole ([2408:8448:5e23:e352:c16:1ab4:27ca:d3f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466886122dsm35354345ad.101.2025.08.23.22.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 22:19:10 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 0/1] arm64: dts: qcom: Add GPI DMA support for sc8280xp
Date: Sun, 24 Aug 2025 13:17:56 +0800
Message-ID: <20250824051756.9031-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds GPI DMA support for the sc8280xp platform. This option is
required only on devices where the touch panel is connected over SPI.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v4:
- remove double space (Konrad)
- remove the last interrupt of gpi_dma0 (Konrad)
- enable the gpi_dma nodes by default (Konrad, Dmitry)
- Link to v3: https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-1-mitltlatltl@gmail.com

---
Changes in v3:
- fix shifted dma channels
- do not enable this on devices without connected SPI slave devices.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20250612075724.707457-1-mitltlatltl@gmail.com

Changes in v2:
- document dt-bindings (Dmitry)
- use describe in commit message (Eugen)
- enable it for sc8280xp based devices
- Link to v1: https://lore.kernel.org/linux-arm-msm/20250605054208.402581-1-mitltlatltl@gmail.com

Pengyu Luo (1):
  arm64: dts: qcom: sc8280xp: Describe GPI DMA controller nodes

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 361 +++++++++++++++++++++++++
 1 file changed, 361 insertions(+)

-- 
2.50.1


