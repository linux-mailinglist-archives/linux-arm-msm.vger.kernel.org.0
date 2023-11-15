Return-Path: <linux-arm-msm+bounces-742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3667ED62E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 22:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B9961C208D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 21:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C76D45BF6;
	Wed, 15 Nov 2023 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
X-Greylist: delayed 424 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Nov 2023 13:47:19 PST
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3AEE1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 13:47:19 -0800 (PST)
Received: from [192.168.2.123] (adsl-dyn116.78-98-216.t-com.sk [78.98.216.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 361463F90A;
	Wed, 15 Nov 2023 22:40:10 +0100 (CET)
Date: Wed, 15 Nov 2023 22:40:03 +0100
From: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, Aboothahir U <aboothahirpkd@gmail.com>
Message-Id: <RIP64S.FSFY9A8F2ENE1@somainline.org>
In-Reply-To: <20231115205318.2536441-1-pvorel@suse.cz>
References: <20231115205318.2536441-1-pvorel@suse.cz>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed



On Wed, Nov 15 2023 at 09:53:18 PM +01:00:00, Petr Vorel 
<pvorel@suse.cz> wrote:
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
> NOTE motivation for this is that some not yet mainlined DTS already 
> use
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
> diff --git a/arch/arm64/configs/defconfig 
> b/arch/arm64/configs/defconfig
> index acba803835b9..10a098aa8b1b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
>  CONFIG_SC_GCC_8280XP=y
>  CONFIG_SC_GPUCC_8280XP=m
>  CONFIG_SC_LPASSCC_8280XP=m
> +CONFIG_SDM_MMCC_660=m
> +CONFIG_SDM_GPUCC_660=y
>  CONFIG_SDM_CAMCC_845=m
>  CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
> --
> 2.42.0
> 
Reviewed-by: Martin Botka <martin.botka@somainline.org>

Cheers,
Martin



