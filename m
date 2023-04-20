Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C4F6E967F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 16:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbjDTOA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 10:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjDTOAv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 10:00:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F005E72B7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 07:00:46 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4eed6ddcae1so2733148e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681999245; x=1684591245;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1aD8yQeVZIHs8X5n3y1xoP0pKOQ0cX0sJ2U9iOb/YY=;
        b=mweWLE8mGevQKG3eonSrFfNjPVMtr9CqnUhAh3XDI/JMVjCtoCCXMR0EXQuc2d6yC0
         6b/FNEZLChWS9F4pMA2tY1u2/Vei9NkXmmiwEI8xIx9WRrCe3X8WcSYEbl16jnL9KnH3
         Edvsm/34C8W4HnXF5DSI6YVwUEdK+td/cXEahE3wMIuXGWKpOpLe7A04Fcn1QTfL3+R4
         La66Q8ngkyADp03bu9pZxT0hT1eqIEjCXjZhDXh+712cURb5XNh+cjRm8kuXHu1IQLZX
         KJsnic0kQla/JoIq7r+ur5ySBo+p1GSW6TmPX8cK/WJ+QBIi8u3M5NUY2CohHTd5Kr/I
         YZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681999245; x=1684591245;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1aD8yQeVZIHs8X5n3y1xoP0pKOQ0cX0sJ2U9iOb/YY=;
        b=JBKYaZ09b4Jde4hs2n8WcmdQjX386a2LuPTS6RIVUPbiSBhlv2lEUkrLAHO52XemrT
         MrAqN5AhhG5f4RhqaA0wg6rSvMeYWZyCAYMPuZ/gVc0o2PlPMaCe8T545voRGnDsotAL
         W/XityMc6bd6BS96eEgIcMlrA4UJ37LsIcYXfPPe8VY4IQCU8zSXN6vw8YdHbMfb7kVi
         x/UxyCpluRc18DVJkw/MsobiCrSN8DEMM1n+FRiLmrg8/uFuoQ1heq+RvwBpMAaEhK6F
         tO/X179O+wLzXzoYJaJmmyqadsq03s8jqiSWhQBIEaZnjyXHB9GdWa4wawfuE/TSOef1
         vOLQ==
X-Gm-Message-State: AAQBX9ckqHoitwE7gjwhkr1yGbkWkB8j7NmZTb8Obff8fBjj5TPt9cch
        5PQknXecK/6GpTeWeUZqHUBIJw==
X-Google-Smtp-Source: AKy350ZPmF4ZLO4m/OWGZMLwwoUErjLDsugYjBHHz9Q3fIzRhrn+TYbRCmTKwCu0qVUzhwRAo9J4dw==
X-Received: by 2002:a05:6512:38c6:b0:4ed:d5ce:7dea with SMTP id p6-20020a05651238c600b004edd5ce7deamr526856lft.27.1681999245245;
        Thu, 20 Apr 2023 07:00:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w8-20020ac24428000000b004db44babad7sm224318lfl.260.2023.04.20.07.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 07:00:44 -0700 (PDT)
Message-ID: <551496a1-caf6-cebf-65b3-64b41a31e28d@linaro.org>
Date:   Thu, 20 Apr 2023 17:00:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 2/6] drm/msm: Switch to fdinfo helper
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-3-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230412224311.23511-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 01:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
>   drivers/gpu/drm/msm/msm_gpu.c |  2 --
>   2 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

