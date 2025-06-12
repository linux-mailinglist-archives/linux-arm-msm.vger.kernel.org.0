Return-Path: <linux-arm-msm+bounces-61153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40651AD7E77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 00:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFF151734D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 22:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B032DECCC;
	Thu, 12 Jun 2025 22:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7MFeE22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB56230D1E;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767849; cv=none; b=supSMGmtGkxuqWRyOBWn/ZEJ57CuKVjLxw8GBg/T8/5YP61MCVOyg+/JOwq73WCpSWxG2w4KPvwQYauL84xPVNeQOQKCxlgmKes7P3NT1GTWMw0HiJYgIDTLtvm7PjWO8i50TfHD3EJiORwW1z/7Vm3j4X8BRmimtbDbJXFZ7JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767849; c=relaxed/simple;
	bh=GQ+Xtv/R4Cazn0jTLW14AKKOtVPMuLFroC6FY7/Wwwc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g0YtstW4LEEiwYiYGdQ7pitYKgNu8/B9vu1S3HZ/VfCqLG0LS/ntj/1CyhoWpoGlLMh6aQIKYzHuIVmVkDo3Q3mqpyQnOAEksXCX1fWclUVpQapbt5Mo06pmzjBJl0bDTxxlRvYo3ln56KmFZ/BNeCSfMdrrDgcq15UmN8qOIj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7MFeE22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68A82C4CEEA;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749767848;
	bh=GQ+Xtv/R4Cazn0jTLW14AKKOtVPMuLFroC6FY7/Wwwc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=H7MFeE22n87q9NkuJhY1Dj4Yx1s2G8kuXAkWSzbBOK1QfS0CFILUJAmTaGoFedA28
	 K92wgJb8rvhcWrCY5XDRMK1rxYgVCHHsisCXNDCE2sl32EuxtY8etHudJQcTleiWJj
	 ZwNi+EMWYfhq0lv3ysGxZFotewKsqOkuWyOEIL1+0gXd8FIepzPsBxHyplstFrOjUc
	 Q9FoO0ZENY+ae//PLpG3xTejHW45puGQ2a+V1o8udzozy2Gkhg1+r6p0kSgULHHob8
	 uEXwYMPKTfoKNKZSQWhy0i0ZcQsrHsXNu8/pG5kZEOuIVI1EGGVo5czeC6+aHSK2qM
	 hv/NjBBvxr8qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF7EC61CE8;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 0/3] arm64: dts: qcom: msm8976-longcheer-l9360: Add initial
 device tree
Date: Fri, 13 Jun 2025 00:37:17 +0200
Message-Id: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ1WS2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mj3aTCCtOCnNJi3RRzo1RDwzRTC3PzZCWg8oKi1LTMCrBR0bG1tQB
 7QwS5WgAAAA==
X-Change-ID: 20250612-bqx5plus-d72e11f5877c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749767846; l=936;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=GQ+Xtv/R4Cazn0jTLW14AKKOtVPMuLFroC6FY7/Wwwc=;
 b=BtpIaq4MHJ8rHJvyS2zi/RJdzpn0Y5hUwKIBUabE0oANdzbtLtlnAFfyhN8FV0nA/zsmrtwIJ
 mFDzJBdJFIMAItGto0WhQsmWZW+wMJfVb/cUtTWU1Eqz/JYjUrcoT6l
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
in 2016.

Add a device tree with initial support for:

- GPIO keys
- NFC
- SDHCI
- Status LED
- Touchscreen

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
André Apitzsch (3):
      arm64: dts: qcom: msm8976: Make blsp_dma controlled-remotely
      dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5 Plus
      arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   5 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      | 532 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |   2 +
 4 files changed, 540 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250612-bqx5plus-d72e11f5877c

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



