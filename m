Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA373F9E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 19:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhH0Ray (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 13:30:54 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43818 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236468AbhH0Rax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 13:30:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630085405; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=f1K7tpYyGaEgTI2CpLNbGPsvPdr213WjVf/5LadNQ9c=;
 b=HlmEih0EcaxaS1zMpZC4ZSsr8HXD1KQVBiIbCTIWHcQmYXigqYkVMsmBFlKkxMXxo47aiwTX
 ftBcc+u+OEIryw3S/1zXfk5XjvHpekOodxXU7nwVK8ItPXeuiMd+/9IVQs1JLRLrawG8fDzV
 NLIvBPTdZ1lKG6lq2Tl7qUB6ZQM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61292119825e13c54a2e97f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 17:30:01
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 888F1C4360D; Fri, 27 Aug 2021 17:30:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AEF6C4338F;
        Fri, 27 Aug 2021 17:29:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 27 Aug 2021 10:29:59 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: core: Use cached values for calculating the
 shared write pointer
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1630073606-13671-1-git-send-email-quic_jhugo@quicinc.com>
References: <1630073606-13671-1-git-send-email-quic_jhugo@quicinc.com>
Message-ID: <cba6da940d7b60ce7362c9588ebb2a33@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-27 07:13 AM, Jeffrey Hugo wrote:
> mhi_recycle_ev_ring() computes the shared write pointer for the ring
> (ctxt_wp) using a read/modify/write pattern where the ctxt_wp value in 
> the
> shared memory is read, incremented, and written back.  There are no 
> checks
> on the read value, it is assumed that it is kept in sync with the 
> locally
> cached value.  Per the MHI spec, this is correct.  The device should 
> only
> read ctxt_wp, never write it.
> 
> However, there are devices in the wild that violate the spec, and can
> update the ctxt_wp in a specific scenario.  This can cause corruption, 
> and
> violate the above assumption that the ctxt_wp is in sync with the 
> cached
> value.
> 
> This can occur when the device has loaded firmware from the host, and 
> is
> transitioning from the SBL EE to the AMSS EE.  As part of shutting down
> SBL, the SBL flushes it's local MHI context to the shared memory since
> the local context will not persist across an EE change.  In the case of
> the event ring, SBL will flush its entire context, not just the parts 
> that
> it is allowed to update.  This means SBL will write to ctxt_wp, and
> possibly corrupt it.
> 
> An example:
> 
> Host				Device
> ----				---
> Update ctxt_wp to 0x1f0
> 				SBL observes 0x1f0
> Update ctxt_wp to 0x0
> 				Starts transition to AMSS EE
> 				Context flush, writes 0x1f0 to ctxt_wp
> Update ctxt_wp to 0x200
> Update ctxt_wp to 0x210
> 				AMSS observes 0x210
> 				0x210 exceeds ring size
> 				AMSS signals syserr
> 
> The reason the ctxt_wp goes off the end of the ring is that the 
> rollover
> check is only performed on the cached wp, which is out of sync with
> ctxt_wp.
> 
> Since the host is the authority of the value of ctxt_wp per the MHI 
> spec,
> we can fix this issue by not reading ctxt_wp from the shared memory, 
> and
> instead compute it based on the cached value.  If SBL corrupts ctxt_wp,
> the host won't observe it, and will correct the value at some point 
> later.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
> 
> v2:
> Fix typo on the ring base
> 
>  drivers/bus/mhi/core/main.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index c01ec2f..dc86fdb3 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -533,18 +533,13 @@ irqreturn_t mhi_intvec_handler(int irq_number, 
> void *dev)
>  static void mhi_recycle_ev_ring_element(struct mhi_controller 
> *mhi_cntrl,
>  					struct mhi_ring *ring)
>  {
> -	dma_addr_t ctxt_wp;
> -
>  	/* Update the WP */
>  	ring->wp += ring->el_size;
> -	ctxt_wp = *ring->ctxt_wp + ring->el_size;
> 
> -	if (ring->wp >= (ring->base + ring->len)) {
> +	if (ring->wp >= (ring->base + ring->len))
>  		ring->wp = ring->base;
> -		ctxt_wp = ring->iommu_base;
> -	}
> 
> -	*ring->ctxt_wp = ctxt_wp;
> +	*ring->ctxt_wp = ring->iommu_base + (ring->wp - ring->base);
> 
>  	/* Update the RP */
>  	ring->rp += ring->el_size;

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
