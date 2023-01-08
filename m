Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C16B661B22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 00:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjAHXcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 18:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjAHXcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 18:32:02 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64A610043
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 15:32:00 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so10515464lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 15:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMahuRHUyby9cTVuxiS45czpMUwY4cTgnEghJo22NtM=;
        b=B/zmp25lbiHXTxa0KspeA4G9eLR4vSmqAyhrfaXFRjd3WVLbQRAe2lZfY5pJ4437A1
         LcCrbGZ2uTfBcGW6PAxHJnh0d4YC/FkcoKM2x/lPFs52aTtPySUiC6Dk7w4uQjP02RcS
         j5Bt/G1fw95wzs/SFoE0xKOCii56DHs65oM8TbdwooGdgO6vqaMGehI3gLUN57d2cFBj
         65V82y669Y7JZbh/MDcRlmMAEbsDT0d7KeN3JHqC9u+OakcIAouKLJRvG5F2IcyOZL2X
         Ws9j6AjM3YU+MAHK7E0TRgykek/OzpqESX9VmUGfyyxsKmnow40uSGf2r6JuKb5SiLEf
         pDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMahuRHUyby9cTVuxiS45czpMUwY4cTgnEghJo22NtM=;
        b=3yLxg8FS90uDSjBTBWGF4VMGfoXfANK4M60nIwTzAmV1fBXuQO2aolpvqtgWdpWQ+T
         u25pp3abH/bg6/WT2gbidF2H+abmst5mF8goYKJ2/vdUAZoI9pUGKxaCjrDexlkAUjLi
         UFSKsIHjNVXXd350VGoVsMD42VPgCz9WzUi386jpNK2pQplVclf8fs4qpOJqBpzxd6um
         zHjUfnysEO7m2d5d3PKnwc/7piisfhulsGoYa6io6EoSRvhAWmSMTqjlhMQK69/brzL5
         yY+WH1p4XAJp87JuT8Wbvw6fCc4FAspANouFIVlu1ToPpmfm/NSEl3YL9HBNnewtDuQJ
         0gMw==
X-Gm-Message-State: AFqh2kpFuANikKZC10+1Ltzgfs1sSAfE+w+/nts1qP6p+o5L/NhdCRSH
        Af2ULRYTaeRQztYaKD0IMucX/w==
X-Google-Smtp-Source: AMrXdXsAP/6HHrzQYlZxu6VJANy0ySDdGi0ykUte9WZ5AYM3cntDWvUcoLeugwDSlwNH2vdWcbCVWQ==
X-Received: by 2002:a05:6512:e89:b0:4b5:b7be:136b with SMTP id bi9-20020a0565120e8900b004b5b7be136bmr18592394lfb.69.1673220719050;
        Sun, 08 Jan 2023 15:31:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u15-20020a19790f000000b004cb344a8c77sm1286960lfc.54.2023.01.08.15.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 15:31:58 -0800 (PST)
Message-ID: <42b45762-7fb9-2694-9fab-039ee09e4709@linaro.org>
Date:   Mon, 9 Jan 2023 01:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/8] drm/msm/dpu: Remove num_enc from topology struct
 in favour of num_dsc
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-7-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-7-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/2022 01:19, Marijn Suijten wrote:
> Downstream calls this num_enc yet the DSC patches introduced a new
> num_dsc struct member, leaving num_enc effectively unused.
> 
> Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 4 ++--
>   drivers/gpu/drm/msm/msm_drv.h               | 2 --
>   3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b5a194..a158cd502d38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -579,19 +579,18 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   			topology.num_dspp = topology.num_lm;
>   	}
>   
> -	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
>   	if (dpu_enc->dsc) {
> -		/* In case of Display Stream Compression (DSC), we would use
> -		 * 2 encoders, 2 layer mixers and 1 interface
> +		/*
> +		 * In case of Display Stream Compression (DSC), we would use
> +		 * 2 DSC encoders, 2 layer mixers and 1 interface
>   		 * this is power optimal and can drive up to (including) 4k
>   		 * screens
>   		 */
> -		topology.num_enc = 2;
>   		topology.num_dsc = 2;
> -		topology.num_intf = 1;
>   		topology.num_lm = 2;
> +		topology.num_intf = 1;

Unless there is a reason, please move num_intf assignment back while 
preparing v3.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   	}
>   
>   	return topology;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index dcbf03d2940a..5e7aa0f3a31c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -548,8 +548,8 @@ static int _dpu_rm_populate_requirements(
>   {
>   	reqs->topology = req_topology;
>   
> -	DRM_DEBUG_KMS("num_lm: %d num_enc: %d num_intf: %d\n",
> -		      reqs->topology.num_lm, reqs->topology.num_enc,
> +	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> +		      reqs->topology.num_lm, reqs->topology.num_dsc,
>   		      reqs->topology.num_intf);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d4e0ef608950..74626a271f46 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -82,14 +82,12 @@ enum msm_event_wait {
>   /**
>    * struct msm_display_topology - defines a display topology pipeline
>    * @num_lm:       number of layer mixers used
> - * @num_enc:      number of compression encoder blocks used
>    * @num_intf:     number of interfaces the panel is mounted on
>    * @num_dspp:     number of dspp blocks used
>    * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>    */
>   struct msm_display_topology {
>   	u32 num_lm;
> -	u32 num_enc;
>   	u32 num_intf;
>   	u32 num_dspp;
>   	u32 num_dsc;

-- 
With best wishes
Dmitry

