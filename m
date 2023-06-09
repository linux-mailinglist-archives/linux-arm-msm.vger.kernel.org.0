Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086DA72A6C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jun 2023 01:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbjFIXeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 19:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbjFIXc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 19:32:58 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B9449DA
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 16:30:06 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-97668583210so344288466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 16:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686353405; x=1688945405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRJNZvhPfChugpU45dpKbNHROAGD/XkdSPesxkM64W4=;
        b=IRxj3bpySsOIcF59fi+Nm+OI/h4Tj5Ohn5xMWOmsKZNb6xyAtkunphLLlOrJZ8mV0x
         iBtUkCAVE1FT3vNkjGzLG44k2kLNSaASFLPjNe58vFPzEW9LfRdNumXw28VmCpdJ5TsP
         v0p4iU+XwwznP4A8f9SrGOvGttYPMyYMXEIFYXy+p7Z2bWQGqYZC/T7OqSATyNRDrseJ
         WbT69Rrgjd8VpchDe4U4/QB2GtfmnhFdQ3TKKNzA0aF+55SZ2JXWk3KABij6IMqOijF+
         yrAN1tcyn9Qm8Qg288rZCiNtUe29PpgUR3uIcGfKFS3auDHzR8/uYmm0/5dNaOgRS4dj
         ouaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686353405; x=1688945405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRJNZvhPfChugpU45dpKbNHROAGD/XkdSPesxkM64W4=;
        b=fj1FudquRFlyA367W4D35RmPXh831vcUV47YBvNUWD27n2Em4ntWgmLRXA8O464DCm
         KlGLclJEFPHSsVGEXmRKOMOD+U7xxWL5eMnPpPaOro/DVKIX+hMQe0Dh8BKjGgka8nGD
         SrrSWznTYaVJutI2ZPsQKcBM4rLp2/Cpxo4SNIxZ7qxLOc28LFtrgor0t0hepZO0zD0b
         WycFZ4ZF60hMMprAJ6qb8f9YUxunSKsDFyQegJ9WZOXPTGJo1YsdDq0YzyDpoXeAeXpq
         K5sJB5HZSxNNPgovKBfHDV1mCxppduKmDWe64NCr7j6XhOsG3RSbW63bSRhUBvW2oanF
         ZStQ==
X-Gm-Message-State: AC+VfDykXY9KWCPEFPIb3CWNU2UGJehbUkYdMyyo5lOfFVkS+UbeDvRp
        lmY0ys2WQroIQjP6wDsRWXgarA==
X-Google-Smtp-Source: ACHHUZ44eca7J/0+Y92PN9Lr2lBwob3EwuyN/85XFHhyDKMBwJtN3Ss2aXY1/jCZDO078fJIjAfhkg==
X-Received: by 2002:a17:906:dc8d:b0:96f:bc31:5e1c with SMTP id cs13-20020a170906dc8d00b0096fbc315e1cmr3079045ejc.47.1686353404945;
        Fri, 09 Jun 2023 16:30:04 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o7-20020a170906358700b00969cbd5718asm1825596ejb.48.2023.06.09.16.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 16:30:04 -0700 (PDT)
Message-ID: <5de320ad-4b95-38ee-7a71-ba76de1a7cf5@linaro.org>
Date:   Sat, 10 Jun 2023 02:30:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 6/6] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
 <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/06/2023 01:57, Jessica Zhang wrote:
> Add documentation comments explaining the pclk_rate and hdisplay math
> related to DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index fb1d3a25765f..aeaadc18bc7b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -564,6 +564,13 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>   		const struct drm_dsc_config *dsc)
>   {
> +	/*
> +	 * Adjust the pclk rate by calculating a new hdisplay proportional to
> +	 * the compression ratio such that:
> +	 *     new_hdisplay = old_hdisplay * target_bpp / source_bpp

I'd say `* compressed_bpp / uncompressed_bpp'. This is easier to follow 
than source and target.

> +	 *
> +	 * Porches need not be adjusted during compression.
> +	 */
>   	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>   			dsc->bits_per_component * 3);
>   
> @@ -961,6 +968,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   		/* Divide the display by 3 but keep back/font porch and
>   		 * pulse width same
> +		 *
> +		 * hdisplay will be divided by 3 here to account for the fact
> +		 * that DPU sends 3 bytes per pclk cycle to DSI.
>   		 */
>   		h_total -= hdisplay;
>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> 

-- 
With best wishes
Dmitry

