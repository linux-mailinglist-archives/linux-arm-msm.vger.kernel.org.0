Return-Path: <linux-arm-msm+bounces-61773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B7ADF844
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 22:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B1B3561EE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 20:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C950E21D3CC;
	Wed, 18 Jun 2025 20:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdS0xrtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879B21CC55;
	Wed, 18 Jun 2025 20:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280338; cv=none; b=gRHxEgPoUkCkdNGhtgXxFeo7uscf38+qbEEAgAbnnLyhXBt1kUIp0ubUico1BP7VvwYhvmLZyoeELWHXKNeh2ekY9Yr8isQ+8EnYuDsTHy5SyMC+oUZDyXpFF0PT2LU/sCqj0N7OLZCwm4ElzhDZg0h4ApqrxjliS3CwHuXAWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280338; c=relaxed/simple;
	bh=dq8xpJbQS0XrT12gGGXOcwDQ/LwE/eWbDajVjVpl+Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crcH74Qe6d3FQ4+Xfkv66QJILslcz51Dji0G2MrraNZ8ULtbCAiSWgM2U4B59ij0/pB4Qb33kf8KFGyoKRtdDotfaYsb884meNV9vLdk5fQJ1tT1kf3PbsfzlR7oWTvP36MIW4JDRWr+FTtV7vrgI3YlOnjLhOC3aZTwiA3fhpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdS0xrtM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFD2C4CEE7;
	Wed, 18 Jun 2025 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280338;
	bh=dq8xpJbQS0XrT12gGGXOcwDQ/LwE/eWbDajVjVpl+Ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdS0xrtMmsaEhdGOlLczJz0ZaiJrHWpj6HjJFiQPOblY1VOYk5HN9uxlUHY9xJUQv
	 5n406uEP1uVL0bLAJgnGk4nvvjFpW0L6v1utf+CNis5BIAc2p8OeEt1eZXqDcSdNcH
	 KTt9/9uFp3wEt79ducXlhlRRNoEk1yR1BYdRfKeYXDPiuQro/Of4Wunl3ggybhHA0q
	 wZ+8dirw83bn+GSIYiaQcj0hpQLf/CGBnGgUwdNtnFHdYrZp5T9x5U6MUMx6rqGmtR
	 DyxQV/jJFV8NqccCItpLifO5Cre9jwePfpDWdmLWHJtGyunuTjhziY8U8c1bj6UYvo
	 PQrsHdAqHqraQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree
Date: Wed, 18 Jun 2025 15:58:54 -0500
Message-ID: <175028033295.754649.1219129479915148824.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 15 Jun 2025 22:35:02 +0200, André Apitzsch wrote:
> This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
> in 2016.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - NFC
> - SDHCI
> - Status LED
> - Touchscreen
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: msm8976: Make blsp_dma controlled-remotely
      commit: 76270a18dbdf0bb50615f1b29d2cae8d683da01e
[2/4] dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5 Plus
      commit: 3440c6d1f81dc6fa6356b0f9adbf1dc785ceb426
[3/4] arm64: dts: qcom: msm8976: Add sdc2 GPIOs
      commit: cf3dcd80dbe45f1915bd9630f3e20bcdbf6360ac
[4/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree
      commit: 79b896e7da7e2743fc930d260bcecd1e84a003c4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

