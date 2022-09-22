Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E7F5E6253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 14:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbiIVM1g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 08:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbiIVM1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 08:27:34 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982DBE6A12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:27:33 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h3so10817357lja.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7ccFSo0Mw9hv51nZ/WTVP/yv8+hP69R+o0QItp6lmgQ=;
        b=CdL4nsoD2ng5Sy28Ql5tfq4y3lZ7rR9unzjVJQnu55s2S1UIEOWAhKCidOVKOR8EJa
         BMizmuYoeHjGSKlbeT4D0yMKOVdaDyKOFqubQXIPJTa5dgv0kT1S0BhrztckgNNNtlk9
         3MrBS2bdlm/ZptwrnnoQWe/KE3CTakCB/kK77bHcs+zQRB1BflakeV6JyRMzQdYv+2j7
         GFfxRKHiI75RAE4AiIV+TuDgiLfw2WQ96BpkNcxRxRikQnNcOsJa8iZ9F+9Y9LHyqCP4
         SEcTiBVNMBTFsvwP3PIDvos91XBITT5oG2M5onvhX3bFXkQG50McBGQr6l8RRE/TnmTS
         ljsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7ccFSo0Mw9hv51nZ/WTVP/yv8+hP69R+o0QItp6lmgQ=;
        b=Rx8K2rO/XKWky1ocuRfM5iXh+ASuktBEnLR2MjyxJWuRQfxSAzmkOMIQicExxZtomE
         yzQk35aez5GNj5FNH6mEAz18AJwiUfD5aIdZjWeGeWh7AhDYzcIav2thiNGTNkjXH4F/
         B3h+vhbo6q95fSGmQ9g8NxRTs6tJI7ByQEcTi5IwtjBEMEpvwI0iFrX2A7qJtRix5AuC
         kMWuXtGtGDyNAs/JN/cLZHN8Qa41kSYDtgOq4WzoqIBIFXPZATI2QIpaitUAYcxpHENO
         zUYefqfKPKNqftnC+wkPkUIsu6yl9nPMyN+u7bg+JVnbGPRnVan8zLGeNrh/pMw1vD6t
         JDRA==
X-Gm-Message-State: ACrzQf0UUIgTAjgbAfh88I5fHLj3DM07PUgrSrRTlmjD/0GWtyMV7Mlc
        +CB19+YKdOk28Nb0AZk+kAa11g==
X-Google-Smtp-Source: AMsMyM6rwPyNPWhgVCTudkXy3IDM/q3Uw7Y6qZ9D1YXsPxVo3MDiQalbiqy3OvcnVEC4ueIt2jIaBA==
X-Received: by 2002:a05:651c:194e:b0:26c:4f8f:8723 with SMTP id bs14-20020a05651c194e00b0026c4f8f8723mr964521ljb.140.1663849651959;
        Thu, 22 Sep 2022 05:27:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b004947555dbc2sm920601lfo.100.2022.09.22.05.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:27:31 -0700 (PDT)
Message-ID: <bc8efd08-3cc3-f41f-74cc-3aa92d5738aa@linaro.org>
Date:   Thu, 22 Sep 2022 14:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
 <CAA8EJpoZbNEiThZMaSCSML-x=TtXc8t8L-yvLZYDbR4hpvigXg@mail.gmail.com>
 <01baf27b-8257-aa08-d61f-a427c5056715@linaro.org>
 <126cd061-173d-62c1-a61d-06c191b13cb9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <126cd061-173d-62c1-a61d-06c191b13cb9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 13:47, Dmitry Baryshkov wrote:

>>>>
>>>> missing allOf
>>>
>>> Rob asked to remove this while reviewing v6 ([1]). And indeed the
>>> allOf's around a single $ref do not seem to be necessary
>>
>> He commented on one of properties, not top-level, maybe it is different
>> case for dtschema. In the past it was required, so are you sure
>> something changed in dtschema?
> 
> I do not know if something has changed or not. But judging from the fact 
> that unevaluatedProperties:false do not generate any warnings, the 
> referenced schema is processed and applied.

Hm, indeed looking at the dtschema code should be no difference between
ref and allOf-ref.

Best regards,
Krzysztof

