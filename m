Return-Path: <linux-arm-msm+bounces-35699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C801F9AE982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059DD1C2238F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 14:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1F31EABC7;
	Thu, 24 Oct 2024 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR2WFJ12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023011EABB9;
	Thu, 24 Oct 2024 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781979; cv=none; b=FDd0Tp51QDcCSql2wnRxSxUt9EuvYti9Q9sMC6PIGDXlKqKBZbBm7z775OsjdL/L9ZiytxkTagm3nlH5cbJ6e06bd+G3A1bwc5qXw/TWZy/levs80Cw8wBI7XcqiVoitgEbmAku/DhN1tUnNsj2i4aLF+Nl8ecs0vLUUdceKKIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781979; c=relaxed/simple;
	bh=XSuV4wMjEaq2bK1+fEfcIVjQ23coe6qpUJ9w0Cf8C5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfhRo3Kz1wDttb8Sn93U0KvNnyoccoH+ooLXHM03ON6976YZ+XjzAkRYOQjVAdIaRBDAxMlQRfS7r0deZDe6nLykGReYP1N39qYqM+ycZmrJUsd3yrAPw8SgREVdXCCxMyLS6AaXTJhyRZWon2IBv/aYU0eVQA80Q1g0pk9JqGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AR2WFJ12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A775FC4CEE6;
	Thu, 24 Oct 2024 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729781978;
	bh=XSuV4wMjEaq2bK1+fEfcIVjQ23coe6qpUJ9w0Cf8C5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AR2WFJ12WyU2LKHGysZ86QfLBQ11wB1FLHBxc+ZeBxFR8HDEpen1FeVqK2XJUrvyY
	 V60idHgtoZLaZbN3sr7t9tS967fQrIBzg26/qlf4hbCiWYiKownSzO7qqGjVyiKdPL
	 iXVhoBLkCDVOFYnJ7uSiICCoY5Jsyd8p6kQxYny+HfGk+LBZXYDo3x9p74Ly0PXtKh
	 cIomyutDLR0BtWFm4+H+1dolBnvkH6knROpxJLSgTGAivSNbp9XyETQvwk57Itzs5n
	 QbrEolsVhSiy7XvomWoluVjJI04rPmPrcGgVdT+dTAK/O2FyKtCTZjWCV6S48jwLZg
	 dkXmTLxbnwAxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1e80100: fix nvme regulator boot glitch
Date: Thu, 24 Oct 2024 09:59:29 -0500
Message-ID: <172978197053.296432.10913188928059703345.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016145112.24785-1-johan+linaro@kernel.org>
References: <20241016145112.24785-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 16:51:06 +0200, Johan Hovold wrote:
> The NVMe regulator has been left enabled by the boot firmware. Mark it
> as such to avoid disabling the regulator temporarily during boot.
> 
> Johan
> 
> 
> Johan Hovold (6):
>   arm64: dts: qcom: x1e78100-t14s: fix nvme regulator boot glitch
>   arm64: dts: qcom: x1e80100-crd: fix nvme regulator boot glitch
>   arm64: dts: qcom: x1e80100-vivobook-s15: fix nvme regulator boot
>     glitch
>   arm64: dts: qcom: x1e80100-yoga-slim7x: fix nvme regulator boot glitch
>   arm64: dts: qcom: x1e80100-microsoft-romulus: fix nvme regulator boot
>     glitch
>   arm64: dts: qcom: x1e80100-qcp: fix nvme regulator boot glitch
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: x1e78100-t14s: fix nvme regulator boot glitch
      commit: dec19f1406fc5d73512cacdcf612e7bb161c2101
[2/6] arm64: dts: qcom: x1e80100-crd: fix nvme regulator boot glitch
      commit: 37f9477ce9d07ed87f6efe9b99de580bc9d27df5
[3/6] arm64: dts: qcom: x1e80100-vivobook-s15: fix nvme regulator boot glitch
      commit: c6d151f61b6703124e14bc0eae98d05206e36e02
[4/6] arm64: dts: qcom: x1e80100-yoga-slim7x: fix nvme regulator boot glitch
      commit: 1badd07e4c0e1ecfb187dcba05357c0f3e70e797
[5/6] arm64: dts: qcom: x1e80100-microsoft-romulus: fix nvme regulator boot glitch
      commit: 5462190b11aa62a945dc2fd74e1531b9c1bc9952
[6/6] arm64: dts: qcom: x1e80100-qcp: fix nvme regulator boot glitch
      commit: 717f0637ffc6a6a59f838df94a7d61e643c98d62

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

