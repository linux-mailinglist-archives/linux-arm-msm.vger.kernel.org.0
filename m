Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF1E69F4B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 13:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjBVMiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 07:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbjBVMiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 07:38:12 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8AF3585
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 04:38:00 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id s22so9719826lfi.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 04:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKuEZcMqbM7zILS9cxxCfU68F8dK5XWQIn5402tHdEc=;
        b=GPy98UG1hDeEOAbM0MS3M8rzgN8mDX11UGL25N3HBRXisH1UpOsusVegf+3elyOg3x
         +Wcb5a0IZkREnVJKKWHsX7oYOjYtDEjIzjqeDqvdf3vFnlNO9WMykDg++hApTH8E8iz2
         Tj3xVjb27xBo+cB9OHps3IKea6jdpV0t018IEscafY4xBDi4oZHPQL9A5dUh5JvNtVm6
         R2oK5QRwIUgUmHehL3O9UlLpttppXdcyOS+HnDE9a4k5ATRBq6rjl0LWXZh2LlTSfTsr
         8Mso/9A+vQbbgZ5EeSduvwSMCAnHwMLtUp2/DzwL+LIFBs2dQsixQuVtTzztJFYVymGG
         4GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKuEZcMqbM7zILS9cxxCfU68F8dK5XWQIn5402tHdEc=;
        b=ilQ6/oOApYr0HSF0YHtsm0J8u35d54CPR6euWdc/YIHVkKzNf1vWApONMcFKhFWpso
         M/Hf5M2SpUB7z+auX8AYXoDKuL4AKYqK7Up8JRtOiXD2YvYAMwlV2N/s21sTiFrIFkec
         C6yUOo45QMN61uiz4tUJGlI4vwDN9V/jSa3Kaz+kL0NogZh4xrCHsHXlBZBdpezaBcqq
         8iL9b+nq8XyK7yeO1CbwfgQUywTFc2U8M//jQ3cqmCToVczExNz+OCS5Ap8z+yt9f84v
         xfTDwD+Tz8satnyO06hJ21YreV1OzLeGnEuQ52ZhzKC/4uquS/ko+c6HILwhfnISup/F
         3SzQ==
X-Gm-Message-State: AO0yUKVlHsHqidhwXKMxCOuXt5ScfRKdDdG9nIdJX/ph91SBy4YsIoOp
        gi+mpupjdX/R4oP399xpm9EnofqI/0DeUDaSGSRqZA==
X-Google-Smtp-Source: AK7set8WUZHmq/ZcY7/crcIYkICMSvCczISO0Ju6oISPcKN2jF10u6hOClbBs7+/DIyEr6Y7bPl1wQ==
X-Received: by 2002:a05:6512:947:b0:4a4:68b8:f4f1 with SMTP id u7-20020a056512094700b004a468b8f4f1mr2922927lft.55.1677069479041;
        Wed, 22 Feb 2023 04:37:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020ac25589000000b004a9b9ccfbe6sm42818lfg.51.2023.02.22.04.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 04:37:58 -0800 (PST)
Message-ID: <c62e64e6-4114-2411-b80b-8cdc112a4393@linaro.org>
Date:   Wed, 22 Feb 2023 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/msm: Fix possible uninitialized access in fbdev
Content-Language: en-GB
To:     Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
        robdclark@gmail.com, quic_abhinavk@quicinc.com
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20230222123712.5049-1-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222123712.5049-1-tzimmermann@suse.de>
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

On 22/02/2023 14:37, Thomas Zimmermann wrote:
> Do not run drm_fb_helper_unprepare() if fbdev allocation fails. Avoids
> access to an uninitialized pointer. Original bug report is at [1].
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
> Link: https://lore.kernel.org/oe-kbuild-all/202302220810.9dymwCQ8-lkp@intel.com/ # 1
> ---
>   drivers/gpu/drm/msm/msm_fbdev.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

