Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEB06595EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 08:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbiL3Hvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 02:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234524AbiL3Hvh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 02:51:37 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BCACD3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:51:36 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f34so30745624lfv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgR0zD0bNX9NZwJOWo6peYaWFZB7v3MfUoWFSr4OpXc=;
        b=OM5P2USJNCMmACe49nEBXl5f5iOZKN/R/kfY8BpDTOALOt+2JBwQQTs+gwsb7A5kuO
         2XvoUy2ry6BR183u/uR2TOp6Kas5U5ce74bWUpVkW3KqAtiiinRVU3kfe0/yWq6T6yUb
         dn0ePrebSHxkuedAKZ+gROOQGjL+Qno5p2D1kjOl3YzhdGrVDHW4gSeAUhU9SpXEL9lO
         JFqthR3SPyqB92t5xDNUrvPqbj21ybOFEJdu1xGIQCstbT/sD9oVZ7h6T04q2L+dkvg5
         Z8vcqriNra0gA5YPj/Jd3QUvbjf9QSttVjyV6YWHlD5DTKsRn4o46C+h6bYNxj0RaunI
         UARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgR0zD0bNX9NZwJOWo6peYaWFZB7v3MfUoWFSr4OpXc=;
        b=qEh+Bzd/1OF9dHYxXc3r4CWJkt51STyCpk53Kn+nPmEuM295vMe7uosoQ/I7k+VMF8
         vGs7fG5MOJLmoy3eZGGoVgdUAHj18ycCUGhaDvfuRfVkD9zyNIU0RF417AAOQ6NKsSQ9
         /VqBljHZt/hbeERKMQhxSsZxcLutBGMqgzIexL+/augQrxydGFEF+xNNnYmo/mVz4itS
         5R0Zs9lzfDGPp1ucZUij83QfZgdYlH9F0B9e1+yQrfw/YZ+r2mBhdFNg6h810z5oQy3C
         yUUxXkKZsKzDPHHHOqaZ73Uh5aVU3pkzqZyARzlqbXO+QGOEOC2cJE/ik3xwneW5A8ix
         YsUw==
X-Gm-Message-State: AFqh2kqiW/kAhlhoatlWsPIUrGChGXj0S1WPxEuTBG6XeRT+FKBhlHAZ
        7yWcQVpm8E3qQO2ssr0Dg5V4tLlyvU6qJnmC
X-Google-Smtp-Source: AMrXdXs1nWKNtBWARTnmhz5BAPjxDGXYYFcJitvnKNsRdXxDcKxke05eIQ81yBnz0sDZkhMPjJGeFA==
X-Received: by 2002:ac2:5e9d:0:b0:4cb:b47:7c9e with SMTP id b29-20020ac25e9d000000b004cb0b477c9emr3856729lfq.38.1672386695279;
        Thu, 29 Dec 2022 23:51:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a7-20020a056512200700b004cb08ec4c30sm1949738lfb.99.2022.12.29.23.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 23:51:34 -0800 (PST)
Message-ID: <444480df-f903-e492-0b9f-5ec63b17b5cf@linaro.org>
Date:   Fri, 30 Dec 2022 08:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] dt-bindings: interconnect: add sdm670
 interconnects
To:     Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>
References: <20221230001442.369608-1-mailingradian@gmail.com>
 <20221230001442.369608-2-mailingradian@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230001442.369608-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/12/2022 01:14, Richard Acayan wrote:
> There are controllable interconnects on Snapdragon 670. Add the
> compatible strings to the documentation and interconnect ID definitions.
> 
> The device tree header was generated by
> linux-interconnect-driver-generator and the copyright year was changed.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/interconnect/qcom,rpmh.yaml      |   8 ++
>  .../interconnect/qcom,sdm670-rpmh.h           | 136 ++++++++++++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/qcom,sdm670-rpmh.h


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

