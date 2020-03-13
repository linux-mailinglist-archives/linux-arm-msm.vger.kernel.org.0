Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 762BA18470E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 13:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgCMMkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 08:40:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgCMMky (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 08:40:54 -0400
Received: from localhost (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11DE520724;
        Fri, 13 Mar 2020 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584103254;
        bh=tgITx3udnkEgR1xuM2wgsUOQN1rzYgIiMUlHDX0dYaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g+gYR2LvtvlA8v0hrbnFWvTCbNSX+vqRry14M3Uuzpmxt6rk3WQ17iARExRk3loUu
         /wv5tuKoZZG+9F2ADNlpQUpQL3QvpXf3XRRO/WZWYTz7k9TYO0dmFaevu/XiM3Ocih
         fgS4UxHUWklz/tB0U6Nqc99mbA8f1sIDr9FwlI3E=
Date:   Fri, 13 Mar 2020 18:10:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 8/9] ASoC: qcom: q6asm-dai: add support for
 ALAC and APE decoders
Message-ID: <20200313124049.GJ4885@vkoul-mobl>
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-9-vkoul@kernel.org>
 <fcee2779-fee8-e3d9-590f-e28fc5880ea0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcee2779-fee8-e3d9-590f-e28fc5880ea0@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-03-20, 12:15, Srinivas Kandagatla wrote:
> 
> 
> On 13/03/2020 10:16, Vinod Koul wrote:
> > Qualcomm DSPs also supports the ALAC and APE decoders, so add support
> > for these and convert the snd_codec_params to qdsp format.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> One minor nit, other that,
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks Srini for the reviews

> > ---
> >   sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
> >   1 file changed, 66 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> > index 53c250778eea..948710759824 100644
> > --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> > +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> > @@ -628,12 +628,16 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
> >   	struct q6asm_dai_data *pdata;
> >   	struct q6asm_flac_cfg flac_cfg;
> >   	struct q6asm_wma_cfg wma_cfg;
> > +	struct q6asm_alac_cfg alac_cfg;
> > +	struct q6asm_ape_cfg ape_cfg;
> >   	unsigned int wma_v9 = 0;
> >   	struct device *dev = c->dev;
> >   	int ret;
> >   	union snd_codec_options *codec_options;
> >   	struct snd_dec_flac *flac;
> >   	struct snd_dec_wma *wma;
> > +	struct snd_dec_alac *alac;
> > +	struct snd_dec_ape *ape;
> >   	codec_options = &(prtd->codec_param.codec.options);
> > @@ -756,6 +760,65 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
> >   			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
> >   			return -EIO;
> >   		}
> > +		break;
> > +
> > +	case SND_AUDIOCODEC_ALAC:
> > +		memset(&alac_cfg, 0x0, sizeof(alac_cfg));
> > +		alac = &codec_options->alac_d;
> > +
> > +		alac_cfg.sample_rate = params->codec.sample_rate;
> > +		alac_cfg.avg_bit_rate = params->codec.bit_rate;
> > +		alac_cfg.bit_depth = prtd->bits_per_sample;
> > +		alac_cfg.num_channels = params->codec.ch_in;
> > +
> > +		alac_cfg.frame_length = alac->frame_length;
> > +		alac_cfg.pb = alac->pb;
> > +		alac_cfg.mb = alac->mb;
> > +		alac_cfg.kb = alac->kb;
> > +		alac_cfg.max_run = alac->max_run;
> > +		alac_cfg.compatible_version = alac->compatible_version;
> > +		alac_cfg.max_frame_bytes = alac->max_frame_bytes;
> > +
> > +		switch (params->codec.ch_in) {
> > +		case 1:
> > +			alac_cfg.channel_layout_tag = (100 << 16) | 1;
> 
> We should probably define this layout tag in asm.h
> something like:
> 
> #define ALAC_CHANNEL_LAYOUT_TAG_Mono (100<<16) | 1
> #define ALAC_CHANNEL_LAYOUT_TAG_STEREO (100<<16) | 2

Sure I will add these

-- 
~Vinod
