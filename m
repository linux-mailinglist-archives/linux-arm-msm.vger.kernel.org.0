Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974C045C9FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 17:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbhKXQae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:30:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhKXQae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:30:34 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0927C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 08:27:23 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e11so6553753ljo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EZa37FHey3/1Rg/hOIu6aLGUem+HE7jKO3BHC2Y3N0k=;
        b=u1PnXNrdCxmjQI0QdbMCH8oYrdeehQqa65VUjKvrEua9/G/uyE9/sXJmNaSz4wK8M1
         T+NLgY+QrSBrmNp8cGtW4LnFnJnsuR2X1mX6tPN2st8fwy84gLfJzR9E8tMD1ONotuxn
         EXLUF8eQq/citxLdlT0FwY0rfYhl8XCpOAFb0iYpxtMZDMErqCYeMbDKFBwCirQseFKv
         IRfuepadQZx0tg2TGXmkL/TYKkDOcj9HgEZHGeN/8M5Vq6pbRYSCagoZDgTHwwIGNgeC
         2SnswQmIAC3pwhu1fFWEgIvDgd6R0aaOFyeVhiGKG23x9jXBM3/wZmzxAGtu5FyFDHzs
         fdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EZa37FHey3/1Rg/hOIu6aLGUem+HE7jKO3BHC2Y3N0k=;
        b=tPPgqTs0uz5/PYZs3GGzwUjohFMJ5/gXGEUPOGgse3fjfbJC6B8wakx6kTts5AjE/0
         5ritG0I4C0hlmJaJ668nflO6ewCj7/Rk+VWhEgTt+y44paIvbHaknZXRz10tOCxM0ASn
         /QPLzb9+HgrOL+C1VXGkAE4Bp6eK7kHgApS5nQbUQ5XkJ/qYlHhxHIGGZzV2bNNlk1K2
         /XskkHxmCgizO7LoOECxZxE65oUhaIwV4465fU2A+b2qk7E+YoPfcdhZUflKuk0IS3Bj
         xSnorM/kGNFixMLrniRuZK8kYAwOF7IAAJXpQYacj15Ldeq88KFiYyQOgZPMgy+8FOZj
         0TmA==
X-Gm-Message-State: AOAM533Wl4q4Uvy2opV6FtWJIDe1qO63TxcfFcqT1i/QKVJDZCCdwX0q
        +mifBu/HnjhhPPu2IgYxt3/0tg==
X-Google-Smtp-Source: ABdhPJx3xNwJns6eQkBJ5GNnDR3LB7KaFdgEHS9nwhOP3QaznjG/GLhJd3lUkK6ZcbA3KLrhQddumw==
X-Received: by 2002:a2e:b802:: with SMTP id u2mr16718877ljo.261.1637771242210;
        Wed, 24 Nov 2021 08:27:22 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o15sm25836lfk.175.2021.11.24.08.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:27:21 -0800 (PST)
Subject: Re: [PATCH v3 12/13] drm/msm/dsi: Add support for DSC configuration
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-13-vkoul@kernel.org>
 <fc9885b3-1fdc-3036-4c82-4de37649420d@linaro.org>
