Return-Path: <linux-arm-msm+bounces-74012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F88B82A54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 768274E0440
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7E723B62C;
	Thu, 18 Sep 2025 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxv4HU5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D723A9B1;
	Thu, 18 Sep 2025 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758162203; cv=none; b=XRp3LNF0rmiT2RGvOvY3Kk7tnpGGgTMq9zMoPwYTBbWukBmjBjpgzHTQztsSgct2x9Dqo5tXhojtxFI1pkqgKuZgwjwS2iGvJ0KCzF+iLKH6JX50+biYLp+pHPgAEl1niKCpn6hcAzcwhkxj2OA5O6qoo4WgrXh0jOjdRepLZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758162203; c=relaxed/simple;
	bh=VHNmO8j+KpvkJEvjZCkpSARV9wxlOL2R69WdLgdr1OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHVvoGDzoHRE90zPND5DxbhKdIo/v1ma4tIypy943xHw4oKLzFGZk4r7YZT11dyBaeUB+Az88741bpl0hTQQNav4EPiQ+ELrBNtWqX4rXHiCrQ5MqO8Juhes57gPd04ydhs640JsxnQ5eyA6JXTn7V5c+AF2onp5QeapegiiZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxv4HU5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECF9C4CEF5;
	Thu, 18 Sep 2025 02:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758162202;
	bh=VHNmO8j+KpvkJEvjZCkpSARV9wxlOL2R69WdLgdr1OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxv4HU5c3fX8xJszb8LUkYYVO47U38A1eEFtz1cxknKnBXQOEdHCaYPjoiU6UTh5M
	 ik2ctq9cgiHtsaqYsfCW6lYh77kp8+C2GfUHxXZ3mjTl6IMtNsGgMcmGI10KJOxHGg
	 n17X4t9Gb1VtkiTsvUhivvoldb0O9xYLVi/gjN0GmOjTtXEfyV7b0x2LWYbnlp4Xho
	 eEa6A2Yu55V8WCkuxKpVZiBbnl3ODUHQC+SKhuoBcldRZbx/cjJCSdSZ2PXcjn5OGO
	 IPS5jbWWIqztg1FQiVrfpNMd7/ZauZb/2g0Cq3fpfOWVqpnnsE1ZzR3JWPl4MQGcvl
	 nZ1OTx7w5TfoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 0/3] Initial support for Qualcomm Hamoa IOT EVK board
Date: Wed, 17 Sep 2025 21:23:19 -0500
Message-ID: <175816214779.142267.10336698605013738671.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917-hamoa_initial-v12-0-4ed39d17dfc5@oss.qualcomm.com>
References: <20250917-hamoa_initial-v12-0-4ed39d17dfc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Sep 2025 10:58:57 +0800, Yijie Yang wrote:
> Introduce the device tree, DT bindings, and driver modifications required
> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
> a UART shell.
> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
> and the HAMOA-IOT-EVK carrier board.
> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
> GPIOs, and PMICs. It is designed to be modular and can be paired with
> various carrier boards to support different use cases.
> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
> It provides essential peripherals such as UART, on-board PMICs, and
> USB-related components.
> Together, these components form a flexible and scalable platform, and this
> patch set enables their initial bring-up through proper device tree
> configuration and driver support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      commit: 458bb855f274e227618acfa8c098b8e4894d9cd9
[2/3] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      commit: 5098ae93ce44110a4d86574819b254fd126243af
[3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
      commit: c11645afb0e228546279ad1b74826fffbfebbc7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

