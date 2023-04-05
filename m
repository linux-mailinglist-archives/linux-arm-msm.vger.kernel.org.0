Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745EF6D86DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjDET2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDET2O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:28:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3283E4ED2
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:28:13 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bx10so20059138ljb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680722891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyk9gyqKSX6vf51KkISu7/1RBcf1YgJerL2mWO19eRY=;
        b=bYXu3+B/PyWJp+zFnlZik2M9E+r77gpb/zk/Qg4EZqIJ6OR3R4QS+FBi+JjpGDysqa
         f0blBODn8+/nC9cR33NyykP8JcVyLOIITM85DbVj/q10Dn3XgKI/Fs1iVciIFIBHGPOa
         m/WxBuUKolIGURPuW10+/HcTKD4SKYluIPw4QAVzJ78vwfXOefDz5RPoDJ2SWx5+CKqQ
         dGbfqrV/QKd44EguEQyf5TexzGxvwLRb+fBztZlvyhZbp+ZQImJU7jOwuPPmG9M7Qyxu
         VSca+glpxqHCVYugimVd+J5wjBkKzneA4rhAr1LfwdYuB6M8akN9VsiVAenj8TOhsoKA
         AjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyk9gyqKSX6vf51KkISu7/1RBcf1YgJerL2mWO19eRY=;
        b=2TyQFoyb16b2CmS2su6F29qO9XbtfCHoOz+KdlscYnQpTOe+PyXg2sjb7TmY+Y/RpE
         ag5s/YJIF9dNCPE+fBBz2Rm7M7Ivf/jfS9hAh12j6jHwQ3iKO4KPB+yd7JpSvz4rUAld
         r5YcUXi6ml3/6tvy92T7xPFKN5kNra3Jfe0a/QxX5Xo5mPezEEZQguAaPJfwwO9xVeMn
         YivuTSjE7je+Eabcsup80pdaNxSRNZiO8A6+QAkIJXunICzKlJphFbMPuZyU1PRigEs8
         XiF3UcTZiZyxc93sBBJslRGHbyNmGpB5y3FbHhQ2r9ZYQNiKFZqxrYh9m+HobecDwlR6
         lNnA==
X-Gm-Message-State: AAQBX9cHwG3iv/XKfWlTrDe6Pkboq2ErNCqroQ4lC8wgYQGV+xr+kmyM
        27QbXlHdf3iyzddRLqFZcI9gEw==
X-Google-Smtp-Source: AKy350YWoifUz5YIaBQr4oUdSmW/vD6IUu3npYLfDxTZR1FEKoc1AvoebpmcKPUSfBhTVMVGq2sCiA==
X-Received: by 2002:a05:651c:44f:b0:293:591d:d84f with SMTP id g15-20020a05651c044f00b00293591dd84fmr725395ljg.11.1680722891533;
        Wed, 05 Apr 2023 12:28:11 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e990e000000b00295b59fba40sm2919806lji.25.2023.04.05.12.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 12:28:11 -0700 (PDT)
Message-ID: <2675ea9e-e13c-d78c-aaf7-0be4ae756ad9@linaro.org>
Date:   Wed, 5 Apr 2023 22:28:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/6] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-5-1b79c78b30d7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-5-1b79c78b30d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 03:41, Jessica Zhang wrote:
> hdisplay for compressed images should be calculated as bytes_per_slice *
> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> dsi_timing_setup instead of directly using mode->hdisplay.
> 
> Changes in v3:
> - Split from previous patch
> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>    dsi_timing_setup as to not break dual DSI calculations
> 
> Changes in v4:
> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

