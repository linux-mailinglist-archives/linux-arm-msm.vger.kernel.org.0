Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E173B73A876
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 20:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjFVSoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 14:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjFVSob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 14:44:31 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E0C1FFC
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:44:30 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b455855fb2so105603071fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687459468; x=1690051468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCOpIHvG88TbyiREhYBT44GXhfDt0FfqT5yfIjW1YVY=;
        b=BsY3UPDWemFdQwlJktCluyp/cMLJDFb9RmtdioV5u5JvFc+eZIC1CgJIrMW4++UJKE
         kqH5pseepvVK5XZCD7W7gHTZrK/QBGY+WpZTQG40dDdUKN8OQEM3LjutV6xgU++Mr0o2
         2Y6Cb6riBHiX0AgIxRIzDM1V1OcpHk9buoTZ7jfPuXM5gt1sn0GNo9OEco5crU+qa320
         zGOnt9bw3Z5IamKTErOluJBOT32+WdygHb737nJSL5ynyDn8Hh79qJJcNSuvVVWRRZMQ
         7xxP+yB1uLOkXurJXV0zD9ii1h4vK5cHS2vgn/alq6jc+agSpR+rtAQSGXfg8irwm39a
         lyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687459468; x=1690051468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCOpIHvG88TbyiREhYBT44GXhfDt0FfqT5yfIjW1YVY=;
        b=OGSZaBgrvDu82vmWUu3cbax7bNsgtLS4zboKtGW8G9Bt0/dlmX0+0/5cBOkuQE1aKy
         acw/ZvNA5kOjcl86wkIN19Hd1NVnJ2kc7J0IM2wpei8a+LnWe2gWDn08+1/71Piuyaug
         6n4zL3fNlVAEM/UvteaPyxw9RsUucgnvG4xB1PetduVRxnGIaNfW920ln/QXlhO3/iOo
         kRGVZPNVq9fAoPIUCleoUBgAEP1vkfBwkTMyuAgRKykAwVMK5/jFIMgGpB962uwyrIj7
         wot0/WrCoR1HhS26me8UOjftYrtrI462uY48Wt4tcMPqCBGiLxPfhsfNsByNaWJRGdiL
         J+Iw==
X-Gm-Message-State: AC+VfDw5BZXoLpQFJAuTr6DCSQY060vu0h9K2J5y/0lDj2dz4Gj7m/qS
        18Ik0GiViLgfOg+Bv3S2mQGIBw==
X-Google-Smtp-Source: ACHHUZ6CVk4iw0BJSVcXeJDQSXiTxAwizB/vtHdoAOZ5FZ0PaQHluOApefAgx0FUqCAc9OATseGHyQ==
X-Received: by 2002:ac2:5b1e:0:b0:4f8:5d15:99e5 with SMTP id v30-20020ac25b1e000000b004f85d1599e5mr2143376lfn.32.1687459468465;
        Thu, 22 Jun 2023 11:44:28 -0700 (PDT)
Received: from [10.2.145.31] ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004efe73ee01fsm1193566lfd.306.2023.06.22.11.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 11:44:27 -0700 (PDT)
Message-ID: <b0460532-b5f1-7efc-49af-8d4feecc1085@linaro.org>
Date:   Thu, 22 Jun 2023 21:44:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/adreno: Add missing MODULE_FIRMWARE macros
Content-Language: en-GB
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        joel@joelfernandes.org, johan+linaro@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
        quic_akhilpo@quicinc.com, ribalda@chromium.org,
        robdclark@gmail.com, sean@poorly.run
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
 <20230620054031.1203960-1-juerg.haefliger@canonical.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620054031.1203960-1-juerg.haefliger@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2023 08:40, Juerg Haefliger wrote:
> The driver references some firmware files that don't have corresponding
> MODULE_FIRMWARE macros and thus won't be listed via modinfo. Fix that.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> ---
> v2:
>    - Drop addition and removal of zap files (needs more discussion)
>    - Add new a690_gmu.bin
>    - Update commit subject and message accordingly
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

