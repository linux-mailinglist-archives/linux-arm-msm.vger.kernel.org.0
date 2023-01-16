Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A42F66C40B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 16:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjAPPfw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 10:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjAPPe5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 10:34:57 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A2ED3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:32:55 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so22424060wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8bpel7kGKLHQHn4OeNNyIbXCW+3n7mjhMCA5OdKUwCI=;
        b=zTjgFSDTPfqa+bpVPJkM6+Y6Ms8SgFtWlHJx/RB4hlgC+KvvUnMJmYYLvQhQH6DjvA
         YwDB9L7tBXAFss4wJf1EppnvJnLMvHeNkqLmvJf13HKX4K/2+2DdYLsR9ewxnr7wG027
         L6KQuqZQktDdQw6/8GzZSbyNuq8QEKQBMBM2g1bdSvuRN5J6iA/isPD2r+WBvVEUzqib
         yRDc1I/Ni65O0tu7LI0T/8vhKhYIl8WL4b2PhlR6yCkjeXWp+ys5BuNecJMy8etz/hzN
         Za8hiNMWm4UtI8FVn93N7NVVZegpY0ms520Z/q31v+a53jNtgerdsxTNuxO0lF/0g/pv
         ch/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bpel7kGKLHQHn4OeNNyIbXCW+3n7mjhMCA5OdKUwCI=;
        b=EwGyERONxrH6OdhNRdN4LgnR2jZ55VyjmA41ICRPKurnVte9AeeyejneeVxv/kvrZv
         oZ3tZ/OspgCPXf2fzdeSl5vtfjvmgLI4YIXI7khkXD2Ujl9N5Vj01IlGIbX3qFC5iZC4
         Ux7uv41+PdKmjwKknkAa1KeGthTvqH1mInfEV7okYh6HF4z1zlYg3YjzKGdu2PkHWibI
         zFNEa2vNmoSeuWrthBK3dti0nnXgzO2I0JBAVyYwm7XHsUMKet2GiEq1Fp87KRYwXSvL
         xGRvP/Lcl87q1EntA9G8eQyTbnkBJfr2GkQukmK5lLSDNA5Pjnd2xI8JpqvFR5zvGYel
         WjBQ==
X-Gm-Message-State: AFqh2kpcSFvoARTGV7c+TPghbuuHwoOVisoJNJ4mVa+95QeuLg9dC7ER
        BKG//21Upd72FAfZ/Si3b1dq/g==
X-Google-Smtp-Source: AMrXdXsmWA1xcburcX2LMZyVHZnLClsI7GWMPr1ccomYi4coWfoLFdlEn4h94ltBxSw97JOqJRmv/A==
X-Received: by 2002:a05:600c:4fd5:b0:3da:1d24:e6bf with SMTP id o21-20020a05600c4fd500b003da1d24e6bfmr13757890wmq.37.1673883173617;
        Mon, 16 Jan 2023 07:32:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0? ([2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c4f0300b003a6125562e1sm36845822wmq.46.2023.01.16.07.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 07:32:53 -0800 (PST)
Message-ID: <a9421146-7993-0132-b3c5-1071ed8a5019@linaro.org>
Date:   Mon, 16 Jan 2023 16:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] drm/msm/dpu: simplify ctl_setup_blendstage
 calculation
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
 <20230116063316.728496-2-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230116063316.728496-2-dmitry.baryshkov@linaro.org>
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
> Extract the common expression in the dpu_hw_ctl_setup_blendstage()
> function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index f4fdf537616c..4d70dcd46c9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -383,7 +383,8 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> -	u32 mixercfg = 0, mixercfg_ext = 0, mix, ext;
> +	u32 mix, ext, mix_ext;
> +	u32 mixercfg = 0, mixercfg_ext = 0;
>   	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
>   	u32 mixercfg_ext4 = 0;
>   	int i, j;
> @@ -409,6 +410,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   		/* overflow to ext register if 'i + 1 > 7' */
>   		mix = (i + 1) & 0x7;
>   		ext = i >= 7;
> +		mix_ext = (i + 1) & 0xf;
>   
>   		for (j = 0 ; j < pipes_per_stage; j++) {
>   			enum dpu_sspp_multirect_index rect_index =
> @@ -417,7 +419,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   			switch (stage_cfg->stage[i][j]) {
>   			case SSPP_VIG0:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 0;
> +					mixercfg_ext3 |= mix_ext << 0;
>   				} else {
>   					mixercfg |= mix << 0;
>   					mixercfg_ext |= ext << 0;
> @@ -425,7 +427,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_VIG1:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 4;
> +					mixercfg_ext3 |= mix_ext << 4;
>   				} else {
>   					mixercfg |= mix << 3;
>   					mixercfg_ext |= ext << 2;
> @@ -433,7 +435,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_VIG2:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext3 |= mix_ext << 8;
>   				} else {
>   					mixercfg |= mix << 6;
>   					mixercfg_ext |= ext << 4;
> @@ -441,7 +443,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_VIG3:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext3 |= mix_ext << 12;
>   				} else {
>   					mixercfg |= mix << 26;
>   					mixercfg_ext |= ext << 6;
> @@ -465,7 +467,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_DMA0:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext2 |= mix_ext << 8;
>   				} else {
>   					mixercfg |= mix << 18;
>   					mixercfg_ext |= ext << 16;
> @@ -473,7 +475,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_DMA1:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext2 |= mix_ext << 12;
>   				} else {
>   					mixercfg |= mix << 21;
>   					mixercfg_ext |= ext << 18;
> @@ -481,39 +483,37 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_DMA2:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 16;
> +					mixercfg_ext2 |= mix_ext << 16;
>   				} else {
> -					mix |= (i + 1) & 0xF;
> -					mixercfg_ext2 |= mix << 0;
> +					mixercfg_ext2 |= mix_ext << 0;
>   				}
>   				break;
>   			case SSPP_DMA3:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 20;
> +					mixercfg_ext2 |= mix_ext << 20;
>   				} else {
> -					mix |= (i + 1) & 0xF;
> -					mixercfg_ext2 |= mix << 4;
> +					mixercfg_ext2 |= mix_ext << 4;
>   				}
>   				break;
>   			case SSPP_DMA4:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext4 |= mix_ext << 8;
>   				} else {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 0;
> +					mixercfg_ext4 |= mix_ext << 0;
>   				}
>   				break;
>   			case SSPP_DMA5:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext4 |= mix_ext << 12;
>   				} else {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 4;
> +					mixercfg_ext4 |= mix_ext << 4;
>   				}
>   				break;
>   			case SSPP_CURSOR0:
> -				mixercfg_ext |= ((i + 1) & 0xF) << 20;
> +				mixercfg_ext |= mix_ext << 20;
>   				break;
>   			case SSPP_CURSOR1:
> -				mixercfg_ext |= ((i + 1) & 0xF) << 26;
> +				mixercfg_ext |= mix_ext << 26;
>   				break;
>   			default:
>   				break;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550
