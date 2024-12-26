Return-Path: <linux-arm-msm+bounces-43435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9199FCEAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A74162193
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D1C1D7E35;
	Thu, 26 Dec 2024 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvY5ttTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD21D7994;
	Thu, 26 Dec 2024 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252749; cv=none; b=WP0CbqVtji7IH6CfoEKg/hp1N9JtL4GkOEdGqcO6gLwQLtxPf90VZXYDyku0DP4QMHVrPDDSX8OwI6jLrSUSrw0PkVgmxWo4/0ioNKWxbemzJ+mERA/d8US3zCwUdbCbHY+3H3hriwPfrOSczPUOfjjEs1k93MXQFptFUalEjT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252749; c=relaxed/simple;
	bh=VFLTWnfQgdHkriO0SkXwz4JIVl+0PyLfE7mImr/Vtt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t1VD4ei5zTRLD/uxuRi0vSFOwO4MMWbdZ9VYEDyh9y6b/kvdpw/osr5aCjUvZXczEwWIJpr6R1BuvIZa3C9t9yFLm21GTXQtpNl/zJAKtPIz6Awjc4oCM1sr833NmUy1KV/MebA/b1lmy6J9LxPxvUYK9jDNadPMfHbHuxdO26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvY5ttTM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ADDC4CED1;
	Thu, 26 Dec 2024 22:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252749;
	bh=VFLTWnfQgdHkriO0SkXwz4JIVl+0PyLfE7mImr/Vtt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvY5ttTMTvx+Zi+3kwODikX3AVr4KfyjG96xMjhFHh5J3qfRy2y8u7CtwBcK0aUN6
	 xEOydB6Wyw5yb+OZwK0tVOvIDprtsge89G+RFAm3E03eMVZ0Cm3QcPPaMpOtUNhn6C
	 eonPprBnr46ArcPJt8rySn1njEc6LpX6k5Mlngo48UNd/HeYpQ1vBQSHWi1Pc8l/Or
	 S5Ps/Slx2kdqpszwZrUiZal6a/fHGBqDaEQYr1IaZAvvRyXBoSaZZOFULYN+OXLCAk
	 tueTPAGELf6ZtMXroufOBMbBr/B4N6TLLULNZk5efrtyLTroCKgtPk7tYjJY5FV9NL
	 DWS2xGKBMDGRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-t14s: add sound support
Date: Thu, 26 Dec 2024 16:38:39 -0600
Message-ID: <173525273255.1449028.10386868284360110581.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203111229.48967-1-krzysztof.kozlowski@linaro.org>
References: <20241203111229.48967-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Dec 2024 12:12:29 +0100, Krzysztof Kozlowski wrote:
> Add support for audio on Lenovo T14s laptop, coming with two speakers,
> audio jack and two digital microphones.
> 
> This is very early work, not yet complete:
> 1. 2x speakers: work OK.
> 2. 2x digital microphones: work OK.
> 3. Headset (audio jack) recording: does not work.
> 4. Headphones playback (audio jack): channels are intermixed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e78100-t14s: add sound support
      commit: 12805b0f998cb65f5c728bf93876f9603fe58477

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

