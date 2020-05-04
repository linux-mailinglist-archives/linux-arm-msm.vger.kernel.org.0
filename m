Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD431C3D16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 16:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgEDOdi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 10:33:38 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61047 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728324AbgEDOdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 10:33:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588602817; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DNLUn6EQruMMMF99UWRP+mb1eNSt+jyIl1CBrxqPHaY=; b=tQ4FdOoew0AAKlBbi1QQlM5kcXWkglNBpgpYQVnivzMHAe/2QE7VzlQ6WVugmIj7CDqBJ06w
 ISVjdUzqnfXkGty3E7MWKa9QZjiKoKrP8L78nKbN3ja7czAlRggP3zauctEl9QMalHy0JntM
 g0LRRrY4w/CpI2HW+JbLcxu97Cs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb027c0.7f3110055a78-smtp-out-n01;
 Mon, 04 May 2020 14:33:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8CC9C433F2; Mon,  4 May 2020 14:33:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 241A5C433CB;
        Mon,  4 May 2020 14:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 241A5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v4 8/8] bus: mhi: core: Ensure non-zero session or
 sequence ID values are used
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org
References: <1588386725-1165-1-git-send-email-bbhatt@codeaurora.org>
 <1588386725-1165-9-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <2a249d99-b1e7-7943-0ed4-d5529f7abc33@codeaurora.org>
Date:   Mon, 4 May 2020 08:33:34 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588386725-1165-9-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/1/2020 8:32 PM, Bhaumik Bhatt wrote:
> While writing any sequence or session identifiers, it is possible that
> the host could write a zero value, whereas only non-zero values should
> be supported writes to those registers. Ensure that the host does not
> write a non-zero value for them and also log them in debug messages.
> 
> Suggested-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/boot.c     | 15 +++++++--------
>   drivers/bus/mhi/core/internal.h |  1 +
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index e5fcde1..9fe9c59 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -43,10 +43,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>   		      lower_32_bits(mhi_buf->dma_addr));
>   
>   	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECSIZE_OFFS, mhi_buf->len);
> -	sequence_id = prandom_u32() & BHIE_RXVECSTATUS_SEQNUM_BMSK;
> -
> -	if (unlikely(!sequence_id))
> -		sequence_id = 1;
> +	sequence_id = (MHI_RANDOM_U32_NONZERO & BHIE_RXVECSTATUS_SEQNUM_BMSK);

I don't think this math works.  For example, if MHI_RANDOM_U32_NONZERO 
is 0x0FF0, and BHIE_RXVECSTATUS_SEQNUM_BMSK is 0xF, then sequence_id 
will end up being 0.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
