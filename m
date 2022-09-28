Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0364D5EDE88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 16:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbiI1OOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 10:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbiI1OOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 10:14:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6292F390
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:14:52 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a3so20529206lfk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OTPmRt98xA3kHqeuFiou7zsehbKe+hz1Lsg8cgktI8o=;
        b=eI5zqZ9oj34395/K1AVbL/BpEEe+nM2dwo69rVgoNqazUG1qU3VSaaNeSoXAxY1/RV
         dUN/tDClhDq1K5yFurg93Lke3olHKxUihimISCxd2KiZA8tNqBGMKy8yZmLUADVvdR9W
         +cUHxcoWH9lmcDPYNHoQrhXHqztJqdpk5hbgdzf3lCJGW2Jdkt9jF7rEX1jtBrOmIOPk
         CbDBZpYFI/rkotKemeBGyrGmg8MjKwzQtkgi0bGzn4RbDvgtDSMMCVGcSgpFeUl7IbAL
         UwrtnhCZK9nN0d+FcLnGpCCQyabMJQ9yuSsqa1uymZkP+SiEZ4Qjf+PVFcLZECTzXIzR
         z7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OTPmRt98xA3kHqeuFiou7zsehbKe+hz1Lsg8cgktI8o=;
        b=5QYwhIsBD7FdMUTTKNGCzr4Q05fxa8P1LHhNgqzZB5x+u2ym7tFJm5PZqziMV5UF8x
         teGNLPU42SaWmofy6tlfMnBDyrklx+AbZZze+dcSQpofBJL5NWToj68wiLo5K7gRPCD2
         VuOePRlkTFNcWPc7fIxq/4pM/T3gAQK46oStOxAqDHNskvIEfFNAZCPMnmEPp/KfQfp9
         qNyDGDl2eN4dZSsdVV+MouRreoNm8s3NJX0lHCtdAiClc5W60wE8MHuAhwJs/eC1EQlO
         POWuk0U/TKOB3e2OjiiCWKxFhcNUgEgqmwQj9Vai4rqThbEZJbjYl0Z1ZrdaRo1+MkKS
         nWCw==
X-Gm-Message-State: ACrzQf3amENALbg/duIsB0W6qo8NSlHDZCBylFAKsoKhHvVlTw70BzlE
        PCW6//PPtqY1GtpCHb2MYXbQ/A==
X-Google-Smtp-Source: AMsMyM4Rd9kNIwum5szSAw6ZmVI6A0QszE+VdTWlDnD0Ivs7fHdME9wOBCJMfDBmxqT7cAOv2/8N1w==
X-Received: by 2002:a05:6512:3e17:b0:49d:9fd5:da61 with SMTP id i23-20020a0565123e1700b0049d9fd5da61mr14295963lfv.270.1664374490428;
        Wed, 28 Sep 2022 07:14:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t6-20020a19ad06000000b00498f32ae907sm487217lfc.95.2022.09.28.07.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 07:14:49 -0700 (PDT)
Message-ID: <1292244e-6e7f-4402-6418-add40772f5bc@linaro.org>
Date:   Wed, 28 Sep 2022 16:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: msm8916-samsung-j5: Use common
 device tree
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        devicetree@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>,
        Josef W Menad <JosefWMenad@protonmail.ch>,
        Markuss Broks <markuss.broks@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20220928110049.96047-1-linmengbo0689@protonmail.com>
 <20220928121717.102402-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928121717.102402-1-linmengbo0689@protonmail.com>
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

On 28/09/2022 14:19, Lin, Meng-Bo wrote:
> v2: Reword and resend. Split common dtsi patch.
> Add missing suffix state in pinctrl.
> 
> The smartphones below are using the MSM8916 SoC,
> which are released in 2015-2016:

Thanks for the changes. Do not attach further versions to some other
threads, because it messes up with our inboxes. Each patchset is a
separate thread.

Best regards,
Krzysztof

