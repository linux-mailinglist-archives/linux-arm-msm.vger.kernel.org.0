Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844BD61671B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 17:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiKBQIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 12:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbiKBQII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 12:08:08 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D4F2CC97
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 09:08:04 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z24so25669297ljn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0I/ROXPneInb/MGZ/Nkeqw8uPPG8K3m2UvjVJMSd+70=;
        b=DyRbaApygVrXJkd7rDhA17TXgTM8qZGDpV0ZixOzyhL+ihS++mbs2tMfh70u97VEyQ
         WsBXCvglwmSJp5likmQuSY9dR640qAqrf55JQUnG4QbgBeA7TM/NKo+3mCh4v2kPJ/2U
         XleqdzJkpJngIp8pZilmw9CKU2OSxMWSPu8BD95womQt147bfrADoJhJWPGmCBjxyN+l
         pPMmt9/l4aElNauCvyltO12mamCd6HOlpyXFaqn2/QvpZA/PjvkkzwE0Zw+B2SugbTYk
         pdYjWR0rocQnCPJU3gs6K2DHJcq5JjCi/u5NqBYaL88JDzIg1QDAGvFsod20obUw7t+C
         /hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0I/ROXPneInb/MGZ/Nkeqw8uPPG8K3m2UvjVJMSd+70=;
        b=RnTFazwzLwvSvqct1fLB8XNkt1OPsdknJlm117MHrXVopK0aTCuSjFHtQf0VgPUen/
         pmQuZURBJsAYTBmYFbYFdgH98Pow4YC/qvb490v0eM2bdYr5jmZhBwza298yvbm7WsKu
         E5F9x8JH0zHMdwJ/zn6IDAPqqf4odFWhpWS9hnWqSoGh4uKcYfkHIPxI8Cql2YPYGPFZ
         +WemW2GWajkhMP363pnfeLzhPmDP7+hRmRa5WEyIcu2urD8WDNvoYT2Yl4edAapcyOvV
         tAqAPME9Qjokj9OOD/QbnDVAt842l5roX5pSnEEvPduwuqbrXrZxTkWSvg4E5Ru0gyhu
         hvbQ==
X-Gm-Message-State: ACrzQf11Sucq4V/Q8X/3Zb0tdckA+ZtDApddVE3P9r6F6QlWUOamGPDt
        vmdB5ps9YzDbh74O/WtG7jKWHchog6y10NCD4q4=
X-Google-Smtp-Source: AMsMyM7eI3+VrOSND/7sen8ZMjN46C8wNN5N4+3XABwphMWhOTEit16bGY7lU052Pv/qcT+cOXqGtA==
X-Received: by 2002:a2e:a490:0:b0:277:e5b:ec07 with SMTP id h16-20020a2ea490000000b002770e5bec07mr10176814lji.371.1667405282393;
        Wed, 02 Nov 2022 09:08:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c7-20020a2e9d87000000b0026dcfc2bf4csm2221525ljj.57.2022.11.02.09.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 09:08:02 -0700 (PDT)
Message-ID: <ff01677d-b236-fa16-fde9-98cfe8a0722c@linaro.org>
Date:   Wed, 2 Nov 2022 19:08:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/msm: Add MSM_INFO_GET_FLAGS
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20220923173307.2429872-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220923173307.2429872-1-robdclark@gmail.com>
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

On 23/09/2022 20:33, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In some cases crosvm needs a way to query the cache flags to communicate
> them to the guest kernel for guest userspace mapping.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
>   include/uapi/drm/msm_drm.h    |  1 +
>   2 files changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

