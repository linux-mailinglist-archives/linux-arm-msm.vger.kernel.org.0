Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A93A047D3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 10:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727424AbfFQIhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 04:37:06 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42702 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfFQIhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 04:37:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so8410820lje.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1t397wHVI5ZNALcSXhk1nacawojdv2GANgE2+/C/lrk=;
        b=TsdfradKQQ05GRFtFroQtR18VGuUsdZ8Ef4vutW+jvbv/tStv5tn9N7/CSI5qjdl1W
         vq2EBs2sf7XmzSJkyeBUp1wh195LybQsjS7YCj5gJX6DVX8uwQ10FHPgSQ/9jBjvWtpB
         soncHi954l+uz3w0t9xMwSUM/WrQ2ANZp07v5u/jYEb9DO0HB74PRYnx0LSkWg6073kN
         1/zfgFNEgRSLkx6ETC4Jmly1hlazmgvK7Ml6Nkp4LEMl+I21vVKeiCjDCQswTlCSF6qT
         Ot3/fOyzRUjD9SUhZF6Vc8t+GapYSm8wCOfZyeZ6xo1lUpNP4z23rUAkpWusfeI2tX8c
         yamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1t397wHVI5ZNALcSXhk1nacawojdv2GANgE2+/C/lrk=;
        b=UeFKOJPOnpR2FRmYVmvnU43xzD2RqovWJcjh3lEnhDcUiIuy+N3MIwKYiCzo1Q2NM+
         /MQChph+nL9nXXs0euQp+LYln6vjl0Afpw2ktAwAIUMHDa9WOHH0agMK8MvnIY9P/6EU
         vfGlYYrwKDrrwY4GnK/o0lV5JIf47YmDhIwRPKL3dFoGXmN3xn3Cds3aH3Te7g6SLnKS
         nR10WaswYKOTklhcij7Qn3Ao/Rr6pyXYaXaCBM3J+ka5tf8mM+tNz2kg82QAwNPNyTp+
         HXtTIHLUrtB6iJ4hhiFW1ecWF9bEVKABfqwpDWwZhRIYC7hV7lsrgWE0uQqLtojnc3Cb
         7NJg==
X-Gm-Message-State: APjAAAXg5pF9kslvygzFrBEXO5HmJlzSu37EH4597+VzM1pWEZLPkZmH
        8lcwMJXGbZj+UJMN39c2xNHhKg==
X-Google-Smtp-Source: APXvYqwuI7QluNPFP2mma7scZggW3BzbiuTdonR73HjPRCl/98WoZfQEt+sDgHch0mQH0RQJlUsFRg==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr11082859ljl.8.1560760623861;
        Mon, 17 Jun 2019 01:37:03 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id p27sm1686189lfo.16.2019.06.17.01.37.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 01:37:03 -0700 (PDT)
Subject: Re: [PATCH 1/5] media: venus: Add codec data table
To:     Aniket Masule <amasule@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-2-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <bc6035d8-2688-f79a-068e-bf6630dd65ef@linaro.org>
Date:   Mon, 17 Jun 2019 11:37:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560233130-27264-2-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Aniket,

On 6/11/19 9:05 AM, Aniket Masule wrote:
> Add vpp cycles for for different types of codec
> It indicates the cycles required by video hardware
> to process each macroblock.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 13 +++++++++++++
>  drivers/media/platform/qcom/venus/core.h | 15 +++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 7393667..43eb446 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -473,9 +473,22 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	{  244800, 100000000 },	/* 1920x1080@30 */
>  };
>  
> +static struct codec_data sdm845_codec_data[] =  {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675 },
> +	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200 },
> +};
> +
>  static const struct venus_resources sdm845_res = {
>  	.freq_tbl = sdm845_freq_table,
>  	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
> +	.codec_data = sdm845_codec_data,
> +	.codec_data_size = ARRAY_SIZE(sdm845_codec_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.max_load = 2563200,
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7a3feb5..b1a9b43 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -35,12 +35,20 @@ struct reg_val {
>  	u32 value;
>  };
>  
> +struct codec_data {

The name is very generic, could you rename the structure to something
like vpp_cycles_data?

> +u32 pixfmt;
> +u32 session_type;
> +int vpp_cycles;

please check your editor, those fields should have a tab to the right.

> +};
> +
>  struct venus_resources {
>  	u64 dma_mask;
>  	const struct freq_tbl *freq_tbl;
>  	unsigned int freq_tbl_size;
>  	const struct reg_val *reg_tbl;
>  	unsigned int reg_tbl_size;
> +	const struct codec_data *codec_data;
> +	unsigned int codec_data_size;
>  	const char * const clks[VIDC_CLKS_NUM_MAX];
>  	unsigned int clks_num;
>  	enum hfi_version hfi_version;
> @@ -216,6 +224,12 @@ struct venus_buffer {
>  	struct list_head ref_list;
>  };
>  
> +struct clock_data {
> +	u32 core_id;
> +	unsigned long freq;

I cannot see how this 'freq' structure field is used? I can see that you
fill it in 3/5 patch but you don't used nowhere.

> +	struct codec_data *codec_data;
> +};

Having the fact that freq field seems not needed can we just merge the
fields in venus_inst structure?

> +
>  #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
>  
>  /**
> @@ -275,6 +289,7 @@ struct venus_inst {
>  	struct list_head list;
>  	struct mutex lock;
>  	struct venus_core *core;
> +	struct clock_data clk_data;
>  	struct list_head dpbbufs;
>  	struct list_head internalbufs;
>  	struct list_head registeredbufs;
> 

-- 
regards,
Stan
