Return-Path: <linux-arm-msm+bounces-85148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B3CBA88B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 13:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB3A309D038
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 12:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D80238C0D;
	Sat, 13 Dec 2025 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNcD5k/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8418DB0D;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765627223; cv=none; b=It6CHzcjN/k9uo6C+PjMW4ewNoNMJDw5wtukP8V+PdAulUhYZ4ReGLH1/o9bUY8vg7v2ZRzQnQe2u3Fg0tSv/N6/0K/FkdIxU1BfeUirBBmZVoF6+3Z8SAIU+u5tOqVUSKe9tu41cb4KorweQ0GMHqixu9r4Nrk/L3EJTC+g6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765627223; c=relaxed/simple;
	bh=63XuyAt3Hq0F57+SA31YuHpdBuIPGjstOhaQOX2ZYXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MO7htfetijhd60U46T5WkyPWOy67yzVOlow7nDX5QuelJTvv3xUgmkMFuRWl64PVYKY6wxW3nO4wXuUi0KiPzfVAJPxEm2Rs41QpKoyDj8IAuo6Xzh9ePmDLHxIkAjSJKydOt+SQWEdHuyQwcf//23/Ji8Odugfl0UP7tIakUw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNcD5k/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5284C4CEF7;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765627222;
	bh=63XuyAt3Hq0F57+SA31YuHpdBuIPGjstOhaQOX2ZYXQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bNcD5k/X/JcDsWeCFwdg/V08XhLlyDxwh3WIV7L088I40JRumHceQm2Vu+mEYX7ch
	 t8uxcpxq8BBJFWn8G7dg6ItXtI3BwXMgZRzzCNIE1PUHZ48yEddSlWFP0KdNHeABVy
	 5ebHAhUHqZ4lS4QPrgXtLzlEx7tPsw+hISxkiRCTGev7IcnwCSpOUGKQ1/X59xFsgd
	 5aKvSjGogIJpebX5FDwMeYEkKgDGOp1dmAXC6mwha830y+zz4vx17do6jRSjXxUSrB
	 XfZkEOX704+Af+0BLDVFVKXOXM34Gm6fFl4wLtC+NVDp4aD6IaTCN3qrPcB8/CKQMK
	 2rhI+OqZjQhiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12DDD5AE41;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Commonize pinctrl for camera master clock on Qualcomm
 SDM845
Date: Sat, 13 Dec 2025 13:00:19 +0100
Message-Id: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFNVPWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nj3eKUXAsTU93c5JxsXQMTwzSjREtTo1RjQyWgjoKi1LTMCrBp0bG
 1tQCvJsaeXQAAAA==
X-Change-ID: 20251213-sdm845-mclk-041f2a952e31
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=63XuyAt3Hq0F57+SA31YuHpdBuIPGjstOhaQOX2ZYXQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPVVVryo+SCUdri61vJQT7ECSguj8+prZd9pLs
 0UsbDBCAt2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT1VVQAKCRBgAj/E00kg
 cjrED/4wsLEjsQFUxo5GQPRV4lroh1eHac1XUGYk53KuCgPuy8uPzJC/G0NTZyDkLdcglXgtKWL
 tRQHYQ2PumcvnoKVFI0aIQreytNSKjMvljey+yWnI7LwN1Enw9xEMXosCVSW2h/IeFG012kBdRs
 U8lQNUcSUTMA7At8UiAv24em5Y7aVDo55hm3krcXWrwf65EK/cBq0c/iBy6M+55itYk2nVy5Jen
 Cx9j6xSwey20DxhNDa438kzOzfHkYTvM/wyF1KwdE+xKYgLLkUaGzyghmQfRIG0Dv0WMgbGEKMx
 JvpFyHB+9UNRPkk2OZTHIqHyoBqKRvb6YHlu+Pk1PM7+tG5QlGG8ohJkPMPTY3hiwxkK+KudWGU
 gWmTixLuA8YSPj7qp0EYFjDNt736aF5I9p723oRpSchGrzbjyFTsSqMkydQ7b9maH2hii2LEo2L
 nfPXFsill/Zn9vqO8wl/3N6cEgQQ0noex8Qw9DJtam9Wk3hItYUoUwvOnhEui2TpBvok2ltv+81
 Pg/j1W84cRjt+/uJDk+ptLbri7TKD9hV9OEAqEYQRKfBxlDVdILrPiRn2XKezgu7ibQYoXym93N
 HMzB82wdiVpdrhQMOmnV2LlqAIbr1/Cqns50UxHFYBfMd3OIx8x6um1zmrbMECAcOHxLkoMBUIT
 H9iFXIyCJKe/rPg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Inspired by Richard's patch set for SDM670, I noticed that SDM845
follows the same pattern. This change prepares for enabling
additional cameras.

These pinctrl settings have been verified against the downstream
SDM845 kernel.

Since most of these are not yet used in mainline, testing was done
on sdm845-next using OnePlus 6 cameras with downstream drivers.

Thank you
David

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      arm64: qcom: sdm845: Introduce camera master clock pinctrl
      arm64: dts: qcom: sdm845-db845c: Use introduced platform wide cam_mclk0_default

 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  8 ----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 43 ++++++++++++++++++++++
 3 files changed, 44 insertions(+), 9 deletions(-)
---
base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
change-id: 20251213-sdm845-mclk-041f2a952e31

Best regards,
-- 
David Heidelberg <david@ixit.cz>



