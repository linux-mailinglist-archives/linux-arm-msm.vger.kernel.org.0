Return-Path: <linux-arm-msm+bounces-44273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC13A05076
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1357166CD4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156DA1A9B40;
	Wed,  8 Jan 2025 02:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtFO9ysx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05471A9B2E;
	Wed,  8 Jan 2025 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302405; cv=none; b=iKow/KzPilWKM/GFdrRQeQOj1N2fgsQmST3HDXnjHRHVAKzD4zDydvEVExOaIFd8h0xrr0PuA4xOit5+gNrPm3z4gSbFow7TdG6v5i0FdlBMOJ55Uc9LjnR/mYpIevGFi+51GH816saCzI/RzNx595UNgNygtzfYMw2IM4T+j6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302405; c=relaxed/simple;
	bh=zQo51c4E2pMPkEdbUcNqEtVGkman8ydWLMoXoDuGPEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNH1kYgugv0JIBONrcCN5As/3IBExkWOSeuP4NVjqhg0lNhhhgr4dxm4iQPWW/8klGQDdv1/f5YDWEBvnelrJB7F9N/ksQ/uiBUq/z6lgGbY8374Lw4XmH1raUzPhacc1jaQ3NVngJuKWCpaP2/oS1t+TDaJlXDQ+Fu/07T0mqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtFO9ysx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED711C4CEE6;
	Wed,  8 Jan 2025 02:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302404;
	bh=zQo51c4E2pMPkEdbUcNqEtVGkman8ydWLMoXoDuGPEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OtFO9ysxW76kCXctFQnegEgM+AaTLsGVas3ICI8V+OwljpuCPOKNXVPZJU9/+z3Ry
	 L3gDJtPwPYbm1D6jxlUxWV5DdwghaZjv73TwgPUvl5X3jJMzMoBLvHAW/142HSrbvo
	 70eeBpQTlNe6RyWs9gy8KijQuKrNNnI8r6dbpli+L56C3L9yNV0Ibl7se22b/Eqcdq
	 T1wU6xGz019h2zESrY6JB+SqoTL7fVEtKHjp1G729UiP7WNVudSLNIPFaWKXoxLD7f
	 8hyctY1FbpQcSFkqym61FyWWKndO0h4z3n7/inlrWogWaZoSfM4w40kCMho8O3jVR4
	 c+5fM6+wGBRJQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 0/3] Add divisor computation feature for sdm845 gp clocks
Date: Tue,  7 Jan 2025 20:13:15 -0600
Message-ID: <173630239536.95965.3833609251283713239.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241118-starqltechn_integration_upstream-v8-0-ac8e36a3aa65@gmail.com>
References: <20241118-starqltechn_integration_upstream-v8-0-ac8e36a3aa65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 Nov 2024 13:15:18 +0300, Dzmitry Sankouski wrote:
> SDM845 has "General Purpose" clocks that can be muxed to
> SoC pins to clock various external devices.
> Those clocks may be used as e.g. PWM sources for external peripherals.
> 
> GPCLK can in theory have arbitrary value depending on the use case, so
> the concept of frequency tables, used in rcg2 clock driver, is not
> efficient, because it allows only defined frequencies.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: clk-rcg2: document calc_rate function
      commit: cef0523dd2ff65cc95cb747a348ce018f22f4d95
[2/3] clk: qcom: clk-rcg2: split __clk_rcg2_configure function
      commit: faddad527c82714dede83d932b4d31f7e38c1766
[3/3] gcc-sdm845: Add general purpose clock ops
      commit: 898b72fa44f5739d22016ec5ff6697ba4ac4464d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

