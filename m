Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB026E84EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 00:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbjDSW2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 18:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbjDSW2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 18:28:23 -0400
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D73118C2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 15:26:43 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id h2so588109ljh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 15:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681943034; x=1684535034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCawUKvbpyJ/O3QCtYIFnEkGoYOHSsivpE+P/NmOeR0=;
        b=gBReHy/14DcmnMDI8++fMkHG+PPvn+g+AG1T9PQl171wpJIcWDtJZ8Yl/HYjgS2+Uq
         cnaNemaH9HMifkQEUNnoLLOmFqmwqfortgIUKhhRlx6doFaKz3mO7bPg/OD62Vjl+jfQ
         XTCqZUzy2zPnSD3txii2j0agx2w/sNad0F6pGDD5hQ54SyJgcVEdgsWduJRbGyobPRRK
         +wDmiTbu/TjuDahlWG+gKoA5YlKwsVg21tJhvuAEdYbx9a+wr8QemRSls9YpFVrZHSX/
         nm7wctkTx62O6FRWnznAyRuxVMWBGTGyvRw3x99dEPVfiT9lwO1c/kf/8TQtwWcRfbTW
         aY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943034; x=1684535034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCawUKvbpyJ/O3QCtYIFnEkGoYOHSsivpE+P/NmOeR0=;
        b=EIH7OfENDO84QyWuloaRgVEUEkDr/RtDAI5WTh3P0ssOBhZiJMprki5EYW036EG5Ud
         +Wr8YcCb1EL1Uloa7WNT6NyD1I/Pljgf5p3LXSf1UAoI27Tsl6C/LR9Hqv8+xgscXqPT
         qcfi7OnpVPQsgQtOfk20L7cC9oxXLPegAQztWcLA1s9XSPa1SkTTTN3fYtw4/RU0GGT+
         Qs6cjVgnozDhaX4RNmXSuh2HJcyY5CCLPUIET2CU4SolP9pn149pRKZNmCEsGcV401Nq
         Tx6Mc36wo47k6uVixKSaV55sFYXSBbTUiBcyrNwSUxgt9PNc9w0SWzN8OrKA5vuK1gAR
         9DWg==
X-Gm-Message-State: AAQBX9fAt8NTG8+IK2bzas6B+GdRJxtVFPGz2I9MPTBZQBXvmCrs5rHN
        l68JhJ93q0GrgxdCAbCCY6igJQ==
X-Google-Smtp-Source: AKy350bMNNErl7bByeTgmpgjdePtabkJ+a2Vh6JpDEnLxmjvPvyv7daUPysh6Z+4C1DKcf7pk3Ip0A==
X-Received: by 2002:a2e:b0fc:0:b0:2a7:763e:f158 with SMTP id h28-20020a2eb0fc000000b002a7763ef158mr2213119ljl.19.1681943034546;
        Wed, 19 Apr 2023 15:23:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e26-20020a2e985a000000b00294692d8645sm3068589ljj.17.2023.04.19.15.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 15:23:53 -0700 (PDT)
Message-ID: <6e807c05-a990-5692-3f84-2e4153c8c278@linaro.org>
Date:   Thu, 20 Apr 2023 01:23:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/11] drm/msm/dpu: use the actual lm maximum width
 instead of a hardcoded value
Content-Language: en-GB
To:     Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-2-d1bac46db075@freebox.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-2-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2023 17:41, Arnaud Vrac wrote:
> This avoids using two LMs instead of one when the display width is lower
> than the maximum supported value. For example on MSM8996/MSM8998, the
> actual maxwidth is 2560, so we would use two LMs for 1280x720 or
> 1920x1080 resolutions, while one is enough.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>

While this looks correct (and following what we have in 4.4), later 
vendor kernels specify the topology explicitly. Probably we should check 
this with the hw guys, because it might be the following case: even 
though a single LM can supply the mode, it will spend more power 
compared to two LMs.


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1dc5dbe585723..dd2914726c4f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -53,8 +53,6 @@
>   
>   #define IDLE_SHORT_TIMEOUT	1
>   
> -#define MAX_HDISPLAY_SPLIT 1080
> -
>   /* timeout in frames waiting for frame done */
>   #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
>   
> @@ -568,10 +566,12 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	 */
>   	if (intf_count == 2)
>   		topology.num_lm = 2;
> -	else if (!dpu_kms->catalog->caps->has_3d_merge)
> -		topology.num_lm = 1;
> +	else if (dpu_kms->catalog->caps->has_3d_merge &&
> +		 dpu_kms->catalog->mixer_count > 0 &&
> +		 mode->hdisplay > dpu_kms->catalog->mixer[0].sblk->maxwidth)
> +		topology.num_lm = 2;
>   	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +		topology.num_lm = 1;
>   
>   	if (crtc_state->ctm)
>   		topology.num_dspp = topology.num_lm;
> 

-- 
With best wishes
Dmitry

