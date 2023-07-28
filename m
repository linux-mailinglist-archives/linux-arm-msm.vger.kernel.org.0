Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44AF767078
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 17:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237343AbjG1PZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 11:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237206AbjG1PZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 11:25:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7C235AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 08:25:25 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso24708465e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690557924; x=1691162724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p88Nz4aiaNVDn50m16T/KmFwj/8wZh1FcbIhem0oQa4=;
        b=qUrDN5dXvCPI9oi0VyQallvgjskKpeDxWvY1kJJXknZ/lZVxhjXZ7AywV/0e6wvPz5
         ozF9AnzZIeSv3gFUflvy7wacf/cqS9RLDEAcfiexTHVHdEC22PSxgUASZL4g9vowfOsC
         rNn/WsYIZrXI8WXh3sNQnBI8pLmuHXPwew4NZLjtdV/p+iB0MADg0kQ/I/sEiCwTiLiG
         fPCfUVOYeVVI4zBHD+yJ3SJtAg8QsC7RZhHOgAs5GzR1RoWjIJbFXZUGdJMdGp20BVpZ
         6tco+bCYOzDf2HdH3b1mHkG5zdjUV8f5RPOW3DsNvHF64EvK8HWgzAjpKZFw8/lTUKC4
         jBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690557924; x=1691162724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p88Nz4aiaNVDn50m16T/KmFwj/8wZh1FcbIhem0oQa4=;
        b=I7305B3yXGQWz9Px6Jpv7cA+2YV7rz7pYxBBL6l/EldEJhkm2QVIkqUauE2lzr6nlV
         gIqb11nHgJa/JFvoyg78LATU2E+64zcIBS4wrClyLIM2741FHO0Zl9LGTZ5Cn5CfUkdE
         gM1defox6tMyfdiYqbUJtQQpZ2GBrNifdAaZTIaSY/BoAEG0nxxZf22rfq9eqZiQtNeH
         DUMSpLzHdsgVPV4Cz3CGT8lPy0eDiAbS4YhVCOWd4/RTYdaStzbVdxS3Y8+hZ/l5Gczg
         Cgyk8dg/hlTT20Bug5q6HjgahTImlur64gsf53HRpx/k1/EA2N6ozMtXkdyBnPFZBCZR
         XbMA==
X-Gm-Message-State: ABy/qLZeNB0aNS7zBwUgC8uh3meNheiHElhTUr+hrWc1wYY8pW/90Ynh
        RnIGvVrSH9aZVD8YXS8eCc+gq2iF8tnWrumVpn8=
X-Google-Smtp-Source: APBJJlHY5Oa5Rvo7n/XhzdBMJCsn0Sy6qy0jwUz+QQHL4rc7cdrx+VTz8+bW1BNBNbAYEsCYbuyqOA==
X-Received: by 2002:a1c:f70e:0:b0:3fd:2e89:31bd with SMTP id v14-20020a1cf70e000000b003fd2e8931bdmr1866493wmh.14.1690557924072;
        Fri, 28 Jul 2023 08:25:24 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n5-20020a1c7205000000b003fe11148055sm1042224wmc.27.2023.07.28.08.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 08:25:23 -0700 (PDT)
Message-ID: <bbc22e71-d581-36c0-d5ac-24a2dc8d84fc@linaro.org>
Date:   Fri, 28 Jul 2023 16:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 33/33] iris: enable building of iris video driver
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     quic_dikshita@quicinc.com
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-34-git-send-email-quic_vgarodia@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1690550624-14642-34-git-send-email-quic_vgarodia@quicinc.com>
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

On 28/07/2023 14:23, Vikash Garodia wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> This adds iris driver Makefile and Kconfig, also changes
> v4l2 platform/qcom Makefile/Kconfig in order to
> enable compilation of the driver.

This is not a meaningfully bisectable patch.

It should go with the addition of the driver. Its good practice to break 
up incremental changes to a driver in a series but, I don't see why you 
really need to do that when adding a whole new driver.

Just

- Documentation
- Bindings
- Driver code

On the other hand if you were switching on IRIS in the default defconfig 
then that should be a separate patch.

If we were say adding inter-frame power-collapse to the existing venus 
as part of a series, then that makes sense as a standalone patch but IMO 
when adding a whole new driver, add it as one.

Its easier to read that way

---
bod
