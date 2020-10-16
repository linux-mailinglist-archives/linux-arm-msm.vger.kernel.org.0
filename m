Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF492906AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 15:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408358AbgJPN57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 09:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395556AbgJPN56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 09:57:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A93C061755
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 06:57:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i1so3075263wro.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D+Oj1pj0xy3pRTG2tbwccw/BvWEVT+/elwc8Xpf2+ms=;
        b=DDXq+5dREgrKBdNS5zYxq9+ypSTjRgAp/ciRqn8b3/yWoQO2NQcZ3qiGzZihicFwzh
         OSKVorGcQ+Nw+fctsSOaK5KbLncywVTX6ZuiK7mYSElwllKamCMVemviNWnqq1mbVdtB
         zerN5dGDQTbe+ce2xHxE+2CB/JjMsaM/DyltB/GU9ugfzCxsKo75b1wnRifLtiv4w11p
         eAw2D0DRUadQ5veCRDIBh+upOxC6bBZG+rOz9YQOl6LAbreGYEdBfQm34Pe68SJzxNxv
         uoDOxmBUXzdEq3n9iM5hslW6fmLNP2BhjDJ3CjLd/ZbibEyBz/Nz/KVVV+rEm13xevMp
         6q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D+Oj1pj0xy3pRTG2tbwccw/BvWEVT+/elwc8Xpf2+ms=;
        b=F9E2c8MrmxkAAcNw+/QdR/UJo/dyuQMEWBwN0GWsToVBwXJCSomjPw5mk+K/aG0Yel
         ftBinh5YHE5Aey0izBcg+Ruv/go9dTijBXMzORgxFsxK9w2tlbJ+a8NuaQqhm/I5z6wr
         ckUTVKOh9a/OTrNYny81CFpj8O2LcewUbImLU6YYTc4gLRoXhCHdaPgcvTZmOo/44+f2
         fZnUPhXuRtmKLbLjhAbDMDY0zrFzsbjJ07zIpCKYJno28d0SDq+WNfrJEWQMv3sGpNny
         RSAypN6ED6zzA/5OSAcXNNVGva9yMcjPxGKjX4Kr+du7NWLeS1iOVA110EgQDd99XdgP
         iI2A==
X-Gm-Message-State: AOAM530HqHvZ6no1phm/qIt34VVq0Ronn/5Fm0C2DNa0NfnM9SO3CdYJ
        mnOZvY1tBevuogU0Cd6K+3Ry2Q==
X-Google-Smtp-Source: ABdhPJzQWk0tbOyCNjqeSDXRj8WMg9EHO3/jd1ZjGhTEY6ctOFAVVz4uMWlvIssusgBkeMNP4rmQsw==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4220816wrq.106.1602856675984;
        Fri, 16 Oct 2020 06:57:55 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u15sm2791368wml.21.2020.10.16.06.57.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2020 06:57:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] clk: qcom : add sm8250 LPASS GFM drivers
To:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
 <160263991247.310579.116180302037536226@swboyd.mtv.corp.google.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <19d0f252-924c-eece-0788-a24d9c7b9645@linaro.org>
Date:   Fri, 16 Oct 2020 14:57:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <160263991247.310579.116180302037536226@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

thanks Stephen,

On 14/10/2020 02:45, Stephen Boyd wrote:
>> Changes since v1:
>>   -removed unnecessary Kconfig dependencies
>>   - cleaned up header includes.
>>   - moved to using pm_clk
>>   - Moved to right place in Makefile
>>   - moved to use module_platform_driver instead of builtin_platform_driver
>>   - add null check for of_device_get_match_data
>>
>> verified dt_binding_check to pass on linux nexthttps://paste.ubuntu.com/p/6nVzjRwvsW/
> Rob's bot complained again. Can you run with

Yes, I think the bot is probably checking against linus master branch.
Now the dependent patches are merged in master.
dt_binding_check passes, I will send v3 with the suggested changes!


--srini

> 
>    make DT_SCHEMA_FILES=<path to schema file.yaml> dt_binding_check
> 
> and make sure the schema is up to date?
