Return-Path: <linux-arm-msm+bounces-88222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B22D07ED5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC829306128A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28EA350A06;
	Fri,  9 Jan 2026 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACz+U1ZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAF4345CA3;
	Fri,  9 Jan 2026 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947989; cv=none; b=ZLEZwWWNhJd21sC9lYaMU7eQsxUPapc4rB+MP5IYy9KXQrbFKY0+97vGnkWjSyqy5dPbH9aLjA2cNOWXTYI19zPwyyxxeD8ZrM+7QZ+jRFUaESpWhoFm6xOygBT+Un3Xn2cbnOOczc30IoCgG8J+qujwEicEeYD58zyf+aIHn0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947989; c=relaxed/simple;
	bh=zXUBV2RJUzJm0vMa7PA3nfYqlnqqKAYGdeQUA31/Eq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlBUC4+HtTY2NUTXfbedBnVuVo+FLZ7Hu9TdAcEBIrNZT0DsscsbEAu3wdYeIFU6E+hjh+qniSB89OXmMZUTUC2bBk13jbecpWOKHuZlX2e7+zw2j42iCiZAbpQXuASN5y0AUz5TE0VLTJT+QWXbVfOUpcxfEJOWN5uWkYlYkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACz+U1ZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C82DC16AAE;
	Fri,  9 Jan 2026 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767947989;
	bh=zXUBV2RJUzJm0vMa7PA3nfYqlnqqKAYGdeQUA31/Eq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACz+U1ZZuF+NYSkhPSyxpZ+lvDF+91/zvDfjNVviA/fkzOf/nt0oWTd3KgAU6I5XE
	 Ldn0qTTvFNQ6Ng42Q1a3K7wYkJ/iHV5GUBQZic/8tdhI8bfvKSCjEv32ltct2m0b29
	 qMm8BrflzkQehB8QPAUOBAv2odTPyGLcq83rcg0p15glWLRQN8qF7ZTabHeFVWw5DO
	 TkegRkmSJsCfpkHZz6db25V2YnIueiM6xu1o7iZ0ZpfJ5NPudLQy++FPg92p9merVA
	 M/LMfAU3KOFb6GwuprI2PFI0fq8xO66r0ZzmhJiUEOdg1AWZYKXc4MqRhhSjLz8vrR
	 Ku5Z8oFwc4LTw==
Date: Fri, 9 Jan 2026 09:39:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com, 
	linux-remoteproc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, mathieu.poirier@linaro.org, konradybcio@kernel.org, 
	p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: clock: gcc-ipq9574: add wcss
 remoteproc clocks
Message-ID: <20260109-simple-smooth-basilisk-ab8df6@quoll>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <20260109043352.3072933-4-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109043352.3072933-4-mr.nuke.me@gmail.com>

On Thu, Jan 08, 2026 at 10:33:38PM -0600, Alexandru Gagniuc wrote:
> Commit da040d560319 ("dt-bindings: clock: qcom: gcc-ipq9574: remove q6
> bring up clock macros") removed these clocks on the idea that Q6
> firmware is responsible for clock bringup. That statement seems
> incorrect, as these clocks need to be enabled before the Q6 is booted.
> Otherwise, the host CPU core that starts the Q6 hangs.
> 
> Perhaps the statement meant that the TrustZone firmware will start the
> clocks. This only happens in PAS mode. Under native OS loading, the
> host needs these clocks, so add them back.
> 
> Besides the clocks that were erroneously removed, also add defines for
> GCC_WCSS_AHB_S_CLK, GCC_WCSS_AXI_M_CLK, and GCC_Q6_AXIM2_CLK, as all
> these clocks are required to operate the remoteproc.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h | 22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


