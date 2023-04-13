Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E99556E0307
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 02:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjDMAHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 20:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjDMAHU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 20:07:20 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD5976AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 17:07:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h12so11948925lfj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 17:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681344427; x=1683936427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOd7NOVIuKpcZyAlsPaoi5g+ynF8wF/mSBwzKeYJ5ps=;
        b=bbMFCdCC5Q+woKKSC+rAMZnhE26CHyAna2FNuf/0daVeomHgUZMCcTz71jrF5gkUOE
         VFSenACxQ9VBgf3V6mhncJfx26wo0J+QCQeKlH1a4bcU/yxK8wcD1dC868C62AQoSwin
         V1gJVj9GbVitZPMXvs0GP5y+4Jb+fIUVcTl45+nPD/6bkMBaAmU17Ubyk/5YL2gjRI4U
         PtkSkD4bqJwRyNeuRCGTlyGIUGy5BosKdfxc7MnczI8Xr+47myEmy17/Eebk126Mjhna
         h1i72YSoOkzH1Un473uRlcsvGm5yDYkMpibyrWkAUZvymQGpNbdsMmEb2v8C0GNmyM2d
         mV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681344427; x=1683936427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOd7NOVIuKpcZyAlsPaoi5g+ynF8wF/mSBwzKeYJ5ps=;
        b=T6POfov1+9BYgFxxRurue4VRmeFAARrQ3U/lReRscCI6/WMvioIYG5hnIJzlwAQCuY
         uERBq29MLZCx7hvjBxGZXQna1C3VnWj7bvAgImcHbdkZu9e9+P+zPs8D6/CTmj8oQNSZ
         adDIkGOUFWxSn4muIP6nFphKiwzsFH4uJ4FEyt1lC7J+m0BCLPHKkX7E2s7nKl99gxo4
         RdgTDpMTpMWO3vlAznDyQemm6xqpD9IABMIzD12Ig6FHlXfRy8GayWap3U2madAIOxMZ
         Kyww0IayTGAKnvAEYmMmbPS69g13mI0X1QzM6FrDJo8NYxxubAUSrF1w5phwEWBdRRRT
         b/yQ==
X-Gm-Message-State: AAQBX9c9UJEHkl1sHJxh5cCjGlbNWMMUoHku3kJtFv/Z9Hx+Ky+gALsq
        B13aBWnNctVrWDvNuySx74A8ZA==
X-Google-Smtp-Source: AKy350ah9N6A7Y0npbYfR/g5D1BHtXhgKT5/gJslSWdjBm4pzyLOimPO2wm46OYGYljhsX5WI8fW4Q==
X-Received: by 2002:a05:6512:971:b0:4d7:44c9:9f4c with SMTP id v17-20020a056512097100b004d744c99f4cmr199797lft.4.1681344427048;
        Wed, 12 Apr 2023 17:07:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f10000000b004db2ca9dd33sm35088lfq.275.2023.04.12.17.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 17:07:06 -0700 (PDT)
Message-ID: <be810874-0648-d57b-de7b-54ff7ec4576b@linaro.org>
Date:   Thu, 13 Apr 2023 03:07:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 2/7] drm/msm: Add MSM-specific DSC helper methods
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
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-2-cb7f59f0f7fb@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-2-cb7f59f0f7fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 02:25, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Changes in v2:
> - Moved files up to msm/ directory
> - Dropped get_comp_ratio() helper
> - Used drm_int2fixp() to convert to integers to fp
> - Style changes to improve readability
> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
> - Changed msm_dsc_get_slice_per_intf() to a static inline method
> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>    method name accordingly
> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
> - Fixed some math issues caused by passing in incorrect types to
>    drm_fixed methods in get_bytes_per_soft_slice()
> 
> Changes in v3:
> - Dropped src_bpp parameter from all methods -- src_bpp can be
>    calculated as dsc->bits_per_component * 3
> - Dropped intf_width parameter from get_bytes_per_soft_slice()
> - Moved dsc->bits_per_component to numerator calculation in
>    get_bytes_per_soft_slice()
> - Renamed msm_dsc_get_uncompressed_pclk_per_line to
>    *_get_uncompressed_pclk_per_intf()
> - Removed dsc->slice_width check from
>    msm_dsc_get_uncompressed_pclk_per_intf()
> - Made get_bytes_per_soft_slice() a public method (this will be called
>    later to help calculate DP pclk params)
> - Added documentation in comments
> - Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
>    renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
> 
> Changes in v4:
> - Changed msm_dsc_get_uncompressed_pclk_per_intf to
>    msm_dsc_get_pclk_per_intf
> 
> Changes in v5:
> - Added extra line at end of msm_dsc_helper.h
> - Simplified msm_dsc_get_bytes_per_soft_slice() math
> - Simplified and inlined msm_dsc_get_pclk_per_intf() math
> - Removed unused headers
> 
> Changes in v6:
> - Documented return value for all helper functions
> - Fixed dependency issue caused by drm_fixed.h being included before
>    linux/kernel.h
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile         |  1 +
>   drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++
>   drivers/gpu/drm/msm/msm_dsc_helper.h | 81 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 108 insertions(+)
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

