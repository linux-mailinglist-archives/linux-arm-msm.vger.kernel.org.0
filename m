Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB619114418
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 16:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbfLEPve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 10:51:34 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:43070
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726257AbfLEPve (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 10:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575561093;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=9pymZMREs0aDkOkin38Qg0017bN8aBp0lR9eje0eErE=;
        b=I0YX2aPyE1wmJuAEsRH7NG882VDFs1+W5HNYeqtHYLS+RCmrI85rJy4kN59Z2iun
        N1ORqJaKoNb822rVVHaLduZXXxwcWENX9aqZyxUffln8idHIl1OkUl57WsCnfBurF9n
        kh7cCK2GsYe9Z2w6PDGqSeTdmSS4NvsBAIK3Y9wI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575561093;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=9pymZMREs0aDkOkin38Qg0017bN8aBp0lR9eje0eErE=;
        b=dYisZPGV5kT0zFkXYf4Ja0qXK7puDCqj0ENz+EncOwW1SpkZ1dLJB4gQP2YijdTE
        3j/cSRj2CQULLqQxFBRRu/HT4YgCw2B6wneHiiEQs9kwx/c8Aro0XuBsiCeH9z3YXmh
        cB4UR2rKaiKWbtwGIDUgPqlb9yTCRE7gsorh1a8U=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17A40C447B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 5 Dec 2019 15:51:33 +0000
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     iommu@lists.linux-foundation.org, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 4/8] iommu/arm-smmu: Add split pagetables for Adreno
 IOMMU implementations
Message-ID: <0101016ed6c26118-3bccfc33-005d-4824-a0d1-55ef6beeaeb8-000000@us-west-2.amazonses.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
 <0101016e95752703-78491f46-41db-441c-b0fb-9a760e4d56cb-000000@us-west-2.amazonses.com>
 <2a43c49e-064e-1e95-6726-8d1e761f6749@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a43c49e-064e-1e95-6726-8d1e761f6749@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2019.12.05-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 04, 2019 at 04:44:59PM +0000, Robin Murphy wrote:
> On 22/11/2019 11:31 pm, Jordan Crouse wrote:
> >Add implementation specific support to enable split pagetables for
> >SMMU implementations attached to Adreno GPUs on Qualcomm targets.
> >
> >To enable split pagetables the driver will set an attribute on the domain.
> >if conditions are correct, set up the hardware to support equally sized
> >TTBR0 and TTBR1 regions and programs the domain pagetable to TTBR1 to make
> >it available for global buffers while allowing the GPU the chance to
> >switch the TTBR0 at runtime for per-context pagetables.
> >
> >After programming the context, the value of the domain attribute can be
> >queried to see if split pagetables were successfully programmed. The
> >domain geometry will be updated so that the caller can determine the
> >start of the region to generate correct virtual addresses.
> 
> Why is any of this in impl? It all looks like perfectly generic
> architectural TTBR1 setup to me. As long as DOMAIN_ATTR_SPLIT_TABLES is
> explicitly an opt-in for callers, I'm OK with them having to trust that
> SEP_UPSTREAM is good enough. Or, even better, make the value of
> DOMAIN_ATTR_SPLIT_TABLES not a boolean but the actual split point, where the
> default of 0 would logically mean "no split".

(apologies if you get multiple copies of this email, I have tickets in with the
CAF IT folks).

I made it impl specific because my impression from the previous conversations
was that setting up the T0 space but leaving TTBR0 un-programmed was a silly
thing that was unique to the Adreno GPU. I don't mind moving it to the generic
code since that saves us from some silly compatible string games.

I like the idea of DOMAIN_ATTR_SPLIT_TABLES returning the split point but would
we want to allow the user to try to specific a desired split point ahead of
time? It is my impression that we only have a handful of valid SEP values and
I'm not sure what the right response would be if the user specified an incorrect
one.

So far I've not found a use for anything except SEP_UPSTREAM but I have the
extreme luxury of a SMMU with an actual 49 bit IAS.

New patchset coming soon.

Thanks,
Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
