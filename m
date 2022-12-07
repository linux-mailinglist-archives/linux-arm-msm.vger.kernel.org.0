Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93E964656C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 00:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiLGXu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 18:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbiLGXu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 18:50:56 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01AA5E3F9
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 15:50:54 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p8so31142639lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 15:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pq17unfSto09mroIVDYeSKKbTNZYwLPO1fJ1295vloI=;
        b=eYb5vcySkHkPVwZt6SBLHmnTWkrCb3H/dugfnLcE1CIivRcZ60CXDA6a67yai9s0tY
         eEncVrzjhKuXjLgTpMS5Fc9ECD2nJEk8rqzKivT/iJSl5SCONdv46ID8WHJlEXc/kM15
         uTeuA+q7zsQJ1jrGPLf25h0ZM++E7r0zLxfWHOfHKHKDQDXykUAV32872BrhNUqdYc+U
         kZ/1Fpo42UJjJd0/NWjzGSQKdYUVoaDhE+AH6Sb3ZnlTU0WG95MYitVbcjVdOPg2k0R6
         u5i0Vu5v0AX7ZgHscxrXMigmJRlX2ZjHp7aKAozZiUURa8dsA4HRBtawozB8KefVAshJ
         UPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq17unfSto09mroIVDYeSKKbTNZYwLPO1fJ1295vloI=;
        b=p/l2txdwUBrOK2hSWW7nnGIflbmO1vKqHNTnoNH0A8F32gmj768tv/bLJPEFXh11sq
         21nXXZHGJ1DYedfHcGg+Vhe2ZCKJFiBwnNhkabvGVRc/KxKzlYuIj4d3BATQKXzZFDd3
         g1Tn5k7tLkdTepufsjavl6MvYNDVtNZkB+TpUhQIcXTabN9ARv8GmAqhwsXdjPrYBT+M
         JYpDzQstM1/EdbsNNc3fWPXYGh47RBo7yun4C5BrTS5D8TNC/NYQvu/BhNyqNDyeCjmh
         Fj5CwkrG6pgQzJ0S0TBh9ru/l7dCXx3yJ+Ec9AxHc0e/xovJzLvgiM6/ObZPyGqbhLtN
         VjGg==
X-Gm-Message-State: ANoB5pm3j2K0FGXjn9AqbdI1rkk107M6MYuwbSEpu0C26ADDVWlogfOC
        ND1z5gji40YnkKw2gg4Jj8gfqg==
X-Google-Smtp-Source: AA0mqf4IX6sJj2egyuPhOCNjryyQqIJH/9UIiMi7b8QIo2VyPbST/fg5I5gtP9WXpE8XjARg//rlRA==
X-Received: by 2002:ac2:5e6b:0:b0:4a2:7c20:15a5 with SMTP id a11-20020ac25e6b000000b004a27c2015a5mr26894754lfr.587.1670457053135;
        Wed, 07 Dec 2022 15:50:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004994117b0fdsm3038581lft.281.2022.12.07.15.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 15:50:52 -0800 (PST)
Message-ID: <feda0561-1291-daa7-ea01-db5729a1a415@linaro.org>
Date:   Thu, 8 Dec 2022 01:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 05/11] drm/msm: Add support for SM8350
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-6-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-6-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 18:37, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
> subsystem unit used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index a2264fb517a1..39746b972cdd 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		/* UBWC_2_0 */
>   		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>   		break;
> +	case DPU_HW_VER_700:
> +		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
> +		break;

Judging from the vendor kernel, the highest_rank_bit is 3, with usual 
todo for 2 for LP_DDR4.

>   	case DPU_HW_VER_720:
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>   		break;
> @@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
> +	{ .compatible = "qcom,sm8350-mdss" },
>   	{ .compatible = "qcom,sm8450-mdss" },
>   	{}
>   };

-- 
With best wishes
Dmitry

