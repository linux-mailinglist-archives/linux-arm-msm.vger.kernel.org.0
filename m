Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26BC6F3F1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 10:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbjEBIbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 04:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbjEBIbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 04:31:40 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5650D469D
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 01:31:38 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94f7a7a3351so687260566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683016297; x=1685608297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vq95rI3k+qtNoUgGZVAuxriMrIyzuC5jkHyoK3pkYA=;
        b=wCmHiPiURd74ZS0m8aQVNlCMYF4t5m815+o6DKuLU0E/9pNLe3Y+iJm0D3C040cNK+
         fDikIztacxOhjsuWuY2SWCAX5HBn0hxBq3phZ+aNWYnNPSCJUy+ZbCIZ9gaW2l3WcBJD
         rp8TLbzWp3+PDd78az93FsFpLXGQYTYQSVNDqwIIijScA/89YbX9ANzX2hvv3PAHXnbs
         NfZRpggUkRSfmK4stYI0wxJTGqk27eLcyOmgdI/n4W4wlzigY25zfo8MEzqVdF5+HdAq
         rd15GRQYH7CaseqizCOG+DpiSQs/A60dDVsZRg2Zk2/6fMQInnWw1uDa5mDAZIcz/SuO
         CQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683016297; x=1685608297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vq95rI3k+qtNoUgGZVAuxriMrIyzuC5jkHyoK3pkYA=;
        b=UvZFMa3AFcD7s6U58QhLUhOTIyKYyNA7MfpN0QS+eBWeI60YAyjQr7Wk3tlv3AlIPe
         EBCqfTAHvzn5XhkzEjPeehsZpaQHLU5WWDjmUe4Z5ky5ljHZ8WMIpDVd/Gj88/1RR65J
         s0uewnifDAvLnFzGwULXHJ7zDIyTauN7XzQVCljCHRwAANnNw/epW8w8gOBWofd2EZPP
         yxhA403N1D0jE4B5jmkNc2THBtSUULEJ3BQdfxA25GQ3+KSZmC95OeL0B0xliMBS46PT
         SXhgxC49SQkAhkEPzpJmK8BfG8k17v/BTXWLjxCb0uIS7KTMJuHCKFohuG9vnOeEOJfs
         C5vw==
X-Gm-Message-State: AC+VfDxBE+Ege7N4XtFM3FYq8wzOE4/v3Dcgpn/3Fojg8vxtG1Si2IQG
        u/SI2G3pWos1PplkN6tPDA3SKQ==
X-Google-Smtp-Source: ACHHUZ6mElOu0Lip0J2gjJLKiz6U8CQAoJwnINNRtPIfe/suHDIiA4olQHwoLoFSOrlpBVJSn5oWyg==
X-Received: by 2002:a17:907:7245:b0:88f:a236:69e6 with SMTP id ds5-20020a170907724500b0088fa23669e6mr13778125ejc.7.1683016296704;
        Tue, 02 May 2023 01:31:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id sb11-20020a170906edcb00b0094f7c1b6a94sm16021020ejb.11.2023.05.02.01.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 01:31:35 -0700 (PDT)
Message-ID: <0fbd5236-d923-0a8d-c7cd-c8e814211651@linaro.org>
Date:   Tue, 2 May 2023 10:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 3/4] dt-bindings: firmware: Add Qualcomm QSEECOM
 interface
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230305022119.1331495-1-luzmaximilian@gmail.com>
 <20230305022119.1331495-4-luzmaximilian@gmail.com>
 <20230308221657.GA3935330-robh@kernel.org>
 <93657561-d545-7ead-7f6c-dd2c62aab319@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <93657561-d545-7ead-7f6c-dd2c62aab319@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:44, Maximilian Luz wrote:
> On 3/8/23 23:16, Rob Herring wrote:
>> On Sun, Mar 05, 2023 at 03:21:18AM +0100, Maximilian Luz wrote:
>>> Add bindings for the Qualcomm Secure Execution Environment interface
>>> (QSEECOM).
>>
>> Pretty sure I already asked, but no answer in the commit message. Why do
>> we need this? You've already declared the platform supports SCM calls
>> with "qcom,scm". Why can't you probe whether you have QSEECOM or not? DT
>> is for non-discoverable h/w we are stuck with.
> 
> Yes, you've asked this before but I can only repeat what I've written in
> my last response to your question: I am not aware of any way to properly
> discover the interface at runtime from software.
> 
> If it makes you happy, I can put this in the commit message as well...

Yes, please, because commit msg should answer to "why we are doing
this", when this is not obvious. If the reviewer asks the same twice it
means it is not obvious.

> 
>> Why is software made non-discoverable too?
> 
> Please direct that question at the Qualcomm guys who actually designed
> that interface. I can't give you an answer to that, and I'm not all that
> happy about this either.
> 
> To reiterate: I've reverse engineered this based on the Windows driver.
> The Windows driver loads on an ACPI HID and it doesn't use any function
> to check/verify whether the interface is actually present. Adding a DT
> entry is the straight-forward adaption to having a HID in ACPI.


Best regards,
Krzysztof

