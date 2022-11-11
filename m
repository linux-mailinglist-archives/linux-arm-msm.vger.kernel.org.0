Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B409D6254B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 08:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbiKKH40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 02:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiKKH4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 02:56:25 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA7A63CCF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 23:56:25 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id x21so3643957ljg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 23:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/Iu4CEI39UAfFhQsd226xNTRIuJLpZNpM7aahMWDJI=;
        b=YLAMmPR8XvFijVBooaEVEjc7fGWjM7VcDGaePHyH9FX1PSQZLq6gmxDD5xY/Zx6VUJ
         qMVwx7Rfswu9pwAofNTTULIiUVirrNtZ9iZU42OGoQqxZUkv/vwMVhkJBi5guLi+2v5C
         weUM/HZ4vSypxstT8j3HcjyTHmfI+hdfIkmQRJzsXS8ZO0eM4dNFdOiEAc9O+vHOt3xt
         iR8H4zytTyiUGJc/YiygBY4Kgp+RHMvcPi46xgX0oWRpTkvrNwIlR6fFxdOcUvhaVE9A
         fYoFuoJ0fFJ+iRrnQqhE9jHx8kM56MgxaDBIjTkrlcwrgkWVftYoSaIjjJVGOFrUEJ/A
         nhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/Iu4CEI39UAfFhQsd226xNTRIuJLpZNpM7aahMWDJI=;
        b=fl/34KaZyKxnZrsRKkt2T723pW4lgLlvsyXlrtGKrEOrZh4+Ff98Joggv7UyhMUtsF
         35tp94rzDrsp6RrB6vmCkJmVQhU57Xy9vFGlknsuk2vuGs3wPNsJDB3/F1MBuVKVJbgc
         RuCMmN0+UD3RKydTi+DG0VuJ9GTJpefxRp6WrG5YNaAmT97EEJkJL3qx7cU7xcO+SJGM
         eqVVtL9LQYfIq+oZDxAcVO3iVIz+3XA5eDVL0QkElrVAgTTEnt0dOadpt05xJLauVum6
         9JzOMp25cxOWZV6oppcBf/6qSu5quXfusQpCksJEnW46/TgTFXr5sR6pwsw3TTQIHnYS
         bUwQ==
X-Gm-Message-State: ANoB5pkpKw/zEVmlIUaxb2YtAjcQFa9zUFBouYADbJsbowm+uWWICrLi
        NnYDUNzKIIfHsAsZ4ajYg4c+Dg==
X-Google-Smtp-Source: AA0mqf4CXgp6RSjsayp7+lJEN8b658DQOYP1PwWFxEKDrjbMnsfX43KI8kyV2Q+vJJahTAHG9L8cQA==
X-Received: by 2002:a2e:908f:0:b0:277:328:affd with SMTP id l15-20020a2e908f000000b002770328affdmr283115ljg.517.1668153383421;
        Thu, 10 Nov 2022 23:56:23 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id b7-20020a0565120b8700b004a240eb0217sm199790lfv.251.2022.11.10.23.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 23:56:22 -0800 (PST)
Message-ID: <a187db7b-1f42-af79-f50d-3f71f378c010@linaro.org>
Date:   Fri, 11 Nov 2022 08:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
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
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <20221024164225.3236654-6-dmitry.baryshkov@linaro.org>
 <f72aeaa0-0c0a-86d9-0b9b-db3810c35fad@linaro.org>
 <b62e7239-0fef-e19c-5653-96f72b7b89b5@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b62e7239-0fef-e19c-5653-96f72b7b89b5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/11/2022 22:45, Dmitry Baryshkov wrote:
>>
>>> +  - reg
>>> +  - reg-names
>>> +  - power-domains
>>> +  - clocks
>>> +  - interrupts
>>> +  - interrupt-controller
>>> +  - iommus
>>> +  - ranges
>>
>> Keep the same order as in list of top-level properties.
> 
> But the order is the same.

Yes, you're right.


Best regards,
Krzysztof

