Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000C45C087
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 17:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729474AbfGAPpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 11:45:23 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42096 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfGAPpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 11:45:23 -0400
Received: by mail-lf1-f65.google.com with SMTP id x144so9133786lfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2019 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ImGPcfrTaxEgEgkx65mt0ofrgVu0PRsPNy18Ds0mkaY=;
        b=DJ3zwEyEiuc0ibdOqvlPD77n0POZywfOmkhuiKrjmpUkv/CUdB7OAvyi8F3WIrr9c7
         1XJXiToXr0WVG76FIprtNBZJQ7Oosvjrx2NseXQUdzeXBJZB27n9fHUyYdCjMQeZEwhI
         3pNdNprHm0a4E/6PNk0Jq2BUeph/Qyy4zcT4sF15duqYle1Vm8DzD6FtfD+P4cMRVRG8
         VhTyZCy5xt1rJu5kcV/bE0bZrDYsRMnCEZpNp2sl5GhB3MkqcCQvZ8jL2wL/xKsp/bFx
         volPESdFR5/agT5n5MRrBlXQxL1FFXCaqiVUhUgeBokXm2SqtZwROS/LfBtUavelQ+SO
         c+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ImGPcfrTaxEgEgkx65mt0ofrgVu0PRsPNy18Ds0mkaY=;
        b=CvUGvdREE9N/Bbq02X0lsCqKngAG1KkHM7pkQtyG+JuTYTHN4aUKAE01jcwztd7f8A
         YuV4ZHAhRPMAYNd0XRyczOwf7H3aUlu0eZPBZQ3ya+jUcuGdltz5nvvSdytYhp7b8tst
         mMMnqQRQK4VaeKgmYS2rRIBo1K6bHmhyDtA1Y7ooQnxAtnAko9XL6AxB5tEjVSEdPT8c
         gdIG0WukOCIa879s2K0U7mnLLqauZCUnWvpubKTmZ/Rez98a6s7HRsd4Iwytjir1TwWl
         6mckYKLT3hq3tceyUoavDoz3N09xOiVMqSRfwWIrZTHGWqNS7E+Ld83fcV8dTbXdh/eY
         5MiA==
X-Gm-Message-State: APjAAAU3V8WttYwwNGvqBTrofpsyFYk6+7uhDmb8aXbzY/2XqxkGOASP
        Sxur7f5/nHQG1bxuKf8ahMsmeA==
X-Google-Smtp-Source: APXvYqzk0XOCZg21kyRORRVSjb0/8YorIcCUA+32A0b0dNQUMjDUYn6pNRk78iQwOuVc652c8JW+rg==
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr12179312lfp.154.1561995921133;
        Mon, 01 Jul 2019 08:45:21 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id d4sm2609795lfi.91.2019.07.01.08.45.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 08:45:20 -0700 (PDT)
Subject: Re: [PATCH] media: venus: Update to bitrate based clock scaling
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1561537416-2067-1-git-send-email-amasule@codeaurora.org>
 <1561537416-2067-2-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <00818fe7-95e6-b43f-fca8-c4669ffad947@linaro.org>
Date:   Mon, 1 Jul 2019 18:45:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561537416-2067-2-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Aniket,

