Return-Path: <linux-arm-msm+bounces-69385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D69B282C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 17:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0E3601278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B655C28D8F3;
	Fri, 15 Aug 2025 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwy7JZuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE628D831;
	Fri, 15 Aug 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270903; cv=none; b=TfiR/moZWtRiSQReu7t1NxE/HSv+7T9C1G60j6DcS7jq39re011TwX2MPWFpv5Nz0HMN32mUavg5guOh4h85NWQwLM7XuzeOVSJIciwXCzn73yNHd8QggvgNwSybsvbRdXEgYxEQxzeULPNyadHAh6mKxq3RCp/qoK23C+iBzaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270903; c=relaxed/simple;
	bh=ROc10LAUF+85I8dV96if61yuH88PyeIBuAWoj3d+CsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oKzm2C2nUmy0rr/XodVo5pTMZAzXH3i17LE/rVIY8ozOVI2jokccxvsM9kiBES/fgBoSLqWli2pVocOWUguPs4PGlUiG0/MPWq82pgjrFwzlvytGXiuFfvFshuDNMuFxm/t1w6wgHfzEFMrLJe9ly8+0iXAZCT1KgYPMsrNxDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwy7JZuU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24457f5b692so24387955ad.0;
        Fri, 15 Aug 2025 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755270901; x=1755875701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pX1aghNkwkFIGaw4SNa/xcjRtoQIfTZv4WTPjxv8i9o=;
        b=dwy7JZuU4LixoLlR6y953nJB18L3sedWFloDx+NYzP1S69wDeuhAp1q4P9c0NKZQHY
         sEaEeIuaAxsbXVYDAfO4olMEN1AbEw/wNKdA6DqJddmwBa+2hzUZVuyeEQaMpaNAe9jk
         fLthfaE2OSxGk5s4X3s58nwbO/aLBXm7CcNRuA/9SSEWEfDnDZMEz2CpBMjNagQX60x8
         JzA52seLAoRFj4bJGeI4/nh+npuwfahxlGJLH3uBeSgx4Cdd3WHRQnsvW8+AmQ+DqQCO
         4WmtzhbLJ+rf0G/wJt+sBt/2HEbRkpwRJaKehRhLQno8gQmEP+YUYqFbtNapHkQ23I6y
         MN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270901; x=1755875701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX1aghNkwkFIGaw4SNa/xcjRtoQIfTZv4WTPjxv8i9o=;
        b=B8KgULhkDPPt95ltUkVmwAalzYPeYniKiQ0DQmKwjCLxYnwZdzGyINCQ+Z9ablwkfP
         BCGozM2eviM/ZagR9/UpuU6bAM+OTnjo5bVjkh6Hw1SijugWnUDDoXsrwqL+evzzmn+s
         LD9bmulTUSVcfKUaAsHyf2bI5PDv5/95e+wBY+TLMs0b336+xrKXYsni2fcXgdhZaDka
         2YIvU6mxc9DVsH4ByKIULsyN+OHU7+hq2T8B9huuu+HSkM9djuvE79rVBqOlFHim2fAr
         +0vN/KyiLqBigUtMPneX6nfo1L/bZdI1oEDwwXR2DS13J2IiK6AFSqdoZDS0ObDkjpUf
         a4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWarcSlB7SfkvDTlO1TMMUVqyQHBlS5rFD5qHBZc9wm5ANOg6I3JovKBCan9ihO3c+k+hJv26qNjnCQKSVI@vger.kernel.org, AJvYcCXUs5HYnoWei85myiKmcQ5obqWfJAXHR2uG18E+XRujxx7EqQWR7QeUa7RQwDDoRoz16OT86EC0uAOi@vger.kernel.org
X-Gm-Message-State: AOJu0YywdoIKilP44a/GyASudG5W2lVPe9ZgLoaSZL+kKhNvEUKJuE0b
	d8FHISsM5809wkns/sd+PMMp1Dv2lFJiLw4kn8Hd1yKjhVhcuZGX5JoyrIE3tmYy
X-Gm-Gg: ASbGncuZQgJmsCjtE9nK36zXdHrDhE3RAR6aotviD2VGNuvqhMWFm9uFZ9UxECmlJDF
	d0/SOuT/TWgE/H8Vyg/Em1rwcPp6e/WSkSaRPBf8CuUmk3oKUUoit+UhQKMYZ1BhQ0YfJHI4FVd
	TrsaKETilfOEHwEy9O1dYjU+P/ya+HB2aJuqpQR0yT7V3uYn+9b4HGJ2E+m7pVURVp9b/GYJnaP
	x/+BlnndMm+ltHjlhmRT4Yz1i18yZ125keakLU8/8EHnHhgIh6XMWe1ge6cx7lTwt3kStYte3h1
	Cray0lJBgDct5Duzxv3YnKgo9I06o5g5hvbjkfMBR8081StFVo48iKFLsQbVzhpX7+yUU62cbif
	OUZocyXFnodaGMlBkNh7eZJSjoVqVlDFzToRd8DFmBK7kFGz/
X-Google-Smtp-Source: AGHT+IG5kEaNqkEN/gRu76jtJqI2ZFD89hyasCab4ZbBi3SXRrkbljVJS90vSYaUdPdsyt010yn2vA==
X-Received: by 2002:a17:902:ced0:b0:240:a889:554d with SMTP id d9443c01a7336-2446d99d42emr43517935ad.45.1755270901421;
        Fri, 15 Aug 2025 08:15:01 -0700 (PDT)
Received: from archlinux (201-0-28-218.dsl.telesp.net.br. [201.0.28.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53db44sm16224635ad.117.2025.08.15.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:15:01 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE
Date: Fri, 15 Aug 2025 15:14:24 +0000
Message-ID: <20250815151426.32023-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add new device tree and binding for the Samsung Galaxy S20 FE
 4G/5G phone (SM-G980/SM-G981B)
It features 6GB/8GB of RAM, 128GB/256GB UFS and also has 4G/5G variants.
 For now, this device tree covers those variants as they have the same
 codename and RAM is assigned from the bootloader.

Best regards,
Eric

Eric Gonçalves (2):
  dt-bindings: arm: qcom: document r8q board binding
  arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE

 .../devicetree/bindings/arm/qcom.yaml         |  1 +
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/sm8250-samsung-r8q.dts      | 47 +++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts

-- 
2.50.1


