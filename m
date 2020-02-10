Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE67D158136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 18:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgBJRTT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 12:19:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37131 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbgBJRTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 12:19:19 -0500
Received: by mail-wm1-f65.google.com with SMTP id a6so85542wme.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oIl67nxXPIGrGYEprbTExGSvnC9F9nc7bLg95r69g+g=;
        b=qsYguvM9Y7IZ0vTYqRn6gqe315EVNSNAoXvnU7Il/jEgH6OA5Ex79LfWkPnVQ1Tig6
         DZkfDWJBkhH8/OU8nsbgj7EJqhFcfE3b9b6ipz/LgM9JJj0yef4v7RAHWEP2iQQ3gcqR
         9bzcCD5sVgzg+4xYDkJI827X3pNvqolyAEH4cPspelg1J25cUMwhAN8/+2AvU/skRtZ3
         dBZMbs/BE3whHqrgNZ5gqWsTjBcDbhRy6dnr5p2HunPzxpL4XNNICps0BLJQf8iid0pO
         eOZInK/0Wx/uPfqdcgiUcKrxjG+V0jaHO4nPzkYx/qsBiaYaDBwdJVTkIzRYzPBID8Zo
         /fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oIl67nxXPIGrGYEprbTExGSvnC9F9nc7bLg95r69g+g=;
        b=W3WB3PW/+PHRXADj+ngb5Pi0SSAqCmxNoMM0ptBnZGWzihSPdj3ggKNWiTDsTvLQdA
         IUh0b8cRD1LiMbgxSF9i2lXvYb32cO+TtYVsLDBRuqpMl2zz7l9RjaEp+/WMk8UgVJ36
         kQ8eZo+vXS6xi1TjZ2sMWqFcDI1Szq8cVroTNEos7rNOluNGQ/3/Q7qHHGE0niYzNf3G
         7ePHqzohQ9uqQZRemndjlKNUw2KpuzjV5xC+n4iMhd67GgMcyK7C462kCf1WvBZ4YD3e
         HSUa/jcqDTXp6IL/G81WIu3w3l5E7el8zmWzDQVBg6OlscY9gTEjfwzsjQE38ExNQPJ3
         AxkA==
X-Gm-Message-State: APjAAAU9MO3yHq5A8lGKBy5AWky6QxVLCMo1m5MeVXWbbOHecbjLwpm/
        NHsITVgMxswdmeelqhlMj9q72A==
X-Google-Smtp-Source: APXvYqzV9sO34XJZFw6xpwiuFWll4zkKifzTrTiAxP59oZnDpnnijGr7YApsIerKdCCMbKpzqWygRg==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr25288wmc.53.1581355157157;
        Mon, 10 Feb 2020 09:19:17 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id o4sm1409882wrx.25.2020.02.10.09.19.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:19:16 -0800 (PST)
Subject: Re: [PATCH v2 4/8] ASoC: qdsp6: q6routing: add pcm port routing
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
 <20200209154748.3015-5-adam@serbinski.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a161cfd8-f1ca-4e1c-65b3-a465053c7d20@linaro.org>
Date:   Mon, 10 Feb 2020 17:19:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200209154748.3015-5-adam@serbinski.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/02/2020 15:47, Adam Serbinski wrote:
> This patch adds support to PCM_PORT mixers required to
> select path between ASM stream and AFE ports.
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
>   sound/soc/qcom/qdsp6/q6routing.c | 44 ++++++++++++++++++++++++++++++++

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   1 file changed, 44 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 20724102e85a..3a81d2161707 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -67,6 +67,10 @@
>   	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
>   	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
>   	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
> +	{ mix_name, "PRI_PCM_TX", "PRI_PCM_TX" },		\
> +	{ mix_name, "SEC_PCM_TX", "SEC_PCM_TX" },		\
> +	{ mix_name, "TERT_PCM_TX", "TERT_PCM_TX" },		\
> +	{ mix_name, "QUAT_PCM_TX", "QUAT_PCM_TX" },		\
>   	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
>   	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
>   	{ mix_name, "SLIMBUS_2_TX", "SLIMBUS_2_TX" },		\
> @@ -128,6 +132,18 @@
>   	SOC_SINGLE_EXT("QUAT_MI2S_TX", QUATERNARY_MI2S_TX,		\
>   		id, 1, 0, msm_routing_get_audio_mixer,			\
>   		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("PRI_PCM_TX", PRIMARY_PCM_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("SEC_PCM_TX", SECONDARY_PCM_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("TERT_PCM_TX", TERTIARY_PCM_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("QUAT_PCM_TX", QUATERNARY_PCM_TX,		\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
>   	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
>   		id, 1, 0, msm_routing_get_audio_mixer,			\
>   		msm_routing_put_audio_mixer),				\
> @@ -468,6 +484,18 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
>   static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
>   	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
>   
> +static const struct snd_kcontrol_new primary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(PRIMARY_PCM_RX) };
> +
> +static const struct snd_kcontrol_new secondary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(SECONDARY_PCM_RX) };
> +
> +static const struct snd_kcontrol_new tertiary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(TERTIARY_PCM_RX) };
> +
> +static const struct snd_kcontrol_new quaternary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(QUATERNARY_PCM_RX) };
> +
>   static const struct snd_kcontrol_new slimbus_rx_mixer_controls[] = {
>   	Q6ROUTING_RX_MIXERS(SLIMBUS_0_RX) };
>   
> @@ -695,6 +723,18 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>   	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>   			   tertiary_mi2s_rx_mixer_controls,
>   			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("PRI_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   primary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(primary_pcm_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("SEC_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   secondary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(secondary_pcm_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("TERT_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   tertiary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(tertiary_pcm_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("QUAT_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   quaternary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(quaternary_pcm_rx_mixer_controls)),
>   	SND_SOC_DAPM_MIXER("PRIMARY_TDM_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
>   				pri_tdm_rx_0_mixer_controls,
>   				ARRAY_SIZE(pri_tdm_rx_0_mixer_controls)),
> @@ -853,6 +893,10 @@ static const struct snd_soc_dapm_route intercon[] = {
>   	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
>   	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
>   	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("PRI_PCM_RX Audio Mixer", "PRI_PCM_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("SEC_PCM_RX Audio Mixer", "SEC_PCM_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("TERT_PCM_RX Audio Mixer", "TERT_PCM_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("QUAT_PCM_RX Audio Mixer", "QUAT_PCM_RX"),
>   	Q6ROUTING_RX_DAPM_ROUTE("PRIMARY_TDM_RX_0 Audio Mixer",
>   				"PRIMARY_TDM_RX_0"),
>   	Q6ROUTING_RX_DAPM_ROUTE("PRIMARY_TDM_RX_1 Audio Mixer",
> 
