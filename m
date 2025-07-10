Return-Path: <linux-arm-msm+bounces-64359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0E4B001AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2774D5A782D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42B42566FC;
	Thu, 10 Jul 2025 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDSUnJPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315D2561C2;
	Thu, 10 Jul 2025 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150433; cv=none; b=ZBJnY8GWGlWBEN3EiRHSXUXBNQm5S1sIr/jI1uUQuWYnaK88vRhbQxyv6afa5NnDodabzV9KuKstcHWwTfVhEaiPVnukcrKz76tIkX/18mjkfJbJHJKvdUrEPzIw9i1KBQgD9N8ZDQeoMx6cXSWaw2uf/1ZW2Shqe38qNnJN2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150433; c=relaxed/simple;
	bh=1esktHZF7hEEXcc94m9OkxaWAqylxLirPuQbh8KVXIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HpT1AHmmRj+iUY9RU/spIAwRBPvZdCbY42mD1B1FDS8q7maKwGvDLLTi6Z/7DZOVSUnA4fmSPUlYMY1Ljf91YrVdVpaFSav/kzJmScSRH2DKCaoTBkQJZ9OnRI88tjJBzwHjY2361y7AO7IfgYRz3MS7mk+1I1z7YDVBDrhvCqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDSUnJPg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747e41d5469so1013961b3a.3;
        Thu, 10 Jul 2025 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752150431; x=1752755231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H68qJH1rtr96WSY9zJBxwpOGyxUPjoiUtWTVEf5FtJo=;
        b=lDSUnJPgMIkAf4omUPciPyIumJUe74z8E5uNHidkcJP/8ZYjKBBQ1kOTTB+6VPTBH8
         j9FFCees7Kzt2BhONU30R5gmGJye3jlxBR8J6wiIOcDsRzMuxFGS4EyFtf+LnOhv9Jfa
         TsbuHCst8xRJxwTwdCatWmWugTUaDx7f1B9AZcangnoNzfkFF4K2ESy8zTJE8fFPD42b
         paexf7lAMBzonHrHMSSEggguYPhaEsBGxzFy1b8/LMV9syuQj9HJE/ig/NruzGwETTUH
         dQ9g9VPk0+GNeEPYc4UGLH8B7HOuJoRClNwNUUYR6cv35+t0uuQFbdyfW6If2cJlYCot
         lI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150431; x=1752755231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H68qJH1rtr96WSY9zJBxwpOGyxUPjoiUtWTVEf5FtJo=;
        b=Aeme3eTGg5gl+d6zD1JHIRsaU2/Zjm17H3T4SyxBt+vSk/yKlsmdBusPt9uKc/uSwP
         bgfBE0hFCFx3SU3vGSCU/MSXabHsA2SqghUdOB+f6Gper3RX02X9y+njeGMqQeD8wxWp
         OhFd/2tCIOrebhm4bnytC+mU8qKJLJJlN8J+02EHoV+JGDySHdoB1M2FTke/c7ROSpXg
         jKkvU7ybMekQCBxyo6sR736DCG1xB+pLcSzAzxnqGCD2WHtoFCFvH+zHgQLxzpGVPGi2
         im/wHmPvIZdoj7RG2swGu4UhAYgcMeIh3KxsLYxn9h9qeDU2pJA53+AGg0dIY5BX7cD9
         agBA==
X-Forwarded-Encrypted: i=1; AJvYcCVAr1RatqU0Rse77TJeEbzqQdsaZO5G6U1SurnDrgIxAX0g1jNj3B4TB17Y72R8oYxfsCbP84tj97mUxKib@vger.kernel.org, AJvYcCWZ04pUYNarkSrjnWtYMsxhlD9gkcEmWP5/J4JkyZ20gQBU5lRHYkcEzyk/FDZykKp21XwFXZiuoMEu@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4yelAb0ujq74ZVMLAR3+Fxg+0r+Da89kKGvKCVyUdM8Au/zD
	NNslHEMFTMuy6nVlyd4I4pNQ2GP+BRH3Um9CQYLjtANXIZ1LR9S3aSzE
X-Gm-Gg: ASbGncuj76VAQTrB0ZM3pRzMmPVY7XNK7JNZilHdZUV27E6JGpSaoAPWt+X5bpFd4vQ
	Cn7l7UcI3hKfSVMG/HVOrSqhVkFupqbDaKUfGfKAKRppwdMQXRwmJ9dPK0LMt3pI85QhFPKhVut
	stTRUImiGu38CL3dIBOuexsKDy/LioGTi5yMZ7OM3XrwuxbKnf2YcsBc4Zcvc9phspE26Ap2LG/
	Rvh/3dE11PDrHTa53Pwa1C5SpCTqGc6EepcU7mdsTmnDrQDoVvJUxK9LUpwQ+pUOgLPMB6aLcc2
	USEH98cslRwWJb0Sf0qZZfye5kseS79ebHF8t69JRQTyngbFtlJYppBVwt6tJjhK3GkU6j9zRQ=
	=
X-Google-Smtp-Source: AGHT+IHcQXTWMtPgAtyNxypXxcZKu2MmhJFYsFVW4VW6GdKn2ygzGDE4bYUAM6X2aGNacK5gckenRA==
X-Received: by 2002:a05:6a00:2388:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-74eb8ec62b2mr4285697b3a.3.1752150431441;
        Thu, 10 Jul 2025 05:27:11 -0700 (PDT)
Received: from nuvole.lan ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8bfe1sm2116413b3a.155.2025.07.10.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 05:27:11 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH RESEND v3 0/1] arm64: dts: qcom: Add GPI DMA support for sc8280xp
Date: Thu, 10 Jul 2025 20:26:34 +0800
Message-ID: <20250710122635.231282-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds GPI DMA support for the sc8280xp platform. This option is
required only on devices where the touch panel is connected over SPI.

base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
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
  arm64: dts: qcom: sc8280xp: Add GPI DMA configuration

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 368 +++++++++++++++++++++++++
 1 file changed, 368 insertions(+)

-- 
2.50.0


