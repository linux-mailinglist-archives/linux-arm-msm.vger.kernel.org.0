Return-Path: <linux-arm-msm+bounces-56389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6CAA6227
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 19:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F6EF3A8812
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 17:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A6621B9C8;
	Thu,  1 May 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="FAomvwPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68920297D;
	Thu,  1 May 2025 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119566; cv=none; b=hbryQu5MD3lo+LSFPWQV385O9NiZAmjih4PkS29QJ/ObG3/nH9oPs0/TgFGkBfkrRvvhTBSPAtWNA+E/cPRgWCmccbxlc2m8yd4kfnUIkFvSTGYHh8GTGWn0WTNWwmgu08HkeDtdxs+Vot+lOedCWDDd2y62MCCKWlAJZ4Q4vP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119566; c=relaxed/simple;
	bh=ieE5qaTc9keiFt3Q+KpxfpARZITd2pBFeqqbYdAjccE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fxkHP2A07xh0XEH1UkgX2dEV7EPqS2JcwfX/S21COFy6i52/7uokxCcTJ8tpauxbet7mLXloJKvAiUGtw3A7DVfE/qy3D6uouIdXQBlVzAflfF5Y3tkw0r1aRRTJ4Nnq94NIB3NxWNVEFRHftLny6wXd2gk4K9TMJ3qm24mDhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=FAomvwPx; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746119045; bh=ieE5qaTc9keiFt3Q+KpxfpARZITd2pBFeqqbYdAjccE=;
	h=From:Subject:Date:To:Cc:From;
	b=FAomvwPx6jOcwQfzG2bbSpwVFNmIvMdEZ8Bdyy7eGG6O6p86tqBRkpkU+Zw33jXda
	 d55Q1tRw6jVXZCNNhc4rK/OZjIMIdp7B51wS/jbqEbEAKUWigSr0w0LQKFErXHV4mt
	 kBCKKcQeCDbm7zt9Gnbq9FYl3PrjTQWjs12lYOrDIwST/1WCSpPz21JWoFFWMSi3YG
	 5n9JgBaMZWHUr5zWJTGOsIhjtiAoYP46JNn+faOwHZZVRNV/uzH4sD2MFyjtfTCyIg
	 /Js0JmiN9P4d701/7PYw6nOJWuk/EnWy0cfsD0Z+oAifjkLYp/qVBLVYADScLJoZ9O
	 CTav4BC8szlJA==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id BB9681E36;
	Thu,  1 May 2025 22:04:04 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 0/5] arm64: dts: qcom: Add EL2 overlays for WoA devices
Date: Thu, 01 May 2025 22:03:40 +0500
Message-Id: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGypE2gC/x3MSwqAMAwA0auUrA20kVL0KuLCT6oBUWlAlOLdL
 S7fYiaDchJWaE2GxJeoHHuBqwxM67AvjDIXA1ny1luHOiFvhMfFaRsexZGaUJOPdaAGSnUmjnL
 /x65/3w9rfLc5YQAAAA==
X-Change-ID: 20250501-sc-el2-overlays-b297325f3729
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marc Zyngier <maz@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2755; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=ieE5qaTc9keiFt3Q+KpxfpARZITd2pBFeqqbYdAjccE=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoE6mARyVw0wPR3BN5m4JSHf+gtq08Cgj3V++6m
 WCKSQ9/svSJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBOpgAAKCRBDHOzuKBm/
 dc8bD/9dX1nbcPwKqnvsZymGfVU+zaIQKZcKNRF+l1v9UVGVS98YMSlWnIKgCvPGpFhnBAwCd1A
 gTucteL2UClV8HHLgRl5BSO1LuURaZMd9i2cEf7JqAeXBCiWedyGOhgRoPvAqf+DSVFOMchTYDB
 q5TZdiJBL9jjg7tj4QHe2tQmRlISdRydugvq+0+V4ldRYRW6l6gN4SoOLmloRsS5nZ9aAkHEZgl
 t1TjnvbiVhp3fmhYT5w0KE/gn92JpsE5UNk7hmKqOV+oKb162as3Mzv+KTEt6TUCfq8gGrc6Owg
 KWRnLkwf0s+54mDvWgeIN2rs6sfY1fHd1GT9aTvgQG+LwDKHELeBuZqgSRuDNFFkcQN9ZjuAzfU
 TvWFNkJU9Qej0tLIZDFM7ux5bt+0Iu3v7xzHlHDA4B+0amWd2xlwRf/X9CLxg4+EtKPV1UEj+tS
 tBUIkgy5O1970SYk4Z4eQ/s0Y4fsiR8BiEN43iQuNfdgcPXuuyn+LTQzD1HAVQiQYucCSJqC18Q
 fCQ2bLcIMBD4KhQ7KowOSHLqHW6qdkeZRo33XcRbmfQAWJpgrkPiKDz8Nz/9LaFOqDQ+K7ui1LS
 +gH0KzFbtyexxP8hRMark6Fbfea3Op0cCv9fcqHp8bhPd/aXv7zVzhkLHyhmqt0SxebIteJMlSP
 0UW/mJBTW70SYrQ==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

WoA devices use firmware very similar to android, which means that Linux
has to run in EL1 due to the presence of Qualcomm's hypervisor (QHEE or
Gunyah). However Windows can replace that hypervisor using Secure-Launch
flow.

More recently the same approach became possible to be used to boot Linux
in EL2 on those devices, thanks to a tool called slbounce[1].

As of now, booting in EL2 comes with some downsides, most notably that
DSP remoteprocs (importantly, ADSP) can't be booted as Linux relied on
hyp's service to authenticate and launch the firmware. The lack of ADSP
results in missing battery/charging and type-c services (alongside with
missing sound of course). On the other hand it becomes more clear that
running under QHEE/Gunyah /also/ has downsides apart from lacking
virtualization support. For example, x1e devices can't use more than
32GiB of ram when running under Gunyah.

As booting in EL2 depreves us of QHEE/Gunyah services, some changes to
the DT are needed to boot in EL2 correctly:

- GPU ZAP shader must be disabled. Linux will zap the gpu itself;
- If PCIe is present, SMMUv3 must be enabled and controlled properly;
- On x1 devices, hyp-emulated watchdog must be disabled.

To make it easier to run WoA devices in EL2, this series introduces
per-SoC EL2 overlays and -el2.dtb variants of WoA device DTBs. Ready
presence of -el2.dtb-s will allow people to more easily use those
devices in EL2, especially as some recent work on fixing ADSP-related
limitations (at least on x1e) is already being done and can benefit EL2
case as well. [2]

[1] https://github.com/TravMurav/slbounce
[2] https://git.codelinaro.org/stephan.gerhold/linux/-/commit/7c2a82017d32a4a0007443680fd0847e7c92d5bb

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Nikita Travkin (5):
      arm64: dts: qcom: sc7180: Add EL2 overlay for WoA devices
      arm64: dts: qcom: sc8280xp: Add PCIe IOMMU
      arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices
      arm64: dts: qcom: x1e80100: Add PCIe IOMMU
      arm64: dts: qcom: x1e/x1p: Add EL2 overlay for WoA devices

 arch/arm64/boot/dts/qcom/Makefile          | 54 ++++++++++++++++++++----------
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso   | 22 ++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso | 44 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi     | 14 ++++++++
 arch/arm64/boot/dts/qcom/x1-el2.dtso       | 46 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi     | 16 ++++++++-
 6 files changed, 177 insertions(+), 19 deletions(-)
---
base-commit: 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
change-id: 20250501-sc-el2-overlays-b297325f3729

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


