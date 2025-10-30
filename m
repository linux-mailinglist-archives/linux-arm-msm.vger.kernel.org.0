Return-Path: <linux-arm-msm+bounces-79586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C149DC1EBAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5053B9AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70319336EC6;
	Thu, 30 Oct 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrhmKFbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5543358AC;
	Thu, 30 Oct 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761809075; cv=none; b=A1lEaLJDp8P04XIi5ECSR7u/+/+ms9TpbopFpIhkGhdXsInTFzuOPpBVSwl8qZ1yLDdrxS3t1ku7v7aXekTm2lSNMEGcVTsMecC8AzT5Ldsg2HUVRrlu9pobgptbITt6tDigA7BB/vOr5DbzGurPBpKv5YZGNkcKF26HtEt4rVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761809075; c=relaxed/simple;
	bh=0GI+RXqQiTErAdEzgskdBRk3bXKy3i+/0wcYrcqI0lA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FWorCE3Ok39+SIyUd7x8wJl5YuvjT3e6OsDmqaZz1VNvrhNSLN7cO7Ntibf6QD3m/cC9tWTpif+TcjtAv8E7m6W3Qgq8PSt4Dp9EUH5mzGCPdQ9cTIdA5aYaQ8KH6Z1PzP+0EFc02RByLA9h+M8njQH+eo4ouKCfpHKw+O6pQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrhmKFbe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC7E8C4CEF1;
	Thu, 30 Oct 2025 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761809074;
	bh=0GI+RXqQiTErAdEzgskdBRk3bXKy3i+/0wcYrcqI0lA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OrhmKFbeOoLilaehmFfrM3Ju6jIYwRSb3Dbjt5NtCW6aM/uA597FVahtxMpW1sLnM
	 3kS9IAgjr0rp5SYymGxcYiFOQo/OcdfO5G8W52Dme94WfJtm5ghI3sA9sdFhdYycqK
	 rSwdhAGbOyFDr6WdBhQAHM4Wjnn4KCp/FhLFv4wgr1t9hmTEJfVFytn/6D1EgK4RPA
	 DB8VbHeNIrCtaHzyHufml40/oYGe7gN9CAAhM5sku38DwKeWgoVE0maiD7APD6xgNm
	 +4S9AQ0wubyF0qArrfMfGCZz0JPRwLBfU3xBLSzQQFFjw/9ZyvFiN1rLVQlKXu5t9t
	 Amcn17EBEEm3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A5FCCF9F8;
	Thu, 30 Oct 2025 07:24:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] Add support for Pixel 3 and Pixel 3 XL
Date: Thu, 30 Oct 2025 08:24:28 +0100
Message-Id: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK0SA2kC/0XOSW7DMAwF0KsYWpeFZste9R5FFrJE1gKa2JVUI
 wNy9ygO0C4/STz+GyuYExY2djeWcUslLacW5FvHwuxPXwgptswkl4ZrMcCazvgNCowQGIP02vK
 etes1I7XVU/o8tDynUpd82eFNPKe7ITg3f8YmgIOf3OQMWaEUfaRzqu/hyg73F5nx57d1qi/3v
 1JruGPSQaxw9SuU2UfMEKkP0jiyRGFsfxsz+YIQluMx1bGjPkrlHCIGqQdrKehoAikZe26JG6F
 JDj6Y1uD+AKU6euUdAQAA
