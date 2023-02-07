Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CACC68DCC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 16:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjBGPUj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 10:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjBGPUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 10:20:38 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0931B2685
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 07:20:37 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id q19so15998445edd.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 07:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhCNOcyRpNLZBCgbM6oSGWNvw1+XdQSGy3BecVAhAEw=;
        b=E4nJecrnv18zMkprVCsirCNTaU/ult/DZ/EWlQU1Z3ZQ+p+7EM1R7UREVIUi4i2rPz
         Ek11py0bXP2n8N2tEHbHewXjZj/BW7UMX6y4tFZI7aFBmfdGWJFRPSznsAaWVIesF01z
         8+Q+5Mw2rdApzpzRBVou+ivV7aZyRfAW48d6dR1jkoR1Q/gn1Q9NXZ2DY3yyUp9tgKj+
         wXMcqSvQ2mwlbeBy0mO8dPVRtOcAoM9rke//W7yFdud9x/QN6McDu3rnGJQvdZEsEcTY
         tW9ek2yD7v3kFpuweMQowWPEFQtBlQRaQ89Brb8ShcVUF8ldI0MAxBIbcuGq64MfKndg
         D5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhCNOcyRpNLZBCgbM6oSGWNvw1+XdQSGy3BecVAhAEw=;
        b=R5O5ihHXkCB21W0c9C3LGYHn0mxfaBldo9LFOvlDZRsUpQPkbPE5hUwhoLGSn2k+Mp
         C7KWmvh7wJARAUwt0nQkWTYOzSOekauCBQPpE7I59bl5c1M1EqXHQ9HpfY8SqqRZqQMn
         V9J1KYpj3jNKlmBR3H8UoekKvc8e3uvkjzsYRa9X4S454JnStgxzwkE5Ueut+T7U0uRR
         ggvEkJFvgL6VA3sly3D3hs1AMFvQ+opw++6FTGZs6fwUTmGtxpL/Mubbl1kf9zPOT+6u
         UDwHjR7uabLsTDRMNxCzqkjDJE/SVL4fYmEvKo8uJ/9JS/V5y24QNaodiI4b7jV5+TYq
         IRTQ==
X-Gm-Message-State: AO0yUKXMurCTw+D+6/lfF8CRyZW53EyV0GrOH8JqUoCfa4FcC0FzAJAg
        I3oCzrHtuY1aH+Oqoy1owOQibA==
X-Google-Smtp-Source: AK7set86e/LGn+ZCVqFVYC53Q4uR7aJ0HPCsmm5q9Ewnkb/wUQdVK8zCIeUfGl9odi9ZER2D5QOSqA==
X-Received: by 2002:a50:d783:0:b0:481:420e:206d with SMTP id w3-20020a50d783000000b00481420e206dmr3723824edi.42.1675783235575;
        Tue, 07 Feb 2023 07:20:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a509502000000b0049e08f781e3sm6695629eda.3.2023.02.07.07.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 07:20:35 -0800 (PST)
Message-ID: <0b14695d-31c2-75cf-5c8c-9171136500f9@linaro.org>
Date:   Tue, 7 Feb 2023 17:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] drm/msm/dpu: clear DSPP reservations in rm release
Content-Language: en-GB
To:     Kalyan Thota <quic_kalyant@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, quic_abhinavk@quicinc.com,
        marijn.suijten@somainline.org
References: <1675780196-3076-1-git-send-email-quic_kalyant@quicinc.com>
 <1675780196-3076-2-git-send-email-quic_kalyant@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675780196-3076-2-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 16:29, Kalyan Thota wrote:
> Clear DSPP reservations from the global state during
> rm release
> 
> Fixes: e47616df008b ("drm/msm/dpu: add support for color
> 		     processing blocks in dpu driver")

This should fit into a single line (even it is longer than the 
recommended length).

And no empty lines between Fixes and next tags.

> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 73b3442..718ea0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -572,6 +572,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>   		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>   	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
>   		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> +	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> +		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
>   }
>   
>   int dpu_rm_reserve(

-- 
With best wishes
Dmitry

