Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D3A4398E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 16:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhJYOqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 10:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbhJYOqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 10:46:00 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE85C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 07:43:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so12469201lfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aMOZolOh952xsKGqN5bct3zBu9Lzqg6czkVYsSx1yuE=;
        b=EopIQ637SwICGuNGZ+FPeowtA/DYsvyXfLRdoww1gNrE/I1SnIHaejm4UDhe0zFQLF
         9a00CEWBYMBzJ1LnZHsezIjNvfEFHpenmrMiFqnOjFCw8h92rkiyxLwwcQChTO4MHlIu
         KNMwi9lycAes7Ss6t7xdoRPLmQzW3e5+w+BaUW8/3JS+w0LHZOVYIL6uNWxQ/p8gRf2X
         zXiWzMC+mOlwwYRJp2lRKH/jH0XvwKlROk7O/oplMmhUqif6soy3z+Fo16Yqx8MSX7a/
         zgBh7mFCDDjv9a6UaKQQB0MCt1/QBHqnwe1nRuGqMEI2LrZ8u6rdtgl8rV9Kn+LMSD1K
         vFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aMOZolOh952xsKGqN5bct3zBu9Lzqg6czkVYsSx1yuE=;
        b=Vr1ea3bkNtEUW3HPw2EYjYJNWr1gkheZa5Ij+8u3J2m5kdd913HzoPcM8YGpBXqWqG
         FcFSIAdX9jg5uRPnSXVkSOYba3sAKC4XavR/6PS9wGhit5XCEzlf4c3QtMdVT5uE8bhs
         sVhvekDypTt6v/bQOnxjFdMCD4ypn630+XHJ6vqoVMj3gEqLVSfKq0NuwrWFO7yTyoxD
         fmzOe9JvTqE+COsI7lSAY9jow7akdv2Nre4/q2y4ttOWvEhet39/QI2A1UsNU+P1r9p5
         aDvV0My4Fre3gGijuridDBLuqurp1tQmHhAmpFdAQ/Hu4rBUSKy9mzfKi8l7dWYKgjqY
         wCTg==
X-Gm-Message-State: AOAM530ld9DgRdQD2sH/74nbtQenKoWYSnEswkIKav7Q8kLcIdUFXh5O
        Q+AchahRo52ERgO9sgzqzHPKhA==
