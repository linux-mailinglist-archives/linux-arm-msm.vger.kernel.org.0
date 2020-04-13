Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9521A676F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 16:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730230AbgDMOCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 10:02:40 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:24659 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730218AbgDMOCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 10:02:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586786558; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=N0n8kdCEFen4uzBPsMM4YzWOmJWKxXpHF1vXpG7UtR0=; b=N7kn2goGi8J7knyS9zzfaD3UVOhh4BGyWtwroSrXp7H+gihViKqBbbNg6O8cGRWBdpuzNSpu
 szXtruqXZamz9XeRVvg5qespdF/hyBvunUIffyZ4Y78ruCDoEv35BG3Y6fxIJ4+RwoHy4kam
 bP3axkbOr0Brtdr1WQf0MbSeGQA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9470c2.7fc7948a5d50-smtp-out-n04;
 Mon, 13 Apr 2020 14:01:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E20D4C432C2; Mon, 13 Apr 2020 14:01:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15E67C433F2;
        Mon, 13 Apr 2020 14:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15E67C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 1/5] bus: mhi: core: Handle syserr during power_up
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bhaumik Vasav Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
 <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
 <1768ba6e-12c2-7b4f-0f17-44fecc6473b9@codeaurora.org>
 <11d9f35b-b911-7985-8846-0a45904ceed1@codeaurora.org>
 <5c4efe13-42a4-e802-4070-5d9d30b8cac2@codeaurora.org>
 <79feeb0b-0837-c5b6-087d-856c3e238c67@codeaurora.org>
 <20200413133447.GA19124@Mani-XPS-13-9360>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <ee51ae8f-5826-5402-9178-3f2fba1358f8@codeaurora.org>
Date:   Mon, 13 Apr 2020 08:01:36 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200413133447.GA19124@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/13/2020 7:34 AM, Manivannan Sadhasivam wrote:
> On Fri, Apr 10, 2020 at 03:39:57PM -0600, Jeffrey Hugo wrote:
>> On 4/10/2020 2:37 PM, Bhaumik Vasav Bhatt wrote:
>>> Hi Jeff,
>>>
>>> We will always have the mhi_intvec_handler registered and trigger your
>>> wake_up state event when you write MHI RESET. BHI INTVEC IRQ using
>>> mhi_cntrl->irq[0] is _not_ unregistered once you enter AMSS EE.
>>
>> I understand it is not unregistered.  However mhi_cntrl->irq[0] may be
>> reserved for BHI, and thus only exercised by PBL EE.  Where as,
>> mhi_cntrl->irq[1..N] may be only exercised by AMSS EE. mhi_intvec_handler is
>> not called in response to mhi_cntrl->irq[1..N].
>>
>> Additionally, I re-reviewed the MHI spec, and I don't see where the spec
>> requires the device to issue an interrupt upon completion of the RESET
>> request.
>>
>> Under section 3.5, step 11 states -
>>
>> "The host must poll for the value of the RESET bit to detect the completion
>> of the reset procedure by the device (RESET is set to 0)."
>>
> 
> If this is the scenario then we need to change all of the wait_event_timeout()
> implementation for MHI RESET in current stack to polling.
> 
> Or the interrupt generation is not defined in spec (sheet) but part of the
> existing implementation?

It probably could be considered part of the existing implementation, but 
I'd like to hear from Hemant/Bhaumik.  Wherever we end up, I'd like to 
have the spec match.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
