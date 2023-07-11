Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D7B74E264
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 02:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjGKACs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 20:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjGKACr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 20:02:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91B91A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 17:02:45 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fba86f069bso8063008e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 17:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689033764; x=1691625764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1w9yY+8SJhlthUMjNjEuOabsBHcswYGEE9IOl91tE7U=;
        b=iWg0XysXVpJWPAvKE7E/yUY6ad9SXRWwGl7JucDBPnXb/3/l8dm4P30HWKpBxrcm9R
         uAiHlrejTG688wUEICg3S+681TmPcO2Y2LoKpJSnUo5GvjPphvmESHjsXKGccJswJcn7
         Unw4+VQ6qhXeKBeTwoocyJiLEqzIED5X+By0cpVwLq4lfjtfhcd6e+N10ssGj73icPZQ
         MjSFv5VPAqUe2KYLL48z1cquEJ86Jh75WulC0KMf4itlLMMBVVrW4Ufn3GNxW76ptMnl
         5DyHDhZx4zAznYxnVfoQ4xdtGUEqDcLJL1Gw2OQrl2dG5XnB3qBtATg+HNQrV6CR+Tok
         3fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689033764; x=1691625764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1w9yY+8SJhlthUMjNjEuOabsBHcswYGEE9IOl91tE7U=;
        b=EPHd7LPro3u7fIt1hZayMsEHflIgVnIZvj9bWtzww3DRU9RJNRzSyotw183Hu24EuF
         Tg7iFBTB9m1oheSoJG5JH4l4nuiPkdtEpOuLtRhBFFkAyTPghRQ0yD6yevYgPta2cON8
         61vJ75amxRwxoAgNTzanMPBltnRfq1rJ6QbYfyejbdxbNhNi9NjO+WJGhPTYjkiT1CGP
         YwAepuR0eXuhF3n9vekqnifvHHKSUjniWgy/S7kjfhL2YPZDR/RVwgn1c74tQNS97kdk
         dI+DXur/GR7TPBVRe/NV1EbeCHYXCYGvlMdueIg4do2+o4g+GqPQZkGhkd2Sq3tJJM+W
         tcpg==
X-Gm-Message-State: ABy/qLZPaYCv61Ilj+LHE2AYiTSOsJOEmQOiatI2Szq8GqIkAsdOFM40
        8nXWByJZWxFskZSWTHk4Xd1S6w==
X-Google-Smtp-Source: APBJJlF2aGhXsDEq8UI9+Fwzc8VwxH2xtVNNn2DRPsCOVB4FeKX3y1lpJ+okehUHP717ty1KSKJjLg==
X-Received: by 2002:a05:6512:693:b0:4f9:51b7:a19c with SMTP id t19-20020a056512069300b004f951b7a19cmr13092264lfe.19.1689033763612;
        Mon, 10 Jul 2023 17:02:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r12-20020a19ac4c000000b004f87893ce21sm91760lfc.3.2023.07.10.17.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 17:02:43 -0700 (PDT)
Message-ID: <1f991319-f276-1097-475a-7e95175cbf4f@linaro.org>
Date:   Tue, 11 Jul 2023 03:02:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Fix misleading comment
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20230630162043.79198-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230630162043.79198-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2023 19:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The range is actually len+1.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

