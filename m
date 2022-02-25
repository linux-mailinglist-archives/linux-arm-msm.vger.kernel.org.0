Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D924C43C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 12:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240173AbiBYLjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 06:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiBYLjp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 06:39:45 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F711C2304
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 03:39:12 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d17so4012863wrc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cJpjB2Imjue5MPptrTSlFySfZuGIV+MLwnJNG0x4xvk=;
        b=Z/g5gebrnBL0zB3qUQxBoIDeTt3F4vtwqF9rDI2nw3EtZkKT76If1gWmUgufJ+TLxY
         6nTbIZ5+Z6EJ23+v+OaZF/xpJaY55g20UDoawIZrJoPGFbyoHjLEvYeapMmNZJBpveek
         PPY5VkkfZ2ubNqIbgxyIR9y8VRwVRM/VsejJ3NUYqeOzQLickh1WLs5mrJVE///Nqq1M
         xMJ1anI3wy9iQVFvee9ByunDawc/akfjPqmxYNnZoUTEW4HNsfNX0Okf8qIkcAWEe+sL
         oLhO+JbwaxV1HZ6qWgSOJH98lIp2moHlLGvi2bFis2JD+L6Shj+BPgsGSXB/6W0glas4
         xEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cJpjB2Imjue5MPptrTSlFySfZuGIV+MLwnJNG0x4xvk=;
        b=qbnalm07ANnynaitE7fMo6+bD+M+D/KiHvDArral8rxxReDSk/bkbPFnPgSlHIHsFZ
         2FBd7XfbcP6ZW0DDol5zjMmD46nnMQjzNUIlQ1PjknoRjAaT+dBROPzNJ9tEWHRMbqso
         TxrrnoAIlMM6N1njio1Aug4X8uny6FwPNYeB7LbXCc7146icEzesqWhqPiFuMwSEHiLa
         5SLCMEDGoRQNwqpWnaE4Ak3vPE8iWXMvFs8KM0pXRbMFMHOLn11XykSsY9ePXymTu8oV
         bnyNACi0wKpJUF7B1/C5F90BjYj4yiIxyHc9C0QXEi475vcqbd5Qdh7J+ZJbyCnK+QL9
         enYg==
X-Gm-Message-State: AOAM531H8eGaqWxW5u7isk7zpRDJdkgUO0w95pvoVVPoglivz5iRAKyX
        mYkrg99Hax8Lq9bofpDK+unnZg==
X-Google-Smtp-Source: ABdhPJwCoD9+ESaqpN1tOSsKHyjc28t7oN0/oVgThSxndsT7mPr0tLHxqG+bnGT+WRRmi7xjDZtBtw==
X-Received: by 2002:a5d:40cd:0:b0:1ee:a044:361f with SMTP id b13-20020a5d40cd000000b001eea044361fmr4479895wrq.235.1645789151291;
        Fri, 25 Feb 2022 03:39:11 -0800 (PST)
Received: from ?IPV6:2a01:e34:ed2f:f020:25a:d4d2:9383:c638? ([2a01:e34:ed2f:f020:25a:d4d2:9383:c638])
        by smtp.googlemail.com with ESMTPSA id c4-20020adfed84000000b001e5b8d5b8dasm3046083wro.36.2022.02.25.03.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 03:39:10 -0800 (PST)
Message-ID: <1aaf4f8f-d777-633a-a469-ebeee4f9704e@linaro.org>
Date:   Fri, 25 Feb 2022 12:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/10] dt-bindings: thermal: tsens: Add msm8953
 compatible
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220220201909.445468-1-luca@z3ntu.xyz>
 <20220220201909.445468-3-luca@z3ntu.xyz> <YhfmQFFCmb74dOvV@builder.lan>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <YhfmQFFCmb74dOvV@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/02/2022 21:10, Bjorn Andersson wrote:
> On Sun 20 Feb 14:18 CST 2022, Luca Weiss wrote:
> 
>> Document the compatible string for tsens found in msm8953.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Acked-by: Amit Kucheria <amitk@kernel.org>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Daniel, can you please pick this patch through your tree?

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
