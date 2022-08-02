Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89ED3587D30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 15:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbiHBNe5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 09:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236212AbiHBNe4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 09:34:56 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6201A3BE
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 06:34:55 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z4so977557ljn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nNai4kk6GSyRg35ry6/3rcAAL8QUIwFfkg5aBxpvgRo=;
        b=s7haoVVb3TUIlA5nt6ol7cpgAQENhCjuDQnHQ2ZKUrQ9vEjoJdSfJHTDeKOMen1FI3
         L5oOh8tqTzvnLGqHsU09X30OXZpwxrldo1djzgFnJGhshODXlfzyD5K06YE9Br3iw9Bz
         7ozBKhIrBncj6MJKqg9K+8u/t79OE4MG02g8pHTSKJB17UMSJV/6EXa/h/NX6PzzNx3/
         uPiM7vjN1YrAmZBodfD7zfdP1aivDHRX5ghMhvgjvbJVbWz1XVPM6OEr8r6GLBmE2sPt
         1m0f/Lgetq7tuN9dGjKMQajzjFr5sGerfOs/mJ0e7gvYK8u2kXif2KD08q+Mxd20UIvx
         OE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nNai4kk6GSyRg35ry6/3rcAAL8QUIwFfkg5aBxpvgRo=;
        b=mIuJ+whKEbabCZU+ylVfQmMggHOrr6dO6ipw69Ws/QvNGK5th78RmBufmcf719slxU
         naYkDDlvZ26ggui6LrTxOv5LnaVcB7oAMyMxkqpGtAT2gv1zyS1vEHC4DsWjZMhliTfv
         JfoEqoEcfJsbgjlEiykvy+QDeFAtoAefBZR8pGNgVXVsGQKRqVcQ5cnmT2bjtXY5LvIe
         7/CI7FhQdxy+KYBdqshekiG9XjVqYv9AbhzL+PJMgzIRKOIdm55ywdHC8ui+ZKqPxkBr
         032A8hr6xiDFL9lXOk/MdOL1Lf4pz3/fIqJHjgcBzmoBXgT/0AQd9PUpbLdx4A91hr1G
         WiDA==
X-Gm-Message-State: ACgBeo0QewXG1O1EO8bfrXAF4H8yUMr3pg1TesGnOl2xi8f1FJVxohLZ
        xvThdEL/Rx+Ix4i2tSNkSEON1g==
X-Google-Smtp-Source: AA6agR6FHfoDDIX+DCnXnvVw/xwd1D4GXoDur6F1uMqCd665QBSkF6srJfl9wDEgN7NuQo1/4xz/AQ==
X-Received: by 2002:a2e:bd0d:0:b0:25e:48f0:5d4e with SMTP id n13-20020a2ebd0d000000b0025e48f05d4emr4485950ljq.192.1659447293659;
        Tue, 02 Aug 2022 06:34:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f0a000000b0048ae484c10bsm1575104lfq.89.2022.08.02.06.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 06:34:53 -0700 (PDT)
Message-ID: <e1a93490-7deb-8221-f3f8-83546946c61a@linaro.org>
Date:   Tue, 2 Aug 2022 16:34:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/11] arm64: gunyah: Add Gunyah hypercalls ABI
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-4-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-4-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Add initial support to perform Gunyah hypercalls. The arm64 ABI for
> Gunyah hypercalls generally follows the SMC Calling Convention.

Seeing a c&p (or c&rework) from arm-smccc.h, could you please describe:

1) Why can't you use the existing arm_smccc_1_1_hvc()? I checked, you 
don't seem to be getting more than 4 values back.

2) If #1 is not possible, why can't you add necessary glue code to the 
arm-smccc.h (as your code to support nargs/multiple return values is 
generic enough) and use corresponding macro in asm/gunyah.h ?

-- 
With best wishes
Dmitry
