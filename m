Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7DE60786A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 15:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiJUNaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 09:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbiJUNaI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 09:30:08 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EF54448E
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 06:29:48 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id x13so1955041qkg.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgmt7nX6KnPzXNdpGQ1k+hkZnzm82SWjZ6hn9mW6e3c=;
        b=xr+TMhCKaZJAadtHo5DyF6AA9DgxE3djgXCTUSuVRQVI99HB05PRFlUK7JbxsDdB9U
         KWOGNVGcw/Aam6KS0Ozgrike/GSKkTvE5HAlwusw/kP2BuzaY4HUm0jmRMDnY0Poaab0
         a8HC756E50eZYCC5Vozd6ptbzZ9HjvebIZB3nloY20qNVskfJ9v54c1t5eX/PZrVNiI/
         Wspo+nzsVyDKmTZ7KkymlIW27d5rWGFonjmyN7AgnX/q8TScevKtJIM71k0L5L+759uY
         k87KqkidWvfogd1eNR9aeYfHeFSoR/u900Trg+ZXidttiBRSI3V57z8+tMkKh/izeSb6
         7l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgmt7nX6KnPzXNdpGQ1k+hkZnzm82SWjZ6hn9mW6e3c=;
        b=YdcPepYxd25o/OaPK+oZHIVQKo+EUmOdicZFTWTrpNfs94hqqPYDy8geOtYqnyLiw+
         u+c4P5YdWJRUbBQ5gKbVKCJqaGT57BiqPp+q+GdGPKjMPTnwB4CgOIXc8wKaJQi/uR3H
         ECBu2VFB4bgUWht4EYcSpYhkYCsQxEbNSMXOi8QziYg1VixmgmS79gaCZtYrS3SwV1w5
         reMeOgg8RywWox3F2K8MMLBLivdktvVL+znnwJxHBzz2EX79DJOkPAMyRB9anwZ7IZyq
         4zz3EfVVgOzoucy32f6lNotB82qMKQzUvKDzLEttK2AVeBtnsHXnpZzxn7nV6kuCaH2t
         MRlA==
X-Gm-Message-State: ACrzQf3sXBsm+WhKwOsq/ha1Q+n0GkpFH2Dp7DP7AkzK2U84KQ2JuAxF
        Qa1s9UhqHhKrOelmA4Wo3mTJIRfI90GhqA==
X-Google-Smtp-Source: AMsMyM4+fNbWa8PnJwC+vhPTrYPkrSEaC9qcEkdYKxP2CS6JIj+Y1IzK+0h04dZ17WcWzPrz0ZR7hg==
X-Received: by 2002:a05:620a:12fb:b0:6ee:79f2:3716 with SMTP id f27-20020a05620a12fb00b006ee79f23716mr13688432qkl.348.1666358986973;
        Fri, 21 Oct 2022 06:29:46 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id hf8-20020a05622a608800b0039cbbcc7da8sm7837080qtb.7.2022.10.21.06.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 06:29:46 -0700 (PDT)
Message-ID: <e13c5fc4-c631-fbb5-f3cf-a8e569fbd752@linaro.org>
Date:   Fri, 21 Oct 2022 09:29:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,ipq6018: replace maintainer
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220924081312.15068-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdbvo5vyqpfP3EJvFRhK1hzq4uH=vzoq-H6q6hwJ0Bkc4w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbvo5vyqpfP3EJvFRhK1hzq4uH=vzoq-H6q6hwJ0Bkc4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/10/2022 04:09, Linus Walleij wrote:
> On Sat, Sep 24, 2022 at 10:13 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>>  maintainers:
>> -  - Sricharan R <sricharan@codeaurora.org>
>> +  - Bjorn Andersson <andersson@kernel.org>
> 
> This is fine, but what about adding yourself as co-maintainer on *all*
> Qualcomm bindings? I think it would offload Bjorn a bit. Just a suggestion.

It's up to Bjorn, if he wants to make it more official. I just added
myself to Qualcomm pinctrl ones, because I spent some time to understand
them. Actually I could do the same for the Qualcomm remote-proc bindings
(SMD, Glink) as some days ago I was refactoring them as well.

I am anyway getting all such patches as a DT bindings maintainer.

Best regards,
Krzysztof

