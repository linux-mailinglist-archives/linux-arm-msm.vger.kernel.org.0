Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11A2324BA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 09:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235348AbhBYIBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 03:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbhBYIBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 03:01:11 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6A6C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 00:00:30 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id jt13so7270830ejb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 00:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m/3BXe9Lkg2+bG4+JOmMPBGYbP5SjLdvW3zAmzRRA18=;
        b=Cx0Q9QwibRfL4FgW1g47i+cBuQywqNwYuaM0KHdhs+ThygEt8tQcqhXHjXalK2mwbL
         Ue2E7GF9V6Xk1g13xStSIxFesiWQkuLJ6YIT0f8HH1vjYU4PSADAvrmQ0YDDaY4IEPBk
         Tof/j7D+O/7KmSSiiE8w+BQbQ20bexdopdfrKTNV8yAF54ADTDpyzQEaEneGeNi3TqU3
         ZYHYazgbd1sOEATCpyAgo6uZZJtjvmFTibVberlYJzN6HYjhJHTMaiXjkw0Yg47onq+G
         jC4EUxJcYRAPe8fKOuyki5Eo+0L1ZcN0ln7qbAVjfmKcaWY2dF4hcA1FHBgV/EXjBPyK
         y7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m/3BXe9Lkg2+bG4+JOmMPBGYbP5SjLdvW3zAmzRRA18=;
        b=U/0DlEBApt1Rf6Qsj8j+gi1tZxD9/NQjvBVd3bjBw9ewgxSNmCSRCrbPKVbehfleLq
         E+Eb1w1jk/NfSlUKqX68homq/rAuff3Vmxsg1USlB9IgyuGnVi7/IjzX07SL9frIbZm/
         /uvHvesdcuk7qhqd4O8VXpMFltHaA9y/3kX94TldFoLbDMel+kDbCpMmvNdFYhgQJ2x3
         3ZS8XfnDCQeibCBEM8pHIbQvgS2+AHHcaktwe3P6BY1HDmnlj3ZTjbYhh6f8dhLX7LoL
         RQ+B8qpi4ZaZzzbDbPIAAURuJb0uBB15rP69ZeoTmJlEwlm4Yq8Rur7xv9//OfDgL5sl
         zcfw==
X-Gm-Message-State: AOAM531c+Rkp45kTyOlkLEcZtC0Rwf4rm78Sns4QmHru8rOcdYKMzWOA
        KYhQlVl630JYoQ1lKAidWl/wGxk+M5EPA7fd
X-Google-Smtp-Source: ABdhPJxzeXoF73uky9bBEthxiuS/6NTzP9Kgp3nmirV0IvVVAUObECrPksCV3CnV9VGq1sfM3DdRxw==
X-Received: by 2002:a17:907:da0:: with SMTP id go32mr1498978ejc.203.1614240029549;
        Thu, 25 Feb 2021 00:00:29 -0800 (PST)
Received: from [192.168.0.4] (hst-208-202.medicom.bg. [84.238.208.202])
        by smtp.googlemail.com with ESMTPSA id c18sm2945527edu.20.2021.02.25.00.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 00:00:29 -0800 (PST)
Subject: Re: [PATCH 22/25] media: venus: helpers, hfi, vdec: Set actual plane
 constraints to FW
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-23-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ce6b3821-7121-e894-ebaf-e718a551ac6d@linaro.org>
Date:   Thu, 25 Feb 2021 10:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-23-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> Set actual plane alignments to FW with
> HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO to calculate
> correct buffer size.
> 
> bod: Fixed fall-through error in pkt_session_set_property_6xx() switch
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c  | 21 ++++++++++++++++++++
>  drivers/media/platform/qcom/venus/helpers.h  |  1 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c | 13 ++++++++++++
>  drivers/media/platform/qcom/venus/vdec.c     |  4 ++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index f0413236a56f..49c52ef1084a 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1113,6 +1113,27 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
>  
> +int venus_helper_set_format_constraints(struct venus_inst *inst)
> +{
> +	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
> +	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
> +
> +	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
> +	pconstraint.num_planes = 2;
> +	pconstraint.plane_format[0].stride_multiples = 128;
> +	pconstraint.plane_format[0].max_stride = 8192;
> +	pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
> +	pconstraint.plane_format[0].buffer_alignment = 256;
> +
> +	pconstraint.plane_format[1].stride_multiples = 128;
> +	pconstraint.plane_format[1].max_stride = 8192;
> +	pconstraint.plane_format[1].min_plane_buffer_height_multiple = 16;
> +	pconstraint.plane_format[1].buffer_alignment = 256;
> +
> +	return hfi_session_set_property(inst, ptype, &pconstraint);

I wonder shouldn't we set this property for v6 only? Or mark this
property as not supported for v1 up to v4.  Otherwise, I would expect
regressions on the older v1 - v4.

> +}
> +EXPORT_SYMBOL_GPL(venus_helper_set_format_constraints);
> +
>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
>  			      unsigned int output_bufs,
>  			      unsigned int output2_bufs)
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 351093845499..98106e6eee85 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -33,6 +33,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
>  				       unsigned int width, unsigned int height,
>  				       u32 buftype);
>  int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
> +int venus_helper_set_format_constraints(struct venus_inst *inst);
>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
>  			      unsigned int output_bufs,
>  			      unsigned int output2_bufs);
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 4f7565834469..cc282b0df8c3 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -1249,6 +1249,19 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
>  	pkt->data[0] = ptype;
>  
>  	switch (ptype) {
> +	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
> +		struct hfi_uncompressed_plane_actual_constraints_info *in = pdata;
> +		struct hfi_uncompressed_plane_actual_constraints_info *info = prop_data;
> +
> +		info->buffer_type = in->buffer_type;
> +		info->num_planes = in->num_planes;
> +		info->plane_format[0] = in->plane_format[0];
> +		if (in->num_planes > 1)
> +			info->plane_format[1] = in->plane_format[1];
> +
> +		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
> +		break;
> +	}
>  	case HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY: {
>  		struct hfi_heic_frame_quality *in = pdata, *cq = prop_data;
>  
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 84c16f33e01b..88ac40ce12e6 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -698,6 +698,10 @@ static int vdec_output_conf(struct venus_inst *inst)
>  	if (ret)
>  		return ret;
>  
> +	ret = venus_helper_set_format_constraints(inst);
> +	if (ret)
> +		return ret;
> +
>  	if (inst->dpb_fmt) {
>  		ret = venus_helper_set_multistream(inst, false, true);
>  		if (ret)
> 

-- 
regards,
Stan
