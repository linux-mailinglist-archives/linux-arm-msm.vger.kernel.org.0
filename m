Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D0F500205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 00:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236908AbiDMWuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 18:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbiDMWui (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 18:50:38 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733E358387
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 15:48:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u7so6062636lfs.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 15:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Rjljh0Ck2s5oy15NuHhlHI64zRd9D7mmJO/ww9jh6KI=;
        b=JWPPH9IH9OWhM3mr2yzedKc+0F9KJv9p7R8apF2V7A2kjsZ2XZjLnG7U+Erq4JMcRx
         j2aZMzjF3EF7sBHG7wuRccxwqgQNYhJG2OA0/8d2o+R2yGaG0xoo5pvUnEK1PZuSQQP/
         AyW5hTUWVYZtAj7V484d8mdQ9j0uPbLOCvGahkS47sUhfOoFCGP3FqhrVEnL7JSRowIp
         RtZnVrR/KSP5kqhTlXNlp/gsIzFfDR+pLFTCTcw8/UzMBDKm+T/mk7PcHJ7NiBZcINFb
         3p0MHtLW7uU+S0GMER/TNzg6r4fSv9A/7HnaUwX8zWdgS0A+iIoaMMrWi+GkBc4jU2m+
         ywbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rjljh0Ck2s5oy15NuHhlHI64zRd9D7mmJO/ww9jh6KI=;
        b=UWwqw+1c2/MPhoAlwakcV4D6vutshb6C97xSJVjPzRHOpftjGYVOkf37YHlEVISHUJ
         R1iiB7S1SuvzGF6o0MrhRmvtZGhDpV8Afg0aff+qP6Jg45X92/d92Qs33ZyDUBiH5y0V
         ZWGVXq/mM0rO8OLTcTG8JEXcjtLkvmRyqAjrOilY6dPtogRwhtWVd5DX6N5UleR4UZvV
         92YR7qycwTuXw8Ib9k8P+yXRRGfe4CPqcQ/sCh6J0DD+Zg95+yFYJdUnOGTqvg5CXw4j
         zKPQKpMAG1t6oXzVBCR6tVulWkBVZPXoxC9i2woYGyiJ2ZYHbSlXVebtxNHuYzHk3hx8
         dWkw==
X-Gm-Message-State: AOAM532uVHI2BF5jc8aJAQzxbX8sG9/c0KmGBEFECZw1CrN6/C/VL5VM
        EtnOZ+kOyDomXQQbR2dJu6VdWQ==
X-Google-Smtp-Source: ABdhPJwLGOXVgRQRnW/vis5ArNXs3GbeL5yfyHkCoVwhOuEEu/oGx5gTPf1dorzul0P6MeWE+j+AqQ==
X-Received: by 2002:ac2:4c53:0:b0:44a:4357:c285 with SMTP id o19-20020ac24c53000000b0044a4357c285mr29062315lfk.99.1649890093755;
        Wed, 13 Apr 2022 15:48:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16-20020a192d10000000b0046ba99878a6sm31873lfj.17.2022.04.13.15.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 15:48:13 -0700 (PDT)
Message-ID: <d39dca75-4f0c-6a8a-8bb3-fb745116c6f8@linaro.org>
Date:   Thu, 14 Apr 2022 01:48:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v8 1/2] drm/msm/disp/dpu1: add inline function to validate
 format support
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
References: <1649695021-19132-1-git-send-email-quic_vpolimer@quicinc.com>
 <1649695021-19132-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1649695021-19132-2-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/04/2022 19:37, Vinod Polimera wrote:
> Check if the dpu format is supported or not using dpu_find_format.
> 
> Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++-------
>   2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> index 418f5ae..84b8b32 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> @@ -21,6 +21,28 @@ const struct dpu_format *dpu_get_dpu_format_ext(
>   #define dpu_get_dpu_format(f) dpu_get_dpu_format_ext(f, 0)
>   
>   /**
> + * dpu_find_format - validate if the pixel format is supported
> + * @format:		dpu format
> + * @supported_formats:	supported formats by dpu HW
> + * @num_formatss:	total number of formats
> + *
> + * Return: false if not valid format, true on success
> + */
> +static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
> +					size_t num_formats)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_formats; i++) {
> +		/* check for valid formats supported */
> +		if (format == supported_formats[i])
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
>    * dpu_get_msm_format - get an dpu_format by its msm_format base
>    *                     callback function registers with the msm_kms layer
>    * @kms:             kms driver
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6565682..3216cda 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1411,13 +1411,9 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>   	if (modifier == DRM_FORMAT_MOD_LINEAR)
>   		return true;
>   
> -	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED) {
> -		int i;
> -		for (i = 0; i < ARRAY_SIZE(qcom_compressed_supported_formats); i++) {
> -			if (format == qcom_compressed_supported_formats[i])
> -				return true;
> -		}
> -	}
> +	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return dpu_find_format(format, qcom_compressed_supported_formats,
> +				ARRAY_SIZE(qcom_compressed_supported_formats));
>   
>   	return false;
>   }


-- 
With best wishes
Dmitry
