Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D686F70DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 19:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjEDR3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 13:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjEDR3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 13:29:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D645255
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 10:29:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f13bfe257aso904764e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683221380; x=1685813380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rqx2oaS2krP8hJ8s1gObuqMtMm/34roOVXO517vfLI=;
        b=Md78zS/H9nDi4/5TGuN1rrSIYirmon/lnfYwDTygH4+2pCycoSP6NK3jcUDncU+Jrd
         y13kGRsJ1YWLDPFyiKUSqXWOeLjKpkHSZUMNWdS8Qdg2GSRn8NITQdMr8SfOFwm1JcFF
         4gKBsBaxMlDsy2b7ShEEVScbBW9arecty7gvYrAE/QUpvmh4AkatVf8S3pxnRqBXHZT3
         ONOLcutZQHPp/X/pxImmSZvAmozE92GUnzHU/Z8/RBVoeQ9F8QyuqQIFOeexU12KOoZ8
         xnjoEkOk/AwjEn0AtpmOSCBooXT6FAuh9+A745R+ept329yqKSBsxTZMzP8GJoKh+Hzg
         3v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683221380; x=1685813380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rqx2oaS2krP8hJ8s1gObuqMtMm/34roOVXO517vfLI=;
        b=Uwrns5Cvaia0IEnNTbzgW3vAiMFTMIQF7DO3xhEfq3d+wZrjryGDxBx0IssFoq1gdj
         S6gdP7oWO+9h0PnW9SdqgtymJCOSOfKVxqHI3extgW0TEh0Eg/ouEBtAECXs4NQxMC2z
         ljCi06gIjFN1DfyaNYilRJcUssU+3zW5w0rbH2vxeSGUZHIo+cThWF4pQO09kvAP/z8k
         WlyOwx0noDhUO/GIQXu0pBPKP6dTUy44sBXvDXlSrhEQkx8x+bVygzyS9gDbYxOBpKpg
         6C06RL8cy7PvRN6BYj2tu0vRgVufofIbYuWp6iiuf2FO5VpeqA2Hng77Iw6cZmzQkPdx
         q/dQ==
X-Gm-Message-State: AC+VfDweMfrl+9AlAMjOd6YXLQmeMLPIxoES3dcjkHh0B6X5tHc2ElJD
        RtFtcZuf//0QMIAC69pltAKUzQ==
X-Google-Smtp-Source: ACHHUZ4HljCmSgAU/9QjSXFjdUruCJDfpqqJDg+LRsQZ1FkqsJbIV4LqlmTHpHgykScyHyuq3SUFjA==
X-Received: by 2002:a19:ee03:0:b0:4ea:fa26:2378 with SMTP id g3-20020a19ee03000000b004eafa262378mr1922417lfb.23.1683221379830;
        Thu, 04 May 2023 10:29:39 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id c8-20020ac24148000000b004edc20b8929sm6588853lfi.69.2023.05.04.10.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 10:29:39 -0700 (PDT)
Message-ID: <a37ff9da-d8d8-0af0-6d08-3d8858fe49f9@linaro.org>
Date:   Thu, 4 May 2023 19:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] venus: update calculation for dpb buffers
Content-Language: en-US
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-media@vger.kernel.org, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1683196599-3730-1-git-send-email-quic_dikshita@quicinc.com>
 <1683196599-3730-3-git-send-email-quic_dikshita@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1683196599-3730-3-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.05.2023 12:36, Dikshita Agarwal wrote:
> Use dpb color format, width and height of output port
> for calculating buffer size of dpb buffers.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
Looks sane but I'm not exactly an expert on this

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/media/platform/qcom/venus/helpers.c          | 4 ++++
>  drivers/media/platform/qcom/venus/hfi_plat_bufs.h    | 3 +++
>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 8 +++++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5946def..4ad6232 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -641,12 +641,16 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
>  	if (is_dec) {
>  		params.width = inst->width;
>  		params.height = inst->height;
> +		params.out_width = inst->out_width;
> +		params.out_height = inst->out_height;
>  		params.codec = inst->fmt_out->pixfmt;
>  		params.hfi_color_fmt = to_hfi_raw_fmt(inst->fmt_cap->pixfmt);
>  		params.dec.max_mbs_per_frame = mbs_per_frame_max(inst);
>  		params.dec.buffer_size_limit = 0;
>  		params.dec.is_secondary_output =
>  			inst->opb_buftype == HFI_BUFFER_OUTPUT2;
> +		if (params.dec.is_secondary_output)
> +			params.hfi_dpb_color_fmt = inst->dpb_fmt;
>  		params.dec.is_interlaced =
>  			inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE;
>  	} else {
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs.h b/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
> index 52a51a3..25e6074 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
> @@ -12,8 +12,11 @@
>  struct hfi_plat_buffers_params {
>  	u32 width;
>  	u32 height;
> +	u32 out_width;
> +	u32 out_height;
>  	u32 codec;
>  	u32 hfi_color_fmt;
> +	u32 hfi_dpb_color_fmt;
>  	enum hfi_version version;
>  	u32 num_vpp_pipes;
>  	union {
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index ea25c45..3855b04 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -1185,6 +1185,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  	enum hfi_version version = params->version;
>  	u32 codec = params->codec;
>  	u32 width = params->width, height = params->height, out_min_count;
> +	u32 out_width = params->out_width, out_height = params->out_height;
>  	struct dec_bufsize_ops *dec_ops;
>  	bool is_secondary_output = params->dec.is_secondary_output;
>  	bool is_interlaced = params->dec.is_interlaced;
> @@ -1235,7 +1236,12 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  		bufreq->count_min = out_min_count;
>  		bufreq->size =
>  			venus_helper_get_framesz_raw(params->hfi_color_fmt,
> -						     width, height);
> +						     out_width, out_height);
> +		if (buftype == HFI_BUFFER_OUTPUT &&
> +		    params->dec.is_secondary_output)
> +			bufreq->size =
> +				venus_helper_get_framesz_raw(params->hfi_dpb_color_fmt,
> +							     out_width, out_height);
>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH(version)) {
>  		bufreq->size = dec_ops->scratch(width, height, is_interlaced);
>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version)) {
