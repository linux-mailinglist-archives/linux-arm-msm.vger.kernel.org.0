Return-Path: <linux-arm-msm+bounces-44154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED5A043B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58A83A2DCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1E11F2362;
	Tue,  7 Jan 2025 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cps1BWbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEFF1F131F;
	Tue,  7 Jan 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262456; cv=none; b=ruPEQjddvgzP7638LcLZMLQoTUeJ0YUNjol+wCwC4HpTYm+WV0SnJWE0C0UKtCEqkl6alkDbHdmux5S7DkzHDpF30RZDmyRzQyejW6+vQkWfUulA6G68IqYCIuiwcIPvNg7zVYJO3+Wq0VHMuU959i4RQ0xQe1veDGYTg04+TfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262456; c=relaxed/simple;
	bh=wjlKPk4Qu042U6KjaRkIyNF6oWv4wUq/wNI/EplKxMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMss7aIzqZJTgO2smx69uZeRhiEpVXmKGawk8COjI56ugatvK9Rwn2n5O3XqG52iQCPs7ftbKBmb5WiX27w6AUyXuRm9rmgCxhHiElVMhkZvC+JllgMmkWrjkAyCdbALLal9T2kO6QGfvDSoq1JIE/rLUImiklQd7FldSicJsE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cps1BWbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930F5C4CEDF;
	Tue,  7 Jan 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736262456;
	bh=wjlKPk4Qu042U6KjaRkIyNF6oWv4wUq/wNI/EplKxMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cps1BWbb53THqvJlQfzJCIfNxBcIzcrVwDah/7t3G2jQOePV5dtxXuqmy5PoE6lHB
	 N134lPkZ2z06yfW7nZpANUGtG5rOplOyrNnpgbh2VWD1PUtASZm5yQ3tHybLF7PfJL
	 Lyq/QcCbY/jpYfc7AHzvr6TJFPGltcurHQaENVXUuFQ7OwgXK0iV6I6RrHTIXB1TO3
	 DbWfBx/HjmoRLohphvvDDcVHD0F3C2dzCIehBgzENrrHhB+hmd8ok4BBhitheuCbmG
	 8JBoo7kXVt+wyTDEeCyCls/hNi++HF4Cw/gOJTZi6hZy8tN0FuklHbZNc59Rj6Zy6t
	 G1gBe/c/dV1rQ==
Message-ID: <29eaebd2-dc69-4576-892f-71ef859e5ae0@kernel.org>
Date: Tue, 7 Jan 2025 17:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: gdsc: Add a flag to skip setting power
 collapse bits
To: andersson@kernel.org
Cc: sboyd@kernel.org, mturquette@baylibre.com, quic_mdtipton@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Georgi Djakov <quic_c_gdjako@quicinc.com>
References: <20241205222156.1880299-1-quic_c_gdjako@quicinc.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20241205222156.1880299-1-quic_c_gdjako@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6.12.24 0:21, Georgi Djakov wrote:
> The sdm845 platforms have a hardware issue that requires keeping
> some of the MMNOC GDSCs in SW collapse mode (which is the power-on
> default). But if some driver tries to use these GDSCs and the mode
> is updated because of runtime pm calls, we may get a board hang.
> Introduce a flag to skip any updates to the power collapse settings
> for the impacted GDSCs to avoid unexpected board hangs.
> 
> Fixes: 7bb38c20f2b6 ("arm64: dts: qcom: sdm845: Add DT nodes for the TBUs")
> Reviewed-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>

Gentle ping... as this is pending for a while. Are there any comments?
Can it be applied?

Thanks,
Georgi

> ---
> v3:
> - No changes
> 
> v2: https://lore.kernel.org/r/20241009151657.1041691-1-quic_c_gdjako@quicinc.com/
> - Pick up Reviewed-by tag
> - Add Fixes tag
> 
> v1: https://lore.kernel.org/r/20240813120015.3242787-1-quic_c_gdjako@quicinc.com/
>   drivers/clk/qcom/gcc-sdm845.c | 6 +++---
>   drivers/clk/qcom/gdsc.c       | 3 +++
>   drivers/clk/qcom/gdsc.h       | 1 +
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index dc3aa7014c3e..019b780e31c8 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3503,7 +3503,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
>   		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | SKIP_SET_COLLAPSE,
>   };
>   
>   static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
> @@ -3512,7 +3512,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
>   		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | SKIP_SET_COLLAPSE,
>   };
>   
>   static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
> @@ -3521,7 +3521,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
>   		.name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | SKIP_SET_COLLAPSE,
>   };
>   
>   static struct clk_regmap *gcc_sdm670_clocks[] = {
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee..4b83cec9137c 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -121,6 +121,9 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
>   	u32 reg, mask;
>   	int ret;
>   
> +	if (sc->flags & SKIP_SET_COLLAPSE)
> +		return 0;
> +
>   	if (sc->collapse_mask) {
>   		reg = sc->collapse_ctrl;
>   		mask = sc->collapse_mask;
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 1e2779b823d1..6bb7e023a19a 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -68,6 +68,7 @@ struct gdsc {
>   #define RETAIN_FF_ENABLE	BIT(7)
>   #define NO_RET_PERIPH	BIT(8)
>   #define HW_CTRL_TRIGGER	BIT(9)
> +#define SKIP_SET_COLLAPSE	BIT(10)
>   	struct reset_controller_dev	*rcdev;
>   	unsigned int			*resets;
>   	unsigned int			reset_count;


