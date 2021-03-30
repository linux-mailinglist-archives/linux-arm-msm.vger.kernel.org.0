Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA43034E408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 11:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhC3JIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 05:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhC3JIi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 05:08:38 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995CAC061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 02:08:34 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ap14so10560798ejc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/eqR/g4dGWafdF3bo4TemakWiaBabfCWwqaWK3tpTqo=;
        b=wR0tOtbZAeOW2MSbinTo9CpuzhtzAXmX8ZZBPgjlR91ZplMhIzXsACCNLyxMYieomd
         prJMQNmN1r0Dd+S1o3J9udQW8C7q1ksTs1c8pVtBVnLTSSdTYrLOrP3KEDER8/M6AbwW
         1iMODhiXBA0GwTF+AoIUsljoCDlFekdZKLNBdhBBTMpaTt/VAuksij/5d8InA88gGoHt
         qzLd5eO6fQ2Dqhxz4qd36ku0diQ3XMK+jImcdW1e12DKCoAA0VUoJY6BDlm9cOItue+N
         dkV1PiOvOlXm83KJACv8ORzrxwqu5MF2PDh3cl7E79GS691haPEIlDgpVyoc2GvbjjSz
         XhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/eqR/g4dGWafdF3bo4TemakWiaBabfCWwqaWK3tpTqo=;
        b=Mt3zTwBDE1q3ABnv55IRy7mTwZyPSu1zImzqmHCs1efQFNrUgbqAGNAFzkqHDwySFe
         rV3zhOe7rgclapv2igQCS0ee39fm7jl7PlEOETbIQ4FkSC75IZz8uRxtLWKth5NWkyaz
         VMGmGqalH8dZH6iC+91B3ZzW145YRhU796R0ljNS7qCrejrOHzbkR/u7I5232tN+Lqgh
         8WDg5/wpXUxr7fcgXlBssaoxXoLDbx6jG2KOhUnUDJq5FVLVTYaqvnz+QDt16UpXttd8
         GYyPcbfaOfU22XtM9++dn60ETjnwP3J+9RSCCoZjhH+f9SP4u4ttdMlO+QCBcIBchDKF
         Ihxw==
X-Gm-Message-State: AOAM531YdyC9kl+ODR2UbiQjawI1F7JXwwDEt5JSayWrm9x62B3KkmOl
        aIE0h+kaXqX+TceOK3MQlvjnag==
X-Google-Smtp-Source: ABdhPJz/7asF1GdAVv322WqculaCFkc4tIsDjNj4rHsPiY0qx06pw6nY9zvYgztYrCvtTeVw6SGGOQ==
X-Received: by 2002:a17:906:f9d8:: with SMTP id lj24mr32579966ejb.200.1617095313267;
        Tue, 30 Mar 2021 02:08:33 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id i10sm9652676ejv.106.2021.03.30.02.08.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 02:08:32 -0700 (PDT)
Subject: Re: [PATCH] ASoC: q6afe-clocks: fix reprobing of the driver
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
References: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0f41669c-c8e5-a2e2-f6ce-cdff066b26f3@linaro.org>
Date:   Tue, 30 Mar 2021 10:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Dmitry for looking at this,

On 27/03/2021 09:28, Dmitry Baryshkov wrote:
> Q6afe-clocks driver can get reprobed. For example if the APR services
> are restarted after the firmware crash. However currently Q6afe-clocks
> driver will oops because hw.init will get cleared during first _probe
> call. Rewrite the driver to fill the clock data at runtime rather than
> using big static array of clocks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

