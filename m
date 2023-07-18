Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59EA17573FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 08:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjGRGXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 02:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjGRGWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 02:22:55 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EB610C7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:22:49 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5216f44d881so5211633a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689661368; x=1692253368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaCAD2RFHD1/f8l8QgguLroNAuxMv7fX4CZEpia6OyE=;
        b=OdPOLdIjn+Ss0Zh3816RQNMU4XVw69+1WBXavPjn8M73d62+xfW9qFf/fybnEgp/ov
         ma/Y6EgJgzA0MJlOm9Wa1P7lueL99gKLg17QW1fqCwJwAgrIW20/plz8q4OX/rUGkvas
         z7kT8d/csWuf5s1rF7ca6u8kIrsDojJFWMTSJf8mDTHmjQ1VLkOLnNukRFiHx9OeCm2X
         dQUHFLWSJ2Adc3nY+8EGzb2iljZblO1HGHRk6ZATWPC2RaS4SwCxiiy7kZZ5C+lAZ4AC
         TzlryVAjGhmnx8NDzzBnWzYv6cYsvqWUTxm4Z5TxDlKsbB/bHbKKaxg8hf83Lrz5tiap
         /7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689661368; x=1692253368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaCAD2RFHD1/f8l8QgguLroNAuxMv7fX4CZEpia6OyE=;
        b=NoC7c7AjEuAPM0bYVN6Ot2XY58FiCqAWjdp+KpH0hybobBY0HSjJceHTE4rZmmGjlZ
         dfiV9shrf5yhziixU896PRFIpM45i4Y+1ruwouMn4mDCULN6qWaBxAGwwo90tc4SAfib
         ifzeG636UpnHIFLD/s08x6NfiGIWGE/drtSNnLdN9BrVQ+StvHSxJch7YLLfcdD8N/gt
         p5UZ2dAJd0QEVCkWytCFX6RNOSBW9Z6fmeuDQtm/IfvUkhiz0NRaH8tOsUrYwPki6nVn
         ilGBmCL3rQ/55qmPIZEigK/iv41Y6f3wdV99I/Rw7hnhQA/dAyshysOj5VH6e2VSQ6Bd
         F6gQ==
X-Gm-Message-State: ABy/qLa4mnUHMkbP7mJNrbj/d2KQsfdjZNNWQlWFgd4NhXyvYGXGX3Bf
        Vu4357Sut+MtgtOXwYv0NuM5zQ==
X-Google-Smtp-Source: APBJJlERbsW44KiGVECnZOWLQzo+ggoEelougNAtieJRx00obRFXnygLXlcSEMoxgkEM4BHnN2BSZQ==
X-Received: by 2002:aa7:d8d4:0:b0:51d:8ab1:5df4 with SMTP id k20-20020aa7d8d4000000b0051d8ab15df4mr12972330eds.21.1689661367886;
        Mon, 17 Jul 2023 23:22:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7df0f000000b005219de74217sm697424edy.43.2023.07.17.23.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:22:47 -0700 (PDT)
Message-ID: <1da4ef5f-c4b5-4415-c2c1-76f1ad7d06a3@linaro.org>
Date:   Tue, 18 Jul 2023 08:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 1/7] dt-bindings: mfd: qcom,tcsr: Add the compatible
 for SM6115
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org,
        stephan@gerhold.net
References: <20230718061052.1332993-1-bhupesh.sharma@linaro.org>
 <20230718061052.1332993-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718061052.1332993-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 08:10, Bhupesh Sharma wrote:
> Document the qcom,sm6115-tcsr compatible.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

