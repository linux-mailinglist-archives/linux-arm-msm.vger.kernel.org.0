Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E307F62556F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 09:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbiKKIhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 03:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbiKKIhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 03:37:03 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895E86315A
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 00:37:02 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j4so7414054lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 00:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rUBEcHbs/F0HT8odG0ezJDK7pXeDb8dy84o7pdHdqA=;
        b=fPuWjo9Oy0xjUyK5FX3r02t8rQPNZ35FMRT7PS1iux7AQ2LCdt4tgALNAC1MDXCjag
         ML9iPHR3DG/Af+w8cZwcrsL9SwyCWmBC46E7wmfD9Of+i2a0pn/4rowSm0H4YD+sd0X3
         jxXStxEsXGvbV7SNoX74MuQRZIlPjIL+5bYwGfvIQcVVO+dBOvZhyvmhAUb9U4HHL++v
         rs0+6A9Mwe7b25HtSh32FFyt+1/TAfrWykGiofRZRez77c9eYSouu1yCVIOwO97J50S1
         N73qDBBkH89PVc/B9oYfSBfM+SDhuOs4IGL1jh0Qk2G8EuC+shJRWuio19apynVjMDYv
         0dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rUBEcHbs/F0HT8odG0ezJDK7pXeDb8dy84o7pdHdqA=;
        b=sSID0gaRl6q6z3KjNx91Ax6iUzn7BXwGkAGB+OmGJ1sosFtUo6yw6uvubLEh2SNpt0
         mnfBqgsn4N3WD6uTDw9Tj7mxpGbFKIG1Wny2pVdJl+e6B/ZiQgxl4fudpW0820szAvhd
         nzwI8hVGnxZ9ANsxJDwoug1/+LM6J9yRfBwrBM7wcloc3RWuTT/5GNFweeCkIMxU7/Vo
         sOrN60GipnZa5nxqLid817DGZdph8tx7skNkiSbbbBsyDz7F7c031qFXX5dnW0FPoo28
         MNXxUHa7FY88ennGXyaIl354CR9fgJ36wdx49BqxaIAOzCY/pDx+bl+plqkuJWAAdxt2
         RqEg==
X-Gm-Message-State: ANoB5pkTFDQg/aiBVrofK54paOikTGeue6uneAyWc96a6O+GJX0i2xwM
        OiF5HzU1sAgLK8n+bkSkTlulgA==
X-Google-Smtp-Source: AA0mqf4qFhHk8uSIrPbd/RlUqh9/stHjBF8Qhw2dAKKjm6Fc2yhZKsq25Op3IUnJSftTA21vobdlBg==
X-Received: by 2002:a05:6512:298f:b0:4a4:5e83:e07d with SMTP id du15-20020a056512298f00b004a45e83e07dmr384605lfb.409.1668155820961;
        Fri, 11 Nov 2022 00:37:00 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id m21-20020a05651202f500b004b01305732bsm213360lfq.216.2022.11.11.00.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:36:59 -0800 (PST)
Message-ID: <3e313f07-4d14-bd49-d2d5-05165ee69b3a@linaro.org>
Date:   Fri, 11 Nov 2022 09:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/10] dt-bindings: interconnect: Add sm8350, sc8280xp
 and generic OSM L3 compatibles
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111032515.3460-1-quic_bjorande@quicinc.com>
 <20221111032515.3460-6-quic_bjorande@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111032515.3460-6-quic_bjorande@quicinc.com>
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

On 11/11/2022 04:25, Bjorn Andersson wrote:
> Add EPSS L3 compatibles for sm8350 and sc8280xp, but while at it also
> introduce generic compatible for both qcom,osm-l3 and qcom,epss-l3.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

