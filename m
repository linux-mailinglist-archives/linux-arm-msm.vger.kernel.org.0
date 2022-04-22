Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA64B50BBA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 17:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449424AbiDVP2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 11:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448590AbiDVP2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 11:28:03 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C348765A
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 08:25:07 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id y10so17022922ejw.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=sa/EoVj7UXoDHkP3+ISFzh+OXFxyPRq9RG0BLiBl6eg=;
        b=hnD+E7YuymEsEN0uCt13UTly6lbaNaHlNGDgxZoQF6Xfs+pwqxOgf6vvEnBWYGXdM7
         dKdfK9LhCPQpZGhqdHt4WYTEk5ts7Zb3rhsmo72FeTBK3Sj2+MNsDyAsCKgXcJu+oUgD
         zsJVl2bniZZemVA2tO4GestXoYnAeXwsST3HEsV9/MscO3kJdbNnKLavvjPZORwpf1UT
         XjXbgQ7S8b9gb61KpNZnA3D7PVlF/7JwzCup63xsTJszS32zOoGnzSMhqnabE/swfCpH
         tZo/JMwTtWyBnuNpoq0h2IvAHRsOk7yGYR+NKRJdE88paV7aXSVn0yLzxMbWUj7ooOtL
         vB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sa/EoVj7UXoDHkP3+ISFzh+OXFxyPRq9RG0BLiBl6eg=;
        b=yUWSzFj1QGPhkRQrpqw9qJ6d+Kk/81dseFjQFT65cQMEilVIX2eH/Az6d6D81Qsto7
         BVuwzCCn4JCKqkQK440Uk7uZDIrEmo9xFY93QrUQmOfl2QwEU6YTenMtmQcQKNhUB6WS
         RzJRUPwlX0dEosYBIG0MLhqc7Kuh5PqsSVs/VLyR4A87rYBd1DnWlze9qNvRK4E9YB8f
         V1ts/fDlyQ53fXGW7cHIzvfXzi4+IMAj+v1M5qgXKJJtkMp00zNNzcjHPFg7Jf0okReR
         i/InJyZulSytIbPfHHlGurusL1pPDMPTaaoa1LSoCwX+D8CFiWIhEvt4pspt5R2/WDBN
         dsQQ==
X-Gm-Message-State: AOAM533rqQpaiKckFEYfQiGL21DTjT0vUkdbDnVuPWvbqw3irxTm5u9i
        TxCZpR22YXY8jSd/04EMfcNdhw==
X-Google-Smtp-Source: ABdhPJyvnxn5qAFZghz/3D1h2x9gZV4WrjtyW7sthE7LvdhGsrfG8iMZquBRE7UxfVek29yANr+GVg==
X-Received: by 2002:a17:907:8a20:b0:6f0:1e57:2dd1 with SMTP id sc32-20020a1709078a2000b006f01e572dd1mr4620592ejc.392.1650641105606;
        Fri, 22 Apr 2022 08:25:05 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cr10-20020a056402222a00b0041d918fdf99sm1008263edb.85.2022.04.22.08.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 08:25:05 -0700 (PDT)
Message-ID: <b96fd335-df13-6657-c2ff-38ff677555a4@linaro.org>
Date:   Fri, 22 Apr 2022 17:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] interconnect: qcom: constify qcom_icc_desc
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220412102623.227607-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220412102623.227607-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 12:26, Krzysztof Kozlowski wrote:
> struct qcom_icc_desc is not modified so it can be made const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/interconnect/qcom/msm8916.c |  6 +++---
>  drivers/interconnect/qcom/msm8939.c |  8 ++++----
>  drivers/interconnect/qcom/msm8974.c | 12 ++++++------
>  drivers/interconnect/qcom/qcm2290.c | 12 ++++++------
>  drivers/interconnect/qcom/qcs404.c  |  6 +++---
>  drivers/interconnect/qcom/sc7180.c  | 26 +++++++++++++-------------
>  drivers/interconnect/qcom/sc7280.c  | 24 ++++++++++++------------
>  drivers/interconnect/qcom/sdm660.c  | 12 ++++++------
>  drivers/interconnect/qcom/sm8150.c  | 22 +++++++++++-----------
>  drivers/interconnect/qcom/sm8250.c  | 22 +++++++++++-----------
>  drivers/interconnect/qcom/sm8350.c  | 20 ++++++++++----------
>  drivers/interconnect/qcom/sm8450.c  | 22 +++++++++++-----------

Hi folks,

Any comments here?

Best regards,
Krzysztof
