Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE205EA756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 15:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbiIZNb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 09:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235290AbiIZNbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 09:31:24 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5891DCC7B
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:54:28 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id p5so7095709ljc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Mn7BtO0CrR75wwHD6k8uIcJOsYMT6YL8yxp/m4Q8puQ=;
        b=wO8YP6TNZZoEtju7Dw0zWf3yBLCurwNYxWl6RG55tJ/VjElqS7W2G2asZzd9Qw9gJS
         2dakReW3g38wAY8RVcZmxnWEYNfvbjZcgMPfRKLsC2u34r05pATjTUED+wAsYgjhmjVi
         vMd4Sl70xy158KuXfXLih1p5RctuH/O0pmYf86+H0+Pr8U3p2pzS260jQr9K84v6p2RQ
         0UvKaxORwyfjIEh/7WacVePt7On5+h5hsrroXSVGxDpY3MI1A82Vu9lrc2YHt6mEUaZN
         Vfp9g1l0uJVJAInurNFDQ9S8KKc6Icgn/g0biNig1aN4yi+Uslblt2TKvExQAkD5/rcC
         F/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Mn7BtO0CrR75wwHD6k8uIcJOsYMT6YL8yxp/m4Q8puQ=;
        b=4OKp8NXWeH9O++qF1etZie1hfVbw7DEjoInMn+kZGSNt/Hi6fd0VT7nJL5z3IovE7l
         vxFIiqRGnFXcHkbuXn3fM3X2JwLzTQy36lPQOo2fZJ4SGQYP8EnBZbxEoFkMpiJqb/8b
         vvnaHdg79hcQcSGq6wRTACjGOM1TjhQTm33WsQy0CVXj9ko5k9biB5u0iOaIh7LdMwmf
         iWz9EhqFBfu8GaHsU3qsghKdpvB8UHaT4D6VIR0qp9hJcPgp9l4xjhybR3IhtShzWo9y
         SpK7lBxqMk5uFI2VYahW13j4DIhzHgn1lo9oxOp5fW+KMrL7lcu6IxiejEmXWf11w3r3
         Lsug==
X-Gm-Message-State: ACrzQf3aSx/42v7Xrj7wW9bIDv0Ye+CLZgty8IZCosG9vtjaUX9q/F9c
        Zym/ljLSMkQKxaSb5CNdTYyIRgoCIoauQA==
X-Google-Smtp-Source: AMsMyM7w99Hat5BiH38tnNlm0fceWMlGL7bmPq3hmcHc8k+/5IujyjhiEhQkKzF13BaWnd467/dXLg==
X-Received: by 2002:ac2:568a:0:b0:49a:1fe:64e2 with SMTP id 10-20020ac2568a000000b0049a01fe64e2mr9240626lfr.156.1664192163103;
        Mon, 26 Sep 2022 04:36:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bi33-20020a05651c232100b0026beeeafab7sm2353259ljb.94.2022.09.26.04.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 04:36:02 -0700 (PDT)
Message-ID: <816c1431-72cb-b73b-79b6-0eae3344eda2@linaro.org>
Date:   Mon, 26 Sep 2022 13:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5] dt-bindings: qcom: document preferred compatible
 naming
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20220720073326.19591-1-krzysztof.kozlowski@linaro.org>
 <7fdcff6a-9db9-a9d0-4013-7d3ff5fd5d8c@linaro.org>
 <CAA8EJprom=CfxPQke5JjZi0CSSvvB=cw1RxOO8StLThpASG3ew@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprom=CfxPQke5JjZi0CSSvvB=cw1RxOO8StLThpASG3ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2022 13:16, Dmitry Baryshkov wrote:
>>
>> This is waiting for two months. If you do not like it, please respond
>> with some comments.
> 
> I'd say, this is good, it documents what was agreed before.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Thanks. I will rebase and resend.

Best regards,
Krzysztof