>   sound/soc/qcom/qdsp6/q6afe-clocks.c | 209 ++++++++++++++--------------
>   sound/soc/qcom/qdsp6/q6afe.c        |   2 +-
>   sound/soc/qcom/qdsp6/q6afe.h        |   2 +-
>   3 files changed, 108 insertions(+), 105 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
> index f0362f061652..9431656283cd 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
> @@ -11,33 +11,29 @@
>   #include <linux/slab.h>
>   #include "q6afe.h"
>   
> -#define Q6AFE_CLK(id) &(struct q6afe_clk) {		\
> +#define Q6AFE_CLK(id) {					\
>   		.clk_id	= id,				\
>   		.afe_clk_id	= Q6AFE_##id,		\
>   		.name = #id,				\
> -		.attributes = LPASS_CLK_ATTRIBUTE_COUPLE_NO, \
>   		.rate = 19200000,			\
> -		.hw.init = &(struct clk_init_data) {	\
> -			.ops = &clk_q6afe_ops,		\
> -			.name = #id,			\
> -		},					\
>   	}
>   
> -#define Q6AFE_VOTE_CLK(id, blkid, n) &(struct q6afe_clk) { \
> +#define Q6AFE_VOTE_CLK(id, blkid, n) {			\
>   		.clk_id	= id,				\
>   		.afe_clk_id = blkid,			\
> -		.name = #n,				\
> -		.hw.init = &(struct clk_init_data) {	\
> -			.ops = &clk_vote_q6afe_ops,	\
> -			.name = #id,			\
> -		},					\
> +		.name = n,				\
>   	}
>   
> -struct q6afe_clk {
> -	struct device *dev;
> +struct q6afe_clk_init {
>   	int clk_id;
>   	int afe_clk_id;
>   	char *name;
> +	int rate;
> +};
> +
> +struct q6afe_clk {
> +	struct device *dev;
> +	int afe_clk_id;
>   	int attributes;
>   	int rate;
>   	uint32_t handle;
> @@ -48,8 +44,7 @@ struct q6afe_clk {
>   
>   struct q6afe_cc {
>   	struct device *dev;
> -	struct q6afe_clk **clks;
> -	int num_clks;
> +	struct q6afe_clk *clks[Q6AFE_MAX_CLK_ID];
>   };
>   
>   static int clk_q6afe_prepare(struct clk_hw *hw)
> @@ -105,7 +100,7 @@ static int clk_vote_q6afe_block(struct clk_hw *hw)
>   	struct q6afe_clk *clk = to_q6afe_clk(hw);
>   
>   	return q6afe_vote_lpass_core_hw(clk->dev, clk->afe_clk_id,
> -					clk->name, &clk->handle);
> +					clk_hw_get_name(&clk->hw), &clk->handle);
>   }
>   
>   static void clk_unvote_q6afe_block(struct clk_hw *hw)
> @@ -120,84 +115,76 @@ static const struct clk_ops clk_vote_q6afe_ops = {
>   	.unprepare	= clk_unvote_q6afe_block,
>   };
>   
> -static struct q6afe_clk *q6afe_clks[Q6AFE_MAX_CLK_ID] = {
> -	[LPASS_CLK_ID_PRI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
> -	[LPASS_CLK_ID_PRI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
> -	[LPASS_CLK_ID_SEC_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
> -	[LPASS_CLK_ID_SEC_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
> -	[LPASS_CLK_ID_TER_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
> -	[LPASS_CLK_ID_TER_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
> -	[LPASS_CLK_ID_QUAD_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
> -	[LPASS_CLK_ID_QUAD_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
> -	[LPASS_CLK_ID_SPEAKER_I2S_IBIT] =
> -				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
> -	[LPASS_CLK_ID_SPEAKER_I2S_EBIT] =
> -				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
> -	[LPASS_CLK_ID_SPEAKER_I2S_OSR] =
> -				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
> -	[LPASS_CLK_ID_QUI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
> -	[LPASS_CLK_ID_QUI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
> -	[LPASS_CLK_ID_SEN_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
> -	[LPASS_CLK_ID_SEN_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
> -	[LPASS_CLK_ID_INT0_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT1_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT2_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT3_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT4_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT5_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT6_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
> -	[LPASS_CLK_ID_QUI_MI2S_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> -	[LPASS_CLK_ID_PRI_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_IBIT),
> -	[LPASS_CLK_ID_PRI_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_EBIT),
> -	[LPASS_CLK_ID_SEC_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_IBIT),
> -	[LPASS_CLK_ID_SEC_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_EBIT),
> -	[LPASS_CLK_ID_TER_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_IBIT),
> -	[LPASS_CLK_ID_TER_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_EBIT),
> -	[LPASS_CLK_ID_QUAD_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_IBIT),
> -	[LPASS_CLK_ID_QUAD_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_EBIT),
> -	[LPASS_CLK_ID_QUIN_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_IBIT),
> -	[LPASS_CLK_ID_QUIN_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_EBIT),
> -	[LPASS_CLK_ID_QUI_PCM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_PCM_OSR),
> -	[LPASS_CLK_ID_PRI_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_IBIT),
> -	[LPASS_CLK_ID_PRI_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_EBIT),
> -	[LPASS_CLK_ID_SEC_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_IBIT),
> -	[LPASS_CLK_ID_SEC_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_EBIT),
> -	[LPASS_CLK_ID_TER_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_IBIT),
> -	[LPASS_CLK_ID_TER_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_EBIT),
> -	[LPASS_CLK_ID_QUAD_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_IBIT),
> -	[LPASS_CLK_ID_QUAD_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_EBIT),
> -	[LPASS_CLK_ID_QUIN_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_IBIT),
> -	[LPASS_CLK_ID_QUIN_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_EBIT),
> -	[LPASS_CLK_ID_QUIN_TDM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_OSR),
> -	[LPASS_CLK_ID_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_1),
> -	[LPASS_CLK_ID_MCLK_2] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_2),
> -	[LPASS_CLK_ID_MCLK_3] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_3),
> -	[LPASS_CLK_ID_MCLK_4] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_4),
> -	[LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE] =
> -		Q6AFE_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
> -	[LPASS_CLK_ID_INT_MCLK_0] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_0),
> -	[LPASS_CLK_ID_INT_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_1),
> -	[LPASS_CLK_ID_WSA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
> -	[LPASS_CLK_ID_WSA_CORE_NPL_MCLK] =
> -				Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
> -	[LPASS_CLK_ID_VA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> -	[LPASS_CLK_ID_TX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
> -	[LPASS_CLK_ID_TX_CORE_NPL_MCLK] =
> -			Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
> -	[LPASS_CLK_ID_RX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
> -	[LPASS_CLK_ID_RX_CORE_NPL_MCLK] =
> -				Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
> -	[LPASS_CLK_ID_VA_CORE_2X_MCLK] =
> -				Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
> -	[LPASS_HW_AVTIMER_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
> -						 Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
> -						 "LPASS_AVTIMER_MACRO"),
> -	[LPASS_HW_MACRO_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
> -						Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
> -						"LPASS_HW_MACRO"),
> -	[LPASS_HW_DCODEC_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
> -					Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
> -					"LPASS_HW_DCODEC"),
> +static const struct q6afe_clk_init q6afe_clks[] = {
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_PCM_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_4),
> +	Q6AFE_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_0),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_1),
> +	Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
> +	Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
> +		       Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
> +		       "LPASS_AVTIMER_MACRO"),
> +	Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
> +		       Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
> +		       "LPASS_HW_MACRO"),
> +	Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
> +		       Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
> +		       "LPASS_HW_DCODEC"),
>   };
>   
>   static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
> @@ -207,7 +194,7 @@ static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
>   	unsigned int idx = clkspec->args[0];
>   	unsigned int attr = clkspec->args[1];
>   
> -	if (idx >= cc->num_clks || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
> +	if (idx >= Q6AFE_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
>   		dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
>   		return ERR_PTR(-EINVAL);
>   	}
> @@ -230,20 +217,36 @@ static int q6afe_clock_dev_probe(struct platform_device *pdev)
>   	if (!cc)
>   		return -ENOMEM;
>   
> -	cc->clks = &q6afe_clks[0];
> -	cc->num_clks = ARRAY_SIZE(q6afe_clks);
> +	cc->dev = dev;
>   	for (i = 0; i < ARRAY_SIZE(q6afe_clks); i++) {
> -		if (!q6afe_clks[i])
> -			continue;
> +		unsigned int id = q6afe_clks[i].clk_id;
> +		struct clk_init_data init = {
> +			.name =  q6afe_clks[i].name,
> +		};
> +		struct q6afe_clk *clk;
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		clk->dev = dev;
> +		clk->afe_clk_id = q6afe_clks[i].afe_clk_id;
> +		clk->rate = q6afe_clks[i].rate;
> +		clk->hw.init = &init;
> +
> +		if (clk->rate)
> +			init.ops = &clk_q6afe_ops;
> +		else
> +			init.ops = &clk_vote_q6afe_ops;
>   
> -		q6afe_clks[i]->dev = dev;
> +		cc->clks[id] = clk;
>   
> -		ret = devm_clk_hw_register(dev, &q6afe_clks[i]->hw);
> +		ret = devm_clk_hw_register(dev, &clk->hw);
>   		if (ret)
>   			return ret;
>   	}
>   
> -	ret = of_clk_add_hw_provider(dev->of_node, q6afe_of_clk_hw_get, cc);
> +	ret = devm_of_clk_add_hw_provider(dev, q6afe_of_clk_hw_get, cc);
>   	if (ret)
>   		return ret;
>   
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index cad1cd1bfdf0..4327b72162ec 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1681,7 +1681,7 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>   EXPORT_SYMBOL(q6afe_unvote_lpass_core_hw);
>   
>   int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
> -			     char *client_name, uint32_t *client_handle)
> +			     const char *client_name, uint32_t *client_handle)
>   {
>   	struct q6afe *afe = dev_get_drvdata(dev->parent);
>   	struct afe_cmd_remote_lpass_core_hw_vote_request *vote_cfg;
> diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
> index 22e10269aa10..3845b56c0ed3 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.h
> +++ b/sound/soc/qcom/qdsp6/q6afe.h
> @@ -236,7 +236,7 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
>   int q6afe_set_lpass_clock(struct device *dev, int clk_id, int clk_src,
>   			  int clk_root, unsigned int freq);
>   int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
> -			     char *client_name, uint32_t *client_handle);
> +			     const char *client_name, uint32_t *client_handle);
>   int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>   			       uint32_t client_handle);
>   #endif /* __Q6AFE_H__ */
> 
