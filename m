Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 484F45FB251
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 14:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiJKMVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 08:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJKMVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 08:21:04 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C66667C8C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 05:21:03 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id a24so525170qto.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBOAePam/DgpbvIZKnayxFMZARU8chc5AqDW1+FCM2I=;
        b=N2Av06SynhLlqyKUPYpU9sFyV4crCJw6JMcK0GqnNzX30nGGc6tVyt0kkE0weU8zFA
         iLWlFY9uSXUpUwb3eThXOsfKSMalCdPVF7+MlE6NMK9gjPwY0s+HeDOaHAwbg2ywugqT
         V59C/6Mo0/kULe+E0/wA9+xyWKDoaIji7r1UfXjDYZpgVqB/g7VxA1Raa1DDhf7vcak8
         nzFs6LYu3mmaFppBy/bN1pfPqwEolE1EPGDyd/77l0puJZ+iehIXeS+1hEOHZoi0P6ax
         J/mvcZ8reTIeVvxve7tBlE1ok2fcKg9S8Laoy8FqiD/v7tEhQN7JG7BCxaP7p6GGKi1x
         Rr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBOAePam/DgpbvIZKnayxFMZARU8chc5AqDW1+FCM2I=;
        b=i1jMOhbZ8utLbc4TZ+9RY9AgBHf1ZPV/Ze+DkFbbfmx6zfi72jo6LncPtprgr3jNme
         ZWGupZ/WPmrRUOKpcqAS4iNnfPyNeJzRbT41/Ks7Ty7tW6DzkA53hbMJiiCL7snRb9IT
         82btkSaHMgxI6vvUPTig33mdaZJq02WQKp2HRw8mR2sICfg3jm9oiq7GxSAlM5IG4dPY
         +Tc8E7WBcB1WoPKlUSKcmKXwBezWPZJ6sZ4IUsTQdE/5GWbK8vo2kuP/JY2s5z8smrmp
         3nlNfBt0DEu689HK7uXc8KIxIK+6yhFWECf2CZBjseY6PEUyg7oOgh0ZEPFo6gBDf3NQ
         89Fw==
X-Gm-Message-State: ACrzQf23fd9W1EDe6AYzqVjGh7ko67ecEflO+9GAXUtMbkS00nHEdVaS
        uv8rFtxrNEDJ7xOgaHeBn2JteA==
X-Google-Smtp-Source: AMsMyM7AJnOBQB/Gg2N3m8SMAoT0i2mFurtiGSL0hqFqd2bnOqwBX/9LST5A7m3icFJCBykX1lckwg==
X-Received: by 2002:a05:622a:13c6:b0:35b:a742:28ae with SMTP id p6-20020a05622a13c600b0035ba74228aemr18341931qtk.435.1665490862732;
        Tue, 11 Oct 2022 05:21:02 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a404800b006bc192d277csm13282700qko.10.2022.10.11.05.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:21:02 -0700 (PDT)
Message-ID: <a687cb53-2dc6-5dec-e083-f66c5f924924@linaro.org>
Date:   Tue, 11 Oct 2022 08:18:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: add xiaomi,sagit board based on
 msm8998 chip
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20221010154039.1144605-1-dsankouski@gmail.com>
 <20221010154039.1144605-2-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221010154039.1144605-2-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2022 11:40, Dzmitry Sankouski wrote:
> Add xiaomi,sagit board (Xiaomi Mi 6) binding.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

Really, you ignore it for the second time. You received feedback, so
implement it.

Best regards,
Krzysztof

