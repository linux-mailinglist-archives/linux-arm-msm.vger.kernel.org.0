Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D9267AD0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 09:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjAYI5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 03:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjAYI5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 03:57:33 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C232E0DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 00:57:32 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s3so21030974edd.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 00:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lmxQqERdosdUE2fxzJYEhYaofhSAz9nthhzlPDf27cw=;
        b=sP/NRdofbRhw+lw54z5SOsjCYN22rITO7UZcs08y9NexA4K9lUpvwQFSpczjitsLeX
         hvMYiMFo1cK9jpmV0LpD8EREXDVmhwtQLFUIIcGVQrHQZEe5u7kZ2dRn8rtnxLHAVWAM
         gRIfP6paLJye3V6H9GnOsPfirnzfnRMLyQeRegZRvWyf5Q9+HMVeplJK2PNdLntgG23m
         QV4piopaLKScDgD1rSZ7R4MbfW2icO2iEqpVSS+XBAWID9K/2vAb+DntiTxjlbtyXYob
         73/APXsEYIqWgVjOsW/e447xBKRPEURZGXsWV9CWyASwGCM49jZy5LuomXiwWH7DXDTC
         4YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmxQqERdosdUE2fxzJYEhYaofhSAz9nthhzlPDf27cw=;
        b=qMQmSlc62ecmvRjLuzh904BklnmcKYzBeEY8f1vT0kdHKJOWAXK3o8G6ahG5znP/BJ
         XiuIxPMn4N56XOrzA3VONiGkvRuZUo6bgXcCRjeG+TM8cU2j49Ow9BdQpZ1GTazugQie
         aq3UPY7Q7jAVZbjjNkkOW/697iJQHogmjbPxLm60N6EhIxf/qJnNxjzFsym09J8YbkhI
         gHPNjeUBcYCrdCPlkxJq5LhVTfdPgLp65hbCTaxb54YcMW7eNhDLw3Y6zrNDSgyDyWTB
         x5ADAqPl9DSx074GQdNisZ9sDNyFJZgH1VROyW0bxsln5o61sYwGCj8HWvanpn+DAyNp
         xEpw==
X-Gm-Message-State: AFqh2kpcKmd2HV+SaP9u68SeXMzxuLSGsVl+PlbLbLVuPseIB9fXn48x
        PeuJ/jWmnNC4zahckApfZxQe2Q==
X-Google-Smtp-Source: AMrXdXvs4kuLGkRAZ87/0sknTfaoDNKj85+ghuZZ0y2XfISSdytBQGv5en3Uei2qpe2tRdnj/gpqdA==
X-Received: by 2002:aa7:c619:0:b0:49e:6e34:c363 with SMTP id h25-20020aa7c619000000b0049e6e34c363mr24541338edq.35.1674637050888;
        Wed, 25 Jan 2023 00:57:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kt21-20020a170906aad500b0087132e779b3sm2036873ejb.224.2023.01.25.00.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 00:57:30 -0800 (PST)
Message-ID: <5626d229-1399-1d16-4fd6-9c5f2708b590@linaro.org>
Date:   Wed, 25 Jan 2023 10:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/7] RPMPD cleanup + parent PD
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
References: <20230125032728.611640-1-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230125032728.611640-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Konrad,

On 25/01/2023 05:27, Konrad Dybcio wrote:
> This series provides a big and necessary cleanup for RPMPD..
> Lots of redefined objects were trimmed as well as some stylistic
> and maintainability fixes have been made. Also, support for parent
> PD is added and put to use on SM6375 where VDDMX should be scaled
> together with VDDGX.

The idea is great, however the order of patches makes it a bit hard to 
review. Moving expanded macros causes git to match parts of the 
structures, making one wonder why _corner_ is suddenly changed to _lvl_.

I hate to suggest this, but it might be better to reorder the patches 
here (yes, I understand the pain it will cause).

I'd suggest the following order (based on my previous experience with 
clocks and icc cleanup):

- remove SoC names from PD defines
- sort RPMPD definitions
- make SoC arrays consistent
- expand the macros
- add parent PD support
- hook up VDDMX as a parent

> 
> Tested on SM6375.
> 
> Konrad Dybcio (7):
>    soc: qcom: rpmpd: Add parent PD support
>    soc: qcom: rpmpd: Expand #defines into structs
>    soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
>    soc: qcom: rpmpd: Remove SoC names from RPMPD names
>    soc: qcom: rpmpd: Remove useless comments
>    soc: qcom: rpmpd: Move all RPMPD definitions up and sort them by name
>    soc: qcom: rpmpd: Make bindings assignments consistent
> 
>   drivers/soc/qcom/rpmpd.c | 790 ++++++++++++++++++++++++++-------------
>   1 file changed, 522 insertions(+), 268 deletions(-)
> 

-- 
With best wishes
Dmitry

