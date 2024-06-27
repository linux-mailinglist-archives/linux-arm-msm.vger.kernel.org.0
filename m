Return-Path: <linux-arm-msm+bounces-24436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0DD91A57F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C10741C22B25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B314C14A4D8;
	Thu, 27 Jun 2024 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FicONVYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65313A409
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719488545; cv=none; b=RT0XBhjQVNFOtGIK4v/VwKU4YplIjSxUz/ecmGLlks1yldJyoO7jBoFBrt7fCq5JV17qOjlgc3cZHU5eMqxQU6v+5g4vm0u2iDlyMLon2G1VixecAwzu6WQnDAsoH/wFKqH5daj0JriMqFJBMeRtToYdHbY/zFmwy8eIy+Ok9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719488545; c=relaxed/simple;
	bh=NHca19c/l4kAA3IjwkGK6+rAojDFVkD/A5ds19ZX/fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MHd0zSHndepJNOLMTOwRNtKYxbXfBF8guxZwcyl/KwfqccqUxYnxO5/60PWReG7eFpPjKBqB96GJxOlgkorL8qxSpVZJ3GAsnlOTUltgVyYDZXs63AUIAOmHP3hhRkAawD99swAUH+cE0PlwrMHCWHW1bFpY2cbKA40p5yUkobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FicONVYf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3645e9839b3so5858802f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719488543; x=1720093343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kXXfXEFDzUC64T17Ry+QFiathD8Dc3ObuiaeMGthVI=;
        b=FicONVYfaWxls0Y4kVHl9m6c0e0TV558K8xRKvx97HqDc4zgw326iXjMvPY7R1x368
         4rsuphylhbwO8uiFty2SM0ps68tD5wRcxDdiHH8GXFFFZp+62XyLlju5FoGzG1n2v+Wy
         kNe509sPZXpnIkowWTPxxRX0tgOy+cewpPZIy6Tz0c9HQRVLt9/0vBIkmLvEAwaFxg8r
         cKVkuqbJvlr3hIa214tc5Mt7JBshRGvpe2rL7ykemiV4S8Vc4eJZk4EqLWzHgtjViMrF
         XUpoDbRNS0jIoy8gkFLu+wKt74/AXK4POteyy+UVhFX1WsIU5j6tnHke8Yy79n9wfq/o
         HkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488543; x=1720093343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kXXfXEFDzUC64T17Ry+QFiathD8Dc3ObuiaeMGthVI=;
        b=ZruTMaUs5W1AVa79/MZ3hqDCNk3OYkWkmRaj3sgrMIN4nPg8W0Eo9HHLeFuHdpczce
         N3KV/HkEujRfw7qianH6BTninV/RvTuE8WYwPL7nL3teSfOJOpXdEtpYtULM9GTjjzx5
         52m1bW5uT3RZ+IIt6BLGp2isPRxq3VftTaBzcpzqxCNoO5tuaX3r7L1XshOFQfZeJFJV
         3mKa/p/enjhZnXqNCgpSUefdY/ETMTl6LbiCxbWWIUCW6AAPMe8q3prXWlSV6o35ogi/
         0YiU1oLwbcnDvLY1ocZCVjwvui/nmOJJc/MmlIvJFPsPFxiIfmpZTLdGtveSnA09KenH
         dxRw==
X-Gm-Message-State: AOJu0YxFGajUDZtPI5JiAmlo+9kDI8IzFBxkPuc49PeoaAvHVzkUDAOR
	Go+qEQzAJSlbUt1lKQ9tF5ZndWbSVGg+GblZPSp0iJpDDqUB41fHD2EXDh5tuxc=
X-Google-Smtp-Source: AGHT+IHoxJdWlrADArRdG8DgzgAL9SZ6fx2OLKkXTk/rwvrre1ojW9RJIRkT5DyqzJfpREwn7bCXqg==
X-Received: by 2002:a5d:694c:0:b0:366:f323:f59b with SMTP id ffacd0b85a97d-366f323f70fmr6752481f8f.1.1719488542663;
        Thu, 27 Jun 2024 04:42:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36743585276sm1554749f8f.62.2024.06.27.04.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:42:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sa8775p-ride: support both board variants
Date: Thu, 27 Jun 2024 13:42:09 +0200
Message-ID: <20240627114212.25400-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Split the current .dts into two: the existing one keeps the name and
supports revision 2 of the board while patch 2 adds a .dts for revision 3.

Changes since v2:
- use correct phy-mode for Rev3

Changes since v1:
- add a new compatible for Rev3

Bartosz Golaszewski (3):
  dt-bindings: arm: qcom: add sa8775p-ride Rev 3
  arm64: dts: qcom: move common parts for sa8775p-ride variants into a
    .dtsi
  arm64: dts: qcom: sa8775p-ride-r3: add new board file

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  47 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 836 +-----------------
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 814 +++++++++++++++++
 5 files changed, 885 insertions(+), 814 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi

-- 
2.43.0


