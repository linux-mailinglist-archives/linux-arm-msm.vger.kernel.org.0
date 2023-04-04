Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38BB96D6F22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 23:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbjDDVnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 17:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbjDDVnI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 17:43:08 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D23D10CA
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 14:43:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x17so44160724lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 14:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680644586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSR45RkCkZAa6HfvzU+qpgIaeIB15LuPXZ7G+069NSk=;
        b=I7aAm/b8LBQTjsriGf5wlEn2paOkAC9x9Dffq5nPc8cgqqqPEsB8FNA7xP4SuDBuqX
         ZBNWGFAkDGwnWyRyLghIW+oj5MXhLqMBu2LLifNseSROmMkM7TNJ7CaJiXuAnKq5rckS
         dHJWrdlDfixUG5UqGeX5C4cCtf7Aoyy3HzRqTfPIi8ONNtEYGD+Xe4sMwq5mHd0qx6Rd
         /P/rCMcZJ1L1L5XiSBXxYQFWXiglGYypP8dY18PjTf1Adb6KVBKWFQexWeIl5jgaiuhE
         Id7H1GQiBKhH7yNPuJaCHCUCXxcf3pTPF4X14HDSEPWbljCBiPTDF+7cXVLsCcToocVO
         cEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680644586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSR45RkCkZAa6HfvzU+qpgIaeIB15LuPXZ7G+069NSk=;
        b=g1RD2L3a4PdwTq6V/F9oHmrEsn0Dd1AnfRXkSsqu7flu4Qda6IPZ/YCzoeOCzL+t5v
         7FxkP6WOgin5nlPQUFcGnWsmBfrF9P99Y0g5pNpeTmCUM5thaM5BMYZyWsdEcAnPX01g
         6afDxPWPBURZVwPy2DNjXahM9AzD0M2JDGXZdXPC9WrQh8YSb9zlug26B7c3aN79K1tZ
         GsR3i9hVcnCnzn3RD91E/s0HvntTssoZUYWTKoU3Qn6oHCRECCwl28f+vHaAjTm3vdCh
         3UTkgVpGXiwZf64m2Tme4IfX/zP4hegm3lm5rd3eIB2Qkvx7q6EWAWfJWWqp+teNLsZ4
         kJcA==
X-Gm-Message-State: AAQBX9cqcC/4aHPv5GBrWYLAXfqEXG3Ea0uDpOUbdme9OahvlVoc28Tu
        bC5qHc3/x5Mf7R83k4lbHam/dg==
X-Google-Smtp-Source: AKy350aqwjn5ys3NOtAi47em7O+S8a0XsVjMCu5tyoY3tio0RsgoA26TA7qzZYrihV3AtEDGFEyNhg==
X-Received: by 2002:a19:c502:0:b0:4b4:8f01:f8b1 with SMTP id w2-20020a19c502000000b004b48f01f8b1mr1069888lfe.31.1680644585926;
        Tue, 04 Apr 2023 14:43:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o2-20020a2e9442000000b0029571d505a1sm2543919ljh.80.2023.04.04.14.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 14:43:05 -0700 (PDT)
Message-ID: <ad5207e8-50d8-98b1-cd07-f4ab0735d25d@linaro.org>
Date:   Wed, 5 Apr 2023 00:43:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/8] drm/msm: Clear aperture ownership outside of fbdev
 code
Content-Language: en-GB
To:     Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-3-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Move aperture management out of the fbdev code. It is unrelated
> and needs to run even if fbdev support has been disabled. Call
> the helper at the top of msm_drm_init() to take over hardware
> from other drivers.
> 
> v2:
> 	* bind all subdevices before acquiring device (Dmitri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_drv.c   | 6 ++++++
>   drivers/gpu/drm/msm/msm_fbdev.c | 6 ------
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