On 6/26/19 11:23 AM, Aniket Masule wrote:
> Introduced clock scaling using bitrate, current
> calculations consider only the cycles per mb.
> Also, clock scaling is now triggered before every
> buffer being queued to the device. This helps in
> deciding precise clock cycles required.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c    | 16 +++++------
>  drivers/media/platform/qcom/venus/core.h    |  1 +
>  drivers/media/platform/qcom/venus/helpers.c | 43 +++++++++++++++++++++++++----
>  3 files changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index f1597d6..ad6bb74 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -474,14 +474,14 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  };
>  
>  static struct codec_freq_data sdm845_codec_freq_data[] =  {
> -	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675 },
> -	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675 },
> -	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675 },
> -	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200 },
> -	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200 },
> -	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200 },
> -	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200 },
> -	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
> +	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
>  };
>  
>  static const struct venus_resources sdm845_res = {
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 2ed6496..b964b7c 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -39,6 +39,7 @@ struct codec_freq_data {
>  	u32 pixfmt;
>  	u32 session_type;
>  	unsigned int vpp_freq;
> +	unsigned int vsp_freq;

unsigned long?

>  };
>  
>  struct venus_resources {
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index ef35fd8..634778a 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -379,6 +379,9 @@ static int scale_clocks(struct venus_inst *inst)
>  	unsigned int i;
>  	int ret;
>  
> +	if (inst->state == INST_START)
> +		return 0;

This condition is related (probably) to the change in
venus_helper_vb2_buf_queue() but shouldn't it be copied in
scale_clocks_v4 too?

> +
>  	mbs_per_sec = load_per_type(core, VIDC_SESSION_TYPE_ENC) +
>  		      load_per_type(core, VIDC_SESSION_TYPE_DEC);
>  
> @@ -418,17 +421,26 @@ static int scale_clocks(struct venus_inst *inst)
>  	return ret;
>  }
>  
> -static unsigned long calculate_vpp_freq(struct venus_inst *inst)
> +static unsigned long calculate_inst_freq(struct venus_inst *inst,
> +					 unsigned long filled_len)
>  {
> -	unsigned long vpp_freq = 0;
> +	unsigned long vpp_freq = 0, vsp_freq = 0;
> +	u64 fps = inst->fps;
>  	u32 mbs_per_sec;
>  
>  	mbs_per_sec = load_per_instance(inst);
>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>  	/* 21 / 20 is overhead factor */
>  	vpp_freq += vpp_freq / 20;
> +	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;

this calculation is not used below. Is that intentional?

> +
> +	/* 10 / 7 is overhead factor */
> +	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
> +		vsp_freq = (inst->controls.enc.bitrate * 10) / 7;
> +	else
> +		vsp_freq = ((fps * filled_len * 8) * 10) / 7;
>  
> -	return vpp_freq;
> +	return max(vpp_freq, vsp_freq);
>  }
>  
>  static int scale_clocks_v4(struct venus_inst *inst)
> @@ -436,14 +448,30 @@ static int scale_clocks_v4(struct venus_inst *inst)
>  	struct venus_core *core = inst->core;
>  	const struct freq_tbl *table = core->res->freq_tbl;
>  	unsigned int num_rows = core->res->freq_tbl_size;
> -
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>  	struct clk *clk = core->clks[0];
>  	struct device *dev = core->dev;
> +

drop this addition of blank line.

>  	unsigned int i;
>  	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
> +	unsigned long filled_len = 0;
> +	struct venus_buffer *buf, *n;
> +	struct vb2_buffer *vb;
>  	int ret;
>  
> -	freq = calculate_vpp_freq(inst);
> +	mutex_lock(&inst->lock);
> +	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
> +		vb = &buf->vb.vb2_buf;
> +		filled_len = max(filled_len, vb2_get_plane_payload(vb, 0));
> +	}
> +	mutex_unlock(&inst->lock);
> +
> +	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len) {
> +		dev_dbg(dev, "%s: No input to the session\n", __func__);

please drop this debug message, if the user pushes empty buffers
something will blow up earlier.

> +		return 0;
> +	}
> +
> +	freq = calculate_inst_freq(inst, filled_len);
>  
>  	if (freq > table[0].freq)
>  		goto err;
> @@ -471,6 +499,9 @@ static int scale_clocks_v4(struct venus_inst *inst)
>  
>  	freq = max(freq_core0, freq_core1);
>  
> +	if (clk_get_rate(clk) == freq)
> +		return 0;
> +

above check is included in clk_set_rate(), you don't need it.

>  	ret = clk_set_rate(clk, freq);
>  	if (ret)
>  		goto err;
> @@ -1150,6 +1181,8 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
>  	if (ret)
>  		goto unlock;
>  
> +	load_scale_clocks(inst);
> +
>  	ret = session_process_buf(inst, vbuf);
>  	if (ret)
>  		return_buf_error(inst, vbuf);
> 

-- 
regards,
Stan
