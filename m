Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A5B6D04AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjC3M2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC3M17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:27:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4ADF46B3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:27:57 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g19so11164452lfr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvEbveK1uWCeCDd1RWXdS2lL6JVQ6l3y8DwliRMNQDc=;
        b=VUbl0GXZMqbt696T8nIZrxZJtcgX/q3qblDeghahOHqODqM2mNOrJGK5sym+faqrq2
         Tc5Z6717oVrFBXrLYQPOOAlsOLq+FGK6c74GfVr7r50SplJh2lFHqfp9kHOqN4TFN7yN
         NsPqcBYHXtO/Yr4AGClDN8vtDqPRXwhYnDix3bP5kz5w7O2bWq3cxVqVxrQracHg2b1b
         fXp0MvIIqqxMzMwQ29yYVR8D5waFAbcbvV3tqp1mA8CW5CDU/E/EbJlwyAgna1JZ69bL
         usRUlqRoLI4T8lB1qkk8fukyU80C8HfLJPXta9bkxI3ZG9N0SD8pj/UHB+alnUtyNg+1
         SaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvEbveK1uWCeCDd1RWXdS2lL6JVQ6l3y8DwliRMNQDc=;
        b=yxZl2IPmVp0zisM3Q7a0sMB3RW5fjjGmiKlz4GgFaWzoKGdfx+T1h7SVlsaPL73YYW
         Xyy9ABlXPNRq6m8WOujOzQGz7g09zAu4dIdFhDq/LRbX3Qya4KkWt3gDJAXGXGKSgi/l
         nUnP4MzBqUzA8nfDD7swdMeB55b6HTJmnOyEmNsQyqNiFlOKi7AK3NbY8up6kPsiu8SF
         3Se97Z6PoJoKBXdrN2WSKoIV4vzlrc4dSSYcfoqBWODQYgAGaVX069ablnkdbrnlS6KA
         1fZymu34Mgzau3YPfG0eeQB6PpgH2jXHk5+PIq8nonkHPFJ5jAO6W0fq8fnlSryWFvmB
         N9Zw==
X-Gm-Message-State: AAQBX9e71Us30w1yufM8nyXPgIm/Otmf60YZ+fIQ0frJUfwPloNZhwGO
        wzwQO4bXwX5Zpm6dJTe3zkt3VQ==
X-Google-Smtp-Source: AKy350Y1ZQJEhnif7Db4/DhBLluxZ+Poft+wmesJ0nfJVQ9JFGpmHrq9djlwFb1Z+iwpnc/OUnml+g==
X-Received: by 2002:a05:6512:92a:b0:4e9:8994:49bd with SMTP id f10-20020a056512092a00b004e9899449bdmr6044678lft.3.1680179276029;
        Thu, 30 Mar 2023 05:27:56 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id u14-20020a056512094e00b004cb35b31b96sm5847822lft.257.2023.03.30.05.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:27:55 -0700 (PDT)
Message-ID: <f9ecaf20-bb35-57e9-d604-a2f47a614732@linaro.org>
Date:   Thu, 30 Mar 2023 14:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,35/50] drm/msm/dpu: duplicate sm8350 catalog entries
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-36-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-36-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Duplicate some of sm8350 catalog entries to remove dependencies between
> DPU major generations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 748f7e14dfcc..0a5d6d9fe751 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -137,6 +137,12 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
>  		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>  };
>  
> +static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +};
> +
>  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>  static const struct dpu_intf_cfg sc8280xp_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> @@ -192,8 +198,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
>  	.dspp = sc8280xp_dspp,
>  	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>  	.pingpong = sc8280xp_pp,
> -	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
> -	.merge_3d = sm8350_merge_3d,
> +	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
> +	.merge_3d = sc8280xp_merge_3d,
>  	.intf_count = ARRAY_SIZE(sc8280xp_intf),
>  	.intf = sc8280xp_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
