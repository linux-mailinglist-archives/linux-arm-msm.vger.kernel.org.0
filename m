Return-Path: <linux-arm-msm+bounces-26052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3092FE2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 18:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DC82283A13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 16:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADD317966F;
	Fri, 12 Jul 2024 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="KQRISjSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5043176AD7;
	Fri, 12 Jul 2024 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720800287; cv=none; b=i7Sx1Rzn6PGdGKa4cgrMqnPSXfmPBSGqDo+fAPcgDzT9kI/LGMzs8cyb4MGPHFm+wGClW/K0oLCi5Cjajko4DEI+5q4KJ44OryUWaDgcv+UQ8RDFkJQzouJKkXsY1McMjhURIEhCPtkjWG9Rf7OPvihhr+OX/tVfnUPHM65ktzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720800287; c=relaxed/simple;
	bh=VHI+b1vecvITGKXYXsoWYq3EOOsLRqSZ4cKYOFtW04w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J184rL9TikIoXmtC2/OdE90kusLBUw9Am3rKHaashZP3jdqHIM/Yr7Ye4MGkriknsWDrRXj7Woowx1l1tEYzN3wVkzRLz1DedhhMtKSovC2FrLoPf6VYcagWEHh98f7RBTtXA2LxJvFWayDhysJa6ahoNlaKukE77Xql0go69hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=KQRISjSC; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 78ACC403A0;
	Fri, 12 Jul 2024 21:04:32 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720800275; bh=VHI+b1vecvITGKXYXsoWYq3EOOsLRqSZ4cKYOFtW04w=;
	h=From:Subject:Date:To:Cc:From;
	b=KQRISjSCKYG93aQeFLO5IZWl7v8AU9yt+QMO5EI+rtt65CaeVXSZ/b/E+/ruEo/WB
	 7/tf08KbTjohBjacMxEMGJlFH7W40Bp7iCzsXT3bFudcUBqRHgAhZtiwil1zQ0A9SQ
	 uWh8HAD2dryEBQ76moKqogWBDZpEU/yYssCE0KqZR13dv58yQe0cCTa0bdHjFVZgGW
	 Se6Y1FxRbDp2GXCaPkkglRMU1gcI+unt1qxRDox6nxpwXLarGDxlCB1ytHUTGEvbih
	 icqyN0bFcmhmxsEfc1/DGe/B0WWAo/aaCQshhsDFCgItReHYKiwRFrhHB0OnVT1uUC
	 gU3mtrwXoTbbg==
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 0/3] Introduce msm8916/39 based Lenovo devices
Date: Fri, 12 Jul 2024 21:04:05 +0500
Message-Id: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPVTkWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0MD3dziXAvLigrd8sy89JLU5AzdzLzMEt1UA3MDS9NUoySj1GQloN6
 CotS0zAqwudGxtbUA4Giu3GcAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, Anton Bambura <jenneron@postmarketos.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=VHI+b1vecvITGKXYXsoWYq3EOOsLRqSZ4cKYOFtW04w=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmkVQMaLZDhZ2SpJDWNO2wL8HEf9f0xhMkOnDvG
 YgtWA7/P8WJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpFUDAAKCRBDHOzuKBm/
 dWsqD/4zyAanFbR26tMbtrBffl9oWKm6Fa/3XM+B+I2fc7g4yvcepn7mXtDKDgE6VAs7cQSp/Bj
 E1jqoxh77Kh127JKRjmGV3leCNHjMynyjTlcTJY8hcjvU6Hpr7amGQMV0S5MEz23zYaWcZ6I8i+
 1j6mPycw3/h7KmDX7Ww0e61HOC6hFSRiTkMAdd/gHXGR02fFuLjSz8oCCZQTdmSRKmm/jKO9rXe
 Pi6P8isuwEPPn8+3nqkNP3mJiy0ehMVwG6FVlTowPRhNuopF6Fbwh5ub0rshjTJw/Ka0YD6Zi7u
 L4Ja6Sly1oVfsDZAB3A3pX3QLl0T2c4wcmAdB2R6dmLKXn7FbcFhKS9vZGuAEVZxaOn9+nZVBGq
 XN86uAkZwI1rl0LZF48PNqifMV+AzmZYKP5uC/aMxapnHpvIvm5t3HnWgmE7Tje6XlePGCa7dMn
 mLj+F+q6P+SfIsuJIXTSAYiVUCscywkOYuSRJv/csnw8TKBAnNQvgSzkFKOrfLMob9Gxb5yGITW
 rD8tQzsagUZzkMc9CBmaAopKkY5RwEjYqA1zQCmVK+h3h3TUTNqXYG9iCxsoGnc3Za05wLtNg0I
 47sZV2y2kPK/PtrV46MMzFuj5cjaYlC97TWXNZ0v7w2thgFbtNZJ6KA3COCJ34GuQiu4eG+894d
 iornIPuHQcntS9Q==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Continuing the work of upstreaming the various msm8916 devices from the
backlog, this series introduces few 8916 and 8939 Lenovo/Wingtech
devices (where Wingtech is the ODM for these designs).

Included devices are:

- Lenovo A6000 (Wingtech WT86518)
- Lenovo A6010 (Wingtech WT86528)
- Lenovo Vibe K5 (Wingtech WT82918)
- Lenovo Vibe K5 (HD) (Wingtech WT82918hd)

Note that "HD" variant of K5 is based on msm8929 which is a lower bin
of msm8939 SoC. A simple dtsi is added for this soc along with the new
devices.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Adam Słaboń (1):
      arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices

Anton Bambura (1):
      arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010

Nikita Travkin (1):
      dt-bindings: arm: qcom: Add msm8916/39 based Lenovo devices

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |  89 ++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     | 160 +++++++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    | 216 ++++++++++++++++++
 .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
 arch/arm64/boot/dts/qcom/msm8929.dtsi              |   5 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  16 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 254 +++++++++++++++++++++
 .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  16 ++
 10 files changed, 787 insertions(+)
---
base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
change-id: 20240710-msm89xx-wingtech-init-e07095e2b2ec

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


