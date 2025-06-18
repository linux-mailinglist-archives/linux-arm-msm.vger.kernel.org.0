Return-Path: <linux-arm-msm+bounces-61656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71984ADE1AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 05:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 990CA189586E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 03:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF0E1A314E;
	Wed, 18 Jun 2025 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ljch38BI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D7192D8A;
	Wed, 18 Jun 2025 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750217628; cv=none; b=MVjGPe6cLoRPmvflSqo18Ay/qb9iP06xZ1IRtRY6njMVGdMGCMl3qU2Ns1XiYJo96maCnF2cdk0C2fEeVGjVMkS7y4Iaohprxd1gp7B6WDwca5NDDwq61/g1VNlpGP6WDZYuHPUOZkU4tUtqX6vMNI1rfA9M/noEb9qRPeWXKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750217628; c=relaxed/simple;
	bh=3VvqmFIUqdeyjynHMuuFCh4mFv5QeHs7/Dxti4jBakM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II48+JE1Gd8hF1sO398a3zZUqFMmAQW9sg5iE/bwLud7ymZAXtk6KSDmDBiirPPVQ6Mvnu8l0Lt6VgbzUL143tmfX+/g18aYoQhhtuP8Mgn3jlHmkHGljrSItsFByMTeLu8AgYzZCxZ/uceeFCojsEibZbstUPNcfuQhkBlfigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ljch38BI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B8FC4CEE7;
	Wed, 18 Jun 2025 03:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750217628;
	bh=3VvqmFIUqdeyjynHMuuFCh4mFv5QeHs7/Dxti4jBakM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ljch38BIGCwmNG61wGiFvAlskwCKR98dsG8dgjojBEopxMMpMWKn4l/ZXuvwZ+Fjw
	 SsJnu17Li2suwRd0llS9BWYR5yvguYJsgM8DPCLwejOXuVy7gs8TDHHpCRKzlK2Yuo
	 t6HzznIhmuKSP6wsYlAzlHChRdcghYwOhRd3qlS6aJ2Kr08TPqHfbfzIi2+rkEg7NM
	 fSkEUED3m0pqyDCxLoDqOIyLvZu8htd45Ck4r4k3JclysCFymCYwJzijJMTAQgY3aS
	 F1IYZ1VXCveyXZfV81jQhQaIBvvrzczZ+dpIaGzPan1sqrWdaNer45RB9Asx7zUVqr
	 jksN+MuFJ3JQw==
Date: Tue, 17 Jun 2025 22:33:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: george.moussalem@outlook.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luo Jie <quic_luoj@quicinc.com>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] clk: qcom: ipq5018: keep XO clock always on
Message-ID: <wao5fe7nbupujho3ql46ctvbqhe6y2adzqrtbyxqgfja6oriwt@nekluv75lcze>
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
 <20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com>

On Fri, May 16, 2025 at 04:36:08PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled to avoid the kernel trying to disable
> the it. As such, keep the XO clock always on by flagging it as critical.
> 

Is there any reason for us to model this clock in Linux, if we're not
allowed to touch it?

CLK_IS_CRITICAL has side effect on the runtime PM state of the clock
controller, so would be nice if we can avoid that.

Regards,
Bjorn

> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> The kernel will panic when parenting it under the CMN PLL reference
> clock and the below message will appear in the kernel logs.
> 
> [    0.916515] ------------[ cut here ]------------
> [    0.918890] gcc_xo_clk_src status stuck at 'on'
> [    0.918944] WARNING: CPU: 0 PID: 8 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x114/0x124
> [    0.927926] Modules linked in:
> [    0.936945] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.74 #0
> [    0.939982] Hardware name: Linksys MX2000 (DT)
> [    0.946151] Workqueue: pm pm_runtime_work
> [    0.950489] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.954566] pc : clk_branch_wait+0x114/0x124
> [    0.961335] lr : clk_branch_wait+0x114/0x124
> [    0.965849] sp : ffffffc08181bb50
> [    0.970101] x29: ffffffc08181bb50 x28: 0000000000000000 x27: 61c8864680b583eb
> [    0.973317] x26: ffffff801fec2168 x25: ffffff800000abc0 x24: 0000000000000002
> [    0.980437] x23: ffffffc0809f6fd8 x22: 0000000000000000 x21: ffffffc08044193c
> [    0.985276] loop: module loaded
> [    0.987554] x20: 0000000000000000 x19: ffffffc081749278 x18: 000000000000007c
> [    0.987573] x17: 0000000091706274 x16: 000000001985c4f7 x15: ffffffc0816bbdf0
> [    0.987587] x14: 0000000000000174 x13: 000000000000007c x12: 00000000ffffffea
> [    0.987601] x11: 00000000ffffefff x10: ffffffc081713df0 x9 : ffffffc0816bbd98
> [    0.987615] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
> [    1.026268] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc08181b950
> [    1.033385] x2 : ffffffc0816bbd30 x1 : ffffffc0816bbd30 x0 : 0000000000000023
> [    1.040507] Call trace:
> [    1.047618]  clk_branch_wait+0x114/0x124
> [    1.049875]  clk_branch2_disable+0x2c/0x3c
> [    1.054043]  clk_core_disable+0x60/0xac
> [    1.057948]  clk_core_disable+0x68/0xac
> [    1.061681]  clk_disable+0x30/0x4c
> [    1.065499]  pm_clk_suspend+0xd4/0xfc
> [    1.068971]  pm_generic_runtime_suspend+0x2c/0x44
> [    1.072705]  __rpm_callback+0x40/0x1bc
> [    1.077392]  rpm_callback+0x6c/0x78
> [    1.081038]  rpm_suspend+0xf0/0x5c0
> [    1.084423]  pm_runtime_work+0xf0/0xfc
> [    1.087895]  process_one_work+0x17c/0x2f8
> [    1.091716]  worker_thread+0x2e8/0x4d4
> [    1.095795]  kthread+0xdc/0xe0
> [    1.099440]  ret_from_fork+0x10/0x20
> [    1.102480] ---[ end trace 0000000000000000 ]---
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..24eb4c40da63462077ee2e5714e838aa30ced2e3 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -1371,7 +1371,7 @@ static struct clk_branch gcc_xo_clk = {
>  				&gcc_xo_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> 
> -- 
> 2.49.0
> 
> 

