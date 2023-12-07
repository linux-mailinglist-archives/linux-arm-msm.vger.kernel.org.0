Return-Path: <linux-arm-msm+bounces-3747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5024808D5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FD1028197B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207B446B95;
	Thu,  7 Dec 2023 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFf9VwLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0433D44C8F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED81AC433C7;
	Thu,  7 Dec 2023 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701966432;
	bh=iRn9oWHcbr7r25lixPwsRXI+r6e8VoaRkje1GjzXFuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFf9VwLL3+IC4cF2DGZhvURnkh0Ou/FEsaTJSLG2NJmdfrR+CEk91fuGAr0GX39KD
	 MWGq1eZccAQBBrOK1bb0SYJoUghlth6AxY9bJI3+7nGKRAR6fr7uKQ6se+em6+mpUC
	 fRBIhcM2Zg1TOs+kSyp2vnr7gyyouWz3/FoQOy/u2/US9qFRls1u+5fSIyGMvEFUwM
	 bCOJNawqeuTsojwXzVqdm1sKV/cbaNIt8/YEWj3NpkVXaaZrllW+dMiiWmtC95vRvu
	 Edy4abQ244HJm7BiybrzutlUrZcUlLYg9Rz/dkxzO+EQpQi5uV+6LqU1/Avj3UFYLV
	 wgX4EvJW+zGLA==
Date: Thu, 7 Dec 2023 08:30:31 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>, 
	Martin Botka <martin.botka@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Aboothahir U <aboothahirpkd@gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
Message-ID: <2bferiemkljxua63v6ogifpzhlbj6m2gycxrbitgmc3ybj2a4p@7kfnzcrjj6jr>
References: <20231115205318.2536441-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115205318.2536441-1-pvorel@suse.cz>

On Wed, Nov 15, 2023 at 09:53:18PM +0100, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Enable support for the multimedia clock controller on SDM660 devices
> and graphics clock controller on SDM630/636/660 devices.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * added commit message (not just the subject)
> 
> NOTE motivation for this is that some not yet mainlined DTS already use
> both:
> 
> https://github.com/sdm660-mainline/linux/blob/sdm660-next-stable/arch/arm64/boot/dts/qcom/sdm636-asus-x00td.dts
> 
> Kind regards,
> Petr
> 
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index acba803835b9..10a098aa8b1b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
>  CONFIG_SC_GCC_8280XP=y
>  CONFIG_SC_GPUCC_8280XP=m
>  CONFIG_SC_LPASSCC_8280XP=m
> +CONFIG_SDM_MMCC_660=m
> +CONFIG_SDM_GPUCC_660=y

I'd expect the GPU clock controller to be a module, can you please
clarify why it needs to be builtin?

Regards,
Bjorn

>  CONFIG_SDM_CAMCC_845=m
>  CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
> -- 
> 2.42.0
> 