Message-ID: <f6a35461-9ab1-ed36-2937-0ff93008fd62@linaro.org>
Date:   Wed, 24 Nov 2021 19:27:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fc9885b3-1fdc-3036-4c82-4de37649420d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/11/2021 19:21, Dmitry Baryshkov wrote:
> On 16/11/2021 09:22, Vinod Koul wrote:
>> When DSC is enabled, we need to configure DSI registers accordingly and
>> configure the respective stream compression registers.
>>
>> Add support to calculate the register setting based on DSC params and
>> timing information and configure these registers.
>>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 113 ++++++++++++++++++++++++++++-
>>   2 files changed, 122 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> index 49b551ad1bff..c1c85df58c4b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> @@ -706,4 +706,14 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t 
>> val)
>>   #define REG_DSI_CPHY_MODE_CTRL                    0x000002d4
>> +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL            0x0000029c
>> +
>> +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL2            0x000002a0
>> +
>> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL            0x000002a4
>> +
>> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2            0x000002a8
>> +
>> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL3            0x000002ac
>> +
>>   #endif /* DSI_XML */
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 31d385d8d834..2c14c36f0b3d 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -908,6 +908,20 @@ static void dsi_ctrl_config(struct msm_dsi_host 
>> *msm_host, bool enable,
>>           dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
>>   }
>> +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
>> +                  int pic_width, int pic_height)
>> +{
>> +    if (!dsc || !pic_width || !pic_height) {
>> +        pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", 
>> pic_width, pic_height);
>> +        return -EINVAL;
>> +    }
>> +
>> +    dsc->drm->pic_width = pic_width;
>> +    dsc->drm->pic_height = pic_height;
>> +
>> +    return 0;
>> +}
>> +
>>   static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi)
>>   {
>>       struct drm_display_mode *mode = msm_host->mode;
>> @@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>           hdisplay /= 2;
>>       }
>> +    if (msm_host->dsc) {
>> +        struct msm_display_dsc_config *dsc = msm_host->dsc;
>> +
>> +        /* update dsc params with timing params */
>> +        dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
>> +        DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, 
>> dsc->drm->pic_height);
>> +
>> +        /* we do the calculations for dsc parameters here so that
>> +         * panel can use these parameters
>> +         */
>> +        dsi_populate_dsc_params(dsc);
>> +
>> +        /* Divide the display by 3 but keep back/font porch and
>> +         * pulse width same
>> +         */
>> +        h_total -= hdisplay;
>> +        hdisplay /= 3;
>> +        h_total += hdisplay;
>> +        ha_end = ha_start + hdisplay;
>> +    }
>> +
>>       if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
>> +        if (msm_host->dsc) {
>> +            struct msm_display_dsc_config *dsc = msm_host->dsc;
>> +            u32 reg, intf_width, slice_per_intf;
>> +            u32 total_bytes_per_intf;
>> +
>> +            /* first calculate dsc parameters and then program
>> +             * compress mode registers
>> +             */
>> +            intf_width = hdisplay;
>> +            slice_per_intf = DIV_ROUND_UP(intf_width, 
>> dsc->drm->slice_width);
>> +
>> +            dsc->drm->slice_count = 1;
>> +            dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width 
>> * 8, 8);
>> +            total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
>> +
>> +            dsc->eol_byte_num = total_bytes_per_intf % 3;
>> +            dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
>> +            dsc->bytes_per_pkt = dsc->bytes_in_slice * 
>> dsc->drm->slice_count;
>> +            dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
>> +
>> +            reg = dsc->bytes_per_pkt << 16;
>> +            reg |= (0x0b << 8);    /* dtype of compressed image */
>> +
>> +            /* pkt_per_line:
>> +             * 0 == 1 pkt
>> +             * 1 == 2 pkt
>> +             * 2 == 4 pkt
>> +             * 3 pkt is not supported
>> +             * above translates to ffs() - 1
>> +             */
>> +            reg |= (ffs(dsc->pkt_per_line) - 1) << 6;
>> +
>> +            dsc->eol_byte_num = total_bytes_per_intf % 3;
>> +            reg |= dsc->eol_byte_num << 4;
>> +            reg |= 1;
>> +
>> +            dsi_write(msm_host,
>> +                  REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>> +        }
>> +
>>           dsi_write(msm_host, REG_DSI_ACTIVE_H,
>>               DSI_ACTIVE_H_START(ha_start) |
>>               DSI_ACTIVE_H_END(ha_end));
>> @@ -959,8 +1034,40 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>               DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>>               DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>>       } else {        /* command mode */
>> +        if (msm_host->dsc) {
>> +            struct msm_display_dsc_config *dsc = msm_host->dsc;
>> +            u32 reg, reg_ctrl, reg_ctrl2;
>> +            u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
>> +
>> +            reg_ctrl = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
>> +            reg_ctrl2 = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
>> +
>> +            slice_per_intf = DIV_ROUND_UP(hdisplay, 
>> dsc->drm->slice_width);
>> +            bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
>> +                              dsc->drm->bits_per_pixel, 8);
>> +            dsc->drm->slice_chunk_size = bytes_in_slice;
>> +            total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
>> +            dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
>> +
>> +            reg = 0x39 << 8;
>> +            reg |= ffs(dsc->pkt_per_line) << 6;
>> +
>> +            dsc->eol_byte_num = total_bytes_per_intf % 3;
>> +            reg |= dsc->eol_byte_num << 4;
>> +            reg |= 1;
>> +
>> +            reg_ctrl |= reg;
>> +            reg_ctrl2 |= bytes_in_slice;
>> +
>> +            dsi_write(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
>> +            dsi_write(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>> +        }
>> +
>>           /* image data and 1 byte write_memory_start cmd */
>> -        wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>> +        if (!msm_host->dsc)
>> +            wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>> +        else
>> +            wc = mode->hdisplay / 2 + 1;
>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>> @@ -2051,9 +2158,13 @@ int msm_dsi_host_modeset_init(struct 
>> mipi_dsi_host *host,
>>   {
>>       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>> +    struct msm_drm_private *priv;
>>       int ret;
>>       msm_host->dev = dev;
>> +    priv = dev->dev_private;
>> +    priv->dsc = msm_host->dsc;
> 
> I have been thinking about this piece. I highly dislike the priv->dsc 
> field for multiple reasons.
> 
> Please correct me if I'm wrong, we use it for several reasons:
> - to check if DSC is requested at all
> - to store the dsc_mask
> 
> The DSC mask should be calculated basing on dpu_encoder_virt->hw_dsc[] 
> values, so it can be removed from msm_display_dsc_config.
> 
> To check whether DSC is enabled, I'd suggest the following:
> 
> - Add use_dsc flag to struct msm_display_info.
>    This way it would be generic to all possible encoders which can use DSC.
> 
> - Add struct msm_dsi_has_dsc_panel() function.
>    It checks whether msm_host has ->dsc data. Feel free to change the 
> name of the function to better suit your style.
> 
> - Call msm_dsi_has_dsc_panel() from _dpu_kms_initialize_dsi().
>    If DSC is requested, set info->use_dsc.
> 
> - In dpu_encoder_setup store use_dsc in struct dpu_encoder_virt() and 
> use it later instead of checking priv->dsc.

I forgot about the patch 2, which actually uses priv->dsc data. The 
overall idea would be the same, get data pointer from msm_dsi and pass 
it through the msm_display_info.

> 
> WDYT?
> 
> 
>> +
>>       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>       if (ret) {
>>           pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
>>
> 
> 


-- 
With best wishes
Dmitry
