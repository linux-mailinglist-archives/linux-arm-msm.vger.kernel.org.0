Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9E72881
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 08:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfGXGvJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 02:51:09 -0400
Received: from foss.arm.com ([217.140.110.172]:35860 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfGXGvI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 02:51:08 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E72CD28;
        Tue, 23 Jul 2019 23:51:07 -0700 (PDT)
Received: from why (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C79E3F694;
        Tue, 23 Jul 2019 23:53:10 -0700 (PDT)
Date:   Wed, 24 Jul 2019 07:51:03 +0100
From:   Marc Zyngier <marc.zyngier@arm.com>
To:     pheragu@codeaurora.org
Cc:     Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
        psodagud@codeaurora.org, Tsoni <tsoni@codeaurora.org>,
        rananta@codeaurora.org, mnalajal@codeaurora.org
Subject: Re: Warning seen when removing a module using irqdomain framework
Message-ID: <20190724075103.00ae5924@why>
In-Reply-To: <aa6a66a7671f12f19d0364755e76de0d@codeaurora.org>
References: <aa6a66a7671f12f19d0364755e76de0d@codeaurora.org>
Organization: ARM Ltd
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Jul 2019 14:52:34 -0700
pheragu@codeaurora.org wrote:

Hi Prakruthi,

> Hi,
> 
> I have been working on a interrupt controller driver that uses tree
> based mapping for its domain (irq_domain_add_tree(..)).
> If I understand correctly, the clients get a mapping when they call
> platform_get_irq(..). However, after these clients are removed
> (rmmod), when I try to remove the interrupt controller driver where
> it calls irq_domain_remove(..), I hit this warning from
> kernel/kernel/irq/irqdomain.c:: irq_domain_remove(..)
> [WARN_ON(!radix_tree_empty(&domain->revmap_tree));]-
> WARNING: CPU: 0 PID: 238 at /kernel/kernel/irq/irqdomain.c:246 irq_domain_remove+0x84/0x98
> 
> Also, I see that the requested IRQs by the clients are still present
> (in /proc/interrupts) even after they had been removed. Hence, I just
> wanted to know how to handle this warning. Should the client clean up
> by calling irq_dispose_mapping(..) or is it the responsibility of the
> interrupt controller driver to dispose the mappings one by one?

In general, building interrupt controller drivers as a module is a
pretty difficult thing to do in a safe manner. As you found out, this
relies on the irq_domain being "emptied" before it can be freed. There
are some other gotchas in the rest of the IRQ stack as well.

Doing that is hard. One of the reasons is that the OF subsystem will
happily allocate all the interrupts it can even if there is no driver
having requested them (see of_platform_populate). This means that you
cannot track whether a client driver is using one of the interrupt your
irqchip is in charge of. You can apply some heuristics, but they are in
general all wrong.

Fixing the OF subsystem is possible, but will break a lot of platforms
that will have to be identified and fixed one by one.  Another
possibility would be to refcount irqdescs, and make sure the irqdomain
directly holds pointers to them. Doable, but may create overhead.

To sum it up, don't build your irqchip driver as a module if you can
avoid it. If you can't, you'll have to be very careful about how the
mapping is established (make sure it is not created by
of_platform_populate), and use irq_dispose_mapping in the client
drivers.

Hope this helps,

	M.
-- 
Without deviation from the norm, progress is not possible.
