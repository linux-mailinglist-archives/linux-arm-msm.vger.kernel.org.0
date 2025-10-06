Return-Path: <linux-arm-msm+bounces-76115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95893BBFA5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52094189DB1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EC21F1302;
	Mon,  6 Oct 2025 22:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAHS72x4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A22D1D432D;
	Mon,  6 Oct 2025 22:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759788803; cv=none; b=U0JADolXhr7mOAMT4Bxlmf26CxfYwV6SD6v7JX15dRE8AhgQhIKz1UrV9asqQUrBvjd3mQcMHrH3S6vNUV001EQCkWF8xC1qkYXZcYvWHr6o9UbJ2T0XStiCOxvqrhrVGs1rlwQ1k5YpVZ4w7hJlNZwCuLQT32Niyi+ev3PfTA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759788803; c=relaxed/simple;
	bh=pFByFUqx//4vtOFebjSMU4azndbCsabj7cA0kq4IOvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kzcv8GD7NfO7lM1HOgc0SXoba5JDaVbI2qgyyGPBxjR4FM14pIl4FDYGR/1egY28f8+ySo6xKl+tHmTvmnQqs3bFPBHJUYIsE/OQkzTNvv3MK8DBG66Mghg2MSuosAIlvpvqqO+u4uW089A3DJiKDFJOnI4I1zTVgoom23fgkns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAHS72x4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4C1C4CEF5;
	Mon,  6 Oct 2025 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759788802;
	bh=pFByFUqx//4vtOFebjSMU4azndbCsabj7cA0kq4IOvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JAHS72x40nYaajYrWrWJptrd4ouCtSi5rNSeOJ9ByVpNZ4NEBAc6YhODWkssHaEMD
	 QJNSUZBQ8GDQOlqivjMAzemHOE2c78WYl/sUoN0ZOllPHGc7vCFudikEvdJIIvxscw
	 VhLIJfuYDFJkAt6oyhyUhNSr3hOMTu6r49qHpjFe3p7YgPvqbk/659ZjMGiv7LSlCE
	 SwfsKD/maCXoi9jKwh2ToEa6Nn3yc1pq4mtukEWPzXMahbgIgKllVFIFBV8Ijly5M2
	 h9eQtIkijhrLPLIOrEspKxTB/mac2911bzgbbkTWHbK1qMP2HfB+PaQRrV5u6y5tYw
	 Ps+AlbNyobrTQ==
Message-ID: <0e8d380f-87fb-4b90-805a-3fd7d59c10e6@kernel.org>
Date: Mon, 6 Oct 2025 23:13:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK
 clock IDs
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-1-184b15a87e0a@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-1-184b15a87e0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/6/25 7:37 PM, Neil Armstrong wrote:
> Add the missing MCLK ids for the q6prm DSP interface.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48ab0040bc39ae16ec324b41dfc152b408..51b131fa95316cff50342ff60bfc9e3608939d6c 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a32086fe105e32c4fd713b8e0a3d17b83bca..7a3f2ad7bbd465a6950568af1ff3839e5cbe4f62 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -52,6 +52,17 @@
>  /* Clock ID for QUINARY MI2S OSR CLK  */
>  #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>  
> +/* Clock ID for MCLK1 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
> +/* Clock ID for MCLK2 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
> +/* Clock ID for MCLK3 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
> +/* Clock ID for MCLK4 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
> +/* Clock ID for MCLK5 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x305

This is 0x304.

Once fixed:

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
> +
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
>  
> 


