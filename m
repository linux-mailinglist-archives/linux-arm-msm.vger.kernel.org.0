Return-Path: <linux-arm-msm+bounces-57987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE811AB7781
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44B9E16914C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E08322333A;
	Wed, 14 May 2025 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9Lvw5BA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208D220696;
	Wed, 14 May 2025 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256639; cv=none; b=MX0L9AMMGxf24wNHRboTRJaX2gkZZm1w3F3or8fSYWjTGwUGEZ/tgUmyDCEpWFhYNmj1+JKf8y62Tg8WcZxpGYgiQToAMfAsbcp+V23GQ2XqnQXSrazGvDuDtkiHF0M10vpu1CZWMuEWCcAZzVl/PGw1QtA67CkL6mmqPmNENsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256639; c=relaxed/simple;
	bh=Ia3J08FH2T+LAOJIpdIZspeG4Yy/3bA929n8wPkubF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTXfu9EdplkpPodh0jUMX6JbQz/ERM/WvRpv7Z13UOcQ1LfjXpRhoa8VXKj6frIYpBjIpfe0I5CRrQpkgxMozZzhtnO5G4fclnQ2rI+lTn1H5557dWTT6+7bnkurhRjR/zitsP3OV/AYfsC35FKBuAndAt+rhCyyLptQF2S6L8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9Lvw5BA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFDFC4CEE3;
	Wed, 14 May 2025 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256638;
	bh=Ia3J08FH2T+LAOJIpdIZspeG4Yy/3bA929n8wPkubF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p9Lvw5BAZHJK049wlfUFR53MSCs0czEqilbkgxlvaEBwQDsq96V3WA6wSmrcfFDzl
	 45DP8vGD4BWHul6T5A4v8iOj+shXCyV/akJChLt2puHKGy8DHG0Gp+/7hIcePiXJR0
	 d4s2nT2D7E0UwK3j174u7dJ/o7A+/a8HDtho9593nZq+bYKPuTndNJ6z6FnHZ7Bntg
	 kfcPtBDAKy0zGfg/QI3NunZ6QbkEnecGM7tDyedjScBhdxaNvLbDMGiMXOlSWvRudN
	 LpvBxH6oy/5eYOBIIs4sqIUqF9+vz2SukRJU540IjfRVaIhn3rbbEMmMq+2ShSR5SL
	 x1qdqc4LYQzcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e001de-devkit: Enable support for both Type-A USB ports
Date: Wed, 14 May 2025 22:03:41 +0100
Message-ID: <174725663051.90041.6844870543853100903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-81153b2d1edf@linaro.org>
References: <20250324-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-81153b2d1edf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Mar 2025 16:08:19 +0200, Abel Vesa wrote:
> The Qualcomm X Elite Devkit has 2 USB-A ports, both connected to the USB
> multiport controller, each one via a separate NXP PTN3222 eUSB2-to-USB2
> redriver to the eUSB2 PHY for High-Speed support, with a dedicated QMP
> PHY for SuperSpeed support.
> 
> Describe each redriver and then enable each pair of PHYs and the
> USB controller itself, in order to enable support for the 2 USB-A ports.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e001de-devkit: Enable support for both Type-A USB ports
      commit: d12fbd11c5a3e98c2f6372252bf84b0e10dd91cc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

