Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624B36D04AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjC3M2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC3M2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:28:20 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400164C2B
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:28:19 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g17so24299212lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OO+mjrMk1jZSB5RM1FlT3sMsdz1umFcmSSqhyUDz4Y0=;
        b=kYQ74xgu/wl6ASnsXCk6xcovXMJDtmH4WRlniuba2ED2fd4LE7rIRGInVeHrH1g0H6
         Bjf2mntZUZeXXJPV/et1JruvbOaywFG5qBIs7BaQcrgfLyZRwMnEH61TVX2xFM16RH7g
         Artj6zsJch6go+uWHcgoCTrxkl/hdyYStdsI7q9a7MThqBcKuz/bETKCGs1U/ohIgvp2
         ix+vsSMgjV6Mzdh6R+4P0icdjL3+OHukeZzWFG9tKvmcQf2ytN+epVFqc+jA6VMgbR/V
         QtKvksf/AzGJxCSH2fp5f2CX4u2mpSRo1C9K2WDYCxqAWobOtPWI1kHdSmLxT8w8CXwb
         Eq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OO+mjrMk1jZSB5RM1FlT3sMsdz1umFcmSSqhyUDz4Y0=;
        b=jhszGXCjrridqfcKwUfWOYCQpBFL72lczTDXW5IWYZKzs+eCP6jN2ISP7/odY/AC09
         /1xiqZ5ygRelrYA4CBav9D/vnXVCdeBJNrF0SEsBBd0/Am7rgohBHqsJu84V1oTBuNUi
         UIbN+XXvPdE7v5wJJlqTapIXyOe7TZo5EbZx3LZH9iW+e7/dfqFe3HaLYaIOQGUjNFfO
         eQjlxAn976KLoHG1mX8H3+aieuHBbgK/FI094mORJUZNxAc7PuKyz9Oysnv4qgR2K5Ej
         qXD/Ykyr10tZtLSUrS1KtsGU/V0uFYSpmie8GbtPZuS4qpxWXTSV3aivNOTciGk3Hznf
         Cgkw==
X-Gm-Message-State: AAQBX9eTT4pqi6QCuwEjqNkMF/7kEvXSkW7r5IOUyucF0yo3g2bpAN4G
        Pe92NlYLxxaFoW63pnDd0oCDNg==
X-Google-Smtp-Source: AKy350bJaOnCk23XOkj5bdXP6K2QEU2a+l6y74hptNST1qySDKDdqhATbo6GdG/qyNwhsY5SI25bnA==
X-Received: by 2002:a19:ad02:0:b0:4e8:5e39:6238 with SMTP id t2-20020a19ad02000000b004e85e396238mr6098835lfc.42.1680179297590;
        Thu, 30 Mar 2023 05:28:17 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id m16-20020ac24290000000b004db508326c0sm5875815lfh.90.2023.03.30.05.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:28:17 -0700 (PDT)
Message-ID: <9ad6c0a7-ff10-54d9-e556-c9eeb66b9bc9@linaro.org>
Date:   Thu, 30 Mar 2023 14:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,36/50] drm/msm/dpu: use defined symbol for sc8280xp's
 maxwidth
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
References: <20230211231259.1308718-37-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-37-dmitry.baryshkov@linaro.org>
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
> Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
> the value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 0a5d6d9fe751..a3a79d908451 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -8,7 +8,7 @@
>  #define _DPU_8_0_SC8280XP_H
>  
>  static const struct dpu_caps sc8280xp_dpu_caps = {
> -	.max_mixer_width = 2560,
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 11,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>  	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