X-Google-Smtp-Source: ABdhPJyUiKd7W8f5v481Cr2XfmxR/TZp5YKQBrpbr3tbw9tGoTk0iMP67J0/fxqCeUqzw+aCAiqRCg==
X-Received: by 2002:a05:6512:230d:: with SMTP id o13mr17423554lfu.333.1635173016436;
        Mon, 25 Oct 2021 07:43:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r10sm1745292ljg.10.2021.10.25.07.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:43:36 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] drm/msm/dsi: add support for dsc data
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
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-2-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <76e0c41c-5de8-1015-c795-948b227c6013@linaro.org>
Date:   Mon, 25 Oct 2021 17:43:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007070900.456044-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2021 10:08, Vinod Koul wrote:
> Display Stream Compression (DSC) parameters need to be calculated. Add
> helpers and struct msm_display_dsc_config in msm_drv for this
> msm_display_dsc_config uses drm_dsc_config for DSC parameters.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since
> v1:
>   - Drop unused fields from msm_display_dsc_config
> RFC:
>   - Drop the DT parsing code
>   - Port dsc param calculation from downstream
> 
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 132 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h      |  18 ++++
>   2 files changed, 150 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..ba24458c2e38 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -31,6 +31,8 @@
>   
>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>   
> +static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc);
> +
>   static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
>   {
>   	u32 ver;
> @@ -156,6 +158,7 @@ struct msm_dsi_host {
>   	struct regmap *sfpb;
>   
>   	struct drm_display_mode *mode;
> +	struct msm_display_dsc_config *dsc;
>   
>   	/* connected device info */
>   	struct device_node *device_node;
> @@ -1748,6 +1751,135 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>   	return -EINVAL;
>   }
>   
> +static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> +	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
> +	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> +};
> +
> +/* only 8bpc, 8bpp added */
> +static char min_qp[DSC_NUM_BUF_RANGES] = {
> +	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
> +};
> +
> +static char max_qp[DSC_NUM_BUF_RANGES] = {
> +	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
> +};
> +
> +static char bpg_offset[DSC_NUM_BUF_RANGES] = {
> +	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> +};
> +
> +static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
> +{
> +	int mux_words_size;
> +	int groups_per_line, groups_total;
> +	int min_rate_buffer_size;
> +	int hrd_delay;
> +	int pre_num_extra_mux_bits, num_extra_mux_bits;
> +	int slice_bits;
> +	int target_bpp_x16;
> +	int data;
> +	int final_value, final_scale;
> +	int i;
> +
> +	dsc->drm->rc_model_size = 8192;
> +	dsc->drm->first_line_bpg_offset = 12;
> +	dsc->drm->rc_edge_factor = 6;
> +	dsc->drm->rc_tgt_offset_high = 3;
> +	dsc->drm->rc_tgt_offset_low = 3;
> +	dsc->drm->simple_422 = 0;
> +	dsc->drm->convert_rgb = 1;
> +	dsc->drm->vbr_enable = 0;
> +
> +	/* handle only bpp = bpc = 8 */
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
> +		dsc->drm->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		dsc->drm->rc_range_params[i].range_min_qp = min_qp[i];
> +		dsc->drm->rc_range_params[i].range_max_qp = max_qp[i];
> +		dsc->drm->rc_range_params[i].range_bpg_offset = bpg_offset[i];
> +	}
> +
> +	dsc->drm->initial_offset = 6144; /* Not bpp 12 */
> +	if (dsc->drm->bits_per_pixel != 8)
> +		dsc->drm->initial_offset = 2048;	/* bpp = 12 */
> +
> +	mux_words_size = 48;		/* bpc == 8/10 */
> +	if (dsc->drm->bits_per_component == 12)
> +		mux_words_size = 64;
> +
> +	dsc->drm->initial_xmit_delay = 512;
> +	dsc->drm->initial_scale_value = 32;
> +	dsc->drm->first_line_bpg_offset = 12;
> +	dsc->drm->line_buf_depth = dsc->drm->bits_per_component + 1;
> +
> +	/* bpc 8 */
> +	dsc->drm->flatness_min_qp = 3;
> +	dsc->drm->flatness_max_qp = 12;
> +	dsc->det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
> +	dsc->drm->rc_quant_incr_limit0 = 11;
> +	dsc->drm->rc_quant_incr_limit1 = 11;
> +	dsc->drm->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> +
> +	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
> +	 * params are calculated
> +	 */
> +	dsc->slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
> +	groups_per_line = DIV_ROUND_UP(dsc->drm->slice_width, 3);
> +	dsc->drm->slice_chunk_size = dsc->drm->slice_width * dsc->drm->bits_per_pixel / 8;
> +	if ((dsc->drm->slice_width * dsc->drm->bits_per_pixel) % 8)
> +		dsc->drm->slice_chunk_size++;
> +
> +	/* rbs-min */
> +	min_rate_buffer_size =  dsc->drm->rc_model_size - dsc->drm->initial_offset +
> +				dsc->drm->initial_xmit_delay * dsc->drm->bits_per_pixel +
> +				groups_per_line * dsc->drm->first_line_bpg_offset;
> +
> +	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->drm->bits_per_pixel);
> +
> +	dsc->drm->initial_dec_delay = hrd_delay - dsc->drm->initial_xmit_delay;
> +
> +	dsc->drm->initial_scale_value = 8 * dsc->drm->rc_model_size /
> +				       (dsc->drm->rc_model_size - dsc->drm->initial_offset);
> +
> +	slice_bits = 8 * dsc->drm->slice_chunk_size * dsc->drm->slice_height;
> +
> +	groups_total = groups_per_line * dsc->drm->slice_height;
> +
> +	data = dsc->drm->first_line_bpg_offset * 2048;
> +
> +	dsc->drm->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->drm->slice_height - 1));
> +
> +	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->drm->bits_per_component + 4) - 2);
> +
> +	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
> +			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
> +
> +	data = 2048 * (dsc->drm->rc_model_size - dsc->drm->initial_offset + num_extra_mux_bits);
> +	dsc->drm->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> +
> +	/* bpp * 16 + 0.5 */
> +	data = dsc->drm->bits_per_pixel * 16;
> +	data *= 2;
> +	data++;
> +	data /= 2;
> +	target_bpp_x16 = data;
> +
> +	data = (dsc->drm->initial_xmit_delay * target_bpp_x16) / 16;
> +	final_value =  dsc->drm->rc_model_size - data + num_extra_mux_bits;
> +	dsc->drm->final_offset = final_value;
> +
> +	final_scale = 8 * dsc->drm->rc_model_size / (dsc->drm->rc_model_size - final_value);
> +
> +	data = (final_scale - 9) * (dsc->drm->nfl_bpg_offset + dsc->drm->slice_bpg_offset);
> +	dsc->drm->scale_increment_interval = (2048 * dsc->drm->final_offset) / data;
> +
> +	dsc->drm->scale_decrement_interval = groups_per_line / (dsc->drm->initial_scale_value - 8);
> +
> +	return 0;
> +}
> +
>   static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
>   {
>   	struct device *dev = &msm_host->pdev->dev;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 8b005d1ac899..367eb1092374 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_fb_helper.h>
> +#include <drm/drm_dsc.h>
>   #include <drm/msm_drm.h>
>   #include <drm/drm_gem.h>
>   
> @@ -135,6 +136,20 @@ struct msm_drm_thread {
>   	struct kthread_worker *worker;
>   };
>   
> +/* DSC config */
> +struct msm_display_dsc_config {
> +	struct drm_dsc_config *drm;
> +
> +	u32 initial_lines;
> +	u32 pkt_per_line;
> +	u32 bytes_in_slice;
> +	u32 bytes_per_pkt;
> +	u32 eol_byte_num;
> +	u32 pclk_per_line;
> +	u32 slice_last_group_size;
> +	u32 det_thresh_flatness;
> +};
> +
>   struct msm_drm_private {
>   
>   	struct drm_device *dev;
> @@ -229,6 +244,9 @@ struct msm_drm_private {
>   	/* Properties */
>   	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
>   
> +	/* DSC configuration */
> +	struct msm_display_dsc_config *dsc;
> +

I have been looking at this again. I think that we should not put sole 
msm_display_dsc_config into msm_drm_private. Even if we agree that it is 
used only for DSI for now, we have two separate DSI channels (and up to 
two bridges/panels). Do you really need it in the global private data?

Anyway, this field should be moved to the patch where it is actually set 
or used.

>   	/* VRAM carveout, used when no IOMMU: */
>   	struct {
>   		unsigned long size;
> 


-- 
With best wishes
Dmitry
