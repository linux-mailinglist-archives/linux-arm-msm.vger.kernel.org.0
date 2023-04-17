Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2B96E4DBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 17:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjDQPzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 11:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjDQPza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 11:55:30 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AC040CD
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 08:55:27 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l15so2404240ljq.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681746926; x=1684338926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXnWo8ByKKEVLIBG2kCqFrQuN4bfPUrFB2sr4C9Aorw=;
        b=Nt/yc5WB22wCJ8cKSZ/CWVsECG2X3iP9z8fDQlEHdiuZGdABnOPNozY2jYZXyVFop5
         LXI4PQPBde6K6siSpgoxpr6bqvqiq80P1Wd7r/mdU0VW+eTJihtUYhhXPi1ehonFGz56
         /3F8GJSBdUKEYBRaCom8GY7JJ0VkahAXjt5dP9BYydvAsHuHpI/j4FqjQWZVux9X+MOG
         uKWWUsAgTGoC8YkxMPuiuR/lvbvBabPNsmrrkPtRU/NjozNGFGuawtrObFxCEnn+KB1i
         C4DZV/2kcJ6im4xbao3hwr5GBVIUdVl7r8jULYfF00ded7QLFJF4BiyTT9OW4gYqOwno
         7WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681746926; x=1684338926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXnWo8ByKKEVLIBG2kCqFrQuN4bfPUrFB2sr4C9Aorw=;
        b=bzRZ5/n/gDC3TwUcYwK4pMZiWzu/3kcpgCfwg7GrrNj58kxSBp2l8E2FJKmbJQo5bF
         d3wqR68R37YrDZdAyq0F54xvSvVxX3Zu44ZviiSvXUGczzHCosqfPNCJsFCuIDY7Cp2j
         PuuoD4gRW+HJGBN0U5C8lvsXJTwsAQ4Fh1s9kSs4wPUFkim7j+GfYYroK9ipCZP++urU
         LFgq8B3P+pCr7XcIPD4WWrQgE8O33gHkFZvu3M9e8u2nV0dZF1EVfLtzOrS7nSC+TfdJ
         5VFDQiCtRgqcj/L8el/JTtw6OgyHHz+tyA1AfeiZkivPNQdyeK74lOaGmzRHAwIUxtEh
         G8ug==
X-Gm-Message-State: AAQBX9ck5Zy4yBKea7LAp419B/TzYGl74omhmNg+VFZ9QPm7AJPsv86u
        1nbRxIIJW9SpBkw6bdPZNaPxMQ==
X-Google-Smtp-Source: AKy350anA5TDyJUtYhMpMxazg0hvvJ6ro1LyKRC+oUeWms2XAVX6FzeVEgCLR58kSSKfo1GKdE9lgQ==
X-Received: by 2002:a05:651c:23b:b0:2a8:bc34:c1d3 with SMTP id z27-20020a05651c023b00b002a8bc34c1d3mr1901161ljn.40.1681746925970;
        Mon, 17 Apr 2023 08:55:25 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id d24-20020a2e3618000000b002a8aa82654asm1804649lja.60.2023.04.17.08.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:55:25 -0700 (PDT)
Message-ID: <f77bcfdc-e50e-d27b-6634-2095033c85d6@linaro.org>
Date:   Mon, 17 Apr 2023 17:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/5] drm/msm/dpu1: Handle the reg bus ICC path
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.04.2023 17:30, Konrad Dybcio wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
> 
> On the DPU side, we need to keep the bus alive. The vendor driver
> kickstarts it to max (300Mbps) throughput on first commit, but in
> exchange for some battery life in rare DPU-enabled-panel-disabled
> usecases, we can request it at DPU init and gate it at suspend.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
[...]
> @@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>  		return rc;
>  	}
>  
> +	/*
> +	 * The vendor driver supports setting 76.8 / 150 / 300 Mbps on this
This should have obviously been M>B<ps..

Konrad
> +	 * path, but it seems to go for the highest level when display output
> +	 * is enabled and zero otherwise. For simplicity, we can assume that
> +	 * DPU being enabled and running implies that.
> +	 */
> +	if (dpu_kms->reg_bus_path)
> +		icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
> +
>  	dpu_vbif_init_memtypes(dpu_kms);
>  
>  	drm_for_each_encoder(encoder, ddev)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d5d9bec90705..c332381d58c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -111,6 +111,7 @@ struct dpu_kms {
>  	atomic_t bandwidth_ref;
>  	struct icc_path *mdp_path[2];
>  	u32 num_mdp_paths;
> +	struct icc_path *reg_bus_path;
>  };
>  
>  struct vsync_info {
> 
