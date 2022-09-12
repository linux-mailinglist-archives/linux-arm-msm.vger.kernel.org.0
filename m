Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B55E5B6116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 20:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiILShU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 14:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiILShB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 14:37:01 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C686B10A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 11:33:21 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x10so11602130ljq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 11:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6WHd2Lh5sHpqZ8XZXHBVfhtt4Zw7UCB2YjsqNgOeRTA=;
        b=HLFslW2Dtv+weTMBIE3BHt+Zkvg70tIfzYAwjzgIQuWIqn8L8wczywqrepcbkEquLF
         6tXsLRIzkPFsD2p5grAdny3PU+oml9CM5c/VuV6tfNqUttBZhFAloyUgt5cf9CgYJISV
         i8AE9GFEdgR2RYLkcjidnltxn+LEeoqzgwP6DOrNQTXRoEkzPbzzL1rV1wuldKjtTsq7
         MXrBwZR8HUMBnnEveSnfmrV0Wqn6bfvO3YySYvz5eGOg9Sa6uvZphbw9vN6V5AaKk8Dx
         yVCDeaiLZznyM/xi/7HoG5S0BBdo4CFRMFFInbOIqRDhVDyzIX+ynS1YagGzNlkEiOQV
         VgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6WHd2Lh5sHpqZ8XZXHBVfhtt4Zw7UCB2YjsqNgOeRTA=;
        b=QcOvtAaxsgIlAZQrw2SIwswh/+fHS3HNw0OY8NdhO7VG6O8N1gU7xqx+LK2GwQ82xE
         iKt3k3o1lrd6PEMaEzvuRI1z+iR/8FCL1/8gC9IQnlrgUBA6HVf2OYKZZ8b23zRo+/Ns
         zrmcTOeAxJCE2GjNiA+A97jyMl0+l2Wxl7jRwZVoUnkNfVCc+9T6/ofQ1vr46s/hVRRn
         Se2ByTEWIVICaBHhQKO0hoE3tLCrRUkefTp/sMO7uOwIhCaCkN9fiHwF9c9J18e7BZM3
         StKDPIU1CEjskW/Rxf+33HdqCWz5BpTuUoBXK0AjKyg0ZaMXO+bvF60HATKrWI7pYK+I
         lpRA==
X-Gm-Message-State: ACgBeo1jok78sEzKXyklZlEANj349c1Rlztmvi0pCcXsBdXjGJPnNgQ7
        SwfQuFj5TkdpwsI8OCnmIl0XYQ==
X-Google-Smtp-Source: AA6agR6XhzOiep2TDtn0FWyDN6hmjubv1DF3PrAVGnrz4DgLT/fkJ5r5d4xePB2Be6IDiUtXarP2jA==
X-Received: by 2002:a2e:b8d6:0:b0:268:9b1d:5084 with SMTP id s22-20020a2eb8d6000000b002689b1d5084mr8266853ljp.37.1663007600193;
        Mon, 12 Sep 2022 11:33:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 3-20020ac24823000000b00498ebd60c35sm1206811lft.165.2022.09.12.11.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 11:33:19 -0700 (PDT)
Message-ID: <f3083bc5-fd56-b017-5cdf-c72e730a987e@linaro.org>
Date:   Mon, 12 Sep 2022 21:33:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/2] Add support for HDR color formats
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com
References: <20220901203422.217-1-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220901203422.217-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 23:34, Jessica Zhang wrote:
> Add support for HDR color formats.
> 
> XR30 linear/compressed format has been validated with null_platform_test
> on SC7180, and P010 linear has been validated with plane_test (also on
> SC7180).

Are they supported on sdm845? On msm8998?

> 
> Jessica Zhang (2):
>    drm/msm/dpu: Add support for XR30 format
>    drm/msm/dpu: Add support for P010 format
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 24 ++++++++++++++++++-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  2 ++
>   3 files changed, 28 insertions(+), 1 deletion(-)
> 
> --
> 2.35.1
> 

-- 
With best wishes
Dmitry

