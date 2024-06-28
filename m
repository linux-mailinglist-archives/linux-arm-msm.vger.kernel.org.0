Return-Path: <linux-arm-msm+bounces-24621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CEC91BD6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 13:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DE0283BE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36A6156C49;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIvtcWUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FEC156972;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574223; cv=none; b=DHKdogVG8NvgecBE91OfDsgsbIIWmMI13nemWbSMRAgewx6kaI5CLBX16mFhBYGlExGekYFvgoj1NNC7msOnLrh3D0lcc25NrV3uMWBa8Bzqw9nHXDiOMScfMn6Z8Kfifmm3Gu8TZtNhEKFx/0HdwpA2v620q0+90X1vXAXVndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574223; c=relaxed/simple;
	bh=SnoK7XdshzEQwvq+kBt0n1g2IoUbW1LSA0WpSE8grF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hf9lgpUrK0aztza0ltHaITdsqKYx11Eg81H3mAbaiFhRGSHIl61PTb1RNJSXpXCYNz2RwdIzThRx0eFZ8ZFK60AylAR+1dPfYxDSK0kGnUcUslJGPnVG8jft5XVeEuUDhuxP8F8J2JLUCFM6n2GESE3JzPYCs9U0IE93S9bfBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIvtcWUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F81CC116B1;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719574223;
	bh=SnoK7XdshzEQwvq+kBt0n1g2IoUbW1LSA0WpSE8grF8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XIvtcWUmHsuaOknxdb+cHwWInshmrTO4AUMiol/Sbgz5CkvJ6W2kLR5LzPfT8xZJ/
	 8Ax56BbHxtQ1C+O2pOsgqjG87gN4L9mucKlpJiYRgjqtroMSiiwVJRMsWpUtcnadnm
	 8aLY14dcWbRkncsDvkZ39P3iDouun7JRcRUhDTCpb/P3IgmdiDS1Ea0EULmGxFU5rM
	 H7Rr4OtmR2qamZ3K+pLMu/mnyVlaMJ+PUu54COI7fnHeCXn717zOGqvhvpsCOR0h72
	 fo6li7JK7QODEaFGw1rTYe/8DuttXTvsF6+HxydAjVZ9mvfEaZ5JQi430r9c4Xnw1Q
	 pXxunRXcknKMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04423C2BBCA;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Subject: [PATCH 0/2] Introduce ASUS Vivobook S 15
Date: Fri, 28 Jun 2024 19:30:11 +0800
Message-Id: <20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOefmYC/x3MQQ5AMBBA0avIrE2iRZWriEUxmEhUOtFIxN01l
 m/x/wNCgUmgyx4IFFnYHwkqz2Da3LES8pwMutBVYbRFJ5dg5OhH73cUVWOjXdU21pTKWEjdGWj
 h+3/2w/t+vmqEiWMAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719574221; l=1810;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=SnoK7XdshzEQwvq+kBt0n1g2IoUbW1LSA0WpSE8grF8=;
 b=TTxkSJn9k9bv9UPn73ineqV4So/coDMuxKSmdV0vQQPcrEVXym9fSKlzUrOGby9hlRXIZ6xnN
 lXLDDNUmRQgAItMxIXoskxaAgKbJt6JsuV3Uvbsuah8E/u+PEk3XRR2
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
Xilin Wu (2):
      dt-bindings: arm: qcom: Add ASUS Vivobook S 15
      arm64: dts: qcom: Add device tree for ASUS Vivobook S 15

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  | 515 ++++++++---------
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 613 +++++++++++++++++++++
 3 files changed, 872 insertions(+), 257 deletions(-)
---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240628-asus-vivobook-s15-72a497863168

Best regards,
-- 
Xilin Wu <wuxilin123@gmail.com>



