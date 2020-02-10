Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB9D158104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 18:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgBJRNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 12:13:40 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46130 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbgBJRNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 12:13:40 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so8694805wrl.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 09:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dT6SGlIAayRtxR7LTqZPmk0Gfcmis2qaH+GTfxwu2fw=;
        b=LApxvCvQZSOS8im3yL3XTp3sia6J46w3IYYvV71fXEnLvHAOrAN1whLz/i/42Dov04
         JGkUaMrQrz1JINwmFOqiDDGtJD/NFaUCOs1pZ9Wo03nfmMxCsx+BnTe15r4sig6p7I48
         KHNehvY4fwWNlrIGMZsQMuBnw0DyEae5fgTRP+F/R/3Hl2ZgIgr0q4EOzQ3BjwnpFrYH
         Jc5j4pioKx8ZMHeZ/S7AEg8RyCbIB/GDa8QEg8b/1xqTpzi42oqmI8Rj1DF5kGQH0paw
         MyCUak2nt328yKNe+mNvtVbv7+I55GDbHz6ZsValEHju/AGpImAtW1fKveV/02Fm7Nkd
         q83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dT6SGlIAayRtxR7LTqZPmk0Gfcmis2qaH+GTfxwu2fw=;
        b=m77fjZKh8zv0T58+wESU8XRFFfWjd8LljYsqZBEyswo2PgBv+qZ9iTbDzRCwJVTluy
         7Gu9TdEJ3jbxghLdivhptOas6a2tqE8KwMDBxlD0RMiffccBo54+ZL14nK/HA70Px5J4
         Y5sumIdZDmNatldxRmxGbYH+ICvHXIhAO4qNkKfdVzXjWSV9WVdBd38VXbB5iy177hHM
         Vodm0ZsIak0ddSmjhgESQatGrM4fh+45HJ2QOZHguBAizunHfz0YXbIlqHnl3MoVLn58
         3wpANmEMqqxPBlULrFyVad+1qx+npvOqtTpKAxYFrUmQlgga7G3L3Z2dFIzqK90PTTRw
         XQSw==
X-Gm-Message-State: APjAAAVpc6cdmqs7/gcQdLhPPiHspAYaN36wstO1Lea5NEZ0t7kkVaiM
        tVOB21BHqnIQuIgOeyDMY7jblQ==
X-Google-Smtp-Source: APXvYqxfaFB4k+8T3DjlAtB0Qivp+v/Gykui7kso1O0BFmhrp7NMhTTjvpaXWgd34aR5HYxvIFv11A==
X-Received: by 2002:a5d:55c1:: with SMTP id i1mr3193454wrw.347.1581354818558;
        Mon, 10 Feb 2020 09:13:38 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id a5sm1169894wmb.37.2020.02.10.09.13.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:13:37 -0800 (PST)
Subject: Re: [PATCH v2 2/8] ASoC: qdsp6: q6afe: add support to pcm ports
To:     Adam Serbinski <adam@serbinski.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-3-adam@serbinski.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4f0c3528-c7cd-37a9-7ca0-e30eb8e6d103@linaro.org>
Date:   Mon, 10 Feb 2020 17:13:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200209154748.3015-3-adam@serbinski.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/02/2020 15:47, Adam Serbinski wrote:
> This patch adds support to pcm ports in AFE.
> 
> Signed-off-by: Adam Serbinski <adam@serbinski.com>
> CC: Andy Gross <agross@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Liam Girdwood <lgirdwood@gmail.com>
> CC: Patrick Lai <plai@codeaurora.org>
> CC: Banajit Goswami <bgoswami@codeaurora.org>
> CC: Jaroslav Kysela <perex@perex.cz>
> CC: Takashi Iwai <tiwai@suse.com>
> CC: alsa-devel@alsa-project.org
> CC: linux-arm-msm@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 246 +++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/qdsp6/q6afe.h |   9 +-
>   2 files changed, 254 insertions(+), 1 deletion(-)
> 

Few general comments.

1>documentation to  "struct afe_param_id_pcm_cfg "
Either we follow kerneldoc style or not add this as we did with other 
similar afe port config structures.
Am okay either way!

2> some of the defines in this patch has no reals users, so we better 
remove all the unused constants.





> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index e0945f7a58c8..b53ad14a78fd 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -40,6 +40,7 @@
>   
...

> +/**
> + * q6afe_pcm_port_prepare() - Prepare pcm afe port.
> + *
> + * @port: Instance of afe port
> + * @cfg: PCM configuration for the afe port
> + *
> + */
> +int q6afe_pcm_port_prepare(struct q6afe_port *port, struct q6afe_pcm_cfg *cfg)
> +{
> +	union afe_port_config *pcfg = &port->port_cfg;
> +
> +	pcfg->pcm_cfg.pcm_cfg_minor_version = AFE_API_VERSION_PCM_CONFIG;
> +	pcfg->pcm_cfg.aux_mode = AFE_PORT_PCM_AUX_MODE_PCM;
> +
> +	switch (cfg->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		pcfg->pcm_cfg.sync_src = AFE_PORT_PCM_SYNC_SRC_INTERNAL;
> +		break;
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		/* CPU is slave */
> +		pcfg->pcm_cfg.sync_src = AFE_PORT_PCM_SYNC_SRC_EXTERNAL;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	switch (cfg->sample_rate) {
> +	case 8000:
> +		pcfg->pcm_cfg.frame_setting = AFE_PORT_PCM_BITS_PER_FRAME_128;
> +		break;
> +	case 16000:
> +		pcfg->pcm_cfg.frame_setting = AFE_PORT_PCM_BITS_PER_FRAME_64;
> +		break;
> +	}
> +	pcfg->pcm_cfg.quantype = AFE_PORT_PCM_LINEAR_NOPADDING;
> +	pcfg->pcm_cfg.ctrl_data_out_enable = AFE_PORT_PCM_CTRL_DATA_OE_DISABLE;
> +	pcfg->pcm_cfg.reserved = 0;
> +	pcfg->pcm_cfg.sample_rate = cfg->sample_rate;
> +
> +	/* 16 bit mono */
> +	pcfg->pcm_cfg.bit_width = 16;
> +	pcfg->pcm_cfg.num_channels = 1;
> +	pcfg->pcm_cfg.slot_number_mapping[0] = 1;

PCM quantization type and Slot Mapping should come from device tree.



> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(q6afe_pcm_port_prepare);
> +
