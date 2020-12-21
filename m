Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A022DFF3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 19:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgLUSGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 13:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgLUSGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 13:06:08 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06ADC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 10:05:27 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s26so25765903lfc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 10:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZQj+lY9Q9qTAn9h/O1jDrfQPMWDKTY6Q2BZuiHff5Iw=;
        b=M4D2E9qGgwUTj7URXt5FnCh0RdB4oZABXC+0HZNClkcuxBkU9CdQRKlz8YKek9BZHH
         D77YcPivFf1wXHWK2uURuSSYydhawUwSdWYdi7rbl5BWLT7TxAetQVQH9VgKaoJU7GHi
         6b/QSaziho4fNBVzAEAOaAFkWtpvXNibJ22YN+9tqA4ITGeT9dmMamDXuBdOeUjbMgbl
         Pg/ayiieEx96VwFVWbvYJXOtpXhzUeRZj4fvwX3IoCpyNP6P0axAjOsTOo0PvO3YTSSS
         mTgSExhzUSKZDdymmYUR5SsKy5/fyX0dWB08dffvd1AFU/gLvW/GvnUlfsn6vZfvwXfY
         im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZQj+lY9Q9qTAn9h/O1jDrfQPMWDKTY6Q2BZuiHff5Iw=;
        b=YKNaARHi6VOhk/1vLZW/kOEmY2r46mj5tGtxZooXnv67kQgoS2rXFKcdssHvFAqUxB
         ucY241l1v7AfzOMMA3F/tvihOtT/XSsAxcr7KxXeOubT6Q0crLmwjz+nBKilrq8w9JQY
         wNXdZyxV80qQ8UHLGZWa6IiqAAcU/H9poRJulVclGmoN4iuJ5LDWYMLB9kw8d6h4b39R
         /VjkPXC8n54femfvLERoJ+3uKyq7x2hTPT3AVWLkqYlpnW7AOPIA45I2NohsNzz5CKrh
         xRBnNWll7HR+rXD+WaqZs4l0+RdPsrXEUV0uTTGeFWwwctquhE6B/igB89/ufbIYCllx
         h+9A==
X-Gm-Message-State: AOAM532Op8JVXrMbBXmOG6XhO7G4N59TrigMOy7vdkLKpjJPxw7QO3bD
        FqNAxfHQbB9vNVBF4K7BRgFmupUZV2sIAc//
X-Google-Smtp-Source: ABdhPJyjlK1WG/DEJVU6rq0koBfatPri8F85K0VZBp6e6CGUZPIxaBB5iaiRtPXEUR0komHKBL4gTw==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr19393526wru.174.1608566516071;
        Mon, 21 Dec 2020 08:01:56 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.204])
        by smtp.googlemail.com with ESMTPSA id d191sm23176698wmd.24.2020.12.21.08.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Dec 2020 08:01:55 -0800 (PST)
Subject: Re: [PATCH] venus: venc: set IDR period to FW only for H264 & HEVC
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1608102410-23390-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <80ba09a0-d830-4b08-1a76-44b5d7fb38ee@linaro.org>
Date:   Mon, 21 Dec 2020 18:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608102410-23390-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/16/20 9:06 AM, Dikshita Agarwal wrote:
> HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD is supported for only
> H264 & HEVC codec. There is no need to set it for VP8 since
> all key frames are treated as IDR frames for VP8.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3a2e449..618cf92 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -588,16 +588,19 @@ static int venc_set_properties(struct venus_inst *inst)
>  			return ret;
>  	}
>  
> -	/* IDR periodicity, n:
> -	 * n = 0 - only the first I-frame is IDR frame
> -	 * n = 1 - all I-frames will be IDR frames
> -	 * n > 1 - every n-th I-frame will be IDR frame
> -	 */
> -	ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> -	idrp.idr_period = 0;
> -	ret = hfi_session_set_property(inst, ptype, &idrp);
> -	if (ret)
> -		return ret;
> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> +	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> +		/* IDR periodicity, n:
> +		 * n = 0 - only the first I-frame is IDR frame
> +		 * n = 1 - all I-frames will be IDR frames
> +		 * n > 1 - every n-th I-frame will be IDR frame
> +		 */
> +		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> +		idrp.idr_period = 0;
> +		ret = hfi_session_set_property(inst, ptype, &idrp);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if (ctr->num_b_frames) {
>  		u32 max_num_b_frames = NUM_B_FRAMES_MAX;
> 

-- 
regards,
Stan
