Return-Path: <linux-arm-msm+bounces-56641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB4AA8021
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 12:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB62986B20
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 10:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600AB1EB1A7;
	Sat,  3 May 2025 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="RNTJqW47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FC313DDBD;
	Sat,  3 May 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268809; cv=none; b=WMr1QN4l+qjIlyEbQs+lg704dQA+6WKvtxRIUHI6kkrHDiVN/Q90llnguJtGOF04Z4D72LdaDPVfX49wCcTEWXyEyxPdhSjpqNl07IbJpZfRFMY458ZkqCoX3tLExwyo9HD366rEIBgUcgZZbEB0iPQ3Iwm8E4Z3P1u17fC8xl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268809; c=relaxed/simple;
	bh=JF9C8669bXvGqxxXsoXqXj2kAjyt2vpY2eUVHwdV5e0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DsHOWZBMU+RW6r3HLsahlqyBOl8rvkjxb0gLt43dVszkBwkRuJDMVJDYYPAYJWK1dT1SGkKK+4a3G//f3VvsP9m5lEI+CdWIN2/lf4qGNuz+lRMwvNMEYKmNidnidgECtpy0nx/bRiDPRofoB6HaVK+c5/xd7/7ZAfvdZUW5mQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=RNTJqW47; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746268797; bh=JF9C8669bXvGqxxXsoXqXj2kAjyt2vpY2eUVHwdV5e0=;
	h=From:Subject:Date:To:Cc:From;
	b=RNTJqW479YwwsROOUefewIzrGFdF3QOsR2VOf5ZIx7rwyrkxFSCL//4dAwl9yAt+u
	 M8ktmly3kZbW+Njx+79xdWHLtSdwAydKdrhTNfFS7vU6ox22aYF0Rq782SGug21mMJ
	 Fwou/eHfPCOKq4ROPpodg67/vvLVGRs1hT9fwKX1huJAmHHSWfvnIXbot1QnvZWXhY
	 LRLMPk6LhWYzWqvsRqHvUun8/Eb+LadokSJ8zzgqm/LFJn9LgKnyECVJrthQHvXeE7
	 Le2aqzG/RMsSpz+GSVRn4Vl45ZnJX9P/DuGJwBTV4glIe3IYyMRMIVr73LMpKR1o+o
	 pc5leYpZH0JWg==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 6538C5AA2;
	Sat,  3 May 2025 15:39:56 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Add EL2 overlays for WoA devices
Date: Sat, 03 May 2025 15:39:27 +0500
Message-Id: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/yFWgC/3WNwQrCMBBEf6Xs2ZVkY6jx5H9ID7VubaAksqnBU
 vLvxt49vhnmzQaJxXOCS7OBcPbJx1CBDg0MUx+ejP5RGUiRVVZpTAPyTBgzy9yvCe/kWkN2NC0
 5qKuX8Og/u/HWVZ58WqKs+0HWv/S/K2tU6GrN1rExp/N1kRyO8oaulPIFF3Ph26wAAAA=
X-Change-ID: 20250501-sc-el2-overlays-b297325f3729
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marc Zyngier <maz@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2941; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=JF9C8669bXvGqxxXsoXqXj2kAjyt2vpY2eUVHwdV5e0=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoFfJ4xb7E15nA93V9NNDkWM79pD1uh6lExCVFp
 S4x0GaPuSmJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBXyeAAKCRBDHOzuKBm/
 dRmTD/45S8PAM+vw7xG4/yOjHI2Z65nR+iMBTYC3U3YGzmTOhtZqwPv6Tm6gpWtQkO/dAcKY0Dj
 G+2Z2dRKAVHjJ/3GIMC8WZLt95VbeV65wAIqXzKUl/Ym3DVB0Wq2ICB6Ha34zAFdzLN3P03akTm
 iO1oTFnpfP7v0XD2mO4QPKpSdHEhOiPYTogkGmJ/C5WkgUfNRxnyQurH8dpKScRa1lS5WbwY/zu
 SEske5L2fGi1mWvtNfCMnEb4hUKsz/YxQSjMFZQvhkTNeGOQ3XZe5y7HPhC1SnURKzHUWK5bSya
 pwVjRfg8W6AtF2Vzo7OBJss2nm4elMXaVISJ2W6Mvr0wpUSP2LDpBUh6G0SayXBQ8KcjZX6sxyO
 AL4yQ0lHCP0uI0Njh6yDGyuwmHcVqb9TsclmNIuYt7Wf6Z7lHz5HFKrhiG7/N57c9VZ/pOROmLm
 m3iD526FEkyrDD/p3zTGZhO5fLpIw2gXbb7EDxD90bdmO5yzbw4H5ybdKpjgvVB7r2V3hCaKxsV
 rk1ugOxJ0XA/7Xc7yls5anCYrdAVxMV2pie35n7FFY+Y6ze6k+p9Um3bikvDs8bwpJcsGvrVQ+g
 UlFsg6/9AJ0jFEA+BYBXqpKkPGOW+sty++wwADUGiQzcGl6dKh35+NGKknX1fhz9vfzIUkrNwFK
 DLQ9FBIR1A6v3GA==
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
Changes in v2:
- Describe pcie its-map which can only be used in el2 on x1 (Marc)
- Link to v1: https://lore.kernel.org/r/20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru

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
 arch/arm64/boot/dts/qcom/x1-el2.dtso       | 52 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi     | 16 ++++++++-
 6 files changed, 183 insertions(+), 19 deletions(-)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250501-sc-el2-overlays-b297325f3729

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


