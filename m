Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90895747DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237443AbiGNJKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236782AbiGNJKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:10:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FA222B16
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:10:35 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u13so1768702lfn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=T5OfZ3+PK9xXcnfzvOc+1s4iD7Hhfzcgc3sJb8baShU=;
        b=qAz4zkT3+B2hVfgd6m9jYDRM0x285oOBdYO36ZemeNLxHWLRBilmSLmZ1dTv5XGVni
         Wk2WCj6nr2JiSKcxXIiCrbUt9rY3RjLOW1+LhAj2w8vSyy8/6+zDI45Do4nZEcNbo6Ig
         d99Ki/INtDCdnWKoYry3+LtMgdWKTv4LmqyncFonUvehn2TghuvxQ/0sMkT/wqRxRnIN
         VCbV3sz/5SzK/jLTkr/r+sKNDdlZT+69pFzrV6iIz/wFCoB2aysGQ24qgBwpUnNLq26P
         0swiYm3jU+Ty6B93nXusVfXPoAkvajR9uUFEvh8YWvhde3MM3/Sk8MeRKGEGkGxfQ/rp
         gKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T5OfZ3+PK9xXcnfzvOc+1s4iD7Hhfzcgc3sJb8baShU=;
        b=T8Zzp3GGSpqv9Qa7yRHU6qpWVsVnuOy7tf1+1+X/g/SvyDxsB5NZQBUdkGJCo6yQzr
         Pff5VKhIlDoxi4VRG9yOPocop602wRQHuxdwbx9o1j4RXT5VzOpG23/QFAq5zd9e+fuQ
         GnAljNE2d1avVQM4i4fn/38qxRHpDeliaanWxp5Zh5+oRzvArg4foaHgcTutGp2jNkAR
         +yWDx4qS4yF7cOkkrQ5GgQ1rf14yfc8ZvW4QstCijpGSGngONRnXb/7vEha4ZY/otAmd
         EIxePR5uO7/yyDu8XuQ1YcTQ4swAzZFmdyErhofXK7U6nODzQRyYcu6+bw95K7RpeqFA
         +w4g==
X-Gm-Message-State: AJIora/XR7c96wMbKkrn0uQBqC2fWf6pqH1Xb8IgGY5MrdGG0G/4+Tt1
        4hNLOz2n1JFL0zHLSOiHI/4qEA==
X-Google-Smtp-Source: AGRyM1s8EmgOtkxZ0CcEKsdSJlgZWiaDLGQME86g+5SP1B6+Og/s3pUx+W+IypC1jLkq/Y5eV12IiQ==
X-Received: by 2002:a05:6512:3103:b0:489:cdd7:b360 with SMTP id n3-20020a056512310300b00489cdd7b360mr4700025lfb.111.1657789833411;
        Thu, 14 Jul 2022 02:10:33 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f5-20020a05651c03c500b0025a724f2935sm174964ljp.137.2022.07.14.02.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:10:32 -0700 (PDT)
Message-ID: <1b13f115-381d-9d50-d3da-590cebf68ca4@linaro.org>
Date:   Thu, 14 Jul 2022 11:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/30] dt-bindings: phy: qcom,msm8996-qmp-pcie: add
 missing child node schema
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-10-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-10-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 15:47, Johan Hovold wrote:
> Add the missing the description of the PHY-provider child nodes which
> were ignored when converting to DT schema.
> 
> Fixes: ccf51c1cedfd ("dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml")

To ease the backport all of fixes should either be independent
(preferred by some maintainers) or go to the beginning of the patchset.
I am fine with both.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Best regards,
Krzysztof
