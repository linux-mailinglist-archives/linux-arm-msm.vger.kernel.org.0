Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2D159D2CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 09:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241433AbiHWH5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 03:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234556AbiHWH5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 03:57:35 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D599C6580B
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 00:57:33 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d23so14223321lfl.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KvtgSh2phbbynB84y9pIsoa+hK1Rxnm5EOo+8e1zaQQ=;
        b=FKu6fUrh8ERK9Kar36H0EJFuWiUWwUh+uOhcwDUbLVAc5WMoOauQtfQWMe23dhct00
         lmGJEJnPSyv1IbAWfATsOD9rc4DG5Ct7jOqilD70Xr/7HSCzZECxqkzcw+h9YIiqN7sG
         58i5MtI3FsVAE/D1dsLNzUx760hNG1/3nVKyS8T9PygbhCRn/mWdbsVI0hRqOOabRqHA
         2j5y3QqFeO+YuhdXbeGWp8Lvo+GHFrN2CJ5+O7cZ8rP3Vcca3pTE0KCffDLhJYYfo+ZE
         MS89w6e/mK2YaF8FPzwFOQC0PmWywYIvfu5KnQN63ZYeHZRlejN6gr2QWBicv7zb3jBh
         OcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KvtgSh2phbbynB84y9pIsoa+hK1Rxnm5EOo+8e1zaQQ=;
        b=lKvN8Z/oGEgdcbsGQ5yfsyN//r0qOstYHMMOza0uDscikD4JVEWsFfgFc76TJ1oN3E
         Ohwh5JLQI0FbDE11ALXOwhpPCPDDC4qkXJOonC2MI7pUF0olUiVvbxxrLq7FnfNLYBeh
         YDwfCQCrT3dEB8il3hVGc/xBZMlrQOxnAmMxJC6Hm7zu+KAFX7iil6dONNk5hl/tMms0
         KJRm4rEk+RbT6cGHHWtck85NiE5Ztene4XMHYzztk/r92WacOE2SxVMvJMLn496eY3rT
         hZbK2l8QepFP4mjsyUoJQOlzq64jbOlZRcoMlD1QOsUCWvm195UvHjEfITejYnd9mZlP
         JGSQ==
X-Gm-Message-State: ACgBeo03UMjCq7OSLgYoRQocQ2u5fJnAfCWY1X6GmMetkjbIUV6plPlj
        f6dF2B3DdyqkrDgmiWHM8uOcng==
X-Google-Smtp-Source: AA6agR5WcQZdOG+6fsE/UGT3A1jCQIfDZk5hX4VOpGeZ4eyBtqp1rmejXmnAdp6unePtuhDydK9YLw==
X-Received: by 2002:a05:6512:3984:b0:492:da1b:9683 with SMTP id j4-20020a056512398400b00492da1b9683mr4680226lfu.58.1661241452127;
        Tue, 23 Aug 2022 00:57:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o11-20020ac24e8b000000b00492dadd8143sm1412135lfr.168.2022.08.23.00.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 00:57:31 -0700 (PDT)
Message-ID: <b8213d5f-b1ba-6576-e9f5-3511c57b2def@linaro.org>
Date:   Tue, 23 Aug 2022 10:57:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 07/11] gunyah: msgq: Add Gunyah message queues
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-8-quic_eberman@quicinc.com>
 <250945d2-3940-9830-63e5-beec5f44010b@linaro.org>
 <6fa6c86d-5b4c-4048-2df8-49a36c86e7d6@quicinc.com>
 <87zggdven5.wl-maz@kernel.org>
 <68e241fd-16f0-96b4-eab8-369628292e03@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <68e241fd-16f0-96b4-eab8-369628292e03@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/08/2022 19:50, Elliot Berman wrote:
> 
> 
> On 8/9/2022 4:29 AM, Marc Zyngier wrote:
>> On Mon, 08 Aug 2022 23:22:48 +0100,
>> Elliot Berman <quic_eberman@quicinc.com> wrote:
>>>
>>> In a future series, I'll add the support to load other virtual
>>> machines. When running other virtual machines, additional gunyah
>>> devices are needed for doorbells (e.g. to emulate interrupts for
>>> paravirtualized devices) and to represent the vCPUs of that other
>>> VM. Other gunyah devices are also possible, but those are the
>>> immediate devices coming over the horizon.
>>
>> Can you elaborate on this "doorbell" aspect? If you signal interrupts
>> to guests, they should be signalled as actual interrupts, not as some
>> hypervisor-specific events, as we rely on the interrupt semantics for
>> most things.
>>
>> Or are you talking about injecting an interrupt from a guest into
>> another, the doorbell representing an interrupt source?
>>
> 
> Doorbells can operate either of these modes:
>   1. As simple interrupt sources. The doorbell sender makes a hypercall
>      and an interrupt is raised on the receiver. The hypervisor can be
>      configured to raise a specific SPI on the receiver VM and simply
>      acknowledging the SPI is enough to clear the interrupt assert. No
>      hypervisor-specific code is needed on the receiver to handle these
>      interrupts. This is the mode one would expect to use for
>      paravirtualized devices.

This sounds good.

>   2. As hypervisor-specific events which must be acknowledged using
>      hypercalls. We aren't currently using this advanced use-case and no
>      plans currently to post these. However, I can try to briefly
>      explain: These doorbells can operate on a bitfield and the sender
>      can assert flags on the bitmask; the receiver can decide which bits
>      should trigger the interrupt and which SPI the doorbell "runs" on.
>      The "user story" for this doorbell is to support multiple sender
>      using the same doorbell object. Each sender has a few designated
>      bits they should set. The receiver can choose which events it wants
>      an interrupt to be raised for and then can process all the pending
>      events. To re-iterate, we don't have an interesting use-case for
>      this yet, so don't plan on post patches for this second mode of
>      doorbell.

Well. For me this sounds like 'we have such capability, no real usecase, 
but we want to support it anyway' kind of story. As history has shown 
multiple times, the order should be the opposite one. First you have the 
use case, then you create the API for it. Otherwise it is very easy to 
end up with the abstraction that looks good on the API side, but is very 
hard to fit into the actual user code.

I would suggest to drop the second bullet for now and focus on getting 
the simple doorbells done and accepted into mainline.

-- 
With best wishes
Dmitry

