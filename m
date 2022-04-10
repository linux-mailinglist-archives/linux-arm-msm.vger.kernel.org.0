Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3FB4FAFA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 21:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbiDJTLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 15:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238402AbiDJTLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 15:11:09 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C66B4AE01
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 12:08:57 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lc2so6301017ejb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XSRApg9IR7P1yOuPuXccR/XxPYV0hJjjv9COC3DCs2w=;
        b=gD4HEgJVO8hmiFVbGAQysypvkSRzGCUR9t7r+M57Y2gt1+PTdnamNGp0CIZPhbWLv5
         VbtqhCk5iTVveJNEcsaQK6Sa4wZN0nDiuL0Sgj2s8/o4ool7db/4//Bi00nfAwxUMqUd
         vRSb1Dq7e4igf2BEIw0R2TssaDak4kELgNHwScRedIBOvhb+r3mKoCRZUb1/INmnVc0o
         Bnd1dFoP8AyLscV0MojQVu29RyLMR5QnL3d2PVKsuH9lvGQBXn3fOFfZ8/qm3xY+td4x
         N5u2Jtr5vuXzEOpxpc/Jwybvsr28+Sf+es/fDR3geddQXCd0ZdpxxH9oZcMDI8BsSs22
         9tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XSRApg9IR7P1yOuPuXccR/XxPYV0hJjjv9COC3DCs2w=;
        b=xpWHtoIphYMuGpofjcJm+3DFJmgMkT+ufPRSbLy/+oEqFMukGaHM8Lrrd0FWhi8wAL
         SDUGKWtlFo3QNZlpO6lCkvEvI5z2PurDcwBPLN6VGiiuhd9dyimw/MrizPw7ZS+yFjia
         BmAKS+LUJudgmXetQoAO2NIG0nNxhlE54pablVervAAA8qfD76CIi5P7armpq6E5xjj2
         BR/q2T5Qkzo4Dzhfoj2zegx8AuUZLcN5P3naX7+Duzt449HATcjO9ryicBe0rDYA8ML1
         Mqc+qIyEQKbIJcv/cYw7xRCDaPJChyRGcRuYuRCpLCC13lnxqgt05HbmpOG3x+lRquYM
         aqPw==
X-Gm-Message-State: AOAM531qjnydG+YIetSkp7zorIzj+S1yz5z1nCOzAhnK/VDm7XrwZ9Eo
        DepPa3re6DExFks4WuLo4CFNfg==
X-Google-Smtp-Source: ABdhPJxS5Z72rfWBis4EqLrmElBuNi6+wCk7GpZfSiHKQmznR5vz5Q2bm07somcPts8JKDH/6m/1aw==
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id q24-20020a1709064cd800b006db0372c4bamr26475128ejt.57.1649617735574;
        Sun, 10 Apr 2022 12:08:55 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm13773231edt.34.2022.04.10.12.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 12:08:54 -0700 (PDT)
Message-ID: <f3736e95-a712-50cd-1cbe-83ced609cd4c@linaro.org>
Date:   Sun, 10 Apr 2022 21:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/6] ARM: dts: qcom: apq8064: User generic node name
 for DMA
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220410175056.79330-1-singh.kuldeep87k@gmail.com>
 <20220410175056.79330-2-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220410175056.79330-2-singh.kuldeep87k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/04/2022 19:50, Kuldeep Singh wrote:
> Qcom BAM DT spec expects generic DMA controller node name as
> "dma-controller" to enable validations.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

All arm changes could be one commit, it's a lot of churn for just name
renaming, but anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
