Return-Path: <linux-arm-msm+bounces-38959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223C9D6D69
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 11:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 043BCB2117B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 10:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1526C18871E;
	Sun, 24 Nov 2024 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n46VcJjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC915B0EF;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442469; cv=none; b=tEYdN/ZjMnROQhJN7jlxrjJwhklmCRuyaPSK90r8RiUNc3RwsBSi4IP8iH4V0milLqAUNYWpQJpipYlLHSeE3zogrHbKq0xgQgKRkShZ6cgi50t38P/t1uAIkzuxNb+IMDkOr7r8PisSy91Q9VlYU3suwTbXSOSdsj3ZeXA6xv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442469; c=relaxed/simple;
	bh=wsiWmyEwu4YNSWKps6tXSxMb1RutH3lVHwYYksxB0QI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KWeyQWO2f0AJqpV5P4AoqyXCbbtZDAYCGvWYOoqny2+5zPsC78Ii8jaxmDtX4zZnoQbeYE53DCsNvQYlj95UDZjiKOPtZsMdPlC+MllMHb1qf2HSZwBN3OvwmT08fAiYCprgLaN34JIOt8xSVsZrigZE0+YBNbvFX9oJV33exrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n46VcJjg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BAB5C4CECC;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732442469;
	bh=wsiWmyEwu4YNSWKps6tXSxMb1RutH3lVHwYYksxB0QI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=n46VcJjgrQWg0gin39QbCuRxut/3Z6IzIUIsS+sA6JJhsNlhmpwMOA2dt1vQVIvND
	 j7SJcwl+wVsEfO7O4ghrHgc1be6Rdw1HqEI4AcestZ2n0itBv42YAVWCneNjHIgoCZ
	 mygIpyE3WS+CjRTQor1pQU5LmAokbv55T2amxL1EbCGajXkI23X9eE4K1qVhamTwEd
	 ywBORZnCVPdabGTVTvvD4VKOFZi+sHmEZQljpEc924++gMEBbpC7Sd4QZHwLNQU+O4
	 7aJ+sbJ6PMo/UIKt/rM/kUxqslFKGLYNPl2fMekUvHt8Un2p35vtbC+8ujdfihUkYg
	 FCnT17QsUseYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3072EE66887;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v3 0/4] Asus vivobook s15 improvements
Date: Sun, 24 Nov 2024 11:00:56 +0100
Message-Id: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFj5QmcC/4XNywrCMBAF0F8pWRvJo09X/odIGdPEDrRNTWqwl
 P67aXEjCC7vcO+ZhXjtUHtyShbidECPdohBHhKiWhjummITMxFMpJzznIJ/+vqhbF836McOZqp
 0ZkwhKilTRuJudNrgazcv15hb9JN18/4i8O360YT8oQVOGS0zqIypRMoAzq2desDuGFtk84L4a
 4hoALsZU2ZFHnvfxrqub6RDhTz4AAAA
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732442467; l=1685;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=wsiWmyEwu4YNSWKps6tXSxMb1RutH3lVHwYYksxB0QI=;
 b=wMo89KlcYiVtbpv3CmvyQ2to4ZkboF/CtjQQKLMntm1f+0+og1b/bOfmCy+L0Or5QNGBGlBGG
 /8olbMCxBN/DUoRth+saS1ecD+A9h0S6NfXITmKyvBoxJ6A5KS9emRq
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
Maud Spierings (4):
      dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../bindings/display/panel/samsung,atna33xc20.yaml |   2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 201 ++++++++++++++++++++-
 2 files changed, 202 insertions(+), 1 deletion(-)
---
base-commit: 98fb106aa5265aab0d857a942c410a753b470cc0
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



