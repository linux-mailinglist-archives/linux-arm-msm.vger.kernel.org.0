Return-Path: <linux-arm-msm+bounces-44168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C48FA045BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 559957A13A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BAE1F4293;
	Tue,  7 Jan 2025 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftY7yf4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F303F12B93;
	Tue,  7 Jan 2025 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266518; cv=none; b=U82A/tO2iJ+3YW9IYFRBHmAgBrjm0+BHI5Kgg+J3QebkpCDyBhTg6C5kfRZPAOVOVnxfMGZdI9KdCM1UwWsI3V6rYuawfVj1i7w5WCXx8oEySm4bPq32LTGLu99xkiMCNCe/hU/2rC1XgBhcC6qe1VsxEDEF+hLnzPcSce/0m28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266518; c=relaxed/simple;
	bh=XRDy10K+AyF9yTEhr8OnnrrKoUNY7s1U01ZzDm3fB2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKr3jfFD0MeqsRvt5B1R5G/hhCdLb/ehGi9c8Mzj41i1Ubfc42ToE5+er/yXwImQImGbK1wq9D8/33HpTiekCxYBtSRQ+aVL9FU8AePRPsHxonBe8e6pWV/FZ+RGwN1vCU+7iN1BKKKVjidT45AOaJ15baEUv6MDpibhh++nSG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftY7yf4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0F5C4CED6;
	Tue,  7 Jan 2025 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736266517;
	bh=XRDy10K+AyF9yTEhr8OnnrrKoUNY7s1U01ZzDm3fB2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftY7yf4PRN5KOIaLmKPtadqrBRROmBldL1iOSwlqgyu6+jb054bYX2m70B6AU+cjj
	 PBoKNebh/cttAMSSyMxj3BZkGxbYNqc1FZFwki/lR0GPnqxY1HMHbtZIUh2s9yr3g5
	 nzNpHLI9HJ+C+8vRtF6mHqqMPKIY2A3TYjcVloa1JQGwwk8PFnLwujARvExL8amwA2
	 MwU+glt4uxTEdtyAwBWQqAF+xGYKTk1nulZKD2bO1ovcHhH8diYHfh9OEZmZ05u30u
	 Q4nP+6Cn31HuEqvlBCh7lGDMZRblR0FpcVVsc+YX+3OU6gqCsCua5ru4jXvV7BL+rR
	 0udURGXfu+8QQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVCEe-000000000dm-0CIQ;
	Tue, 07 Jan 2025 17:15:16 +0100
Date: Tue, 7 Jan 2025 17:15:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Do not turn off usb_2
 controller GDSC
Message-ID: <Z31TFHg6SzY6LvUv@hovoldconsulting.com>
References: <20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-v1-1-e15d1a5e7d80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-v1-1-e15d1a5e7d80@linaro.org>

On Tue, Jan 07, 2025 at 05:55:23PM +0200, Abel Vesa wrote:
> Allowing the usb_2 controller GDSC to be turned off during system suspend
> renders the controller unable to resume.
> 
> So use PWRSTS_RET_ON instead in order to make sure this the GDSC doesn't
> go down.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Cc: stable@vger.kernel.org      # 6.8
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 8ea25aa25dff043ab4a81fee78b6173139f871b6..7288af845434d824eb91489ab97be25d665cad3a 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -6083,7 +6083,7 @@ static struct gdsc gcc_usb20_prim_gdsc = {
>  	.pd = {
>  		.name = "gcc_usb20_prim_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };

This does the trick and matches what we do for the other controllers:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

