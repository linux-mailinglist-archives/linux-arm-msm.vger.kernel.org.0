Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F027626650B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIKQvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:51:19 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:32776
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726413AbgIKQuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 12:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599843009;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=75M3K27A75eW01qMnHulweMV5JfADkFu3ldMwzlgYeY=;
        b=lb//+xMSLmWH+r/OEJfhQcvXFI1tU0t84Vwd1t6nkEeJfQUW/UUjLl6C7EzekYyM
        mICxrPP0s45OdF68XjW/JS9nCjRlg8hxg9A5V4j535T5Ne1ffR/ojCDFHNdT33O3j+D
        hVrBtXSoANljozw39mtE6uhNTABeSM3NvSYU1LO4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599843009;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=75M3K27A75eW01qMnHulweMV5JfADkFu3ldMwzlgYeY=;
        b=BqUlzDKKpJjS0nZlrEaxCfH5YZxAUm72EFUOJr3Q5MPlib9GwbtSZ4R6GRGlDmI9
        4st0/pu5V/12I9FzJaO7Bf1maZaPyqhjeLCXCvB+xTFemncnqIqKohEcxKB9Ln/yP6n
        MV+glFyWZHXvO8PeaUWukvNvZ2zADzmZoqvZXheE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 16:50:09 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
In-Reply-To: <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
 <20200911160706.GA20802@willie-the-truck>
 <010101747df8e9df-fad2f88d-e970-4753-a99a-2cfeeb1a29a9-000000@us-west-2.amazonses.com>
 <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
Message-ID: <010101747e130426-dbab3e59-3915-40c2-80e1-dc0ce8970d36-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-11 22:04, Robin Murphy wrote:
> On 2020-09-11 17:21, Sai Prakash Ranjan wrote:
>> On 2020-09-11 21:37, Will Deacon wrote:
>>> On Fri, Sep 11, 2020 at 05:03:06PM +0100, Robin Murphy wrote:
>>>> BTW am I supposed to have received 3 copies of everything? Because I 
>>>> did...
>>> 
>>> Yeah, this seems to be happening for all of Sai's emails :/
>>> 
>> 
>> Sorry, I am not sure what went wrong as I only sent this once
>> and there are no recent changes to any of my configs, I'll
>> check it further.
> 
> Actually on closer inspection it appears to be "correct" behaviour.
> I'm still subscribed to LAKML and the IOMMU list on this account, but
> normally Office 365 deduplicates so aggressively that I have rules set
> up to copy list mails that I'm cc'ed on back to my inbox, in case they
> arrive first and cause the direct copy to get eaten - apparently
> there's something unique about your email setup that manages to defeat
> the deduplicator and make it deliver all 3 copies intact... :/
> 

No changes in my local setup atleast, but in the past we have
had cases with codeaurora mail acting weird or it could be my vpn,
will have to check.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
