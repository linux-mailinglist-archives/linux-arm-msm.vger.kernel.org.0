Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F35132E4A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 10:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhCEJWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 04:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhCEJWO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 04:22:14 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D437C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 01:22:14 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m1so807472wml.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 01:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=URqG5L18cDBBwa4eOeQoxnZ8Y3fXypRiyHuYJ5+QuzE=;
        b=HoyGLNY7ohPCLRBEGZb5FPIUYBtc9xzKJZYixoFjiDRS45I46wdSoaCL7GNgYVFZg+
         E7JWOrqne/UdPWudNYXxJlC2G3q7mwUrsa3Txpk0aMKuaL++bi/QrJds6gHZf6LaqaZD
         Lxu7QP+OT5diVZWtlQcW2RG21ghUvUMmPgZ80myqMStadnBdoZeyTpgcyXmkRNU6SeQu
         FcG/dV7NUqO24jxHQb37R/y2VCP0/4h/M/uk0hfDMUAvPKIC4yOsEI0WQPwCYFHZ1VIC
         670r7GtkPT3gR1JlNNehohXTuHpFT7JGbLpUsPL06lM5Ywtss/1xuTmaesYQVbMybt54
         2/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=URqG5L18cDBBwa4eOeQoxnZ8Y3fXypRiyHuYJ5+QuzE=;
        b=I82iGOSlXltKCfVEYEcRPu5KyIGiN5FwhlS+voA7G/hs1avJACLcMgQOwJx2P3SPur
         FrqyBbC4G5Wgmi/2ECAMdEOBQiFs6tResIcec2U+T+mFyiAcUh+61nAK7H9A9fgBVZx3
         Ekq+md4BoGIt7s9Rb/ZBRsexUs6m94OIbE4G6/gbgBmd+kMCqx46EWHL4xvcA/a6y9ky
         cKMAtrkEFHowH3oM1E83cttviTAH7PDAQ/46OCp2EJeP3AIH6sx60ymHQsyCwHnOFqQJ
         v14iPPmFBVRBMp0IZlcjqjxv6T1rGv0U8CMUoA4SqdSyo4eWxc+usCdVEyj91GjWJd+1
         xDhg==
X-Gm-Message-State: AOAM531OEkF0PT5qrCqySZMZOjtFrGPQbkE8GX+eQavWyrXPiw+bh77e
        S9xuizIjwlycG79v003uY0DLvw==
X-Google-Smtp-Source: ABdhPJwUyzXYupqpsGjWfl+dJhKYsjoKpRJUNtYpHzgqcAwJq4jNK52aor5/UOe45LmnyozCUn5UWw==
X-Received: by 2002:a7b:c209:: with SMTP id x9mr7839461wmi.92.1614936132969;
        Fri, 05 Mar 2021 01:22:12 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id d204sm3565418wmc.17.2021.03.05.01.22.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 01:22:12 -0800 (PST)
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: mute/unmute all active
 decimators
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "moderated list:QCOM AUDIO (ASoC) DRIVERS" 
        <alsa-devel@alsa-project.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210304215646.17956-1-jonathan@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <32f49fa9-136c-91a5-5790-373651719fda@linaro.org>
Date:   Fri, 5 Mar 2021 09:22:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210304215646.17956-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Jonathan for testing and fixing this use case!


On 04/03/2021 21:56, Jonathan Marek wrote:
> An interface can have multiple decimators enabled, so loop over all active
> decimators. Otherwise only one channel will be unmuted, and other channels
> will be zero. This fixes recording from dual DMIC as a single two channel
> stream.

> 
> Also remove the now unused "active_decimator" field.
> 
> Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   sound/soc/codecs/lpass-va-macro.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 91e6890d6efcb..3d6976a3d9e42 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -189,7 +189,6 @@ struct va_macro {
>   	struct device *dev;
>   	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
>   	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
> -	unsigned long active_decimator[VA_MACRO_MAX_DAIS];
>   	u16 dmic_clk_div;
>   
>   	int dec_mode[VA_MACRO_NUM_DECIMATORS];
> @@ -549,11 +548,9 @@ static int va_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
>   	if (enable) {
>   		set_bit(dec_id, &va->active_ch_mask[dai_id]);
>   		va->active_ch_cnt[dai_id]++;
> -		va->active_decimator[dai_id] = dec_id;
>   	} else {
>   		clear_bit(dec_id, &va->active_ch_mask[dai_id]);
>   		va->active_ch_cnt[dai_id]--;
> -		va->active_decimator[dai_id] = -1;
>   	}
>   
>   	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, update);
> @@ -880,18 +877,19 @@ static int va_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
>   	struct va_macro *va = snd_soc_component_get_drvdata(component);
>   	u16 tx_vol_ctl_reg, decimator;
>   
> -	decimator = va->active_decimator[dai->id];
> -
> -	tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
> -				VA_MACRO_TX_PATH_OFFSET * decimator;
> -	if (mute)
> -		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> -					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> -					      CDC_VA_TX_PATH_PGA_MUTE_EN);
> -	else
> -		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> -					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> -					      CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
> +	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
> +			 VA_MACRO_DEC_MAX) {
> +		tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
> +					VA_MACRO_TX_PATH_OFFSET * decimator;
> +		if (mute)
> +			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> +					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> +					CDC_VA_TX_PATH_PGA_MUTE_EN);
> +		else
> +			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> +					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> +					CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
> +	}
>   
>   	return 0;
>   }
> 
