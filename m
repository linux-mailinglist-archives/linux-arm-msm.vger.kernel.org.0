Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1069667F81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 20:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbjALTp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 14:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbjALToe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 14:44:34 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A6913D18
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 11:36:30 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d30so25010338lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 11:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QP7ZDXy/vz6h2E8Aw8jzhMKk5b2tVMVMs8kkY7DjRxg=;
        b=VRa1lYmLZwBt9u8EhEFY9jOztdyhUc0rbhIsKErJjegBmGKvqae+ioHuWXiDv8ojQs
         VlENQvWkzosriREEEtozgXWWfl2TYj+fITtabr02X4YmTjsxazE8spp0ZSVPe17AF+0X
         Kf++ghoP05TZk5uCbVqQ4pz8Ihs3X6acl8/V2BC9zwxAM7bcjHXKeSHrYOXCD3wmXeZX
         L4vzc9sup3I3A+2RRNz29LyV3BXZWW9cdvn1IgEczE5Hsv/XyXDC0rNvAl0kQsgdRV8O
         2fpL+QlmoVN5qFyfEgD9on8glRvlVvMVbwnRpaFg9M06xeZiV+rObea1NNJzF+hKYPgZ
         n4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QP7ZDXy/vz6h2E8Aw8jzhMKk5b2tVMVMs8kkY7DjRxg=;
        b=hxaUr1r6uFc293YRR37koSV2PvGgSceEn0fTjZZ/YmjNRvlfKN5GdF9b7FuxtXMIFJ
         hupsSZnjkvie8adSGmly1jxqgmzwTLYjnOh1TL3fpC5eI5I3hydIa0B7iEWTh5utYexN
         aiTjKxo+lpbSZ903OU4k0yZDhEItJcLNbRo5ETTDG49Bqs8zTozjmnwuTUata2wA0I2y
         OwvhhliN9qZNMVxaDMqjY3XZShAdBgyjLWdaHwf3/vHxb+v0djmfLIRA9HjpGN6uxuQ9
         XGgyHc1eIaW6uUxCuJ5dfScLuFvFTS2HJssy8dgHJC4QS5Das1kBlOPMSuk1g8iVPW6f
         r40Q==
X-Gm-Message-State: AFqh2kpvu8v9BFor73R+XfwNcqpeboJuQggiO1M2Qf9FL34ZxrDx+zeU
        yx1eh9d8bwiJKSMPqcnNf4me+g==
X-Google-Smtp-Source: AMrXdXuCP2iZ9ad22QlH8IWK4c8i8Rc8dMqOQZuciPiR9xdgK9SnFECFIPl7JvZMmqyyu5q35RCHjw==
X-Received: by 2002:a05:6512:33c4:b0:4cc:53e2:5387 with SMTP id d4-20020a05651233c400b004cc53e25387mr10413221lfg.50.1673552189189;
        Thu, 12 Jan 2023 11:36:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651210d100b004ab2cb8deb5sm3403247lfg.18.2023.01.12.11.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 11:36:28 -0800 (PST)
Message-ID: <790207ad-9184-577a-ed0f-55e04b26aa09@linaro.org>
Date:   Thu, 12 Jan 2023 21:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/3] add color management support for the crtc
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, quic_abhinavk@quicinc.com
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
 <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
In-Reply-To: <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/01/2023 01:43, Dmitry Baryshkov wrote:
> 
> On Mon, 21 Nov 2022 01:08:12 -0800, Kalyan Thota wrote:
>> Add color management support for the crtc provided there are
>> enough dspps that can be allocated from the catalog
>>
>> Kalyan Thota (3):
>>    drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>>    drm/msm/disp/dpu1: add helper to know if display is builtin
>>    drm/msm/disp/dpu1: add color management support for the crtc
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/a4d6f8253645
> [2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4cb6b1eebb92
> [3/3] drm/msm/disp/dpu1: add color management support for the crtc
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/c48c475bd75a

These patches break sc7180 in a bad way, as the SoC is short on SSPP 
units. I'm going to carve these patches out and wait for better solution 
for the color management issue.

> 
> Best regards,

-- 
With best wishes
Dmitry

