Return-Path: <linux-arm-msm+bounces-24625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FD91BDCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 13:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A033C2859A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD67158215;
	Fri, 28 Jun 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoJmuPSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8DA155A58;
	Fri, 28 Jun 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575384; cv=none; b=lXiMV9EBd2X1GeJ8ODNgegJHDeEmc1m1PqJqpYegTycGaC+tcZMyYgyKEDE+52DcxxRBXuuzS7kxpBXV+jz1StpAWc4B0iCtD7cs1od4Jvk0Adh/nahHnpkZ/1u4fX4ziwVb1Ghpi9E1B+qXv0FdkImB3SU8WooDAiR3Oh7r6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575384; c=relaxed/simple;
	bh=0I+r8Bzyzaqu9bFb0Ty+lOwGyBNGIZfkjaSm1li3Tqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nkhWOvuq78+AewQJ6SUKi6AEy2mB9Or2xvyApkNULN2TNGxRNnRwxqoqi0nNgfyWeBADlLiW8yb8mDAw4F5Wzv2zSmeHYqr0UfD8gUcKMKif9//NkwcspjZhb7aLtHoxQDf/R9YqoJ5g5bbDj5P8ytpdlqLWaQcAE43RAB3YPEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uoJmuPSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0CACC116B1;
	Fri, 28 Jun 2024 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719575383;
	bh=0I+r8Bzyzaqu9bFb0Ty+lOwGyBNGIZfkjaSm1li3Tqw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uoJmuPSm/SEplLF3/31rtJPsP4MypgYbnXSzRyyJArYeWNB8H5VIix7p2ryscI/Oa
	 xSBjrsuaqR15jzxikpn3B5vNoEOwf70aG3IzomWdDuuFAFV4XXLjjRtSUO1fafERBq
	 J2wfhZRrhgWL53yamu1lQLYbCrjmuWkqb4SaAd4b57gVOOBGvq2cIlt9+5hoS2uWOZ
	 8kfpBb627xReI3tpiMOGvhYTN1lPXOtQmsy2vllA9t8gNXLD4HKYuVs3rCx4RLqOGH
	 z7nzCD/UdirfqNIEuXXExLdyBvnPGhQpEzjrgDaYOUMAugQtvBu/PFwQhTlhG+Kh/A
	 EAaAs3B+Ov0Kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B09C2BD09;
	Fri, 28 Jun 2024 11:49:43 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Subject: [PATCH RESEND 0/2] Introduce ASUS Vivobook S 15
Date: Fri, 28 Jun 2024 19:49:33 +0800
Message-Id: <20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE2jfmYC/32NOw7CMBBErxJtzaKsycdQUZCWAkqUwgkmWUFi5
 AULFOXuWDkA5ZvRvJlArGcrsEsm8DawsBsj0CqBtjdjZ5GvkUGlKksLpdHIWzBwcI1zdxTKsVQ
 m25a62FChIe6e3t74szgvcKrO1fEAdcx7lpfz3+Uq0NL+sQbCFJUhm+UlNdo0+24w/Fi3boB6n
 ucfFpZhJboAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719575382; l=2004;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=0I+r8Bzyzaqu9bFb0Ty+lOwGyBNGIZfkjaSm1li3Tqw=;
 b=dMP0dS6tpEfExHXKCM/hZ1/UTrzeOPPfyohGLUbAmAqKk71rHky9+KiO1IJlmHmD7oLBvWemF
 igusOgcO45XAcjtCaktvIC0gDoiW39l5ZF+R5oJYw1V0p0v6ZqGFdMb
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
Reply-To: wuxilin123@gmail.com

ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
SoC (X1E78100). This series adds initial support for the device.

Currently working features:

- CPU frequency scaling up to 3.4GHz
- NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2)
- Keyboard and touchpad
- WCN7850 Wi-Fi
- Two Type-C ports on the left side
- internal eDP display
- ADSP and CDSP remoteprocs

Some features which can get working with out of tree patches:

- GPU [1]
- Bluetooth [2]

Notably not working features:

- Battery monitoring via battmgr
- Orientation switching and altmode on the Type-C ports (USB4 retimer driver needed?)
- Two USB Type-A ports on the right side (dwc3 multiport controller)
- Front camera
- SD card slot
- HDMI connector (using a Parade PS186 DP 1.4 to HDMI 2.0 converter) 
- USB4 and the retimer (Parade PS8830?)
- Anything using the EC

Dump of the ACPI tables could be found here: [3]

[1] https://lore.kernel.org/all/20240623110753.141400-1-quic_akhilpo@quicinc.com/
[2] https://git.codelinaro.org/abel.vesa/linux/-/commits/topic/b4/x1e80100-bt
[3] https://github.com/aarch64-laptops/build/pull/103

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com

---
Xilin Wu (2):
      dt-bindings: arm: qcom: Add ASUS Vivobook S 15
      arm64: dts: qcom: Add device tree for ASUS Vivobook S 15

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 613 +++++++++++++++++++++
 3 files changed, 615 insertions(+)
---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240628-asus-vivobook-s15-72a497863168

Best regards,
-- 
Xilin Wu <wuxilin123@gmail.com>



