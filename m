Return-Path: <linux-arm-msm+bounces-75977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DFEBB9722
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Oct 2025 15:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1083C189AABA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 13:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FA8283686;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbblAf6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21D2BCF5;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759670193; cv=none; b=pMph5PRJHmC+YtJkYu6me8QBuZ/UybiKpz5+LOECPsD40CTaxDJiYxOgru+u5rUkZVwRvR/ACTMs4omUWnFopJUA74tlAEspmDX1gW3C3v0T+vOZ0ilkAL2/Ox2WcPCPuZQl2NWFsjFMHdOgGDApjsSV8s3i/+/9XVIBf+KytYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759670193; c=relaxed/simple;
	bh=4jB+u25ZMhXJQ2J8eJP4a57jtjByDue+5wvNNt8Pq/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e1pswnaONeNsTOfSLFqBvZ70suSNGbRtKJN/ka6G5DN/Wj/I8e84WQQKO/eSi2qwkdFuleCQU8/g3gPMdFVru4LrjGCBGQkphJp2rvOvu2BJpQeaZEbYd6eN/UUKSlIU+xdNf2ZnDzoMYpJAhtOKc4DufVyf6AoyziAXjuWuHgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbblAf6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25E49C4CEF4;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759670193;
	bh=4jB+u25ZMhXJQ2J8eJP4a57jtjByDue+5wvNNt8Pq/o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tbblAf6IHOvYoprbLeaRqyNkqPSzpVLCvPFgWzYilEE2LpymCXB/QO5pP6I4C8Wp1
	 nAM79UZqFy+xByLcV6/wl4yQyKLYjg54ZcWrSSO2uJn2Ym3TkspNdRIW6HRBaU593J
	 ZLquFVKrcfVrmlHOoS8JH/cx9p1qRUKhZlaelHrLmD354z7+F5GzSLtvXbqfRw1rq3
	 u3qjM4lXnDjkmtXrMc8yNqJi5ClToqSXkeuqJtkWgLfkR39KSp2fVKpotALlLzr7H1
	 3DlVIHVw8g/IZQlq0pRyAQr0LhXBGfm+KBlTcqDfsa73qvvCFVRcMG8PvnjBPNkU6K
	 65z8No6302wug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A597CCA470;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Add support for Pixel 3 and Pixel 3 XL
Date: Sun, 05 Oct 2025 15:16:27 +0200
Message-Id: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKxv4mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NL3YLMitQcXWNdU0PD1JRko0QTMwNzJaDqgqLUNKAUyKTo2NpaAP5
 i8odZAAAA
X-Change-ID: 20250419-pixel-3-511edc2a4607
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4jB+u25ZMhXJQ2J8eJP4a57jtjByDue+5wvNNt8Pq/o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo4m+vPHSg6W3fWjcWMLLcQyC/6TtbZGV0hPfCw
 P8eW4HgCoKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOJvrwAKCRBgAj/E00kg
 cvSlD/9nGXHqAA18DOslR00OvsErto7Xr1SozQ2Adfb3GfXUcz4DIArCX5ux7eXs0sZEYop31u6
 Hcthkb8EJM2oSrDmuWPKMjmBOguzYmda8iogqARV7tCxlaXD/O9edF9mF/j70uLWsCX07zhbda/
 ttehxZ5NhQi09Hq3hjh6tNRZ3SbQdtlCrGPnG/irh4Sikhbv8ONU6PnGIdwH1rKd4w81n+pcaBG
 Uf/b3FMtq0SpdiVFp7FAiXw25r7n4UdohyrgpZCTnsi0Cs8gZzreATOsXr8/iFSgz6u1ufUthg3
 AVs2QWF+IwJvOKK06DS01ckLZwtV8cGwIRVYGndsZU9ZO8/YlrtLL/NsBm5gVbQHeOl7f2GUNIi
 /ztkpuebfBreIUBIltmqy462hrzmZ0zswtb8M+RzbtmhGYIrJMPUqYyjF+NP+liemvQ8MLbN2ZO
 iJ2kJTXAa/Y3sG6ACmCISwrd6Cr6pJXKMd8hXgzuiC8qwCmDsi+pnD3DuzGfytv9AK/IF0QzUFN
 41pOJ2vtSgjKr2QjB2xaUGVMl4C64VkmjKL+t55SDTgHffJepLUSB5ffy1fzzN9aBplhwn9cOp2
 xx3c3Qhi+70lRwEkpLRt8fLuroD/asTp9MOXQx/VBPmJug0K77CW8ijPL9gQc5xWPtjI3wHerVG
 Zc7C0Zyg3YsTxEA==
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

Supported functionality includes:
 - Debug UART
 - UFS
 - Charger
 - USB-C (peripheral mode)
 - Display (Pixel 3 only)

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

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      Documentation: dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL

 Documentation/devicetree/bindings/arm/qcom.yaml    |   5 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts | 128 ++++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 467 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     | 137 ++++++
 5 files changed, 736 insertions(+), 3 deletions(-)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250419-pixel-3-511edc2a4607

Best regards,
-- 
David Heidelberg <david@ixit.cz>



