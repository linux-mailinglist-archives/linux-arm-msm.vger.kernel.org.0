Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3106F5E9184
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 09:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiIYHrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 03:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiIYHrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 03:47:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA29371B4
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 00:47:01 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a8so6373158lff.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IqTYUttp9fReFBo4Q6fCWj5y3UNld99XW4zScIAoz5g=;
        b=jtkTBfZ4MxDYpQ+w+N9ZVw60L4P1+O2El3APHzeCD9adF309Z8MbaLxB45Q+Js/vUl
         yS1IOS1F7uRIZPcmry6p2qTRhqLFCIEsaDh6eoqKTPK3hcDvf/eVklA7ZjwbbYGKRf60
         6GmwAr6JuYBFWV5MUbMk2yoOP6QZAdzjUk43ym0DoJPN5PfoCpPJBDTk8eRyyIt71K3X
         w/DLzaMC/XKpGPkKwidtoDUE51k9CzkuPrYI+KTnjP+wvlbwgnRvw/iCWGziU4I87ylq
         S8UG7TRrLmpeEYATPuPeyECjgMzyrThP6oWuRVT2fNeBaxHIoOP5UzKmd/fcsK/pOnfq
         JKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IqTYUttp9fReFBo4Q6fCWj5y3UNld99XW4zScIAoz5g=;
        b=z/v61XjJi0nv1ZODDxE5VrIvo+Xxjny3h3LZe8r3EObU5G6hig9V2B9c9iymqBsM1/
         f5zFDbb1E3k5igCZTgPaSq2ttAbLAFUaX2RGp1Y4X7tf1Q+0GgUshKNGlvM8Dw6B4Vt8
         7am3M6w+ElozjZovdfKS2s8GDLuY+YpaULym/mSkHb3ruJDX3vXKtNg5anXa/Owd/Nez
         YdBxD7VS17l+3x/QSNR9N2MGnlc+wPUOGq9KJKrsiKxrdF2DG5HKtYfufFH4p0LAVLEl
         5xL5NZ5cFNAUn9i9hCpGgywvCzugl9TfcLVj96Hq8+hiylFc3ubKNhVzARoNUB0ygAeE
         qqLw==
X-Gm-Message-State: ACrzQf2Q+HxZhctCpLEmMAjrBtYUozshGrX23kFk08rhOo57rcit/j9f
        fmrSJV7cOC0tlUWM0M7WZu/rqg==
X-Google-Smtp-Source: AMsMyM4T57GirHiC3ezKRkXiCLFXVFvPN1348MhCGX7DSVE0hJA3Y1lQouWYBSor0mRzUs7czw3T+A==
X-Received: by 2002:a05:6512:3986:b0:49f:480f:c9d5 with SMTP id j6-20020a056512398600b0049f480fc9d5mr6140605lfu.445.1664092020016;
        Sun, 25 Sep 2022 00:47:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm2135038lfd.29.2022.09.25.00.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 00:46:59 -0700 (PDT)
Message-ID: <c83700ef-c653-b155-c3f4-e44f3b80e6ee@linaro.org>
Date:   Sun, 25 Sep 2022 09:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
 <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
 <f6ed6e44-ab28-9f13-4193-517eef0edea1@linaro.org>
 <3a14c5a3-e4f2-a89d-815b-8923d1d189c1@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3a14c5a3-e4f2-a89d-815b-8923d1d189c1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:15, Dmitry Baryshkov wrote:
> On 24/09/2022 12:12, Krzysztof Kozlowski wrote:
>> On 24/09/2022 10:51, Dmitry Baryshkov wrote:
>>> From: Loic Poulain <loic.poulain@linaro.org>
>>>
>>> QCM2290 platform uses the 14nm DSI PHY driver.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> [DB: changed compat to follow the agreed scheme]
>>
>> Bjorn asked to keep consistency in other case:
>> https://lore.kernel.org/all/20220829210408.gxbv6szxfwiiwrbv@builder.lan/
> 
> Ack. Should I use qcom,dsi-phy-14nm-2290 or qcom,dsi-phy-14nm-qcm2290?

Ugh, no clue, but existing pattern would indicate without qcm.


Best regards,
Krzysztof

