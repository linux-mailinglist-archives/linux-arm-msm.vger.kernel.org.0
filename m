Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5843366C40C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 16:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjAPPgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 10:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbjAPPfS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 10:35:18 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2194623879
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:33:08 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e3so18621589wru.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qtqZdBROkBky94C/LQ+25J07B9BTNHsS0Z6ioalX3YA=;
        b=afFUkbmAkbMTFaNJcbdGMkL29e8yJvOKjdES30ZvJdt5p0Gvm3XhlbfRjASaIKbOV6
         FPf30VrAoHEIGGT0QoIBzanMCKJsA5UGCx5LUsGHq5hwgQS5PT359ILkqowsW0Uz05QH
         1y1GavICB8h+wcQCbH5o/vQrq7xAMhFuY8ncEtmbqrhYVXC5qf3X5/Jf0jNkBlfxJkf4
         H7y2Sx779D07XT/uaI/qxdDjjRsCdJqmMuvgiqbhWs71qB5IrYYSjBdjvLVvUlaIJjVo
         1XTqJlmznoxPUY8/uS7tonuNpJXp0VUYn07gDU1dUxs+qVpKiY+CiGjdEZND1HJoAFgq
         1MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtqZdBROkBky94C/LQ+25J07B9BTNHsS0Z6ioalX3YA=;
        b=DEHS6DHeLQZw3whYz9AdeXkthSm6J6uQtNdqUnvSiXZXLpEv8PdpWSrsY9dS4eMCg3
         uJaIFRe5fdI1BUCBzoKH3KC1FISuXjlvLXsQzZVc1zSgHTUd5bfRtPVJOCgKKrs6+qCe
         ql5V4ijNnXz76QjfqXdPvfsyjE0Vfx/8e9vwI06jJ6c5kIVka10avaeIpA79EWkC76uK
         4sKoyDzEL2dCvoGd29nC6jwoL1UDrfhhLXnLHc7Vptx3vIYkvs2DCsKczaECyCmpfvba
         rM8SVw5hGsnObE55qzA11naULe7MnCzILtl/opwENSR8LN5Op9UJBRCcgCSZAsxYqKIl
         L7MQ==
X-Gm-Message-State: AFqh2krAVXjhZoMngkhAZShKjAulxcYdhlU1TFEhFBDeDAHNhSAl2o7b
        x1KwddyzdDLdCoZ+pbhYU+RE/g==
X-Google-Smtp-Source: AMrXdXsp4j0/ELwXCzyw5D5hbnV3JyIcKYvzKfM664c8iQCqK6bItYDViXiGko/MkKQTwK6d7Fx6xQ==
X-Received: by 2002:adf:fdc7:0:b0:2bb:1844:32a4 with SMTP id i7-20020adffdc7000000b002bb184432a4mr25391134wrs.48.1673883186579;
        Mon, 16 Jan 2023 07:33:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0? ([2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0])
        by smtp.gmail.com with ESMTPSA id a10-20020adfdd0a000000b002bb6b45ab57sm24648957wrm.85.2023.01.16.07.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 07:33:06 -0800 (PST)
Message-ID: <1203a8e5-07a2-e760-f77d-7c037ac4affc@linaro.org>
Date:   Mon, 16 Jan 2023 16:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] drm/msm/dpu: simplify blend configuration
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
 <20230116063316.728496-3-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230116063316.728496-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/01/2023 07:33, Dmitry Baryshkov wrote:
