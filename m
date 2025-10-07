Return-Path: <linux-arm-msm+bounces-76167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36690BC046E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0B1C4F3C8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D88229B0F;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIe5+Hwm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2E4226CF7;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759816549; cv=none; b=ksIMDpaOWa+QKpol1IVIdBkkUIf3ciY5+7el/46yZ9PDNwCOo3BYAp7S52c07cogmeF4dTKrwOPWCqnayIf+oj3JSXgt01b0wugutJR0Z16HlhE7eguxN4aI+AYlEd/UFVJyvCDVZd/JNfZMeuUxzCGquUXUaNBaEtijesp+rxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759816549; c=relaxed/simple;
	bh=Gf2m2IDyByH7gmdlj92TgGHt/kPecA91fuSLd1/3x9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BaEsHWa7R2L+MjAmjtbwwpEuleNsbG8L6TgE8rzk3hEmjdykgaaZMNBdGKv1oDniYea5iE29uKRvtPnU7doWh0k9+ciaOQv6Kw9eLwfr12d4yB+Uk9n6mNZgGfFVS9NO/XlGb2pGKzY8vSUFyZ+Z0hfjgliTgT+G2jStAwF4tYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIe5+Hwm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAA07C4CEF9;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=Gf2m2IDyByH7gmdlj92TgGHt/kPecA91fuSLd1/3x9A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DIe5+HwmMh+CxenYgQjBf7eh7ra6GAu+eA/KSdv/htod35kmYPfc7cEvFkVTyafXt
	 jA2XHc0thB3aGYnj1XtL1G0zW+TnlYzsFWj7J+ldl67uMkFyslnvnthgbvblDMGTgi
	 ODHwxPQhXmOfYIn+7sPK9Y0mnvkPPDGwczrz8S/N+EguHkne9nrN5HL2S6Q2Y3x5Vo
	 sRDU5P9r5amJZtt33yARnHKEwWgWKyn8WoQFPEtShqKYFvefyzOV1IeYTpKZINo/zv
	 wcd0fco8eAZD8ZeK1+25hmL6t+W8ADe6SSqqqCeelzaM9rkUDVafNhZdDStsEKkGsL
	 5qW90SIdSe7mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6622CAC5B8;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Subject: [PATCH 0/4] Describe more hardware of the HTC One (M8)
Date: Tue, 07 Oct 2025 01:55:41 -0400
Message-Id: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2r5GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNz3VwL3ZSSYt3ElJTMEqBaICsZKGdpmJiWaGSiBNRWUJSallkBNjI
 6trYWACYatAdiAAAA
X-Change-ID: 20251007-m8-dts-additions-ac20291afa24
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=751;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=Gf2m2IDyByH7gmdlj92TgGHt/kPecA91fuSLd1/3x9A=;
 b=5ibouckw/wXrYl4/1BrXypwgXknGcJqzOUQh6dcjqcFKMMvY/k9z74zd60/bSZG0EfDv9s+B8
 EzG91zLwpQFB8ZlYwSVn66l7/BfCCKOPEQDf/3bXylR5woqjL2zMLfY
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

Add hardware description for these parts of the HTC One (M8):

 - Notification LEDs
 - Bluetooth
 - NFC
 - Touchscreen

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
Alexandre Messier (4):
      ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen

 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 88 +++++++++++++++++++++--
 1 file changed, 84 insertions(+), 4 deletions(-)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20251007-m8-dts-additions-ac20291afa24

Best regards,
-- 
Alexandre Messier <alex@me.ssier.org>



