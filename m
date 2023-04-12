Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C466DFE9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 21:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjDLTRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 15:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjDLTRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 15:17:32 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3F3619B
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:17:29 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q15so9431582ljp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681327048; x=1683919048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dRODDXy/BT0Gjum0+OFeyBhxWrO5XinOtxuRQcw/8ZE=;
        b=HZRbePvjp6po9F/X9fmsFkPogyhg5PUjdwGig9JFLn1SWeB2i1t/Bl7EQN6b5MPdpM
         Lnm44sEK+8HGuU8IcrzO9z9pzrMv267MBfjKQOJEQMgRkdBz3Vo5QstxxDYCKb9TUBar
         Mz3hQpxwV3MBIkXEs4m2nXFkyNN94xaaW9PCaWH8bRtqJSJ9SgQVSet9Mt8a3ZBlOor3
         CBXtCYTJCAokywY589e95UOEfFNlP5y1ysQ4Tg1PK3uEeCfAAFWd/XU7lP0s8GhH91bQ
         Pw4egQAZ2oiHRjcXzwe1OgqA/iym3hra1iUWKhUNjIfE+c1oLQUlmfR6SXX+PJ7VJhzQ
         dUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681327048; x=1683919048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRODDXy/BT0Gjum0+OFeyBhxWrO5XinOtxuRQcw/8ZE=;
        b=F30VfWxgbuxdR37ESOqdcyUKfmdv9+3CjWvq22U5IXR0G4RbO0rNQUoIIMT/QfoyxZ
         JT77W75NIaWAl9+6e9YFR0uGwBCjIs6BGWjPqsxXZK/sJhvXxk272HzquqL94MuGW44m
         IMsfDteY9Gs7yGcXTdrqWEFzmsh0GGWGeOoVHiiBOMWLi7q0nFbD3yaPlyNQyPFUl1Vq
         ZV4r/XCh8PpChc6wkvjZS/Yt8t9TpaygFdiD86DtjOuJ3DsuO44d1QCZt/8CnwN/5FWe
         LH0c+ysKFwIsCr5eQNyVFFwCtRAwnI56U3xJ2+h1KbTLgypvs4P2504FS7US9HhFdWDV
         NRkw==
X-Gm-Message-State: AAQBX9dN6roUXe8Ra1bAvs0gBfekcvrTmQR7ODpnhV/ltDTFY2FUgesT
        hue/ty7AP1GbdAyKtAOEDGSsew==
X-Google-Smtp-Source: AKy350Z/uC6ywvX8543O0rMPaEZsM9dpm6pLBnycnKxum4DMfimLO2bGQEIj6Aj1skYL2+ZEmrergQ==
X-Received: by 2002:a2e:95d2:0:b0:298:acea:d261 with SMTP id y18-20020a2e95d2000000b00298acead261mr1088226ljh.21.1681327048099;
        Wed, 12 Apr 2023 12:17:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q1-20020a2e84c1000000b002a421ac8629sm3391473ljh.49.2023.04.12.12.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 12:17:27 -0700 (PDT)
Message-ID: <2c3c696e-fcf8-37c4-f112-0ba4071d307f@linaro.org>
Date:   Wed, 12 Apr 2023 22:17:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 5/8] drm/msm/dsi: Use MSM and DRM DSC helper methods
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
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-5-0108401d7886@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v5-5-0108401d7886@quicinc.com>
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

On 12/04/2023 22:09, Jessica Zhang wrote:
> Use MSM and DRM DSC helper methods to configure DSC for DSI.
> 
> Changes in v2:
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
> Changes in v5:
> - Split slice_width check into a separate patch
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