> Rewrite dpu_hw_ctl_setup_blendstage() to use static data configuration
> rather than using a switch-case. This simplifies adding support for new
> pipes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 156 ++++++---------------
>   1 file changed, 45 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4d70dcd46c9d..f3c15b5a2099 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -379,14 +379,37 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
>   	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
>   }
>   
> +struct ctl_blend_config {
> +	int idx, shift, ext_shift;
> +};
> +
> +static const struct ctl_blend_config ctl_blend_config[][2] = {
> +	[SSPP_NONE] = { { -1 }, { -1 } },
> +	[SSPP_MAX] =  { { -1 }, { -1 } },
> +	[SSPP_VIG0] = { { 0, 0,  0  }, { 3, 0 } },
> +	[SSPP_VIG1] = { { 0, 3,  2  }, { 3, 4 } },
> +	[SSPP_VIG2] = { { 0, 6,  4  }, { 3, 8 } },
> +	[SSPP_VIG3] = { { 0, 26, 6  }, { 3, 12 } },
> +	[SSPP_RGB0] = { { 0, 9,  8  }, { -1 } },
> +	[SSPP_RGB1] = { { 0, 12, 10 }, { -1 } },
> +	[SSPP_RGB2] = { { 0, 15, 12 }, { -1 } },
> +	[SSPP_RGB3] = { { 0, 29, 14 }, { -1 } },
> +	[SSPP_DMA0] = { { 0, 18, 16 }, { 2, 8 } },
> +	[SSPP_DMA1] = { { 0, 21, 18 }, { 2, 12 } },
> +	[SSPP_DMA2] = { { 2, 0      }, { 2, 16 } },
> +	[SSPP_DMA3] = { { 2, 4      }, { 2, 20 } },
> +	[SSPP_DMA4] = { { 4, 0      }, { 4, 8 } },
> +	[SSPP_DMA5] = { { 4, 4      }, { 4, 12 } },
> +	[SSPP_CURSOR0] =  { { 1, 20 }, { -1 } },
> +	[SSPP_CURSOR1] =  { { 1, 26 }, { -1 } },
> +};
> +
>   static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
>   	u32 mix, ext, mix_ext;
> -	u32 mixercfg = 0, mixercfg_ext = 0;
> -	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
> -	u32 mixercfg_ext4 = 0;
> +	u32 mixercfg[5] = { 0 };
>   	int i, j;
>   	int stages;
>   	int pipes_per_stage;
> @@ -401,7 +424,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	else
>   		pipes_per_stage = 1;
>   
> -	mixercfg = CTL_MIXER_BORDER_OUT; /* always set BORDER_OUT */
> +	mixercfg[0] = CTL_MIXER_BORDER_OUT; /* always set BORDER_OUT */
>   
>   	if (!stage_cfg)
>   		goto exit;
> @@ -415,119 +438,30 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   		for (j = 0 ; j < pipes_per_stage; j++) {
>   			enum dpu_sspp_multirect_index rect_index =
>   				stage_cfg->multirect_index[i][j];
> -
> -			switch (stage_cfg->stage[i][j]) {
> -			case SSPP_VIG0:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 0;
> -				} else {
> -					mixercfg |= mix << 0;
> -					mixercfg_ext |= ext << 0;
> -				}
> -				break;
> -			case SSPP_VIG1:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 4;
> -				} else {
> -					mixercfg |= mix << 3;
> -					mixercfg_ext |= ext << 2;
> -				}
> -				break;
> -			case SSPP_VIG2:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 8;
> -				} else {
> -					mixercfg |= mix << 6;
> -					mixercfg_ext |= ext << 4;
> -				}
> -				break;
> -			case SSPP_VIG3:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 12;
> -				} else {
> -					mixercfg |= mix << 26;
> -					mixercfg_ext |= ext << 6;
> -				}
> -				break;
> -			case SSPP_RGB0:
> -				mixercfg |= mix << 9;
> -				mixercfg_ext |= ext << 8;
> -				break;
> -			case SSPP_RGB1:
> -				mixercfg |= mix << 12;
> -				mixercfg_ext |= ext << 10;
> -				break;
> -			case SSPP_RGB2:
> -				mixercfg |= mix << 15;
> -				mixercfg_ext |= ext << 12;
> -				break;
> -			case SSPP_RGB3:
> -				mixercfg |= mix << 29;
> -				mixercfg_ext |= ext << 14;
> -				break;
> -			case SSPP_DMA0:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 8;
> -				} else {
> -					mixercfg |= mix << 18;
> -					mixercfg_ext |= ext << 16;
> -				}
> -				break;
> -			case SSPP_DMA1:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 12;
> -				} else {
> -					mixercfg |= mix << 21;
> -					mixercfg_ext |= ext << 18;
> -				}
> -				break;
> -			case SSPP_DMA2:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 16;
> -				} else {
> -					mixercfg_ext2 |= mix_ext << 0;
> -				}
> -				break;
> -			case SSPP_DMA3:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 20;
> -				} else {
> -					mixercfg_ext2 |= mix_ext << 4;
> -				}
> -				break;
> -			case SSPP_DMA4:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= mix_ext << 8;
> -				} else {
> -					mixercfg_ext4 |= mix_ext << 0;
> -				}
> -				break;
> -			case SSPP_DMA5:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= mix_ext << 12;
> -				} else {
> -					mixercfg_ext4 |= mix_ext << 4;
> -				}
> -				break;
> -			case SSPP_CURSOR0:
> -				mixercfg_ext |= mix_ext << 20;
> -				break;
> -			case SSPP_CURSOR1:
> -				mixercfg_ext |= mix_ext << 26;
> -				break;
> -			default:
> -				break;
> +			enum dpu_sspp pipe = stage_cfg->stage[i][j];
> +			const struct ctl_blend_config *cfg =
> +				&ctl_blend_config[pipe][rect_index == DPU_SSPP_RECT_1];
> +
> +			/*
> +			 * CTL_LAYER has 3-bit field (and extra bits in EXT register),
> +			 * all EXT registers has 4-bit fields.
> +			 */
> +			if (cfg->idx == 0) {
> +				mixercfg[0] |= mix << cfg->shift;
> +				mixercfg[1] |= ext << cfg->ext_shift;
> +			} else {
> +				mixercfg[cfg->idx] |= mix_ext << cfg->shift;
>   			}
>   		}
>   	}
>   
>   exit:
> -	DPU_REG_WRITE(c, CTL_LAYER(lm), mixercfg);
> -	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg_ext);
> -	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg_ext2);
> -	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg_ext3);
> +	DPU_REG_WRITE(c, CTL_LAYER(lm), mixercfg[0]);
> +	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
> +	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
> +	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
>   	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
> -		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg_ext4);
> +		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
>   }
>   
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550
