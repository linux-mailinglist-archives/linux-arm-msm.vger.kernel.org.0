Return-Path: <linux-arm-msm+bounces-39936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEC9E0ACE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 19:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D97D1281F7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 18:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B4E1DDC24;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFGSH9jX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4F1DD0F6;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733163503; cv=none; b=eKtZJHnvdlp0d0suLoLFPlcRLmy/kwsOZaaJk4XJUuA/VJdB1fFaIeWw3Px6PlT9nO12mk4tLVlxcJBsIDuhW+70vYhN7kNz2YyhMKxFJQ/mugdGb5c71hwPmy0TJyHEiG2EpPlDM7TDA9b2OYhACEpvFP6incQxLUMTyru4kK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733163503; c=relaxed/simple;
	bh=tcxvbR1FAr5OU+Ae2DnYPGRw2+BZE+xh7hbNlNtOolE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vFHhpOLeMST8bwlaFa9xInQh4c15Acid3tj/SqAo7tuYDtNAcCb/42VLPigjDHz84zuejdIojQ5BZqqjm+rwga/bZv1Eo8YED3Jb+Jqxc1g5vGIRaGvYjaS8wpFv0i7z5CnGG6RyM4vh8uou4WFodzjs/qC31zq+ifF+D2SaN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFGSH9jX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42FDBC4CED1;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733163503;
	bh=tcxvbR1FAr5OU+Ae2DnYPGRw2+BZE+xh7hbNlNtOolE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LFGSH9jXOMABRKfPLbPUYaYC4oiLOZIXkNU0ltX96PVvgNB3cRx8Q8vBJSUfeMaK0
	 u2bvi5v7b+W4pxjxSYvgIOEQI1s/+xo8UZ0fx46FklNHH4FGUGvwxC9rHppaXa+7c4
	 tF+LVvc7sLJK3jY8lwOyfk+NjljIFQeWBc7FErnr56NIeQ+O9InMk7Y42DBthPnBQv
	 JAXQtxxAyLmR4XEgE2+XyNMpkwR0V59t4p13lMfscZB3y7sgzWS7Pf0p/qSulm9Izi
	 yLYu1mxU/2LwyL/Zg0LXhEAqxatt+KljQrZAB3Yi6bH4QkMvuE1Jcj4IwIP1KGs5JX
	 o8NRaEutEW1Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E27E69E83;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v5 0/3] Asus vivobook s15 improvements
Date: Mon, 02 Dec 2024 19:18:10 +0100
Message-Id: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOL5TWcC/4XPTQ6CMBAF4KuYrq1ppz+IK+9hjBmglSYgSpVIC
 Hd3IC40krh8kzffZAYWXRtcZLvVwFrXhRiaCwWzXrG8xMvZ8VBQZiBASyktx/iIp1ve1KcixGu
 FPc+d8T6BVCktGO1dW+fDczYPR8pliPem7ecTnZymbw3UgtZJLvjWYOp9Clog7svmXmOoNtRik
 9fBXwPIQJF5vzWJpd6voT4NvWQoMoSALAGVyRTEr6E/DbNkaDKsRF2gtPSM/TbGcXwBHe90c4A
 BAAA=
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733163500; l=2074;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=tcxvbR1FAr5OU+Ae2DnYPGRw2+BZE+xh7hbNlNtOolE=;
 b=ohRxTArBAYUdhoIgMRFpdrg9/yJh+2+tZgfkLMpmkp9Pv4KW0YofZetk3vbXtVqUnw38Y+db9
 VO1cd4syZT1DzriVb3xnKZOdzXfOC0tpAm1iuz/lZqkysi4PxgR0h+U
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

Improves several parts of the devicetree:
1. The eDP panel bindings
2. Add a lid switch
3. Add bluetooth and describe wlan (depends on [1])

[1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

---
I seem to get a warning that the pci17cb vendor is undocumented (wlan)
I can find this compatible in
Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
But pci17cb doesn't really seem like a vendor name to me, I have ignored
this warning for now.

Changes in v5:
- Fix the pinctrl-# definition in the wcn7850-pmu node in the
  bluetooth/wifi patch
- Link to v4: https://lore.kernel.org/r/20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com

Changes in v4:
- Fixed the pin parameters for the backlight enable pin
- Fixed the wcn_sw_en drive-strength, this was not in the acpi table I
  checked.
- Fixed the ordering of several nodes in the bluetooth/wifi patch
- Link to v3: https://lore.kernel.org/r/20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com

Changes in v3:
- Fixed commit message formatting (line wrapping)
- Fixed bad indentation (lid switch pinctrl)
- Fixed bluetooth addition and added wifi description
- Link to v2: https://lore.kernel.org/r/20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com

Changes in v2:
- Add missing gpiokeys include in the lid switch patch
- Add depends on for the bluetooth patch
- Link to v1: https://lore.kernel.org/r/20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com

---
Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 202 ++++++++++++++++++++-
 1 file changed, 201 insertions(+), 1 deletion(-)
---
base-commit: 5f48de798324665d18f539ee09a61de1a9221f33
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



