Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBBC5F77F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Oct 2022 14:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJGM24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Oct 2022 08:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJGM2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Oct 2022 08:28:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B68AA35B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Oct 2022 05:28:54 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a29so7102378lfo.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Oct 2022 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AaaH4Hzpc+BWxzk2RGTWufBjtoYuA+LOvqpi3Lw3mMY=;
        b=JimTXh/0MZ1L5q5YlKnUBaL7g2yVNCqJFefLV7S7pBS22G1gGhIph68C0apbMB8qQq
         jWqj7S4q9PcZhvdwMvBaGwifdZ0usoCgy6COmg6zABI77dNCUKLne9z9trZUaAkcUpFy
         HJwVVByGoPIH5JLUTc4lhcJnDZdqvzC/OKRy2YgHI+jyrDXUAHHTeow3Yh/6rBq9kswm
         1ygzt+2T1ghghERjhYUybteaZJJ8qQWF1LbLKJT7+X7xd7bu2oMJ9hw2puw3Qybgqvzc
         8/5k3GIXazHdOqfFMa1SKgWKhvlBvzWr5D8Xwc+1kciMKNBEH3VGtWAOoeGhJv342AHY
         /FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaaH4Hzpc+BWxzk2RGTWufBjtoYuA+LOvqpi3Lw3mMY=;
        b=OSC9EW2NAATvhJYkKkMRUp6Sol6Wa6ocWSJSv7l7cCyIrRtF9LowqPQS/CRdWbL+vz
         02IV2rdwMIfdCSvxvZ2kTq/6ZE9D7DcC9cYYM2ZmPI9saFGcsvXUgiPwI398YH8hjDuA
         03OHaj1hC15V7oFureX/JXoPDauMKSuoId1ml/6x9N6lti43wS4Mbc/UexCJTT96sBC3
         ZCizYoyCFKSg2v7CtLwN5/xP/Z3/K2uMx2q0+ppOEmL+kJvGuXqPO32qm/RrE0Is44gT
         5zU8YE2ZUGkvUji9r9VGovAfs7zlM8ir8tK9ZrTNIwhHxl8jrhCJv+CN1yyq52+XbYD6
         bSBA==
X-Gm-Message-State: ACrzQf3AHlre4HMPnjJQovTHewSjvmnS0fc9ZexBm8jGvLjgLbmPjyYf
        sig6Yx9wbQPgLa2Tif0x67aFKPRMTSdCqQ==
X-Google-Smtp-Source: AMsMyM7mciDeK4YJsQJNGOMn8IAMb4ygr5ZASg/buDnVtEEy6/BWFjR4RTN1izCeik5DNvsqVlPFWg==
X-Received: by 2002:ac2:5a44:0:b0:4a2:5c3d:d68c with SMTP id r4-20020ac25a44000000b004a25c3dd68cmr1649669lfn.347.1665145732626;
        Fri, 07 Oct 2022 05:28:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z18-20020a05651c11d200b0026c0f6be5dasm244298ljo.116.2022.10.07.05.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:28:51 -0700 (PDT)
Message-ID: <5847d571-34d8-0af0-300b-019e6a628d6b@linaro.org>
Date:   Fri, 7 Oct 2022 14:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: add sc8280xp binding
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221007121110.5432-1-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007121110.5432-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2022 14:11, Johan Hovold wrote:
> Add a binding for the SC8280XP TCSR.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

