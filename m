Return-Path: <linux-arm-msm+bounces-20506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561838CF7AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0D328103F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A5461694;
	Mon, 27 May 2024 03:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgvhvbIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C060DCF;
	Mon, 27 May 2024 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778865; cv=none; b=oWAQbffe+Z9wEV6xkSKymhglO9kOOGCqyArb+ZqX6PPBaAxwIQNE7PKNSfRzYMgMUMtHKdGvso4105SH0Ju+GmXiTFY60bZ6u+4po/PWvOxv7v4w3tbQmKS6JIQ0e/LLF+SilvF4UwcVmIOnEKa2cQzTG8keY0efBpHrNHMe4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778865; c=relaxed/simple;
	bh=p8JxXUNhGo3q91trM6l4L6PrggiVY6FDGU7IHT/MPcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0RWGbV9ALoGlYJybqdEh0JnsQX2pJ89TsiOCoqNydgLWOn6A4RQaT8orr55aEeu7xRbyAo9MQlh8iCLWbaHHbaqvYoQuCDxHclQJRa/iXHvPmEoqOHd0hW/nz4tksTs+aGCaZIn/wAZxBmR9qCZOrMX7hbjpuSfGpb51hazj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgvhvbIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B966AC4AF08;
	Mon, 27 May 2024 03:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778864;
	bh=p8JxXUNhGo3q91trM6l4L6PrggiVY6FDGU7IHT/MPcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OgvhvbIoSVd/zsN4fgjIZkiBQ2up3qTgEbT8dJNC0LhEM1CiFIFn229X2wVlKquSr
	 UHubWQjUGFVCAxRmqffPVTqktq8TIKQt5imNPsKJO/Cp6xrKOhWd3kXXuEmGPu4q5k
	 QBLaOKirrh0KTqeeXA20Oo9rEzCkYl4rHoPj6Thql1GyeUPTmkvMvZajB5dEiYDy4j
	 7zcGMmcX9WRFAIC8HXfit8oewwRX9KqcQbRHli2w+YR5QESiwCfNomnie0KpPQMlAG
	 kiJWTwxQjhERlJElTXxO89O13HagSCBZIqFqp4eL6QH8LKx5ACQJ/BGTv0pk1nemBt
	 0TzvqLUMkhLNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: (subset) [PATCH v4 0/3] arm64: qcom: sm8650: add support for the SM8650-HDK board
Date: Sun, 26 May 2024 22:00:32 -0500
Message-ID: <171677884198.490947.15710316608559219307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422-topic-sm8650-upstream-hdk-v4-0-b33993eaa2e8@linaro.org>
References: <20240422-topic-sm8650-upstream-hdk-v4-0-b33993eaa2e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Apr 2024 10:48:11 +0200, Neil Armstrong wrote:
> The SM8650-HDK is an embedded development platforms for the
> Snapdragon 8 Gen 3 SoC aka SM8650, with the following features:
> - Qualcomm SM8650 SoC
> - 16GiB On-board LPDDR5
> - On-board WiFi 7 + Bluetooth 5.3/BLE
> - On-board UFS4.0
> - M.2 Key B+M Gen3x2 PCIe Slot
> - HDMI Output
> - USB-C Connector with DP Almode & Audio Accessory mode
> - Micro-SDCard Slot
> - Audio Jack with Playback and Microphone
> - 2 On-board Analog microphones
> - 2 On-board Speakers
> - 96Boards Compatible Low-Speed and High-Speed connectors [1]
> - For Camera, Sensors and external Display cards
> - Compatible with the Linaro Debug board [2]
> - SIM Slot for Modem
> - Debug connectors
> - 6x On-Board LEDs
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document the HDK8650 board
      commit: 329dce8aad3efba47ad968c1cedf2d028c5643f6
[2/3] arm64: dts: qcom: sm8650: add support for the SM8650-HDK board
      commit: 01061441029e7fdedcd5d573ae6bd7c4e025018a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

