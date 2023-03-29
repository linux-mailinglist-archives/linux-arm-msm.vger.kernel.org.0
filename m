Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E436CF709
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjC2X0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjC2X0U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:26:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C4C5FE8
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:26:01 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bi9so22272538lfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680132360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrgPNT8vzPgQfrpIpJG+pXuTkcdwWxfDZq0A5XIC43w=;
        b=q8k49qJU9m8XCnmMDtVciJmUbVI10H2PqO1DXt4bc6K2LXAMROmIMd23Ir7FHAmGiT
         4Di2wyGhrzgcmxdI9pm1T+F/BvvAeyheVfJuePL9BbBYuMNGNlUL3QoP5CmTn6egjlZ8
         X8evZqxkEQ69VtU7hbg/h6xhS6YIPzBcHRxvHs3u/JkI09qS9/nLLbBOTDeW3u383rvH
         Oz3KAI0M6EtufgQOSAsqYz+ftzJKQoj3o1cBrrXETty4vOHV2f6KvnwCxP7Flmk3z5Qs
         jLWCWtOnyRC4RL3I9i23+CB/0DF8SaByURmjiADLZLeBTKZ9N9sWO+pOaih/OJk2MpJB
         ec+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680132360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrgPNT8vzPgQfrpIpJG+pXuTkcdwWxfDZq0A5XIC43w=;
        b=CKCem3a3GwWGoESU+2QHXXEPxVBrO5+TWkvD5ygSnRsLZetUD+BnAPAIWiJh1ZPU0a
         uu7hcBMLlUVoT+qs2sm1fyaj2VBpwUoPMNWkMEZs6pFpEtUPU0MiIrPuRWU3TJjR+KmU
         TEvkjnTBesw8ppPtu0kO3zSJsZuBhqJyJTy0zUQDyPpMP/Xh4aE/Ddu7Q1gN17ojHOv6
         Ph90uBM5qRb0wMrGAmma7IIgMC7vF/EdvUT+c7oQawZ3Xafcvs0bnqa9xCd1dB3jaJTC
         qXmP7hqpu50ksdvcARi6jI8wAudxLdUwxcshTHJmtBgsakeYRJWXVfwoZjLtRfE9zEmB
         zM5Q==
X-Gm-Message-State: AAQBX9dSJb1ARy8yix2W68oDpyl3WAVnGA63b8LIp7rthZmuATrnTb6b
        BwJZPoxSIyT7q6Hk8hd1MsiXPA==
X-Google-Smtp-Source: AKy350aWfx48MdELFtnKoYiqNxo1Jjx9WbSr8n1W41BsOzi4FHGCOKjapoWwP3MLzuSzpcy5e7g8Ug==
X-Received: by 2002:ac2:42cc:0:b0:4b5:649a:9105 with SMTP id n12-20020ac242cc000000b004b5649a9105mr5557062lfl.65.1680132360103;
        Wed, 29 Mar 2023 16:26:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m19-20020a195213000000b004eaf393dc46sm3454696lfb.249.2023.03.29.16.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 16:25:59 -0700 (PDT)
Message-ID: <5b713a38-2f3c-05b4-b243-6d9c0bd9e728@linaro.org>
Date:   Thu, 30 Mar 2023 02:25:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 1/5] drm/display/dsc: Add flatness and initial scale
 value calculations
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-1-f3e479f59b6d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-1-f3e479f59b6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 02:18, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 4448c482b092..63175650a45e 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -17,6 +17,16 @@ enum drm_dsc_params_kind {
>   	DRM_DSC_1_2_420,
>   };
>   
> +static inline int drm_dsc_calculate_initial_scale_value(struct drm_dsc_config *dsc)
> +{
> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);

Just set this in drm_dsc_config, like other functions do.

> +}
> +
> +static inline int drm_dsc_calculate_det_thresh_flatness(struct drm_dsc_config *dsc)
> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}

this is flatness_det_thresh, per the standard.

Otherwise LGTM

> +
>   void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>   int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>   void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
> 

-- 
With best wishes
Dmitry

