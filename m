Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70AF56D6F31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 23:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbjDDVo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 17:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbjDDVoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 17:44:23 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB9940FD
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 14:44:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bi9so44090469lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680644660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4cGrSZvJ2WwLk51+RNni7SQAM20J6HheQCudpB7xaI=;
        b=M0sbz1uuCT89qn8mrqMkXbXNWikGtg49Jkgysnu6s+BaRJa/bKa5er8cYQwnmIxAd+
         mEN/6DCUbYcpDDDGpHK7tReV4VEwOx98dimtsk0OAsxHPcHwr572j8QYewAdRHlewGcd
         C0MF8kB2W5IG6kEu5D6qW94TMt/mi7pl367otPHBWgnAqQ4PeLniehQ7cyw8i2Ptb0q4
         GF02Hr7PHugnDz/2N6aq7av18SCJpDHwvLDVQiYIXp6+dyWo9nrUr5gfcMCk4RaSAR2z
         8BwaWXcK00+uB70xgkep8LJjh9tJJ1omLWixZIzXh0dSpOMHA2IksHgjmpd7jo0+Ha/S
         grGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680644660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4cGrSZvJ2WwLk51+RNni7SQAM20J6HheQCudpB7xaI=;
        b=c003XNRYFW3YmvgehIlIh35AoqCSkQHs5gofVHvrQAoQHkmNRASDycQuBVTfo4FqJc
         ut1IUGkZ9WtkcbhOlo1IQMhZgaGZpSZxfgSuQ1M4GaQ8TCU0Az0oFpJf3LOSJtIxHqAS
         TrBqNLns+qz9WWM9WRjOhq5j9k8OauojPrkQtSqO3hn6eR30xKIJ/saBP4lJRfS2JYtp
         tdOPKrTeIFadBluidypPqBt5bdRV1f7mgqsTXHmYNtvte1WJhaNBSkKn5KErLPSrqLk3
         gDlhozit/jEFs+Cu6FolqfvKdh6Tm7ZerxpNei0HNS9piyt385qrtZBKj6Ma7rkBEQIs
         qi8w==
X-Gm-Message-State: AAQBX9dtO52qdrDuzhq/p9pGqvqIfOVX3uRxqnv6pxJlbLFd5lEtLEHW
        ckn9tA2AbjsWdt1gJJrY2mwNCg==
X-Google-Smtp-Source: AKy350ZGb14UqtpSccBCgE8DwAr/KcuNUeQz0853wDC2eMzAj64VPLGG1kiBiL/gqUrzz1/qQRCMgA==
X-Received: by 2002:a19:f60a:0:b0:4d8:5238:ae97 with SMTP id x10-20020a19f60a000000b004d85238ae97mr908396lfe.36.1680644660435;
        Tue, 04 Apr 2023 14:44:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l14-20020a2e99ce000000b0029f7d27b78bsm2559978ljj.110.2023.04.04.14.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 14:44:20 -0700 (PDT)
Message-ID: <a20bba42-db84-5e5e-e87f-c066e09c5775@linaro.org>
Date:   Wed, 5 Apr 2023 00:44:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 6/8] drm/msm: Move module parameter 'fbdev' to fbdev
 code
Content-Language: en-GB
To:     Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-7-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-7-tzimmermann@suse.de>
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
> Define the module's parameter 'fbdev' in fbdev code. No other code
> uses it. No functional changes, but simplifies the later conversion
> to struct drm_client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_drv.c   | 10 ++--------
>   drivers/gpu/drm/msm/msm_fbdev.c |  7 +++++++
>   2 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

