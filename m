Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FE71024AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 13:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbfKSMk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 07:40:59 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:36250
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725280AbfKSMk7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 07:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574167257;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=CEhdhlN+M1OpAxIH/yMj19nrltuBHW5P13jllfaEM2s=;
        b=mLOdS0dXbzUa+uX0R/zereNz9q7MmiC6XbuSA4SDhW8YZfJ6tYJ5OB+o3xIvzskf
        9jOOQ0mrBuZ83orFXlon1SuZ3ERwQQ8TZe3xN2KEKLs63O4M0DEjq4+2uAFJd7dUXVb
        XPO+D71/lymMwfaUYGdlk4oLTUDHv9I8rbdQ/db8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574167257;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=CEhdhlN+M1OpAxIH/yMj19nrltuBHW5P13jllfaEM2s=;
        b=LBrMfl4hZtt/1kyZzzfdG/56L+NfPWasqDltYDL6JXxHCD4wEvq5KtVlqkdVz2XC
        JDyV6ObB0Z+migTZEg4UC+PgLWxnqgR14k/+nZbtfgTI1ixIu+50Y8HK8u3H8E0sxnQ
        qKEj4GJz4fo+4sLsNf9zZKl97v4kYzg4AVjujMDI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 Nov 2019 12:40:57 +0000
From:   dhar@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v2] msm: disp: dpu1: add support to access hw irqs regs
 depending on revision
In-Reply-To: <5dcd8f05.1c69fb81.bdd4.2b0a@mx.google.com>
References: <1573710976-27551-1-git-send-email-dhar@codeaurora.org>
 <5dcd8f05.1c69fb81.bdd4.2b0a@mx.google.com>
Message-ID: <0101016e83ae22b5-7a05918b-c1c4-40f1-ae17-5dd36a003c36-000000@us-west-2.amazonses.com>
X-Sender: dhar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.19-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-14 22:59, Stephen Boyd wrote:
> Quoting Shubhashree Dhar (2019-11-13 21:56:16)
>> Current code assumes that all the irqs registers offsets can be
>> accessed in all the hw revisions; this is not the case for some
>> targets that should not access some of the irq registers.
> 
> What happens if we read the irq registers that we "should not access"?
> Does the system reset? It would be easier to make those registers 
> return
> 0 when read indicating no interrupt and ignore writes so that 
> everything
> keeps working without having to skip registers.
> 
In some of the hw revisions, the whole hw block is absent and trying to 
access those
registers causes system panic(bus noc error).

>> This change adds the support to selectively remove the irqs that
>> are not supported in some of the hw revisions.
>> 
>> Change-Id: I6052b8237b703a1a9edd53893e04f7bd72223da1
> 
> Please remove these before sending upstream.
> 
>> Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  3 +++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 
>> +++++++++++++++++-----
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  1 +
>>  4 files changed, 22 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index ec76b868..def8a3f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -646,6 +646,7 @@ struct dpu_perf_cfg {
>>   * @dma_formats        Supported formats for dma pipe
>>   * @cursor_formats     Supported formats for cursor pipe
>>   * @vig_formats        Supported formats for vig pipe
>> + * @mdss_irqs          Bitmap with the irqs supported by the target
> 
> Hmm pretty sure there needs to be a colon so that kernel-doc can match
> this but maybe I'm wrong.
> 
>>   */
>>  struct dpu_mdss_cfg {
>>         u32 hwversion;
