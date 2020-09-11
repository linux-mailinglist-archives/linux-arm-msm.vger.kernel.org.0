Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AD726638C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgIKQT6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:19:58 -0400
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:54180
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726516AbgIKQTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 12:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599841153;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=XBT+2F8Be9EUhOk79AkAkxBza69lSFrrfNDtXiYkez8=;
        b=aqGrYUHzMVKHuSU0ksGRsKHk5f3+HQbmzBV7srIhWvXSU3MnMFfopGf2xRhKKzGW
        P7z9pzOnga24lmNNL5dAep7SjjgYF3FuoVk3cQ1VkSXvZWqRaY8UsU0BYWU6F1mSAk1
        F738U9QdrC3Zb3zOJwWa4RJKbg4H0QGfxK9XYjo8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599841153;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=XBT+2F8Be9EUhOk79AkAkxBza69lSFrrfNDtXiYkez8=;
        b=KogK6wJVFQreN/mETzr9ra1qZ8nX2dQe6QNa2rJ/+xPUvUPRjNxbIcExRPOtBFPW
        LND6H4YoiB9/JxbMQMyIwX2jhxA49OiK72QTjVmaTQMMOUQDs6jMk8gKo2+fasGs0XF
        Yq1pzAp2Y7W97jCh8z5/GAq6O4N4mesJeAyeYKIs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 16:19:13 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
In-Reply-To: <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
Message-ID: <010101747df6b106-0fd7caa1-471f-41e6-9f34-8d6eb3380f17-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-11 21:33, Robin Murphy wrote:
> On 2020-09-11 15:28, Sai Prakash Ranjan wrote:
>> There are few places in arm-smmu-impl where there are
>> extra blank lines, remove them
> 
> FWIW those were deliberate - sometimes I like a bit of subtle space to
> visually delineate distinct groups of definitions. I suppose it won't
> be to everyone's taste :/
> 

Ah ok, I thought it was not intentional, I can drop it.

>> and while at it fix the
>> checkpatch warning for space required before the open
>> parenthesis.
> 
> That one, however, was not ;)
> 

I'll keep this one.

> BTW am I supposed to have received 3 copies of everything? Because I 
> did...
> 

Ugh no, I just sent it once but something seems to have gone wrong.
Apologies again if you receive this message also multiple times.
I'll check further what's going wrong with my setup.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
