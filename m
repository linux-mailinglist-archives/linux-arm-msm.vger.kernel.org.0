Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C869E759D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 23:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfGYVlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 17:41:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44918 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbfGYVlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 17:41:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 93BDD60386; Thu, 25 Jul 2019 21:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564090908;
        bh=jqzrQBVq8lBiAxe0oBWB4NzMopTX5KV8rFKZCzdTySI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m9ZUKMR2bmgnO0VU73/7N6pitQWuXk5awOMdwtiw8/aZ8J7Lne0OiwQstf9b+oyfo
         2GOHhrejNCyojn4oCOm6XWmaDah5HfN8TNanUKgWZUEIDkRMQM25WiB+UQp6XaxjuZ
         AQXLkO1WGVDYqa/xWCcXjwRYnUbPXO72x8RvlHZs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 249BE6021A;
        Thu, 25 Jul 2019 21:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564090908;
        bh=jqzrQBVq8lBiAxe0oBWB4NzMopTX5KV8rFKZCzdTySI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m9ZUKMR2bmgnO0VU73/7N6pitQWuXk5awOMdwtiw8/aZ8J7Lne0OiwQstf9b+oyfo
         2GOHhrejNCyojn4oCOm6XWmaDah5HfN8TNanUKgWZUEIDkRMQM25WiB+UQp6XaxjuZ
         AQXLkO1WGVDYqa/xWCcXjwRYnUbPXO72x8RvlHZs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 25 Jul 2019 14:41:48 -0700
From:   pheragu@codeaurora.org
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
        psodagud@codeaurora.org, Tsoni <tsoni@codeaurora.org>,
        rananta@codeaurora.org, mnalajal@codeaurora.org
Subject: Re: Warning seen when removing a module using irqdomain framework
In-Reply-To: <20190724075103.00ae5924@why>
References: <aa6a66a7671f12f19d0364755e76de0d@codeaurora.org>
 <20190724075103.00ae5924@why>
Message-ID: <db46690929f70536ea4d391275471131@codeaurora.org>
X-Sender: pheragu@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-07-23 23:51, Marc Zyngier wrote:
> On Tue, 23 Jul 2019 14:52:34 -0700
> pheragu@codeaurora.org wrote:
> 
> Hi Prakruthi,
> 
>> Hi,
>> 
>> I have been working on a interrupt controller driver that uses tree
>> based mapping for its domain (irq_domain_add_tree(..)).
>> If I understand correctly, the clients get a mapping when they call
>> platform_get_irq(..). However, after these clients are removed
>> (rmmod), when I try to remove the interrupt controller driver where
>> it calls irq_domain_remove(..), I hit this warning from
>> kernel/kernel/irq/irqdomain.c:: irq_domain_remove(..)
>> [WARN_ON(!radix_tree_empty(&domain->revmap_tree));]-
>> WARNING: CPU: 0 PID: 238 at /kernel/kernel/irq/irqdomain.c:246 
>> irq_domain_remove+0x84/0x98
>> 
>> Also, I see that the requested IRQs by the clients are still present
>> (in /proc/interrupts) even after they had been removed. Hence, I just
>> wanted to know how to handle this warning. Should the client clean up
>> by calling irq_dispose_mapping(..) or is it the responsibility of the
>> interrupt controller driver to dispose the mappings one by one?
> 
> In general, building interrupt controller drivers as a module is a
> pretty difficult thing to do in a safe manner. As you found out, this
> relies on the irq_domain being "emptied" before it can be freed. There
> are some other gotchas in the rest of the IRQ stack as well.
> 
> Doing that is hard. One of the reasons is that the OF subsystem will
> happily allocate all the interrupts it can even if there is no driver
> having requested them (see of_platform_populate). This means that you
> cannot track whether a client driver is using one of the interrupt your
> irqchip is in charge of. You can apply some heuristics, but they are in
> general all wrong.
> 
> Fixing the OF subsystem is possible, but will break a lot of platforms
> that will have to be identified and fixed one by one.  Another
> possibility would be to refcount irqdescs, and make sure the irqdomain
> directly holds pointers to them. Doable, but may create overhead.
> 
> To sum it up, don't build your irqchip driver as a module if you can
> avoid it. If you can't, you'll have to be very careful about how the
> mapping is established (make sure it is not created by
> of_platform_populate), and use irq_dispose_mapping in the client
> drivers.
> 
As per your suggestion I tried making this driver a statically compiled 
one.
I tried various approaches with this -

1. Using arch_inticall(..) - When I used this call, I saw that once the
clients were removed, I don't see the IRQs requested by them (in 
/proc/interrupts).

2. Using module_init(..) (statically compiled) - When I used this call, 
I saw that
even after the clients were removed, I do see their requested IRQs in 
/proc/interrupts.
This behavior in #2 is the same as the one I saw when I compiled my 
driver as a module
and used arch_initcall(..).

Is there any reason why this is seen only with arch_initcall(..) used 
statically?


Regards,
Prakruthi Deepak











