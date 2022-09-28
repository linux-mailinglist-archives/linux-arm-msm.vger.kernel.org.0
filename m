Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70C85ED713
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbiI1IEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbiI1IEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:04:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445961F0CF2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:04:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id d42so19283446lfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ff2Af8wnvNaIb1kySsnmT6w66901VaPZOtaBt+Ba+mM=;
        b=tkDy8FSZCKEACGMbv7TNH3//AgxXuPUehbKo2oEdC7czFQIZsXiR0OB1yGPI1xu7iO
         OlEPCc8H12dHF5AZSpen+fhrCznTwgX8IoguDH4u2HC2YfJbjvIoIMDkCS3uHG0WDzA0
         zkTLALGvnpX2M94zwy8EI+y9LO6tURmyHfkaYVKFaSKtlgucTUY1BjKAKP+sjHHKDWW0
         gE0xTbfihCHSKDf7hS1x4AmewrY6VcTKQQHg9oVE5mtp6CMI3naJ0Cg4CIyUSpoOWMzG
         6AnKbvvMmTXVAj/I9wopPRdTsTzuU9aLm4XsFxReQvz7ymq+ct9fkjpi9AniUWRBr92l
         1MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ff2Af8wnvNaIb1kySsnmT6w66901VaPZOtaBt+Ba+mM=;
        b=UCC7vyaekZx65YBRzXw0Vz4ui9W1aFkUuM/XJS5JKXyrsHmjIz+9io2GNlNo8NKkY+
         PquNy3AJtLumz8xvZkZX5xoN7B/kkcUG28dnk3EtWyl+1LFDp4dkcfZTfEMM844zhHyB
         qrazkzZOgaljZRlCnSSMeswY6eb66G7ViH/c3KasBksgrxLJlNglE9/O1+hp/aYEtNBT
         uzLDhzD004ChqTaZ7ODwpwJQsFv/Ak9cIUo4Zkl/u3+eEAg0pCRrVi5pClxdYPCZw84p
         RzuFN3is7tj7t+kciMEiNcbEa7bZa9muVRuk2pDI5R+De64WmVdwuiBBuxSrn2Fzv3qz
         Zv0Q==
X-Gm-Message-State: ACrzQf1mfRSpGQZlD0XMcQRXZ2fDSolYa/CymECmwuKHAUIWY4WUkDIi
        P4VKj2Har3iQPunA2NhoyJiF8g==
X-Google-Smtp-Source: AMsMyM5rommvOYkkGtKyw4ykIU1WW2BqQpPqHrUuLl3CWZJ+QMgMkInkDSaF57srd731r7uRyEUUYw==
X-Received: by 2002:a05:6512:12c8:b0:49b:8005:1d9d with SMTP id p8-20020a05651212c800b0049b80051d9dmr13437045lfg.489.1664352240358;
        Wed, 28 Sep 2022 01:04:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j15-20020a056512344f00b00499f9aaa9desm400083lfr.179.2022.09.28.01.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:03:59 -0700 (PDT)
Message-ID: <9cf8e03a-9ae1-8af9-f786-95931aa3fedb@linaro.org>
Date:   Wed, 28 Sep 2022 10:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: cp01-c1: use "okay" instead of "ok"
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927201415.1265191-1-robimarko@gmail.com>
 <20220927201415.1265191-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927201415.1265191-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 22:14, Robert Marko wrote:
> Use "okay" instead of "ok" in USB nodes as "ok" is deprecated.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

