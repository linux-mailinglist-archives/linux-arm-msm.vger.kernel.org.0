Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD3A735EC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 22:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjFSU53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 16:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFSU52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 16:57:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C359EE4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 13:57:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f86d8a8fd4so2455681e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687208245; x=1689800245;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DdgLBE7ortnikmhoP1Yw2NLv7TWW6NRWleDmf5QpKEo=;
        b=M8WHDSQRj8BMjGsZ0EpBTXSR8iWAXp+0iL/4cqDrTB5spLjhzBAFmtxNY6YkZKMG6G
         qbBMU1W666e1xlWMLOiYCHsMw0PDh5laDHWITK0PiSNzYCxP9HhY7WwIHoQ5880U16op
         RKuyzAstn9EHoL5l+0rZtJrVr0OKBZwEGd1enLg9sO4eyGc6HQfs8eOSY6Ub0Wykbt+V
         yp/ZjxA+DNuxHEGwZl09HaLVdbP583jnbkdPGu81sTRbSqH+Yua+Lapqy7MU6E4KQ8fn
         Wvtumccy4Ub8lPFZjxQ9nvFt363PLPYylPBjkz0is3C0rW278fMQluRFanTWr72dg7Ds
         noog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687208245; x=1689800245;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdgLBE7ortnikmhoP1Yw2NLv7TWW6NRWleDmf5QpKEo=;
        b=B3CU+Nu5FN2d+hFndLcAU8t53PgTPATruBJJt15L1oRHNLWQmHSu39ZPuMWynfFBT0
         WqWBfC4rqsO30c4HaM661mMOdPuFZxRC255/xEGmm0ejjFVB9y8J5KTNAtUV6zEnKPYn
         ECysNgff9gFK24y7j5N6AjtEvt077+y5NzgRmhTRl4ve3d5lW7zu3u+O8ZI7ZmhGMZLf
         ezPNESP6INHwu+Kk83OJbdefZPTcn1x9XnM/WheMVUcLKmnZZgAkUoSpnAcyuyItCHdt
         8JkcYotv6x5AoroZB7WiJsCXnDnWqlBs9dGtizCJx73YK1yOTrmN6Ni+OTbGeucWQDho
         7gAw==
X-Gm-Message-State: AC+VfDyj1OIOSbwAp6hczxIU7wvYtZrZ3rrds8/6iCzSCt5DsYWCdsAj
        UM6dDuoZyButwOcmTqEVeSL7ng==
X-Google-Smtp-Source: ACHHUZ4Zk55ODVpUx1QnaQ5Rr+X6R+tCa0odArHwPhMZ9ilpWM+NeG7YePDIF7QbTi7AU8heat1PKg==
X-Received: by 2002:a2e:9050:0:b0:2b3:31c1:c747 with SMTP id n16-20020a2e9050000000b002b331c1c747mr6458810ljg.24.1687208244935;
        Mon, 19 Jun 2023 13:57:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id i22-20020a2e8096000000b002b21089f747sm50130ljg.89.2023.06.19.13.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 13:57:23 -0700 (PDT)
Message-ID: <677b74dc-e0f5-22e9-2b21-a7272c661b6e@linaro.org>
Date:   Mon, 19 Jun 2023 23:57:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dsi: Document DSC related pclk_rate and hdisplay
 calculations
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230616094152.495723-1-dmitry.baryshkov@linaro.org>
 <h2u5wsfbfpz7qivmxl3t37xen452zxt76uheonkwcihytfmb3l@axiy5bmwf4ma>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <h2u5wsfbfpz7qivmxl3t37xen452zxt76uheonkwcihytfmb3l@axiy5bmwf4ma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 15:25, Marijn Suijten wrote:
> On 2023-06-16 12:41:52, Dmitry Baryshkov wrote:
>> Provide actual documentation for the pclk and hdisplay calculations in
>> the case of DSC compression being used.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 3f6dfb4f9d5a..72c377c9c7be 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -528,6 +528,21 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>   	clk_disable_unprepare(msm_host->byte_clk);
>>   }
>>   
>> +/*
>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> 
> Make this a kerneldoc with:

Ack

> 
>      /**
>       * dsi_adjust_pclk_for_compression() - Adjust ...
> 
>> + * the compression ratio such that:
>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
>> + *
>> + * Porches do not need to be adjusted:
>> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.
> 
> as-is

Cambridge dictionary gives this "as is", without dash.

> 
> Though this was never tested nor confirmed by QUIC, but we can assume it
> is the case for now?
> 
>> + * - For the CMD mode the are no actual porches. Instead they represent the
> 
> the are no -> these are not
> 
> they currently* represent.  

Ack

> Let's make sure that folks read the FIXME
> below by perhaps rewording it right into this entry?

I kept it separately, so that the FIXME can be removed once CMD handling 
is reworked.

> 
>> + *   overhead to the image data transfer. As such, they are calculated for the
>> + *   final mode parameters (after the compression) and are not to be adjusted
>> + *   too.
>> + *
>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
>> + *  refresh rate and data overhead as a starting point of the calculations.
>> + */
>>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>>   		const struct drm_dsc_config *dsc)
>>   {
>> @@ -926,8 +941,24 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		if (ret)
>>   			return;
>>   
>> -		/* Divide the display by 3 but keep back/font porch and
>> -		 * pulse width same
>> +		/*
>> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
>> +		 * not used, a single pixel is transferred at each pulse, no
>> +		 * matter what bpp or pixel format is used. In case of DSC
>> +		 * compression this results (due to data alignment
>> +		 * requirements) in a transfer of 3 compressed pixel per pclk
> 
> 3 compressed bytes*, not pixels.

No, that's the point. With 6bpp one can think that 4 pixels would fit, 
but they don't.

> 
>> +		 * cycle.
>> +		 *
>> +		 * If widebus is enabled, bus width is extended to 6 bytes.
>> +		 * This way the DPU can transfer 6 compressed pixels with bpp
> 
> pixels -> bytes?

Same comment, no.

> 
>> +		 * less or equal to 8 or 3 compressed pyxels in case bpp is
> 
> pixels*... bytes?
> 
> And I will ask this **again**: does this mean we can halve pclk?

My guess would be no, since all other data transfers are not scaled by 
wide bus.

> 
>> +		 * greater than 8.
>> +		 *
>> +		 * The back/font porch and pulse width are kept intact.  They
>> +		 * represent timing parameters rather than actual data
>> +		 * transfer.
> 
> See FIXME above on dsi_adjust_pclk_for_compression()?
> 
> Thanks so much for finally putting some of this to paper.
> 
> - Marijn
> 
>> +		 *
>> +		 * XXX: widebus is not supported by the driver (yet).
>>   		 */
>>   		h_total -= hdisplay;
>>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

