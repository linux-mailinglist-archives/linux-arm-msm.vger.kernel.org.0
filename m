Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB67118469C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 13:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMMPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 08:15:24 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40371 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgCMMPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 08:15:23 -0400
Received: by mail-wm1-f68.google.com with SMTP id z12so851332wmf.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 05:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Us+slyMydZd/eqziQ4Za2MmMvMvI/Alts84+tTbnLIk=;
        b=dmdrL9J8Py6pjzSo9zxb1Yfa1SYLqBuFeXStUEe356hzKeaAzHXVcOgPyuyyrEefAl
         lRQUAClgr46+cGoe9EiUoCs9iFeVJEJJMexF8D13T9wf6eAyiCk4qCsQ07DW561IuBYO
         hnPfwa5/OCPwap5maFvMYyxIkukrBuOIgBYqdi1yNzTqopWHa2q/1oQm8iZLJG0lGt+n
         6sqAlipnm0nYh/0p3RgYOw4QKViq2p6lOKel6B3y71wEAXvZ41vPjaUWivg2ZVoznsSK
         FU6fgQkETfifKTe817Ea4sPB/g74dG66ohFKeJ3bFRb2KRKwWH2opOCdQnWdzpfY79C6
         9s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Us+slyMydZd/eqziQ4Za2MmMvMvI/Alts84+tTbnLIk=;
        b=a7VqbzPJNuG2s0oLfG+Xr5IXmyckqBUEOVD7m58m77XW1bfuIzqla3pCTfTLokAdKs
         WJES1TYTp8ItqIlWtTeBeROP+YrNROT1ScH7xT3AHRORgTZmO9lNm2xR+AZjTNpdfVzx
         POchYd3+avu68giZwoOu60+iS0H+B9lMLqYh8uzu49aoyTN7/hNpcrJ4C3EXwHRjm4R+
         E6gNWWDnhtsckOOnt7wL32I3JDjvx1vMAkto9fGCE5nf1IY9qhsVroSU6g0oRhgjT19v
         5FyAQjjjiyX1q6vtDnSu02t2U1obQRMZykka4G48ywXBpZX5hk02KxU+KTOkGUErOfoJ
         HjxQ==
X-Gm-Message-State: ANhLgQ0YNZbOJeO/qXRn6tw4+ZysIP8zBViU1iZTBZ3bcJrTqha2hiYh
        C6MHCINt5mBIsIePoRTjiz0Jvw==
X-Google-Smtp-Source: ADFU+vveUbU45uEhQYSZ4Gbmvwbf1schWKEpmcGYLn3cvPLdTqdNnZeTOPyZ6EBJ9iwM90TrudsIvQ==
X-Received: by 2002:a1c:208a:: with SMTP id g132mr10174291wmg.44.1584101721737;
        Fri, 13 Mar 2020 05:15:21 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id a184sm17302709wmf.29.2020.03.13.05.15.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 05:15:20 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 3/9] ASoC: qcom: q6asm: pass codec profile to
 q6asm_open_write
To:     Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-4-vkoul@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <15823832-0639-f868-9338-091bceaba6bd@linaro.org>
Date:   Fri, 13 Mar 2020 12:15:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313101627.1561365-4-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/03/2020 10:16, Vinod Koul wrote:
> Codec profile is required to be passed for WMA codecs so that we know
> the codec profile present and tell DSP accordingly, so update this API
> to pass the codec profile as argument
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
>   sound/soc/qcom/qdsp6/q6asm.c     | 2 +-
>   sound/soc/qcom/qdsp6/q6asm.h     | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index c0d422d0ab94..8f245d03b6f5 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -250,7 +250,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
>   
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   		ret = q6asm_open_write(prtd->audio_client, FORMAT_LINEAR_PCM,
> -				       prtd->bits_per_sample);
> +				       0, prtd->bits_per_sample);
>   	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>   		ret = q6asm_open_read(prtd->audio_client, FORMAT_LINEAR_PCM,
>   				       prtd->bits_per_sample);
> @@ -652,7 +652,7 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   	prtd->bits_per_sample = 16;
>   	if (dir == SND_COMPRESS_PLAYBACK) {
>   		ret = q6asm_open_write(prtd->audio_client, params->codec.id,
> -					prtd->bits_per_sample);
> +				params->codec.profile, prtd->bits_per_sample);
>   
>   		if (ret < 0) {
>   			dev_err(dev, "q6asm_open_write failed\n");
> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index 36e0eab13a98..64eb7b6ba305 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -858,7 +858,7 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
>    * Return: Will be an negative value on error or zero on success
>    */
>   int q6asm_open_write(struct audio_client *ac, uint32_t format,
> -		     uint16_t bits_per_sample)
> +		     u32 codec_profile, uint16_t bits_per_sample)
>   {
>   	struct asm_stream_cmd_open_write_v3 *open;
>   	struct apr_pkt *pkt;
> diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
> index 6764f55f7078..1cff7f68b95d 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.h
> +++ b/sound/soc/qcom/qdsp6/q6asm.h
> @@ -55,7 +55,7 @@ void q6asm_audio_client_free(struct audio_client *ac);
>   int q6asm_write_async(struct audio_client *ac, uint32_t len, uint32_t msw_ts,
>   		       uint32_t lsw_ts, uint32_t flags);
>   int q6asm_open_write(struct audio_client *ac, uint32_t format,
> -		     uint16_t bits_per_sample);
> +		     u32 codec_profile, uint16_t bits_per_sample);
>   
>   int q6asm_open_read(struct audio_client *ac, uint32_t format,
>   		     uint16_t bits_per_sample);
> 
