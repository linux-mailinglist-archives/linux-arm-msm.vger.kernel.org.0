Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD4C62D646
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 10:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbiKQJSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 04:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbiKQJSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 04:18:12 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B797C748F8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:18:10 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id d20so1877345ljc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zc9P2mVxcSIaau3yoidC3balhKl9rgLwRo/q9Bmer3A=;
        b=jYBC++3UkjH19yfeDG5OTJ+zf7Xn30J1P514sRkvvyVQkkjT2BsX2XBJ5g8Y08lthT
         kcVpdM82Axk8n/aKMFGrWgalCuJefuRfcuM4fh7LncsWVXUDzzJ5F+N7kMI/AQMN+okq
         KVVZgqTke314ggOohouyjCyWroMSMLGmZ8XFM+1M7E9WPhQBp6vty7CWyNDapQB8YF7q
         17uIsEpjxqozpR98Qn8Lef8XaAtR7TlP9KXBY012aIzOwPyMxcpjWh47mPqWLJ4RNe1i
         WMSdeeRdFzoOk0ugtmtJK0V9rxCddBPDN0h4qqPU9q9CcuMELHBxX+yNJUKz+Xt7ZyVi
         +JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc9P2mVxcSIaau3yoidC3balhKl9rgLwRo/q9Bmer3A=;
        b=qVCMZZ46ZWvufoe25BhWLARp1fz8BHADKfddhE4WkObUH3hPLT3d1rd3W5tn6pWOtw
         uOS3avsF7C/46Ps38gKDbIaVmxxBupVtHT+8hrRMB+Bou0kEyL9F276ozK4hn6kgc3H4
         Dh0aFnSORNaIe+npnXk9dhB1Hdw5CuK2lNgn1dJNL3yZXBt/Ll3GmugMzlyucucxk0Yg
         KUV1MxM4zUtRR/eQzD+MW/BoGqn5nFUSfVgVmUTCisrUINgqs12pm4EEsa+6/qph76J5
         Hi41W9dskjUG5i+7u+s8pSetofONrP6o+0+agZujes+zuqOeroFJr0YMYQ7QNOt5m4Hf
         XwDA==
X-Gm-Message-State: ANoB5pl+xV/wYqt/LO7YW9+wV10sLR3KZPNaBvVEd1inXwC/XZYYoceV
        knpFvgFejpbKkYD0kAJ68RBr4g==
X-Google-Smtp-Source: AA0mqf6m8+LnYNYoHzMDL+O0WNfB5ENzP4VeZSxLuKbbmuvnJ2iIvXGh860jmH/qL8XlX/jpYjqGDA==
X-Received: by 2002:a2e:a4d9:0:b0:277:3984:324f with SMTP id p25-20020a2ea4d9000000b002773984324fmr611114ljm.424.1668676689115;
        Thu, 17 Nov 2022 01:18:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m4-20020ac24244000000b004ab98cd5644sm55578lfl.182.2022.11.17.01.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:18:08 -0800 (PST)
Message-ID: <30686147-07c8-4713-ec84-ba42258f6a06@linaro.org>
Date:   Thu, 17 Nov 2022 10:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/7] dt-bindings: mfd: qcom,spmi-pmic: document pmr735d
Content-Language: en-US
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v1-3-6338a2b4b241@linaro.org>
 <f3338d53-a0bf-9fc4-fcee-959e2b9a7e22@linaro.org>
 <3be329e6-79f8-4b78-c24e-9341f4d803a2@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3be329e6-79f8-4b78-c24e-9341f4d803a2@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 17/11/2022 08:42, Neil Armstrong wrote:
> Hi,
> 
> On 16/11/2022 12:16, Krzysztof Kozlowski wrote:
>> On 16/11/2022 11:11, Neil Armstrong wrote:
>>> Document compatible for the pmr735d SPMI PMIC.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> I think this should be squashed.
> 
> I'll squash both 2 & 3 into 1, can I keep your Reviewed-by on 1 ?

Yes.

Best regards,
Krzysztof

