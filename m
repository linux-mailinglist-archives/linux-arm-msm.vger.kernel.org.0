Return-Path: <linux-arm-msm+bounces-34535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A362399FC25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 01:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27EDC1F25762
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 23:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94F81D63D3;
	Tue, 15 Oct 2024 23:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lBcZsQE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45FA1C75F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 23:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033980; cv=none; b=aW69mrhP4gb/1MIC16syLyPZAf9J+GDlqiNQIbWMO1R6udEeoUbjydcK0L7jGPeH3Sm691YPoiKjyAVFUqB0bD1qT7MqKFNrwCIvvIn7pL3j0hJWsn+iNSAjZVOYVpn83jCBUTWy3jAPyKxbBnPWhgRYU7jNO+1hnnuapch11TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033980; c=relaxed/simple;
	bh=RWqlw+8u2Zt41/yQztVKI9ZpheCOIPjne05sgHhv6x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOzsaxYJy9UTO1rylNWifm5iqrVbMDCOvj5JeT11c/bOnoOw+418llACR8Z3Y2FotLAI9zFEm2bJ6uopM6lEDhnmDAGPeg1MqZ0vtGAMQLZZpOlglfj9YE7XOz9i8aQQrcni33yBztwwT2QxoeR11qUiDnbJn/A+j8IsUMbLCTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lBcZsQE9; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0cee600aso360114666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 16:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729033977; x=1729638777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsTfxtNmSnHSpS1GVrU4G72wmYQhb3/HlyX+GQvuTPk=;
        b=lBcZsQE97tFzXi2+wfImI9U4aDBdWTPbe9iBTHPCnhk/LYw3TduvMgSeYUQOplgcLz
         KHVaugQdQWv4tOsbCa0AA5s5TiUHAy2iiv1C5tilQvQ9y3Y0rnggsvv5xs6cwLLswjIe
         mxCMYaWtxfzcPAdex2Lz7n7ICyISP5GP3mYrFcL4FxefQy7eXWzAOh1V6RJrCxUKE5Ko
         gDgeuadXO1sOrP47WKDwYvvsQJuaNTTdi4KPnrtJlS/RXR++ecEIkeQI4qGRv8maasII
         v7vZ5iQdBBocx2gRlQTgGLJOtowyDsLozZDDy61gw38uzPiMCmT6s1CKmmzxUaphMwXY
         mwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729033977; x=1729638777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsTfxtNmSnHSpS1GVrU4G72wmYQhb3/HlyX+GQvuTPk=;
        b=l1voWfU73bjcfC5o64K5RusajE4EfgCVGUqSYwMMPR8TP/9YYYZSOchLbre2LpmRXv
         Oa1xW5aG9p+VyI46Go8J8nvoJGSyRibcAjv4lByarnl4Fw5OVupMdwkAXjOeoDAonREr
         AJBqBROI9gV8Yc/4LypUPnA1/bXCvyMlGjU+pFul+O3a6WzUREQgB+ENl0M5gmuEuglq
         9KYRMBfxU1x6bLFq88/SklQVLxJ3HYUxmvp5PRMw5Ykm5W/t1/4vSPcvQB3iiDB7w59L
         qL/Tco+cs8O2IHjLDsCBY994SEKHwIkq29HZW36R1rExDT4lIa5H1X+TOiv1c1LcXWZ9
         0AUg==
X-Forwarded-Encrypted: i=1; AJvYcCW5AgST+v8A53fLpgikiJnexFUXd5NEdg9isUWo0tisysn15iC9myLPrP54AV17HGlP8bosEMrcU+2LRYtx@vger.kernel.org
X-Gm-Message-State: AOJu0YzxgIjo7HAjBwrkd4s/9x3KxHo8+h6lOVku58v56e6jr8/VLy35
	S5mkcu9kqmnyveZX/wbcnAfYnvR1KWtQykOxEi3eiU6KI9VTnBq52+ouXbexDj4=
X-Google-Smtp-Source: AGHT+IEWzh2eNvnTzVKZKXexuSdzn+yKYxn62+JRj0yBk79QfJhJYmXwkzy1tfmjdbM0eQKmrbxOng==
X-Received: by 2002:a17:907:3f8a:b0:a99:f4c3:580d with SMTP id a640c23a62f3a-a99f4c35955mr1127076466b.42.1729033977197;
        Tue, 15 Oct 2024 16:12:57 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844899sm116776766b.178.2024.10.15.16.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 16:12:56 -0700 (PDT)
Message-ID: <079045ac-27e7-43f4-a4a4-bc9d03de61c8@linaro.org>
Date: Wed, 16 Oct 2024 00:12:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: venus: Helper function for dynamically
 updating bitrate
To: Fritz Koenig <frkoenig@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240814-submit-v3-0-f7d05e3e8560@chromium.org>
 <20240814-submit-v3-1-f7d05e3e8560@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240814-submit-v3-1-f7d05e3e8560@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2024 23:14, Fritz Koenig wrote:
> Move the dynamic bitrate updating functionality to a separate function
> so that it can be shared.
> 
> No functionality changes.
> 
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/venc_ctrls.c | 34 +++++++++++++++-----------
>   1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index d9d2a293f3ef..3e1f6f26eddf 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -67,12 +67,28 @@ static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
>   	return 0;
>   }
>   
> +static int dynamic_bitrate_update(struct venus_inst *inst, u32 bitrate,
> +				  u32 layer_id)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&inst->lock);
> +	if (inst->streamon_out && inst->streamon_cap) {
> +		u32 ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> +		struct hfi_bitrate brate = { .bitrate = bitrate, .layer_id = layer_id };
> +
> +		ret = hfi_session_set_property(inst, ptype, &brate);
> +	}
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +}
> +
>   static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct venus_inst *inst = ctrl_to_inst(ctrl);
>   	struct venc_controls *ctr = &inst->controls.enc;
>   	struct hfi_enable en = { .enable = 1 };
> -	struct hfi_bitrate brate;
>   	struct hfi_ltr_use ltr_use;
>   	struct hfi_ltr_mark ltr_mark;
>   	u32 bframes;
> @@ -85,19 +101,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>   		break;
>   	case V4L2_CID_MPEG_VIDEO_BITRATE:
>   		ctr->bitrate = ctrl->val;
> -		mutex_lock(&inst->lock);
> -		if (inst->streamon_out && inst->streamon_cap) {
> -			ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> -			brate.bitrate = ctr->bitrate;
> -			brate.layer_id = 0;
> -
> -			ret = hfi_session_set_property(inst, ptype, &brate);
> -			if (ret) {
> -				mutex_unlock(&inst->lock);
> -				return ret;
> -			}
> -		}
> -		mutex_unlock(&inst->lock);
> +		ret = dynamic_bitrate_update(inst, ctr->bitrate, 0);
> +		if (ret)
> +			return ret;
>   		break;
>   	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
>   		ctr->bitrate_peak = ctrl->val;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