X-Change-ID: 20250419-pixel-3-511edc2a4607
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3373; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0GI+RXqQiTErAdEzgskdBRk3bXKy3i+/0wcYrcqI0lA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpAxKx/aC3TjOUiHTJgeiWXSedWFuEw7byLOkB2
 +J9v2wuZB6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQMSsQAKCRBgAj/E00kg
 cp6uEADRJjf+khkFIOe95a6MLunuI93bagSMw3bt11Lq+Fm7s9cPWCgS1yyOfQ1b3j7fhSBLacf
 AXNtcOTNgDlceEyknFduBQiYLqJNWLKysJqNYX9UDQtyAHG8r1LWsbE98SyaUhKoMswiBf/7JKO
 qrXnELhDJkcInz33OLXaYKxSuSR9RGmwcvyWM0yktbXnd6EhAr5IDMldP2IsIEhkjWBUqo6Nvdo
 twXWtfGgxIyg6mlvHJgFF4LmyzZvqKAtj8KncycaL/dQRe2bLeZcwjyjlQHIboW5JkPVnxApTdk
 ISLfpxbnJFz0v18lpnq/ItaYS8N+VGUMIdV+vpzQ1HsdpBvoot/iTgohDDtQeB9//Mm2kIFjX96
 Z3Nm5+SRZkJiGidiL0KvPHjSa2Ez5brQR47RsyyE31jkmdkP5SfZYnGClsDEIbSrZoPYVXnEHzZ
 8fGl9Ro6OYQVXGwDO/Fvxz1JceEqhkxBwn633saMq1PWoRgGY2xwDgKLqkC+8YBdm8W1lmTbQuN
 PrS215m97EQf1pTAHvgVQ8snY9W3DthLuZnogzRF/ocDIv95u4qukUiRzXSLEUAU6lY9Qeh486v
 K1r6bZP6yaC2PeU6/pHxQlFJCcJVfqv6h/032XIsbybgq5rNgbsTwM3uW1dy/fkPE4egk1pU/2f
 /wx8MqynRgKbAOg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This adds initial device tree support for the following phones:

 - Google Pixel 3 (blueline)
 - Google Pixel 3 XL (crosshatch)

Both phone boards use the same identifiers and differ only slightly
in their connected peripherals.

This is mainly focused to get the base functionality of the board and
being able to use the upstream DTS within Linux and u-boot.

Booting
-------
For older Pixel 3 bootloaders, bootloader-compatible board and MSM IDs are
required for the kernel to boot, so these have been added.

For recent Pixel 3 bootloaders,
a) you want chainloaded proper bootloader (f.e. u-boot),
b) you can also boot kernel when adding back TEXT_OFFSET
   (partial revert of 120dc60d).

This series is a beggining of cleaning up and transitioning support from
sdm845 close to mainline tree to the mainline.

Note: I assume this won't get merged yet, but all or at least most of
initial feedback to v1 should be incorporated.

Depends on:
- "[PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node" series.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- rebased on next-20251030
- generalize chosen to -common (Dmitry)
- demystify rmtfs_mem qcom,vmid
- use qcom,use-guard-pages instead of lower/upper guard block
- merge port@1 endpoint into label mdss_dsi0_out
- sort pinctrl
- sorted the nodes inside root
- put status as a last property into mdss_dsi0 block
- rename volume-keys to gpio-keys   
- removed LS-UART1 label
- removed gmu block, already enabled
- removed accidentally introduced WIP crosshatch panel support
- removed useless panel_pmgpio_pins (Dmitry)
- removed usb_2 as it's unused on production units (only devkit)
- move mdss node into the -common and disable in crosshatch (Dmitry)
- move battery node into the -commonm
- move framebuffer into the -common (Dmitry)
- add all firmwares (Dmitry)
- add Wi-Fi support
- add Bluetooth support
- add missing gpi_dma1 node
- renamed regulators to follow regulator-foo-bar BCP (Dmitry)
- adapt to recent cleanup GPU's zap-shader node
- Link to v1: https://lore.kernel.org/r/20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz

---
David Heidelberg (2):
      Documentation: dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  94 ++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 522 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  39 ++
 5 files changed, 659 insertions(+)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20250419-pixel-3-511edc2a4607
prerequisite-change-id: 20251028-dt-zap-shader-df7c258f6ffc:v1
prerequisite-patch-id: 0f0f709c9a638ec48be64bf357975cf75bc144ad
prerequisite-patch-id: 495544e8cb329eff420e1134292446ed7ccd018f
prerequisite-patch-id: 55c07e275cc46d1dc5a279fd0e3a789f67eec02d
prerequisite-patch-id: 707a86a8dd82384f31847a6790d988b7896140bc
prerequisite-patch-id: d8852b1c3dd3e8a16d391824c41b71bcb8a30c3a
prerequisite-patch-id: 06dd1f88f5f076795a2e602582c0c9026aba01ba
prerequisite-patch-id: 8b13202f3d3fef85bbe6d63b81d15c08c54b584f

Best regards,
-- 
David Heidelberg <david@ixit.cz>



