Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B51445C937
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 16:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240177AbhKXP5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 10:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbhKXP47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 10:56:59 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87571C061714
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:53:49 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t26so8391036lfk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+2IForFL3H4Rg1XJ8u343moAEUuLDVUsXt53nWJvKrU=;
        b=We/6TJpANV9qHOxh9BmCKWfLE/RwYP+NbyYpP92C2gjS0rF9eZE9S6uPBNQZ/ABa2Y
         j4Az1JORBQ4RRObE48HNCFUIVnx56l8zpl2NLk6Ou93I5c5ojcmqcYGoUKEX0BFQLzpm
         FMxgM5CuUE97OGwRQHrkBLTFfCckDd5liIMdjZkpXdFMcj1YLzhpv9FDzKoBFjnan1mY
         qC8WPcNMBm9Pr1jOWe4/ZGYhvg5TL/uJCWTFpfRHokG8JBw0kmpgh4dEeQogN9c9OM7D
         JwdQ0xZ9d5Z1s8Gvcoo0iip06586XhOn768+acgny4/ag3Tpn26DrDqb4M6QHJJyd4eb
         SHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+2IForFL3H4Rg1XJ8u343moAEUuLDVUsXt53nWJvKrU=;
        b=MBc0eSdyoaYyuwDmvbM5hNZDXWDqQy+OFwpfSWT1UD8xCo68ePgvmHtuWvJnNgYs8c
         53bbMI2eU44fyCNdH6U2fDB9D2kf93LV3w86MsvAHDMPjIE64Cx3kP5n1wQvYkYHDXyb
         czK5Dfpp+HtMcAgMPvHIqC6hpgAoyaDbXU/U0njQfeg7o4a1rGb30bXDUSalrEKqlpcE
         5X3XWdui2kEyVEF/0TVPvVikbN/mvcKu3iTaf7RsYklGu44UAP/kDc5WhgB0PA36fhx/
         eObElXbMH4oNuqA+pBIG3T5kUQKjgbCeAUQVDeVY02jtKp+7yC8vsxa7uBtxgun+V6sm
         W04g==
X-Gm-Message-State: AOAM533Ulp7tpkTZZ2pdXlIeADm8c74XrQVmzlsxlRGxbKtDIOeQxBwd
        utalnqdWgUxjXJxGqblAahtWkQ==
X-Google-Smtp-Source: ABdhPJwc9IkVR/6iFihGQCJwJCGCWardGK58eVWHYbc4XlNITvEu1Xq1KP0jYHliVafcVkWDd5mGFA==
X-Received: by 2002:a05:6512:693:: with SMTP id t19mr15860139lfe.647.1637769227423;
        Wed, 24 Nov 2021 07:53:47 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m3sm20937lji.112.2021.11.24.07.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 07:53:46 -0800 (PST)
Subject: Re: [PATCH v3 01/13] drm/msm/dsi: add support for dsc data
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
 <20211116062256.2417186-2-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <606708b7-186e-3758-1130-b4e87beffe22@linaro.org>
Date:   Wed, 24 Nov 2021 18:53:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2021 09:22, Vinod Koul wrote:
> Display Stream Compression (DSC) parameters need to be calculated. Add
> helpers and struct msm_display_dsc_config in msm_drv for this
> msm_display_dsc_config uses drm_dsc_config for DSC parameters.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 132 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h      |  20 +++++
>   2 files changed, 152 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index f69a125f9559..30c1e299aa52 100644
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
> @@ -157,6 +159,7 @@ struct msm_dsi_host {
>   	struct regmap *sfpb;
>   
>   	struct drm_display_mode *mode;
> +	struct msm_display_dsc_config *dsc;
>   
>   	/* connected device info */
>   	struct device_node *device_node;
> @@ -1710,6 +1713,135 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
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
> index 69952b239384..de7cb65bfc52 100644
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
> @@ -134,6 +135,22 @@ struct msm_drm_thread {
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
> +
> +	unsigned int dsc_mask;

Here you have a bitmask, but it is never used in this way (you never 
read actual values from it). So I'd suggest to drop it.

> +};
> +
>   struct msm_drm_private {
>   
>   	struct drm_device *dev;
> @@ -228,6 +245,9 @@ struct msm_drm_private {
>   	/* Properties */
>   	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
>   
> +	/* DSC configuration */
> +	struct msm_display_dsc_config *dsc;

Let's make it `stuct msm_display_dsc_config * dsc[2]` at least. This way 
DSI0 and DSI1 will know if DSC should be used for the respective host.
Otherwise DSC can get enabled for DP encoder if there an attached DSC 
DSI panel.

> +
>   	/* VRAM carveout, used when no IOMMU: */
>   	struct {
>   		unsigned long size;
> 


-- 
With best wishes
Dmitry
