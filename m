Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E7B1DEEA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 19:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730817AbgEVRtp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 13:49:45 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:31598 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730798AbgEVRtn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 13:49:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590169782; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kBMBarMq60G2rfz2ZQoGG77PVjZaTssIIV2wPk/2GhU=; b=w6zRUzPULiO/Di2lIkX/k8blX4svfYQ75QaqT9C6aCWsnY8q8f+pgeqZej1jBlKEYp4V0e52
 FUvJZoJe1JME6VoOUxRYPtGsvwYJsGvfmmsAOmj+zKvEoKiY6MIzWxO2XTd5oDItyiO2Uito
 8QrGJMZEUszee1TE6FXo5H3Epsw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ec810a7807c16b83944ecc9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 17:49:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3DC2C433CB; Fri, 22 May 2020 17:49:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.64.235] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4851CC433C6;
        Fri, 22 May 2020 17:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4851CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v2 0/3] Re-introduce TX FIFO resize for larger EP bursting
To:     Felipe Balbi <balbi@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
References: <1590050169-30747-1-git-send-email-wcheng@codeaurora.org>
 <87o8qgwazy.fsf@kernel.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <e814d3fc-1e6f-c7f7-7483-1cf06184cfdb@codeaurora.org>
Date:   Fri, 22 May 2020 10:49:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87o8qgwazy.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/22/2020 2:54 AM, Felipe Balbi wrote:
> Wesley Cheng <wcheng@codeaurora.org> writes:
> 
>> Changes in V2:
>>  - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>>    FIFO.
>>  - Removed dev_dbg() prints and fixed typos from patches
>>  - Added some more description on the dt-bindings commit message
>>
>> Reviewed-by: Felipe Balbi <balbi@kernel.org>
> 
> I don't remember giving you a Reviewed-by, did I?
> 

Hi Felipe,

Sorry, I put the Reviewed-by tag by mistake, I sent a follow up email to
disregard the tags.  If you need me to resubmit the patch series
version, please let me know.  Thanks!

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
