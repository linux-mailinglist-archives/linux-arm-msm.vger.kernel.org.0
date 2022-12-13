Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A622E64B851
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 16:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbiLMPX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 10:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiLMPX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 10:23:58 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05F2B5D
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 07:23:57 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id r26so18174235edc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YNJl4dW3INoFLSur18KGvAEZEys7Zg7HXl7mE/l9WMc=;
        b=cAdyHfnfTDl6Q1NGQlVuUwFnzVmOszYJerLagpzhCTJsBpIZzvJpbcry6wj/DZ8C9b
         T9PXTL/orC/c9TALqWuJtqWUmDhBkUsA8tOl3F3l7VFJ0DdeeepXJiUhgllK03T8m01h
         Vkjo0Sj5XyI7TYIDUEcxxq+unpUGpbk9fqbwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNJl4dW3INoFLSur18KGvAEZEys7Zg7HXl7mE/l9WMc=;
        b=GyDnKEw3S8E1xkYs01bH0uGXwrP5NTnF8rem0GumJSkyO7uufntDASLPE8ol9x2rnc
         MeljLMc4oMyoqXQkPwSN6gPewEfiqUS/Ss5cgB/U89TxDT9AUK727COZdmOZ+i/G2ucN
         /rvUpPKfce1LG80LNPsB2maKIj6muOnNa3MjnDcJBr95jBmD+ZN3jNuuCf95M1cS4BQ5
         H2H0rRKLbziyVw20jgPN0wI2heeg4xZhDkLGNR+YK3Y4ez8NUTltgWqyBtedyIFPNISj
         3xdd1WE2+jrX5dNlgzdVEv2ms7WSs4uRDjdLmUaqp2+IsDZe4gNY4OQs4BZe6dmZIQ+g
         luqg==
X-Gm-Message-State: ANoB5pmjfDyWdCl2Kqr68W4MVx+q1DVZI6FDNMRZDqfm0TQjwtkslToc
        m+43BWhQ9fr5rNswOIIXDptL/tQppXrnO/lZl54=
X-Google-Smtp-Source: AA0mqf6d4LoQe4IYWbFia82tCEvgy6Z//iFx/L2t/mdFNgN9Ci9eGYUhmzUmgweuh2iFFGm28NvTlA==
X-Received: by 2002:a05:6402:65a:b0:46c:2034:f481 with SMTP id u26-20020a056402065a00b0046c2034f481mr20879697edx.8.1670945035286;
        Tue, 13 Dec 2022 07:23:55 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id p8-20020a056402154800b0046ac460da13sm5132091edx.53.2022.12.13.07.23.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 07:23:53 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id o15so8632461wmr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 07:23:53 -0800 (PST)
X-Received: by 2002:a7b:ce10:0:b0:3cf:5731:53db with SMTP id
 m16-20020a7bce10000000b003cf573153dbmr220771wmc.85.1670945032985; Tue, 13 Dec
 2022 07:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20221213002423.259039-1-konrad.dybcio@linaro.org> <20221213002423.259039-5-konrad.dybcio@linaro.org>
In-Reply-To: <20221213002423.259039-5-konrad.dybcio@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Dec 2022 07:23:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
Message-ID: <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/a6xx: Add support for A650 speed binning
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Dec 12, 2022 at 4:24 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add support for matching QFPROM fuse values to get the correct speed bin
> on A650 (SM8250) GPUs.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2c1630f0c04c..f139ec57c32d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1887,6 +1887,20 @@ static u32 a640_get_speed_bin(u32 fuse)
>         return UINT_MAX;
>  }
>
> +static u32 a650_get_speed_bin(u32 fuse)
> +{
> +       if (fuse == 0)
> +               return 0;
> +       else if (fuse == 1)
> +               return 1;
> +       else if (fuse == 2)
> +               return 2;
> +       else if (fuse == 3)
> +               return 3;
> +
> +       return UINT_MAX;

Unlike some of the other functions, you don't need any complexity. Just do:

if (fuse <= 3)
  return fuse;

return UINT_MAX;


I'd also suggest that perhaps "UINT_MAX" isn't exactly the right
return value for when we have an unrecognized fuse. The return type
for the function is "u32" which is a fixed size type. UINT_MAX,
however, is a type that is automatically sized by the compiler. Though
it's unlikely, theoretically a compiler could be configured such that
"unsigned int" was something other than 32 bits. Ideally either the
return type would be changed to "unsigned int" or you'd return
0xffffffff as the sentinel value.

-Doug
