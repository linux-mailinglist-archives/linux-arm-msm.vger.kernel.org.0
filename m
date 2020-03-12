Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBCE182F5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 12:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgCLLix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 07:38:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:33940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgCLLix (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 07:38:53 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84C8220716;
        Thu, 12 Mar 2020 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584013132;
        bh=MZCqMF9dtPQuoAguywZt1bk0weVwPYLBA3uj+VpWdE8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2ng77m7TDLvyNg6BYuMI4v6AdCxHOhAE8hNV1FlsNwNFGnq5UaRGkdwQiTkb24T8X
         TzvFZUIhHbUu0F2zNHmh5pTeSgOxSh9MCbK4m1YdPwQnkx0IvOyLWJKUtcef5p2opf
         jqul0bD56qAUB6RC0OE3Ze5FGcrOFGjMLA/JHVJY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jCMAs-00CCW8-Pf; Thu, 12 Mar 2020 11:38:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 12 Mar 2020 11:38:50 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, linux-kernel-owner@vger.kernel.org,
        mkshah=codeaurora.org@mg.codeaurora.org
Subject: Re: [RFC 1/2] irqchip: qcom: pdc: Introduce irq_set_wake call
In-Reply-To: <6fd12e17-5216-d136-b454-2ee7e4a1686e@codeaurora.org>
References: <1581944408-7656-1-git-send-email-mkshah@codeaurora.org>
 <1581944408-7656-2-git-send-email-mkshah@codeaurora.org>
 <158216527227.184098.17500969657143611632@swboyd.mtv.corp.google.com>
 <4c80783d-8ad0-9bd8-c42e-01659fa81afe@codeaurora.org>
 <158265096050.177367.409185999509868538@swboyd.mtv.corp.google.com>
 <55bfc524f6c45419227c228c86fb20dc@misterjones.org>
 <6fd12e17-5216-d136-b454-2ee7e4a1686e@codeaurora.org>
Message-ID: <68130578959b36d92b721131a9b35e94@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mkshah@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org, evgreen@chromium.org, mka@chromium.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, linux-kernel-owner@vger.kernel.org, mkshah=codeaurora.org@mg.codeaurora.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-12 11:33, Maulik Shah wrote:
> On 2/27/2020 6:39 AM, Marc Zyngier wrote:
>> Maulik,
>> 
>> I'd appreciate if you could Cc me on all irqchip patches.
> 
> Sure Marc, i kept you in Cc for V2 addressing stephen's comments.

Thanks. Make sure you use maz@kernel.org (I accidentally replied from
my personal address).

> 
>> 
>> On 2020-02-25 17:16, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-02-21 03:20:59)
>>>> 
>>>> On 2/20/2020 7:51 AM, Stephen Boyd wrote:
>>>> 
>>>>     How are wakeups supposed to work when the CPU cluster power is 
>>>> disabled
>>>>     in low power CPU idle modes? Presumably the parent irq 
>>>> controller is
>>>>     powered off (in this case it's an ARM GIC) and we would need to 
>>>> have the
>>>>     interrupt be "enabled" or "unmasked" at the PDC for the irq to 
>>>> wakeup
>>>>     the cluster.
>>>> 
>>>> Correct. Interrupt needs to be "enabled" or "unmasked" at wakeup 
>>>> capable PDC
>>>> for irqchip to wakeup from "deep" low power modes where parent GIC 
>>>> may not be
>>>> monitoring interrupt and only PDC is monitoring.
>>>> these "deep" low power modes can either be triggered by kernel 
>>>> "suspend" or
>>>> "cpuidle" path for which drivers may or may not have registered for 
>>>> suspend or
>>>> cpu/cluster pm notifications to make a decision of enabling wakeup 
>>>> capability.
>> 
>> Loosing interrupt delivery in idle is not an acceptable behaviour. 
>> Idle != suspend.
> 
> Agree, we are not lossing it, but rather RFC v1 was keeping a
> requirement on drivers to keep wake
> enabled by calling irq_set_wake when the interrupt is routed via PDC,
> even after coming out of suspend.

An endpoint driver shouldn't have to know what interrupt controller it
is connected to. So your "when the interrupt is routed via PDC" is
not enforceable.

         M.
-- 
Jazz is not dead. It just smells funny...
