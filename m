Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542466669B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 04:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbjALDmj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 22:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbjALDmh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 22:42:37 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD00244352
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 19:42:36 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bf43so26578074lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 19:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLHtoE959u40G0xbX28KrB8L8Do3FTdLcmezZ+Ohpr8=;
        b=YpauyFYgXE4dRDmivNFp/j2H4FoZtQkEFypYGteVIZ2dMLikBrHLjmTkAae4+PLlWg
         +URvMWTOiZNnIhBoBb8E+XemGxzDOMd8QFlg5YXQFQkL/20Eubtu8MK/mHfHVH9mVUTm
         lkaAmXvrD+wN4YqYIStIPe6MMVHDYPXPgpBBKUTBL4SgKZG4aThbi/HPlEiwZivM1YOJ
         RFt4IVrY6x8P05m+hbN8xKPrQgva4UaZ0Y08qrkuaHUAJy5QT6NTTV3fYBWK4iFzxKak
         3atssbaNGxv42pnWPaDDh5OKHiKDj1bPlNUS0qvCPsOyS8BlYXWWY/lniu2y24XhThMx
         it4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLHtoE959u40G0xbX28KrB8L8Do3FTdLcmezZ+Ohpr8=;
        b=RKvrtzvplUGv6J55Ap2ttYlFl895gFNjuo5isCxJZ/TaUAe9YR2rEGxijTx8XUkhFO
         afFhuOVA0dx0lAt5uLRmOUKTf0yFwrgJBNnKnvhTOi7kqjJK2Qgl5LY9OOMaOQXRSbTk
         j299cEr0Ey6fzwnqODVjZCzO6xovipfpWHMSUei7DpxWz1MDadM/4pmfC33U9tLXLN+K
         iK9Tg4nGLpR1usqWjJwwkt2/37/DZR+DfprdEyBj0C5tcKDJhuSFL4XLcbGnihOPfIKl
         XPz5ct1vM79WOaNNKCJjidC0DNQIge34+2E0mUbNBzPXH3n92a2U1TqAzbch/3jLbBrr
         Fw3w==
X-Gm-Message-State: AFqh2kqJvZzBvc7np4lHbd93GMxvy72nxJZ4JokGLd44OBvEKSEZ1oyj
        EIuj9daW/Wbokt5IAJ2/vJULKIAtER5GI8bA
X-Google-Smtp-Source: AMrXdXuAjlLyWrwlXPju1jhRFwVMDKZBuI77Lkwtin61RZmeiNOZGX9nHS19HZduB4tcQ9jqucCMDw==
X-Received: by 2002:a05:6512:6d6:b0:4a4:68b9:609b with SMTP id u22-20020a05651206d600b004a468b9609bmr25117729lff.38.1673494955164;
        Wed, 11 Jan 2023 19:42:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b004a4731f75a5sm3033409lfr.250.2023.01.11.19.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 19:42:34 -0800 (PST)
Message-ID: <c3265c78-7ea7-04ab-13e4-65f79fbf9cd0@linaro.org>
Date:   Thu, 12 Jan 2023 05:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/dpu: Remove some unused variables
Content-Language: en-GB
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        robdclark@gmail.com
Cc:     quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230112033823.24901-1-jiapeng.chong@linux.alibaba.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112033823.24901-1-jiapeng.chong@linux.alibaba.com>
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

On 12/01/2023 05:38, Jiapeng Chong wrote:
> Variables 'sc8280xp_regdma' and 'sm8350_regdma' are defined in the
> dpu_hw_catalog.c file, but not used elsewhere, so remove these unused
> variables.
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2029:37: warning: unused variable 'sc8280xp_regdma'.
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2053:37: warning: unused variable 'sm8350_regdma'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3722
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 16 ----------------
>   1 file changed, 16 deletions(-)

NAK, the patch should change catalog entries to use correct regdma 
entries instead of deleting them.

-- 
With best wishes
Dmitry

