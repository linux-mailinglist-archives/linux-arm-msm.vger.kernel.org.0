Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822B86D86D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbjDET1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDET1g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:27:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75F56198
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:27:22 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y15so48041066lfa.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680722841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXy9k8uG9grZlhzZGPq1SGSKKZtxPCxIYKujcGIR3Bo=;
        b=WtmpVrjvv5oj589+NK0eoo+nPywpeQrwJ11FtubJ1vTO1UNHfmu18jHklu2M8RB14Y
         zdYJ4eR8xMPLwHWRMt1cnM/9hbDjkxmvGAMB22fw0xYlqy2pydIAG3PcwJ3XqRnjgeSq
         pZ1gnRKJdcgYbHob4jiIenRhE83JDjWK7hYu9BSw0KLGGzYV+EFGc7kN895XX3xpwI9r
         gmKVs7ZYSy+Jf0I96eRP9zAky6KIHsoG+lybyOkD5JVGLQeqYrZDsT7EtzYdvn7ZG1br
         Pf8CUkR5aDYprUHzusmst6bdRBg9QEdfFIgB31W9Zwh52DVu4rqxlQUeZ4ZsX2RXQKex
         fOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXy9k8uG9grZlhzZGPq1SGSKKZtxPCxIYKujcGIR3Bo=;
        b=aMo7W+o4p4fuaFHHB8vpYhsZitd98oFn9rVZdMsZhUF6dDul5tPCG7aAsv+jdDviKe
         MWmr90gaZ9OkVqxoPCpH4azBxpSfJIjAXYbP8meqzkg1vj2WNB6lkcpwfm+jTKtc6M1Q
         Dt8h8QjmXJb4YaN0DtyLnIjKuJbTkuAH6xIoEZOhkuZ5mUT69qQjfU13O+FBi5LMbccC
         MBnDGS40EDjdxavikVjfqRzaHM27wfp6GsY3kCZKfAvMGSB5ZCdvO78s7p7q5kPBRrYB
         zlhAJXJOk+4KMj/4SRsox7vVsF0CGcdBYmz1AqaWAEKlcLVkxEPUsPCL3YRq/0AUOUvR
         UeMA==
X-Gm-Message-State: AAQBX9cl+QqKWfm/Um/0EvE4m/931xbLgMY6LtphW9SEZVlM7rbmwwoP
        VWL5RjpuBC0ar9+vcg7rJsTcFw==
X-Google-Smtp-Source: AKy350bE40H0Dtwd3+6TvUavRTABXlZcjlcNHeE9ZYXdKLpADHGjW8hKcXcZrq5lO7rzJXQOS2nmmw==
X-Received: by 2002:ac2:5681:0:b0:4d8:5de4:e3b4 with SMTP id 1-20020ac25681000000b004d85de4e3b4mr933612lfr.1.1680722841003;
        Wed, 05 Apr 2023 12:27:21 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p15-20020a19f00f000000b004ddaea30ba6sm2925878lfc.235.2023.04.05.12.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 12:27:20 -0700 (PDT)
Message-ID: <1cf2d02a-e8d7-1aa8-de3f-3321295d2d09@linaro.org>
Date:   Wed, 5 Apr 2023 22:27:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 4/6] drm/msm/dsi: Use MSM and DRM DSC helper methods
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
 <20230329-rfc-msm-dsc-helper-v4-4-1b79c78b30d7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-4-1b79c78b30d7@quicinc.com>
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
> Use MSM and DRM DSC helper methods to configure DSC for DSI.
> 
> Changes in V2:
> - *_calculate_initial_scale_value --> *_set_initial_scale_value
> - Split pkt_per_line and eol_byte_num changes to a separate patch
> - Moved pclk_per_line calculation to hdisplay adjustment in `if (dsc)`
>    block of dsi_update_dsc_timing()
> 
> Changes in v3:
> - Split pclk_per_intf calculation into a separate patch
> - Added slice_width check to dsi_timing_setup
> - Used MSM DSC helper to calculate total_bytes_per_intf
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 74d38f90398a..6a6218a9655f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -28,6 +28,7 @@
>   #include "dsi.xml.h"
>   #include "sfpb.xml.h"
>   #include "dsi_cfg.h"
> +#include "msm_dsc_helper.h"
>   #include "msm_kms.h"
>   #include "msm_gem.h"
>   #include "phy/dsi_phy.h"
> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	/* first calculate dsc parameters and then program
>   	 * compress mode registers
>   	 */
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> +	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>   
>   	/*
>   	 * If slice_count is greater than slice_per_intf
> @@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	if (dsc->slice_count > slice_per_intf)
>   		dsc->slice_count = 1;
>   
> -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	total_bytes_per_intf = msm_dsc_get_bytes_per_intf(dsc, hdisplay);
>   
>   	eol_byte_num = total_bytes_per_intf % 3;
>   	pkt_per_line = slice_per_intf / dsc->slice_count;
> @@ -936,6 +937,12 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   			return;
>   		}
>   
> +		if (!dsc->slice_width || (mode->hdisplay < dsc->slice_width)) {
> +			pr_err("DSI: invalid slice width %d (pic_width: %d)\n",
> +			       dsc->slice_width, mode->hdisplay);
> +			return;
> +		}

This is not the "use of MSM and DRM DSC helper methods" and thus should 
be moved to a separate patch.

> +
>   		dsc->pic_width = mode->hdisplay;
>   		dsc->pic_height = mode->vdisplay;
>   		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> @@ -1759,7 +1766,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>   		return ret;
>   	}
>   
> -	dsc->initial_scale_value = 32;
> +	drm_dsc_set_initial_scale_value(dsc);
>   	dsc->line_buf_depth = dsc->bits_per_component + 1;
>   
>   	return drm_dsc_compute_rc_parameters(dsc);
> 

-- 
With best wishes
Dmitry

