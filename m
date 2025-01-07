Return-Path: <linux-arm-msm+bounces-44199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2CFA04899
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 18:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B17A7A2849
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3531898F8;
	Tue,  7 Jan 2025 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbYVarLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2A15D1;
	Tue,  7 Jan 2025 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272201; cv=none; b=O5aDabeGvY/ldiuhvAxGbSyxzgjkBKzBLBsr6XXDJeiKisqMJkb5VN4dx4OorAvnLwNs9m/XRrWSMICEMNwIuzt6gF/+LvrK4KRpTE0L86k+gzLNOvOMX+ANT9r7yilw43ODJzKtj2I3aFPtpJF+q6eXlEHNokYwKLEicFGo0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272201; c=relaxed/simple;
	bh=QiWd9qO0ZHQDyITcPCRiQrzwNVwwk2Gp/rRGjhwaGt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9kWAyex487XHJtHeF7cdOTatPQhz9nEKEX3MY9GVLgc/GLqJvj6HbBEFGj989Hv5yA1atyjrD72Ma7mpvd5hkcIKVmDpDt7emuufP7Pd7sD7wrKJCpUWFCkY6akEwdqfRmRPQo9X4Ey5d3v6SZIXIrlwyCy6Wr2SazgmoFc9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbYVarLf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34816C4CED6;
	Tue,  7 Jan 2025 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272199;
	bh=QiWd9qO0ZHQDyITcPCRiQrzwNVwwk2Gp/rRGjhwaGt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbYVarLfsZSSPrqg6MkeemWSfWLBm7nWBbKChexDJdX7Nn5X68fU67Ow1nbalIAuL
	 Zyh0tYeH/7DWKsPpNOJkNko3Vd163dqOSmY4nm75+YqPU7BsyXXq3GXPDvzQanQMNB
	 6hlsnpkIpoxNCOvulRXZUQZvFTNb7jtN3mvc9jCaLigRK6S5wt5Dl6mxOI4MG/PBSc
	 cXm+T5fmN9vjTma27+ryw0jLHCV/KXFP9j595DJu93he1OZfJ9cwIsJxaIM+k4q8Ry
	 zSf+lnkzohs+N+rMAWnGaK8+Z7tb9GK0q+SOq3F8QyiUERM9g3X6pKwAi0dUfqFns4
	 GQh3aUs1sruRw==
Date: Tue, 7 Jan 2025 11:49:57 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Georgi Djakov <quic_c_gdjako@quicinc.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, quic_mdtipton@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH v3] clk: qcom: gdsc: Add a flag to skip setting power
 collapse bits
Message-ID: <sfnqygr6rodqidyjo2ighia4pvjhavm4nuijrx7pi62pel7qur@ycpn7qjgnybv>
References: <20241205222156.1880299-1-quic_c_gdjako@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205222156.1880299-1-quic_c_gdjako@quicinc.com>

On Thu, Dec 05, 2024 at 02:21:56PM -0800, Georgi Djakov wrote:
> The sdm845 platforms have a hardware issue that requires keeping
> some of the MMNOC GDSCs in SW collapse mode (which is the power-on

Here you say "keep in SW collapse".

> default). But if some driver tries to use these GDSCs and the mode
> is updated because of runtime pm calls, we may get a board hang.
> Introduce a flag to skip any updates to the power collapse settings
> for the impacted GDSCs to avoid unexpected board hangs.
> 
> Fixes: 7bb38c20f2b6 ("arm64: dts: qcom: sdm845: Add DT nodes for the TBUs")
> Reviewed-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---
> v3:
> - No changes
> 
> v2: https://lore.kernel.org/r/20241009151657.1041691-1-quic_c_gdjako@quicinc.com/
> - Pick up Reviewed-by tag
> - Add Fixes tag
> 
> v1: https://lore.kernel.org/r/20240813120015.3242787-1-quic_c_gdjako@quicinc.com/ 
>  drivers/clk/qcom/gcc-sdm845.c | 6 +++---
>  drivers/clk/qcom/gdsc.c       | 3 +++
>  drivers/clk/qcom/gdsc.h       | 1 +
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index dc3aa7014c3e..019b780e31c8 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3503,7 +3503,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
>  		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | SKIP_SET_COLLAPSE,
>  };
>  
>  static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
> @@ -3512,7 +3512,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
>  		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | SKIP_SET_COLLAPSE,
>  };
>  
>  static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
> @@ -3521,7 +3521,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
>  		.name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | SKIP_SET_COLLAPSE,
>  };
>  
>  static struct clk_regmap *gcc_sdm670_clocks[] = {
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee..4b83cec9137c 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -121,6 +121,9 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
>  	u32 reg, mask;
>  	int ret;
>  
> +	if (sc->flags & SKIP_SET_COLLAPSE)
> +		return 0;

And here you say "skip SW collapse" (well functionally you say skip set
or clear SW collapse, but the constant says "skip set/enter SW collapse").


Do you need to perform the other functions of gdsc_enable() and
gdsc_disable() for these GDSCs?

Is there a reason why we declare PWRSTS_ON and PWRSTS_OFF as valid
states for this GDSCs and then add a quirk/hack at the bottom of the
callstack to not perform the (key) operation?

Regards,
Bjorn

> +
>  	if (sc->collapse_mask) {
>  		reg = sc->collapse_ctrl;
>  		mask = sc->collapse_mask;
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 1e2779b823d1..6bb7e023a19a 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -68,6 +68,7 @@ struct gdsc {
>  #define RETAIN_FF_ENABLE	BIT(7)
>  #define NO_RET_PERIPH	BIT(8)
>  #define HW_CTRL_TRIGGER	BIT(9)
> +#define SKIP_SET_COLLAPSE	BIT(10)
>  	struct reset_controller_dev	*rcdev;
>  	unsigned int			*resets;
>  	unsigned int			reset_count;

