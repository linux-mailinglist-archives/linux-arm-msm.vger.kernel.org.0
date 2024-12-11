Return-Path: <linux-arm-msm+bounces-41523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D89ECFF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45E5716049C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918881B87C0;
	Wed, 11 Dec 2024 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQVHYBZw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA11A4E9E;
	Wed, 11 Dec 2024 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931551; cv=none; b=sLDn1ZKsdHT9FM5P6238+/0oN8SN7e6rY5tsg91EHPDIaOA3mExlbgVtMenbqgoNoJ0DxfTMqD/Rs+Z1urWJ/RmmsfJBZo5OYj72nK2M6NyQS6XT3f2afQZLmGphc3AgvNQ0XBZAtH/T1dS8xOIdYbyLhDGntP4OWFqCigO+8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931551; c=relaxed/simple;
	bh=HxVyBQpalQcHkqFks4heCS7q0ocMDVTLWIENzSUaPb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eu+fbceMD/V/Vxxobm3Qb13GD+CooXUyvaQBIIz64MuRhDupAD3gwa6CMGOZeYHOwacw15boDNJpA6WRebTTjhO/8Nf2yLVj2A17QaEQRdfw1K71TP4+T6u+SRX4ONIdFaPgPkRIPFp6ndn31k/mV0MKnWYUwlYcm085B9mPga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQVHYBZw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216426b0865so34268205ad.0;
        Wed, 11 Dec 2024 07:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733931549; x=1734536349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vcZmpkE5wxR9kaIUiiWM60oxOyLsrn850O+fsByltok=;
        b=jQVHYBZw9H0he5+MYxB5LxdQ5q9lPioEnxodjpT6l6M3tJpeKBT/RAnl+GN6PB1zRv
         yJpfw5vneuerB84w8gnz8pDh0h375iVASrclIxlbRkFhirMc/Ypv6hKbBmyCW4/NpngB
         RdBFEyjHR2HaIvLdk4l/HDiOpoArw+tYbPv6VnIgoBgmQK+KUyf57oWUh755weUzda76
         CvXrfalsP5CZkW0X4+EXcvbQNduHrDF6R/tIBa2XCM7pXH9IdUaZfBhROxfm85kUGNGc
         4X5p1A3J9BzYwHO6obGl/ylSr/JR65mBPeS9YHECYFTsYuEdgBnfjyJAXYwHaOnWuSeV
         +9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931549; x=1734536349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcZmpkE5wxR9kaIUiiWM60oxOyLsrn850O+fsByltok=;
        b=Jwco+Y81i/s63LP3nBsoSprjLLLctfEWRy1eT0cB9yh81OoTvaQTCaNRKjsoOsNBNz
         uw0mRfJdNW8c4pVjs5Q1hYqkGFYx+CWs1CB4XQR7IfryQwYKvufqfYiptLaAVKIOEK6L
         kuQBfFJsV9U3OKwTvXqZEw8X5t9IdDsH83PnCk7iY5iiZwySsJrx+qbF4uZPPzlGodMg
         2QLd8MhjlNK7NGGZqL1YgWYYi7EptjjCBMEeSj5nucTxuhHlSe+OEkObVawii5B2LfnT
         2x+2gwfTpwq2tMqFTNCLS2mR/Fn0c5oYCmCEei2wj6dSOVm+ZgZqDuREGBziOyunEiFl
         L4og==
X-Forwarded-Encrypted: i=1; AJvYcCWDdF/zn8V5YHEGGK+yHMDwmuUEZJlnAkHR/V/PuZsEMt8vXmSAYI1MFNe3t5YwNTpekbyj5A2SOpbOV5Da@vger.kernel.org, AJvYcCXLEhRrJnOalaBVtJLCUIgZeaW72ACgNiVKYOSOGCBpp8aNAMMgtTk7ctwIBgTRPQkat/m01qhVQSYjpsDk8w==@vger.kernel.org, AJvYcCXNc0FwjlvpilqZkJ7C9lqcu+u/6c+8WOrwYfIr0kbitEofVa/utUKUUnBgPRk4pv+JpIPShriIJ2D5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30bPlF1dEkNXgG6/HMaH62fBr4Pheu5c2cQkxUuRDc+9h+Y+u
	CJK/p7FB9KbEEuYOHmrb3oq8FjGOvgSTdhvS78mE1BcquU+dBlFs
X-Gm-Gg: ASbGncsa/TDPygEpC3y9ZweMjBJbYh2L9mDsp/V31VWtyhXjYAhnFmYn6Vh0oYeG0fi
	Eh2ZBW08HooOPyD1zktt3K8l2ueYURlezQcAekt3Zn5nwkz5tJjJGHfCTUFmYCOXS5xkKI22K8+
	AdDImqlDUYLVUWjlH3OIkY1ULBlYvcg/dqlE9ZnTkM7WJdp9OoxjTWkoCOODtCjxuzvZhs0qd8A
	gmjv0YFzTfWDW0pv0C7RE0So5wVPFSm3Cgpi1qxuLrO08YtusvM
X-Google-Smtp-Source: AGHT+IGfECcb4Jtb28fDH3M5QY4KWFFurJHygWUiujOrYcE5tcsGKa1nm9pLWkYu9Lv3DOTiUqeLRg==
X-Received: by 2002:a17:902:e752:b0:216:5b8b:232c with SMTP id d9443c01a7336-217785632ebmr53926875ad.54.1733931549263;
        Wed, 11 Dec 2024 07:39:09 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163d978286sm62357965ad.277.2024.12.11.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:39:08 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gty0622@gmail.com,
	chenxuecong2009@outlook.com,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/3]  arm64: dts: qcom: Introduce Huawei Matebook E Go
Date: Wed, 11 Dec 2024 23:37:51 +0800
Message-ID: <20241211153754.356476-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SC8280XP-based Huawei Matebook E Go (sc8280xp)

This is my first time to submit patches to Linux kernel, I have referred
to some submit cases, but I will inevitably make mistakes, please give
me some advice, thanks.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---

Pengyu Luo (3):
  dt-bindings: arm: qcom: Document Huawei Matebook E Go (sc8280xp)
  firmware: qcom: scm: Allow QSEECOM on Huawei Matebook E Go (sc8280xp)
  arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 1332 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1335 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts

-- 
2.47.1


