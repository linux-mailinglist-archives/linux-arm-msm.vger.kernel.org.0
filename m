Return-Path: <linux-arm-msm+bounces-30042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A186596475B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 15:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E921F228CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5537D19412E;
	Thu, 29 Aug 2024 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaWi4+YN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19018CC1A;
	Thu, 29 Aug 2024 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939913; cv=none; b=Rv/iXgBxzcDIDXHJZxHyOzfbaNEm4SAFQQtsU3Q9fnFENs1M6YwnvJYCsulavnUWjqZgATgQuMoCMYkn0PQrG4lmLDtiRK+k/TNlgDn3VvA31qkeRaL7fnNy5MaYAdHFzBWv0jGB1Zn/grhxL3oDhI2oYGGPQ5xQJd32M3GFSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939913; c=relaxed/simple;
	bh=ZapR8G5uRpf7IydIeRIlNL2R+edJOZvbSd+R9K2a/dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfxLKKFDuhJwmRnX48Xmqs2W2CyBbbJPWOOrKoVIY8dVdrBm+QsdmAcZTD+9+oltPpjwFSycELZ5bsmaHPCK+3Qv+qWV/zc/jK1HYiBp+S7Tr5owW28NZGo4gC+9Gq6evF3IaLPcx63BLFoOFZ3PHJvmtoBd8xUvKYt81/IBUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaWi4+YN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91276C4CEC1;
	Thu, 29 Aug 2024 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724939911;
	bh=ZapR8G5uRpf7IydIeRIlNL2R+edJOZvbSd+R9K2a/dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DaWi4+YN3qETrzeIdOj4+WS854MUgisfVEIlRP0Yxkg5Sg+PaqfYmyt648E56Q2It
	 lMT5fJYhC7QVKhOAAAuc8GrKzQrgiZQH3yqAfVAmr02Cr983F6J9YVjAcxlNvtYHEz
	 uV8OFDoW7PobQ2nj8R0UHbMnYEQ0KX2Qh1zvgFI6sr8+XVyegYIuYgICJhuP5Hz5bE
	 t1AM87PhtREUpN5lL1incQCrs9oWQvTxK/jpEzOHjKLOccE+QaW7mlOqD6vJmeeA6R
	 fFplD2aD3sgmHyBs9DG0SjbyltYlt+W+SCGM0QVIDDYpxHAd/r1Wglr0SKePhrfvtt
	 h1zf6inKKRUYw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sjffh-000000007Gd-0eAg;
	Thu, 29 Aug 2024 15:58:45 +0200
Date: Thu, 29 Aug 2024 15:58:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/2] clk: qcom: dispcc-sc7180: Only park display clks
 at init
Message-ID: <ZtB-lZWdRIv3mLFr@hovoldconsulting.com>
References: <20240828171722.1251587-1-swboyd@chromium.org>
 <20240828171722.1251587-2-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828171722.1251587-2-swboyd@chromium.org>

On Wed, Aug 28, 2024 at 10:17:07AM -0700, Stephen Boyd wrote:
> Amit Pundir reports that audio and USB-C host mode stops working on
> sm8550 after commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> registration"). That's because the gcc_usb30_prim_master_clk_src clk is
> registered and clk_rcg2_shared_init() parks it on XO. Running USB at a
> slower speed than the link supports is effectively under-clocking the
> USB link and probably confusing the downstream USB devices.
> 
> We didn't need to change all the shared RCGs to park on XO at
> registration time in commit commit 01a0a6cc8cfd ("clk: qcom: Park shared
> RCGs upon registration"). Instead, we only needed to park the few
> display related clks on sc7180 to fix the issue.
> 
> Fix sm8550 (and likely other qcom SoCs) by skipping the parking part of
> clk_rcg2_shared_init(). Make that the default init clk_op for shared
> RCGs, but keep the part where we cache the config register as that's
> still necessary to figure out the true parent of the clk is. Introduce
> another set of clk_ops 'clk_rcg2_shared_init_park' that does what
> clk_rcg2_shared_init() was doing and use that for the display clks on
> sc7180. This fixes the sm8550 problem and limits the "park upon
> registration" logic to the display clks that need it.
> 
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

I can confirm that this fixes the earlycon issue on x1e80100 that Bryan
reported here:

	https://lore.kernel.org/lkml/20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org/

Perhaps you can drop the "dispcc-sc7180:" prefix from Subject when
applying (or resending) since this fixes a regression on multiple
Qualcomm SoCs. For example, use something like:

	clk: qcom: Only park sc7180 display clks at init

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

