Return-Path: <linux-arm-msm+bounces-42992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3269F95FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F336E7A4324
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 16:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F51215713;
	Fri, 20 Dec 2024 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IotxdJ3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107739FF3;
	Fri, 20 Dec 2024 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710810; cv=none; b=iNDZ+drFGHRAJnGPPKTHKtMH9fIZRVPiL754wHlvk0EqgstE15LlhSGytcwoae2QUkhz9MtwsrgvNn6dRsv5rCraIiNdMl3Yp9YrT0g8oN/ZqYTB9iPWt5A5yBJ0QBSQZ48tJTt17ojEPr7BGtVfvKNw7AeDPSVn7COvLE2RE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710810; c=relaxed/simple;
	bh=chMdNm/Q5KLgechMxKPNtyrQw5ShEV7Z2Gkq+62QFIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNhCsIaYYuyetEGM+qt5TJqzsNISXBLEX5B2WprVXXwNhLC+hbd7Q25ex6lmJVWThW9BwG9rmxx/eEQhDVSKTIZa7/+aOqPPYGPs5fQyI2eOI9XtSWJKogiqlPLsKIt+nMgxPmnpi0feVMnj9AfBu/2ZO8nE+6/A4ofLCy9BaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IotxdJ3a; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f441791e40so1689744a91.3;
        Fri, 20 Dec 2024 08:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734710808; x=1735315608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqzkneedjFpkKrbm/77u/4WbXSRIbYzZ5pp4s+HER/o=;
        b=IotxdJ3aIPy1TtpnKCYLBUwJGFMZX6kpYNA8WoBVEoYa3Wj/TW5kTzZk4fG51hPcFn
         z7BIlGBqV8WP1vWWsqjadWcoXQQgmvZXxN/z237/AbLVTs2HHacM9RdqR/XeX44Vtnub
         JMuJds8YMCW+5mxynduhRK8glr0qWRMTgkWBfv0mbj2ftXQYW5E3tpjWeDaAJTqT8NzE
         az7rT9w/otXF7sWnErDvgVpf6a2CsWDzFd++ZdqkkyKvL77IWFa7nB4roYpA82WQ70yp
         fRjNn9bJk8cO7eYCnZA7WPkE2xf4uIAZG44b1T3DTyqTEBSkf2j1wNb/sOX4bY1Rzz6m
         IByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734710808; x=1735315608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqzkneedjFpkKrbm/77u/4WbXSRIbYzZ5pp4s+HER/o=;
        b=ueZy+sivBmvVSfpODsrTHqhkupnENAJLNyYdMhCXiURKKkX0mkvl7Oy5AyoNkIjNHJ
         OhCbUsEJSx2qZfyr6B+gXCTY7BTLUBzmXuAVuVOYQ9uQKKyoIu/APe4xrCYzuYGJ1heB
         kee0ilt3Bb7PKrEDOitIdMcJVoPG5PI/xS/bvSIzWrbhBytXV61EyX81NiJoQbcNUwWJ
         vJHynLd3v65gq/Sg29ZW14XCO7O/JxORcfNTljmYn9JvAEu17G6LygK/EBKv7CsbZKGo
         6zLlqdQF5SKwO7kcObmxhvdJSVm2MNg21DgG54keTwDKxw41aZ+xn1ZOVPW2PBIVOwKp
         HE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUclp/1u1MEwuIJJMMWf4eks5WP/7UR8IhlQX0NC0kbBQ9df1u2Nr5T5QhAQwaqJtZ8itTn6COsKVNMqTujXA==@vger.kernel.org, AJvYcCW4/Mvsh+4sPQxOCGGuZWyBWf/3wP56eZJeWiBUpfqZdQmJNFCKWaHHLxE0cSp7KZqlbgidDgjEXpJn4/gR@vger.kernel.org, AJvYcCWau6ojeT0nFR1ULkWRArWM1FlHNMb4F38HyHU8HMOREazcMCi7xduGFDsiqj4iej2iDbi1xvSByXKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxiX7McQrP0HNXhsc36aOu8IqzxJAZRIzMPr0ZCZms9B0WxeHwd
	62eTHRbZMwDJ3xcqBVHpRuK1bIIh/SrOeCocUE2r8Z9tv+PLUNnE
X-Gm-Gg: ASbGnctkT1oauI28QX4cZ2P0ZIERGnCaQbf8IYiH6Rp9V4UU9LgTm+MYqbR1EmlpiS7
	oK1jW0+eVP/tTBfGZJfcS60U1ovba/rLXyP5W80SsWrFQx6o/gHi+EBWjNmqK7ALoAPlUMqODVM
	hCgDUyn6VV8NfyCD3FgBoPr4n+8MOEi94rZnVXAbNaeJHdu1uT6j9N9ELlyDMNId96wfLgC377f
	4GLadB7ag6loeWAw1aJ5uuhzMFEojwR8CyETKGscRxyfrTBw3kLN3Q=
X-Google-Smtp-Source: AGHT+IESaLSHzyGt0jMI3iXNk2wEyI/+br7s3QbEkDb1UV0Njw2E43YUAaGmhJnAPGpAVc2DkepdiQ==
X-Received: by 2002:a17:90a:da88:b0:2f1:4715:5987 with SMTP id 98e67ed59e1d1-2f452e1e7b4mr5403559a91.9.1734710808471;
        Fri, 20 Dec 2024 08:06:48 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478a92absm3518771a91.44.2024.12.20.08.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:06:48 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: chenxuecong2009@outlook.com,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Introduce Huawei Matebook E Go
Date: Sat, 21 Dec 2024 00:05:27 +0800
Message-ID: <20241220160530.444864-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SC8280XP-based Huawei Matebook E Go (sc8280xp)

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- use Co-developed-by: tag (Konrad)
- follow this order (property-n property-names) (Konrad)
- add a label for tablet mode switch (Konrad)
- handle line breaks properly (Konrad)
- remove the wlan calibration variant (Konrad)
- drop the venus node, as upstream has not supported it now
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241211153754.356476-1-mitltlatltl@gmail.com

---
Pengyu Luo (3):
  dt-bindings: arm: qcom: Document Huawei Matebook E Go (sc8280xp)
  firmware: qcom: scm: Allow QSEECOM on Huawei Matebook E Go (sc8280xp)
  arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 1318 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1321 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts

-- 
2.47.1


