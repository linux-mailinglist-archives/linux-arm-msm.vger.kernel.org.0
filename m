Return-Path: <linux-arm-msm+bounces-24738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B67191D0B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 10:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E219CB2115A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 08:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410B612CDBA;
	Sun, 30 Jun 2024 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9k9rd3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F80512CD96;
	Sun, 30 Jun 2024 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719737969; cv=none; b=TzqrbEEhzXuoYHC5s6oFuM/0AY27OtJPdPxPnWzi/j81bDMDohyiuH3ftUmTUpKBarE63E6/kFd3+9l2X3R0gjmiU49ZHiFLQGoWvcnPfVS+xFOFBRUCc/m3OaqiuditT8x5/snDwd5Oh2oUo126OT2gEs7ICOcrGSfUCKlw1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719737969; c=relaxed/simple;
	bh=ubd/LNdUMtaC79ActlqFB4RXyv5gk0dFugNatKOZ0lc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ViSrkGLtK/4OR/oxH3pNPg2DnjHS29EruAC1xL/uTyXzn2BH0/2cqR0WMdBOTGG89xWUz+VPmqdM6/eWCV45Fmq18XgbY/yxltW4se6Bf9GE2UCe+NGb5O2n5xCZGU5nNHMAQjGICzGdK7pM+O5pPlJZ8cYV1DuHLsHuf/XJlrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9k9rd3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C963C2BD10;
	Sun, 30 Jun 2024 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719737968;
	bh=ubd/LNdUMtaC79ActlqFB4RXyv5gk0dFugNatKOZ0lc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=V9k9rd3aMNBdiv2CeX+FLhPGMWRsQA26cAO9/Um4eSB+PDrMQFfeAHgAfu8RMjVuw
	 akIb2r2rwBEkQR+x7K3zgzQMNs5laNrZ1hE2Vlsc5vwbWXKTj9PY/TowHvm+0MBpCV
	 dZlWMeFNZRp4Yr4FJNP9C0FVS1C9aUXA9lZ2lznOTz/mtO/9jsdY9Dd5ZG5QAwhCyi
	 3iqPwVI6j9XqFOa7hrGcOosm9lrQun/H5fUe44011qT0SApGE7RR9lPNV6R8VdNrG3
	 Ztrnzt/migNBD7g2ruySS9QXshJI+R5/FM2rSVySJjfiGERNp1ArMCuLQqEeQ4BIwv
	 MezATS5umDBlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C275C30653;
	Sun, 30 Jun 2024 08:59:28 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] Introduce ASUS Vivobook S 15
Date: Sun, 30 Jun 2024 16:59:25 +0800
Message-Id: <20240630-asus-vivobook-s15-v3-0-bce7ca4d9683@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0egWYC/4WNwQ6CMBAFf4X07BraQimc/A/DocUCG4WarjYaw
 r9bOHnS47xk5i2MXEBHrMkWFlxEQj8nkIeMdaOZBwd4ScxELopcCQ2GngQRo7feX4F4CZUwRV1
 pJbnSLHn34Hp87c1zm3hEevjw3i8i39ZftcghB2G4K8qKW23saZgM3o6dn7b4P7MWnZV1L3uu1
 JfZruv6AXym0OXsAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719737967; l=2142;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=ubd/LNdUMtaC79ActlqFB4RXyv5gk0dFugNatKOZ0lc=;
 b=mjXYYhBhAvSnFdkC/xu3h2iXAxUt1jkkdnCu202fD7SdH7Ozr+FvOh+mE48htsyrq2cWVIW30
 sc93YHtLs9CAVEOtrxx3mkcit7d+/iAI6CKXa9fFnOU6OoYlMxwPQkI
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
Changes in v3:
- Add comment detailing pmic-glink connector mapping (Konrad)
- Minor changes in dts (Konrad)
- Link to v2: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com

Changes in v2:
- Fix accidentally changed Makefile
- Link to v1: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com

---
Xilin Wu (2):
      dt-bindings: arm: qcom: Add ASUS Vivobook S 15
      arm64: dts: qcom: Add device tree for ASUS Vivobook S 15

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 616 +++++++++++++++++++++
 3 files changed, 618 insertions(+)
---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240628-asus-vivobook-s15-72a497863168

Best regards,
-- 
Xilin Wu <wuxilin123@gmail.com>



