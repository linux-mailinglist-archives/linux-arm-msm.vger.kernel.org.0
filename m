Return-Path: <linux-arm-msm+bounces-58253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A8ABA874
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 07:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87F91BA4B43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 05:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180E31A8F94;
	Sat, 17 May 2025 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3Shexq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9CD1A8F84;
	Sat, 17 May 2025 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747461444; cv=none; b=W5KPtZFjBqE4jz4kgCj++fffRI3XmGbFI1bNUCM+u3GVWUi8A9yzzrEbw0KNYMVDvb78PsFe8bHsWiaVo7N0sxfnOOdxskhv61MGv1MW0fdvXvD1Jm0XaW/syDvU1hPD6IBJuc11sXgnDXRyW1P5EzLpBQGEVLzyzb/Y/qcyzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747461444; c=relaxed/simple;
	bh=fWJltr0OrccsWaiqa1kcQtqebzauVJZBjlTdt6o2fJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ij6jHAmtw60R7matB6f1R5QRCFHkch0chcYbAHdB35X7U+kH9RDPN8XyMDhXdohcFJjIBMB100atOc9XffolQNjiFQEpYPiBAQmLQ9W4z0trNdLZGAhn/CbfgVfyFcgBbG3hVpwHioVFgstyjX+IucoYdNczGhqTay2mD2TsKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3Shexq/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B259C4CEF0;
	Sat, 17 May 2025 05:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747461443;
	bh=fWJltr0OrccsWaiqa1kcQtqebzauVJZBjlTdt6o2fJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c3Shexq/Lr8FtTLLo02K+IwTGGvGFdDWOiNqvYSFItZhin9vUHMDQtXp1PzveTktv
	 olw4XLNoJE+MUoJldJcHOLKDgvfbN+8eUtrECzoLrHKm8SE5aBEZlYsd9GblFk+4JW
	 ywDIIZH9KAaqYAGhH28z/GWknds8m5ZpFy1HI+G9aBHTFiIAeX/RdplAGM4tUtrLSG
	 5LqDdX17/oL2c3Gm+7sdIlKNuZIGRqY2QK6olkNiTBt4dEMciLhTULH/8K7RBTKFFr
	 QcBVABe3NFkWacgv17za/6SUPEzsIo2JlCYWy3bmlFuLThG+3AJZk2UIEIIuVwMWCr
	 ONIfCVCJA+OPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
Date: Sat, 17 May 2025 06:57:13 +0100
Message-ID: <174746143139.152010.491507010021269329.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328084154.16759-1-johan+linaro@kernel.org>
References: <20250328084154.16759-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Mar 2025 09:41:54 +0100, Johan Hovold wrote:
> Jens reported that the sanity checks added to the new ps883x USB retimer
> driver breaks USB and display on the HP X14. Turns out the X14 only has
> a retimer on one of the ports, but this initially went unnoticed due to
> the missing sanity check (and error handling) in the retimer driver.
> 
> Drop the non-existing retimer from the devicetree to enable the second
> USB port and the display subsystem.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
      commit: 9c6ee9a760c52207eae64cb6b20cd1d93c3761ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

