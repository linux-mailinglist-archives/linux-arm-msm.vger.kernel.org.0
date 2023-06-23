Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7520673ADB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 02:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbjFWARz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 20:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjFWARy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 20:17:54 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EC42126
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 17:17:53 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b46f5d236dso1898731fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 17:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687479471; x=1690071471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfOh5/AaFo5h2RYrnqVP+NgoBNsxxnP8qJLiftnsgoI=;
        b=fuxlRim6hKrZw3LVa+Ew3uiS4+KYM0Jd87TKgJ9hn8EZT8xUuOalqK6L4D2NH2xjsm
         TjgOBmvMwdyB+URp3RW2IFPlvzFucV9BqEaxJ2GYNjkOJ6MhTpI+Z/+eRHYYf3y4uTIm
         pXxh5PKSzYjz6djOBKNFaMqJt4qBcvQCOAjMOU8KFOaRn9I4DhvtihDCI387/ei2QQum
         OgNFCLgmDLzE05f4N4/53n10HO9k68V3kI/L1fVcqwF7T6Dqf0ohL/2NImJNlAUqbALb
         3xHujw6DLYXnmigE/kRGiJTOu+2IHuACMAzTdCvbLpL1t811L/x09kGK4QqXxp4Y/T14
         v5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687479471; x=1690071471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfOh5/AaFo5h2RYrnqVP+NgoBNsxxnP8qJLiftnsgoI=;
        b=GK0EuIb9fBFmj2T/QhMInHi8jkT/nONyzThT8DpU7nAEPIA6e0LQWJi5Vc5e23dj8M
         SJ51vb8PD9KzpzE3IHmnfivMDa9pB9PT0/WPM18xa83cz8eCWVJh33M3MlC/0edQMTlZ
         C+F4sJPrkByRGVefnQ+MvQFnaNjIlwTGWwyp7jSyb1pMoVlfHh6CWi/bRhV2FXFy/yx8
         EFnqtOitBW2V4DcTgmXOgkVAxIllGlPS5OxYc1MiXij7/ssMmt2KQxQgBynZWd3qnPcd
         yt6UxQeCThXD5EQniHiEE2Q+oGl7npTHZGzCar5miI5Ao4moB/jFaf6xn/HEqKxq5NP/
         pXhw==
X-Gm-Message-State: AC+VfDwMAQyCZIm5xYye0dk09MyS+RnVwHeS2KSYqCSLGNhpnvMz3Tqa
        R7q0pRzkYGAVdtHsgaMvlSVtjA==
X-Google-Smtp-Source: ACHHUZ63908UI5Un4hDZf6o4paKWXT483TcF2BUCburhQBmV/N6+t/FyAaddSs8YH9DdlrrUWZIrgw==
X-Received: by 2002:a2e:9355:0:b0:2b4:70e2:3be7 with SMTP id m21-20020a2e9355000000b002b470e23be7mr9306465ljh.11.1687479471517;
        Thu, 22 Jun 2023 17:17:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c12-20020a05651c014c00b002b323126037sm1519566ljd.81.2023.06.22.17.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 17:17:50 -0700 (PDT)
Message-ID: <b632e52d-7b86-9f5a-913a-aace26d9a039@linaro.org>
Date:   Fri, 23 Jun 2023 03:17:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/06/2023 03:14, Abhinav Kumar wrote:
> 
> 
> On 6/19/2023 2:06 PM, Dmitry Baryshkov wrote:
>> Provide actual documentation for the pclk and hdisplay calculations in
>> the case of DSC compression being used.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Changes since v1:
>> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
>> - Added a pointer from dsi_timing_setup() docs to
>>    dsi_adjust_pclk_for_compression() (Marijn)
>> - Fixed two typo (Marijn)
>>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 3f6dfb4f9d5a..a8a31c3dd168 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
>> *msm_host)
>>       clk_disable_unprepare(msm_host->byte_clk);
>>   }
>> +/**
>> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for 
>> compression case
>> + * @mode: the selected mode for the DSI output
>> + * @dsc: DRM DSC configuration for this DSI output
>> + *
>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
>> + * the compression ratio such that:
>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
>> + *
>> + * Porches do not need to be adjusted:
>> + * - For the VIDEO mode they are not compressed by DSC and are passed 
>> as is.
>> + * - For the CMD mode there are no actual porches. Instead these fields
>> + *   currently represent the overhead to the image data transfer. As 
>> such, they
>> + *   are calculated for the final mode parameters (after the 
>> compression) and
>> + *   are not to be adjusted too.
>> + *
>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
>> + *  refresh rate and data overhead as a starting point of the 
>> calculations.
>> + */
>>   static unsigned long dsi_adjust_pclk_for_compression(const struct 
>> drm_display_mode *mode,
>>           const struct drm_dsc_config *dsc)
> 
> I am fine with this part of the doc.
> 
>>   {
>> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>           if (ret)
>>               return;
>> -        /* Divide the display by 3 but keep back/font porch and
>> -         * pulse width same
>> +        /*
>> +         * DPU sends 3 bytes per pclk cycle to DSI. If compression is
>> +         * not used, a single pixel is transferred at each pulse, no
>> +         * matter what bpp or pixel format is used. In case of DSC
>> +         * compression this results (due to data alignment
>> +         * requirements) in a transfer of 3 compressed pixel per pclk
>> +         * cycle.
>> +         *
> 
> I dont want to talk about data alignment nor formats and I will not ack 
> any references to those.
> 
> I would like to keep this simple and say that DPU sends 3 bytes of 
> compressed data / pclk (6 with widebus enabled) and all this math is 
> doing is that its calculating number of bytes and diving it by 3 OR 6 
> with widebus to calculate the pclk cycles. Thats it.

This makes it unclear, why do we simply by 3 rather than doing * dsc_bpp 
/ 24.  My description might be inaccurate as I don't have hw docs at 
hand, but simple description is not enough.

> 
>> +         * If widebus is enabled, bus width is extended to 6 bytes.
>> +         * This way the DPU can transfer 6 compressed pixels with bpp
>> +         * less or equal to 8 or 3 compressed pixels in case bpp is
>> +         * greater than 8.
>> +         *
>> +         * The back/font porch and pulse width are kept intact.  They
>> +         * represent timing parameters rather than actual data
>> +         * transfer. See the documentation of
>> +         * dsi_adjust_pclk_for_compression().
> 
> this part is fine.
> 
>> +         *
>> +         * XXX: widebus is not supported by the driver (yet).
>>            */
>>           h_total -= hdisplay;
>>           hdisplay = 
>> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);

-- 
With best wishes
Dmitry

