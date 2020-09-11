Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4792663A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgIKQVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:21:46 -0400
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:55928
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726173AbgIKQVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 12:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599841299;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=zLLjZiRypG0Wci37ZvhYi5U/numQqbf1L3QFevedjJ0=;
        b=b5sWtdvb6+EMijlW6CafSr4+0yqX/3+d7UG/urtb+TKItxQzb7HRMPOY0i4OrB25
        Ct5Bmk4OcXIQj8RHc5jWhBs9bFXysjV6/J8BNf8s3vxAQ4E8km2a14i7pU36mdzza0Q
        W91pGLwldrdojIex7UAzl0MuFzhCrpS2vus4gXto=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599841299;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=zLLjZiRypG0Wci37ZvhYi5U/numQqbf1L3QFevedjJ0=;
        b=OLYn9r+W8veX9mSkaQUT3PSo168E1Wi01Y/FThhDEQiD/9bWazM0r73F0vpLZjJT
        m3WsEhgxghJCztbgUk69KlWoOg33c5wehyNM/Z53oReYbBokc1XJNV4JDVeHbHxCEJn
        l1yJJuNJb8fgoZMBfKUiBPyGC8rDIqpIWeKGZtLc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 16:21:39 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
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
In-Reply-To: <20200911160706.GA20802@willie-the-truck>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
 <20200911160706.GA20802@willie-the-truck>
Message-ID: <010101747df8ea40-24a84c86-afdc-4425-a21b-7d80158e7393-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-11 21:37, Will Deacon wrote:
> On Fri, Sep 11, 2020 at 05:03:06PM +0100, Robin Murphy wrote:
>> BTW am I supposed to have received 3 copies of everything? Because I 
>> did...
> 
> Yeah, this seems to be happening for all of Sai's emails :/
> 

Sorry, I am not sure what went wrong as I only sent this once
and there are no recent changes to any of my configs, I'll
check it further.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
