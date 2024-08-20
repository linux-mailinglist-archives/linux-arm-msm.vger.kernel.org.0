Return-Path: <linux-arm-msm+bounces-29080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B82F39582CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6C81C20AD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 09:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4F618C343;
	Tue, 20 Aug 2024 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALSiNT2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89718C332;
	Tue, 20 Aug 2024 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146631; cv=none; b=ODxFQv1QS5icp41YZSxRL6i8gmZovxZsKBere8MwK5MrAcHThJgPi4mbYJmIksDwMaa2IgimOQ581SITe109DgNTrpW5SyDoqmBTzuvGNVu/lQ3aMoYslexlG1tgpaAI9IOFpcPcpRfIK/CwCiprbJYCKp5B4zpr7mG5HH2/dfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146631; c=relaxed/simple;
	bh=27VQnEMdnqOcGlF7LNJhoGhfIvxG5khxXm1G5k4+TBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZKIB7a3dWwhJe7uMbYmSmYPFLLmaIqxtnyjq9jQeJp+yMd0Jt0cPSBSYwR+k2kVqTlLyZP0vB7tOw66+6Wa+h6IYTcov2fhISN+dej2PxYannOVD3waPJV1qFi07U9UrkH5+S/8PBb972B8mKp9BLUnelF5QwoeYvmRpS72+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALSiNT2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE989C4AF0F;
	Tue, 20 Aug 2024 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724146631;
	bh=27VQnEMdnqOcGlF7LNJhoGhfIvxG5khxXm1G5k4+TBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALSiNT2yd7HBz2jpgfAZUiv/N9akqjpIfqYDV2dGBAQxcGOvvtNzRQw/6ZGrTz+7n
	 od3kHyuyX1kOEGTcaPT5TBPArVDBKT2OAm/BaNLKVmpYkoBFHidxSRVXawekbFZpJv
	 zXtPypbCl/B2PA1Xp/d1hFS+PHO2+AmFL3ycIO8Q47dFIc0Gd+DWH8MYUeLjU6fhD5
	 kA2+Yfz5UOIJcK09FP4b+aSPlaqt/MeORAPj/8L9MZiyRXWwPovpTuiuf1yvMG38QM
	 LcjfZwayQWMBxQ+awv7SpTKVAqBzlig1Wk1dAVwbyS/VPh+hU7Pen00cVkbw1q35d7
	 jsBuwuX10CFHg==
Message-ID: <f608289a-3e84-4ef4-8ced-2c615a67dd55@kernel.org>
Date: Tue, 20 Aug 2024 11:37:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] ASoC: qcom: apq8016_sbc.c: Add Quinary support
To: Adam Skladowski <a39.skl@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2024 5:25 PM, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3023cf180a75..5a29adbd3f82 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -20,12 +20,13 @@
>  #include "common.h"
>  #include "qdsp6/q6afe.h"
>  
> -#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
> +#define MI2S_COUNT  (MI2S_QUINARY + 1)
>  
>  struct apq8016_sbc_data {
>  	struct snd_soc_card card;
>  	void __iomem *mic_iomux;
>  	void __iomem *spkr_iomux;
> +	void __iomem *quin_iomux;
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
>  	int mi2s_clk_count[MI2S_COUNT];
> @@ -86,6 +87,12 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
>  			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
>  			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
>  		break;
> +	case MI2S_QUINARY:
> +		/* Configure Quinary MI2S */
> +		if (!pdata->quin_iomux)
> +			return -ENOENT;
> +		writel(readl(pdata->quin_iomux) | 0x01, pdata->quin_iomux);

I'm nitpicking, but 0x01 here is BIT(0)

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

