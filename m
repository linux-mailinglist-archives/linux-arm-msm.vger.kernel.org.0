Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A716FEA9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 06:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjEKE3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 00:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjEKE3Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 00:29:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438EB26B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 21:29:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f139de8cefso43801150e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 21:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683779353; x=1686371353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJ9MXtnOkyAVZSPiIueGuCw4XVJi6n0drxpzqQb3yGA=;
        b=hfFw4KhqPnzGb7/9iNT+mQvt1xSemQLUAuB3c4pzvXG3Kt7q25rPzDiLXby+De7xdN
         Fz97vlkzFl4YKmn9l2YiFwwavKSnxAZnMiAo58/wIBeX9PMZoGxujTf6u2xbX+uN3eMO
         c3Ee7s9TkR4KLzo40oXYIvquEd6TrqfR531MyG1wQydr8dQ+j4+YfPhwqsJSWnvebiuw
         Hg9yp56X+1RdhsONFuKtndCy7dsIUWacyOF2wwVudKLM1GmhBHR0jNqLmtESTjuxXrji
         FelWnZooEfboxYJaMu3gVWdqalpnApA9dJfCQ4YRUpO3GnoteoQTP7ZDrOHh2MI+tr4v
         M7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683779353; x=1686371353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJ9MXtnOkyAVZSPiIueGuCw4XVJi6n0drxpzqQb3yGA=;
        b=SFKjBjKmy0dgf6aclgeKrDu0Vg3wRxS2cBHhn8MXlxwMg8zcR+7gVxkS1oqEw2m3ve
         z9QvjsQ5Tuo5LQtq7/T2ZprpLIAXLuiVusuphY2IdNE+6oUXgipbxW/iyCDMnNkPw2cu
         +jGFcodkoHmIJ7vQqMAgSkOe7rfcdHvO8QZUPt55CHTAAgQ/8SMW/3YzUVy6M+LqAl8j
         u1Ms5S22giuY0DApV+7/HpC4rfKuE1n7y5Vzh2+YRYV18vAbNJybr0e5eQ08GpPa3Ayw
         832VsHfE3Tfn6DOCUqyEt7xUQIVtbB3ZMpKMTwseeKMamO2PSGfwxG3fYW4RBzHuyqj2
         6rig==
X-Gm-Message-State: AC+VfDwU5KZIsXnJWAbEKhMxU21X3beIGHRFYXbcj46EOqZtyyyRsq/V
        xXguyT8dCTl8PUTfN7y/uk1iWA==
X-Google-Smtp-Source: ACHHUZ4zi2SfJVRXQ/IZVAj25HEo64XGEYiTDFLfilGlyFboBiHXVQshtFq4MApzsvuQ+QZk4VrpMQ==
X-Received: by 2002:a05:651c:1316:b0:2a8:bb0a:2214 with SMTP id u22-20020a05651c131600b002a8bb0a2214mr2180194lja.12.1683779353464;
        Wed, 10 May 2023 21:29:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r4-20020a056512102400b004f24db9248dsm965718lfr.141.2023.05.10.21.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 21:29:13 -0700 (PDT)
Message-ID: <b4438422-f24b-7fc1-18cf-3cebdd777530@linaro.org>
Date:   Thu, 11 May 2023 07:29:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for
 DPU < 7.0.0
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> DPU < 7.0.0 requires the PINGPONG block to be involved during
> DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
> encoder engine moved to INTF with the help of the flush mechanism.

Nit: was moved.

> Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
> PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
> available [in the PINGPONG block] on DPU 7.0.0 and higher anymore.

this looks good

> Existing call-sites to these callbacks already skip calling into
> them if the function pointer is NULL.

This is more relevant for patch 3 commit message.

> Add DPU_PINGPONG_DSC feature
> bit to all chipset with DPU < 7.0.0.

This is incorrect, as we do not change the catalog in this patch.

> 
> changes in v6:
> -- split patches and rearrange to keep catalog related files at this patch
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +++-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 82b58c6..78e4bf6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -76,13 +76,13 @@
>   	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
>   #define PINGPONG_SDM845_MASK \
> -	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
> +	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
>   
>   #define PINGPONG_SDM845_TE2_MASK \
> -	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
> +	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2) | BIT(DPU_PINGPONG_DSC))
>   
>   #define PINGPONG_SM8150_MASK \
> -	(BIT(DPU_PINGPONG_DITHER))
> +	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define CTL_SC7280_MASK \
>   	(BIT(DPU_CTL_ACTIVE_CFG) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 6ee48f0..dc0a4da 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -144,7 +144,8 @@ enum {
>    * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_DITHER,    Dither blocks
> + * @DPU_PINGPONG_DITHER     Dither blocks
> + * @DPU_PINGPONG_DSC        PP ops functions required for DSC
>    * @DPU_PINGPONG_MAX
>    */
>   enum {
> @@ -153,6 +154,7 @@ enum {
>   	DPU_PINGPONG_SPLIT,
>   	DPU_PINGPONG_SLAVE,
>   	DPU_PINGPONG_DITHER,
> +	DPU_PINGPONG_DSC,
>   	DPU_PINGPONG_MAX
>   };
>   

-- 
With best wishes
Dmitry

