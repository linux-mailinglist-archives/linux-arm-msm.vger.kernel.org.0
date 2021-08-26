Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4603F8F46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 21:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbhHZTzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 15:55:49 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58352 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhHZTzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 15:55:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630007701; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EXwBrTAGYH3RRb4lnABv9qAlkU3sSh0tGVtUJ78yQY0=; b=JL5zxwl9xo8IHlPfVb7Lax64UgjWGmh1GuqrKTo6RtYF4ySdEOgIbHOAP/bUFCspiN8j7Omh
 7JjAWcXTHbxpnmO9sgrMyAE/UU2mX4MTlCo/c/PA4LS9BQW1iHrNm2HPxYwXdiw71MNoHOhG
 KqtH2Fmx2lBiP/R09LSOmMK57SM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6127f186d6653df767d408b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 19:54:46
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F39AC4360C; Thu, 26 Aug 2021 19:54:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.9] (cpe-76-176-73-171.san.res.rr.com [76.176.73.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32E43C4338F;
        Thu, 26 Aug 2021 19:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 32E43C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Use cached values for calculating the
 shared write pointer
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, mani@kernel.org,
        bbhatt@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1629997263-11147-1-git-send-email-quic_jhugo@quicinc.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <30921a2b-1cd0-bbaa-83e1-c414d321493e@codeaurora.org>
Date:   Thu, 26 Aug 2021 12:54:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1629997263-11147-1-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/26/2021 10:01 AM, Jeffrey Hugo wrote:
> mhi_recycle_ev_ring() computes the shared write pointer for the ring
> (ctxt_wp) using a read/modify/write pattern where the ctxt_wp value in the
> shared memory is read, incremented, and written back.  There are no checks
> on the read value, it is assumed that it is kept in sync with the locally
> cached value.  Per the MHI spec, this is correct.  The device should only
> read ctxt_wp, never write it.
> 
> However, there are devices in the wild that violate the spec, and can
> update the ctxt_wp in a specific scenario.  This can cause corruption, and
> violate the above assumption that the ctxt_wp is in sync with the cached
> value.
> 
> This can occur when the device has loaded firmware from the host, and is
> transitioning from the SBL EE to the AMSS EE.  As part of shutting down
> SBL, the SBL flushes it's local MHI context to the shared memory since
> the local context will not persist across an EE change.  In the case of
> the event ring, SBL will flush its entire context, not just the parts that
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
> The reason the ctxt_wp goes off the end of the ring is that the rollover
> check is only performed on the cached wp, which is out of sync with
> ctxt_wp.
> 
> Since the host is the authority of the value of ctxt_wp per the MHI spec,
> we can fix this issue by not reading ctxt_wp from the shared memory, and
> instead compute it based on the cached value.  If SBL corrupts ctxt_wp,
> the host won't observe it, and will correct the value at some point later.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

LGTM

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
