Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09A41C90EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 16:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgEGO4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 10:56:31 -0400
Received: from foss.arm.com ([217.140.110.172]:33292 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725969AbgEGO4b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 10:56:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A1C1FB;
        Thu,  7 May 2020 07:56:30 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D63D3F68F;
        Thu,  7 May 2020 07:56:28 -0700 (PDT)
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <fad5dc096a2bd9404341ba8738ba8fc9@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <80a3b07d-f3a7-07c4-4e8f-76e28563027c@arm.com>
Date:   Thu, 7 May 2020 15:56:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fad5dc096a2bd9404341ba8738ba8fc9@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-07 1:06 pm, Sai Prakash Ranjan wrote:
[...]
> We could have our own context fault handler in QCOM implementation,
> but that would just be duplicating things from arm-smmu context fault
> handler. So I did not think it makes much sense to have our own
> fault handler in qcom impl just for enabling stall model.

Hmm, it's probably worth thinking ahead a bit here, to the "actually 
doing things with stalls" plan. I don't have a clear picture off-hand of 
how well the new device fault handler API might fit into arm-smmu - at 
the very least trying to make it truly generic implies having to play 
nasty tricks with disable_irq() for the general case given the "IRQ may 
remain asserted while SS is active" possibility, and that isn't 
particularly inviting. Not to mention tying it into the 
pretend-auxdomain stuff that *is* rather dependent on the qcom impl. If 
it turns out that you'll eventually have to reimplement the IRQ handler 
anyway for all that, then starting off down that route *might* work out 
cleaner and less hassle overall.

Robin.
