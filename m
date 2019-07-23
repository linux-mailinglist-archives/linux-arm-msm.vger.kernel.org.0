Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF713721DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 23:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731278AbfGWVwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 17:52:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58132 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfGWVwf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 17:52:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7B3C4615BF; Tue, 23 Jul 2019 21:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563918754;
        bh=RSyzP7VuwcQnmyMg0sztV95p9t97Vsc4pA9J0mnzN7U=;
        h=Date:From:To:Cc:Subject:From;
        b=EsXqCRtQp1rf1jr4V+cmLTUrlSbrf275bHrvQuYMmePO+GQyVPUzeXKrOQt+P09ij
         PAMcGcX5UX1dzHH2ctaWxWjcq8lS7qH0FRvI0F7MNYNEJUWQ83NvM65lQX8iD85HpK
         3OFy9z1Wpt1HshIrKf+to8EF+UCeZPvmZ2+VreMo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 34AAC61157;
        Tue, 23 Jul 2019 21:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563918754;
        bh=RSyzP7VuwcQnmyMg0sztV95p9t97Vsc4pA9J0mnzN7U=;
        h=Date:From:To:Cc:Subject:From;
        b=EsXqCRtQp1rf1jr4V+cmLTUrlSbrf275bHrvQuYMmePO+GQyVPUzeXKrOQt+P09ij
         PAMcGcX5UX1dzHH2ctaWxWjcq8lS7qH0FRvI0F7MNYNEJUWQ83NvM65lQX8iD85HpK
         3OFy9z1Wpt1HshIrKf+to8EF+UCeZPvmZ2+VreMo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 23 Jul 2019 14:52:34 -0700
From:   pheragu@codeaurora.org
To:     marc.zyngier@arm.com, Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>
Cc:     psodagud@codeaurora.org, Tsoni <tsoni@codeaurora.org>,
        rananta@codeaurora.org, mnalajal@codeaurora.org
Subject: Warning seen when removing a module using irqdomain framework
Message-ID: <aa6a66a7671f12f19d0364755e76de0d@codeaurora.org>
X-Sender: pheragu@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

I have been working on a interrupt controller driver that uses tree 
based mapping for its domain (irq_domain_add_tree(..)).
If I understand correctly, the clients get a mapping when they call 
platform_get_irq(..).
However, after these clients are removed (rmmod), when I try to remove 
the interrupt controller driver where it calls irq_domain_remove(..), I 
hit this warning from kernel/kernel/irq/irqdomain.c:: 
irq_domain_remove(..)
[WARN_ON(!radix_tree_empty(&domain->revmap_tree));]-
WARNING: CPU: 0 PID: 238 at /kernel/kernel/irq/irqdomain.c:246 
irq_domain_remove+0x84/0x98

Also, I see that the requested IRQs by the clients are still present (in 
/proc/interrupts) even after they had been removed.
Hence, I just wanted to know how to handle this warning. Should the 
client clean up by calling irq_dispose_mapping(..) or is it the 
responsibility of the interrupt controller driver to dispose the 
mappings one by one?

Regards,
Prakruthi Deepak Heragu
