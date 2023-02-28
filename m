Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138246A5EBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 19:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjB1S1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 13:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjB1S1G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 13:27:06 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF7D33472
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 10:26:56 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id k14so14400161lfj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 10:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeTqNJz+wlwStd3akJO6gZ1qy6VhdHZAOZjVTjq8Ths=;
        b=Hg303GL4P5Q2pdSN9pUyE1WywQFRKlLyQo6KYVr9Mu/xlV3i7uJRW1lj0VpgRxGJkD
         hTkQgY+xkkFxoqMaS4Lyfb41a8HJ3jHlc3udXm1O/bq0R1p7t9bEwhwna2k4KBHwyjap
         IRWuIC0ygcPQlsczqypuN6JiOkQiKSA1pLtSECv47HVme91A7K6bdx+gVw+lWNoN5FgN
         2oH0gSOJvFII3PBDbfnKkMCa1kwYlZwAVTPjnf5i+3K8CwkItAwH13tJM9wbBTz2RYpc
         0lovVIKHM4ergXahJguy9+XePKMKZR7NVzjvkBZjHPd6Oy3u9RhHb7oyDykO0VBUvQ8x
         IPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeTqNJz+wlwStd3akJO6gZ1qy6VhdHZAOZjVTjq8Ths=;
        b=wvYfYwMHxnnTBRNTChzeBiqUI722yMQQG8VtgNEg5gHnrVSVd0WgZQmAS0xZdj+szK
         ynIRDvLKgPXwW1IofGIKLkc70GNWN6PNA7A25HEUWLpi6Undm430rJwiByGe7/wyanB2
         rJqxxZ+aRtQEK2gH+N6Wp6fhGQctpbXnrfSdCBYUzVPsBWYoE/SOSX+9BrfXUQa2+UI6
         UXAh2aagekGzAw/fmP2VF3ANSEP9de1z6LmZN3ACQ3XsZvBFefOeUGy7Xk8ngFfVERNs
         n4ws2VAsIMqzJe7Dlp1b9A3KdF3OUfO15FKcY8aTCD7Y55+r7L899wWS2CZnZRebl7QC
         Duog==
X-Gm-Message-State: AO0yUKXrJD16oruca5EAtiwhhr+EIyEXosfCMrhPG4Ofg8ayiZcJ8rUz
        l/rklSuLwLQs+pSKI6HZ8Oh6yg==
X-Google-Smtp-Source: AK7set8ibk/owvLCNHo66A+Nyj9jA4S4dqpTehR9707ManX49TtuMEUwwMN0vBPr18saVuIdlRgI9Q==
X-Received: by 2002:ac2:532f:0:b0:4e1:1bfe:38f7 with SMTP id f15-20020ac2532f000000b004e11bfe38f7mr849063lfh.27.1677608814434;
        Tue, 28 Feb 2023 10:26:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 1-20020ac25681000000b004dda9e8233asm1419865lfr.42.2023.02.28.10.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 10:26:54 -0800 (PST)
Message-ID: <25b0283b-3d87-6b08-22a9-50c470c3d32f@linaro.org>
Date:   Tue, 28 Feb 2023 20:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] drm/msm/disp/dpu: fix sc7280_pp base offset
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1677533800-3125-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1677533800-3125-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/02/2023 23:36, Kuogee Hsieh wrote:
> At sc7280, pingpong block is used to management the dither effects
> to reduce distortion at panel. Currently pingpong-0 base offset is
> wrongly set at 0x59000. This mistake will not cause system to crash.
> However it will make dither not work. This patch correct sc7280 ping
> pong-0 block base offset.
> 
> Changes in v2:
> -- add more details info n regrading of pingpong block at commit text
> 
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

