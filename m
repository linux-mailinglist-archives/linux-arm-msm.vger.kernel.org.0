Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7801E778E3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 13:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233486AbjHKLwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 07:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbjHKLwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 07:52:30 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EAEFA
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 04:52:29 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso17527725e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691754748; x=1692359548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytzsw+9FGfegmC5owvATb/cYekMxvGTk/t3tQkqPALo=;
        b=zC8v6V61UrFbXkN7t8z13Q6ybgf4NG0b8mkAqyAXojf3zH7X+9M+KHMuk9P03flj/T
         6tJgasr9N5Iz4rr4yqrtTQnYao74ztrpMMOe9M5Dmmt6MzhIz7tMAqCEhRR4dYuQ+Mja
         FLCHhI1CVNbMpvgjIndRj1MkoMhg2R7Ag1VQfR8gRr32FRi7heVMyCleH3XsiPa64tzb
         ptGcPO/HK0ftlwAnvXHvK30aG0YDlNa5xB+u3I0FSAWWfXAJ+sSB3edx01gnhgltpdH3
         8G2VFb4guMdk/+Qr81LxKj6lVliOQTWk3gOfcjKcRBTaqJ3wP2I0FG+OnxXz72N2B4JZ
         fP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691754748; x=1692359548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytzsw+9FGfegmC5owvATb/cYekMxvGTk/t3tQkqPALo=;
        b=b79/pageStr8f6yXLroitA1NTN2ftlK2U1VEFPvl/PKhg3br8vWAirW5Kmeqgpn0TC
         z/T9TxkGY6Fq+WsXEv+Cu6oisNfdvuAB+1y1lU1K5vca0PBJ28/X2hxTYONCXdHhzCJr
         dcjZV9Dk/8etzbPTH1RVka+b2Ev3s+ANrO3VTu+DXgRg5hb8LTSLZ9590wJUssger4/V
         qWlw03vYnm1X2+3oRqA3bfin+HocAi68GEV7520VChCJrWO6f0pHpZkoSby4neKI37Yw
         2XEZfUAuZz7tpwWdb4+2VRTtc6NHoCMC3LER8LILG0hMttbBrL1BIAxWYtG46hHDGV3C
         QCWA==
X-Gm-Message-State: AOJu0YxCE6b1c2PRvh5a0leS1wFLI9IilTbIU0gPzRnlm9qtNIecnaAQ
        bLjbd68AJz5t+JFdMHP5ngO9drZzhvV1tPYEu30=
X-Google-Smtp-Source: AGHT+IFsbsawSoWEfWBp71X4qlguL7+WiWu48Oe72oTcv+6CKLNDZuRdTHX1JZz41VBYt5j6tVTV1A==
X-Received: by 2002:a1c:7501:0:b0:3fa:8c68:4aba with SMTP id o1-20020a1c7501000000b003fa8c684abamr1289836wmc.25.1691754747642;
        Fri, 11 Aug 2023 04:52:27 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003fbb346279dsm4996223wmr.38.2023.08.11.04.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 04:52:26 -0700 (PDT)
Message-ID: <85603f46-6520-6afa-1560-9ccd171475d8@linaro.org>
Date:   Fri, 11 Aug 2023 12:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: pm_helpers: Unify v3 and v4 venc/vdec_get
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230811-topic-venus_dedup-v1-1-c4b4af499ef2@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230811-topic-venus_dedup-v1-1-c4b4af499ef2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/08/2023 12:12, Konrad Dybcio wrote:
> They do the same thing, except v3 and earlier are expected to have the
> old style of bindings (i.e. core clock per core under video-enc/decoder
> subnode).
> 
> Unify them to stop duplicating needlessly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 34 ++++++++------------------
>   1 file changed, 10 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 48c9084bb4db..83d1e68bb9ca 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -295,6 +295,8 @@ static int core_get_v1(struct venus_core *core)
>   {
>   	int ret;
>   
> +	legacy_binding = true;
> +
>   	ret = core_clks_get(core);
>   	if (ret)
>   		return ret;
> @@ -349,6 +351,9 @@ static int vdec_get_v3(struct device *dev)
>   {
>   	struct venus_core *core = dev_get_drvdata(dev);
>   
> +	if (!legacy_binding)
> +		return 0;
> +
>   	return vcodec_clks_get(core, dev, core->vcodec0_clks,
>   			       core->res->vcodec0_clks);
>   }
> @@ -374,6 +379,9 @@ static int venc_get_v3(struct device *dev)
>   {
>   	struct venus_core *core = dev_get_drvdata(dev);
>   
> +	if (!legacy_binding)
> +		return 0;
> +
>   	return vcodec_clks_get(core, dev, core->vcodec1_clks,
>   			       core->res->vcodec1_clks);
>   }
> @@ -764,17 +772,6 @@ static int coreid_power_v4(struct venus_inst *inst, int on)
>   	return ret;
>   }
>   
> -static int vdec_get_v4(struct device *dev)
> -{
> -	struct venus_core *core = dev_get_drvdata(dev);
> -
> -	if (!legacy_binding)
> -		return 0;
> -
> -	return vcodec_clks_get(core, dev, core->vcodec0_clks,
> -			       core->res->vcodec0_clks);
> -}
> -
>   static void vdec_put_v4(struct device *dev)
>   {
>   	struct venus_core *core = dev_get_drvdata(dev);
> @@ -809,17 +806,6 @@ static int vdec_power_v4(struct device *dev, int on)
>   	return ret;
>   }
>   
> -static int venc_get_v4(struct device *dev)
> -{
> -	struct venus_core *core = dev_get_drvdata(dev);
> -
> -	if (!legacy_binding)
> -		return 0;
> -
> -	return vcodec_clks_get(core, dev, core->vcodec1_clks,
> -			       core->res->vcodec1_clks);
> -}
> -
>   static void venc_put_v4(struct device *dev)
>   {
>   	struct venus_core *core = dev_get_drvdata(dev);
> @@ -1180,10 +1166,10 @@ static const struct venus_pm_ops pm_ops_v4 = {
>   	.core_get = core_get_v4,
>   	.core_put = core_put_v4,
>   	.core_power = core_power_v4,
> -	.vdec_get = vdec_get_v4,
> +	.vdec_get = vdec_get_v3,
>   	.vdec_put = vdec_put_v4,
>   	.vdec_power = vdec_power_v4,
> -	.venc_get = venc_get_v4,
> +	.venc_get = venc_get_v3,
>   	.venc_put = venc_put_v4,
>   	.venc_power = venc_power_v4,
>   	.coreid_power = coreid_power_v4,
> 
> ---
> base-commit: 21ef7b1e17d039053edaeaf41142423810572741
> change-id: 20230811-topic-venus_dedup-08f183d3a611
> 
> Best regards,

This makes sense.

It'd be nice to get rid of the top-level static bool and bury it in the 
core venus structure but, that's not a problem with your patch.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
