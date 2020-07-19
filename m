Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B302253CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jul 2020 21:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgGSTz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jul 2020 15:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgGSTzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jul 2020 15:55:55 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3461AC0619D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2020 12:55:55 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id 12so12762691oir.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2020 12:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mRtQwdBy4cMJ2VUTfd5VyA2rBeltOGvlkiQuwEZP/i0=;
        b=PhcDkenTejEXeGJcJ3EQZjX+eEwXRF9XstpBQVjzS7UUEYNKMmLlrNKaIspOlx7Zap
         Rz+/m+U/nF7UDTCOYhgyHx4VWF01jSPYYOSDOjWLwZZMCsIHRjNfLD6+9oSJ6l6PrVr9
         ZEKskoCZDSWAaJxXwdyDNG7V7TsiPdJA95T+3fKsSUHzkvSi/vfkhl9M5v8VmXMsmLRh
         XutfxqtwmBu1NRfPkBwHoTShtmY7kotXkg9ErOerm2o0HGP85uWR1SwDpB5V7C2Ikxqr
         SSapvobuuewi9v1BGd9oNqQOtZQrPrxU5xjs7im7rVpW5JFcDDw6JglzhMNhZCwKzSWf
         en+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mRtQwdBy4cMJ2VUTfd5VyA2rBeltOGvlkiQuwEZP/i0=;
        b=ZQfQOz+XIvL+sWgjMqbldlfTdGD3LDkjSi2V3xL1zNZVTXGv7D+W6I4H/yh3YHSKp6
         Jj1Uho4ydrx1XcK8tx3aHqvXwtb4Uo+bcWI7IhBaPwMHqAON6etAGTUT685gA7/iy2+3
         zPUcRHPQARF2c5hzJ9YgS4jKyuaBxIXAGPdy4RYlMo/YxzXM2a7q5kh1l4fzxODVpBrq
         nIFKhP1c757mqsM7K2xxpQgSq3/0oreC9EoOqFIKCl+r3BU6LNoXYmO+bHBcYJR/T0/7
         +r1D36HeE9x6T0kRUdESrg0AVbCnjVyJ9ZaiWDAbIAaag9ERZl863IQdtO33aC2Moe/7
         rsTw==
X-Gm-Message-State: AOAM531Lh7KThNZ/s+Nm49Qdfkn/1sLJmBWFEPDiVrHUQ8B0e2v4mYqh
        PZcVzoIH5Z/zC5iagz5QqLDzsg==
X-Google-Smtp-Source: ABdhPJw49cUNxgoWmff++mA23jaYik5OoL2M48trhIC+wILhz86X9K4y444350XVMjDkuuELIlfF6g==
X-Received: by 2002:aca:54d1:: with SMTP id i200mr15643632oib.11.1595188554414;
        Sun, 19 Jul 2020 12:55:54 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id 97sm3091692oti.15.2020.07.19.12.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2020 12:55:53 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dpu: fix/enable 6bpc dither with split-lm
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Steev Klimaszewski <steev@gentoo.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Zheng Bin <zhengbin13@huawei.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200715221955.3209856-1-robdclark@gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <997f19de-9ea0-969c-ba91-603a2b214299@kali.org>
Date:   Sun, 19 Jul 2020 14:55:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715221955.3209856-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 7/15/20 5:19 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> If split-lm is used (for ex, on sdm845), we can have multiple ping-
> pongs, but only a single phys encoder.  We need to configure dithering
> on each of them.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 ++++++++++---------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  3 +--
>  2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 46df0ff75b85..9b98b63c77fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -212,14 +212,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>  	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>  };
>  
> -static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
> +static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>  {
>  	struct dpu_hw_dither_cfg dither_cfg = { 0 };
>  
> -	if (!phys->hw_pp || !phys->hw_pp->ops.setup_dither)
> +	if (!hw_pp->ops.setup_dither)
>  		return;
>  
> -	switch (phys->connector->display_info.bpc) {
> +	switch (bpc) {
>  	case 6:
>  		dither_cfg.c0_bitdepth = 6;
>  		dither_cfg.c1_bitdepth = 6;
> @@ -228,14 +228,14 @@ static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
>  		dither_cfg.temporal_en = 0;
>  		break;
>  	default:
> -		phys->hw_pp->ops.setup_dither(phys->hw_pp, NULL);
> +		hw_pp->ops.setup_dither(hw_pp, NULL);
>  		return;
>  	}
>  
>  	memcpy(&dither_cfg.matrix, dither_matrix,
>  			sizeof(u32) * DITHER_MATRIX_SZ);
>  
> -	phys->hw_pp->ops.setup_dither(phys->hw_pp, &dither_cfg);
> +	hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
>  }
>  
>  void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
> @@ -1132,11 +1132,13 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>  
>  	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>  
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> -
> -			_dpu_encoder_setup_dither(phys);
> +	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
> +			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
> +		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
> +		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +			if (!dpu_enc->hw_pp[i])
> +				continue;
> +			_dpu_encoder_setup_dither(dpu_enc->hw_pp[i], bpc);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 7411ab6bf6af..bea4ab5c58c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -231,8 +231,7 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>  	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>  	c->ops.get_line_count = dpu_hw_pp_get_line_count;
>  
> -	if (test_bit(DPU_PINGPONG_DITHER, &features) &&
> -		IS_SC7180_TARGET(c->hw.hwversion))
> +	if (test_bit(DPU_PINGPONG_DITHER, &features))
>  		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>  };

Sorry for taking so long to get around to testing this.  I was able to
today, and it does reduce the banding to be less noticeable.

Tested-by: Steev Klimaszewski <steev@kali.org>

Thanks!

-- steev

