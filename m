Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573C22C1D58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 06:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgKXFWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 00:22:43 -0500
Received: from z5.mailgun.us ([104.130.96.5]:27339 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728661AbgKXFWn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 00:22:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606195362; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QCEbPZ+4NCyW03THEzwjMRu8R88TrrAsdg0fQA0QrN4=; b=pRdmKjEZ04lPifEFwga+yrfdiPLnFBjuqLcICJKEFFyu4GU4P0J4fH449sPWg6tvDpj2OJma
 g3QqCtDea/iTeoRbwBe0GBinBrfLcCjCUwdFMaiCRSGe1QJMnfFs67w4hxGIt0/jpaWyZ+yI
 6xWjAnRRTyXgoclcAtrcslHs5nA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fbc988e7e9d874dfc3d7caa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 05:22:22
 GMT
Sender: neeraju=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C0C24C433ED; Tue, 24 Nov 2020 05:22:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [49.206.49.183])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: neeraju)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CEA9C433ED;
        Tue, 24 Nov 2020 05:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CEA9C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=neeraju@codeaurora.org
Subject: Re: AMU extension v1 support for cortex A76, A77, A78 CPUs
To:     Mark Rutland <mark.rutland@arm.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Marc Zyngier <maz@kernel.org>, sudeep.holla@arm.com
Cc:     suzuki.poulose@arm.com, ionela.voinescu@arm.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, catalin.marinas@arm.com,
        Will Deacon <will@kernel.org>, valentin.schneider@arm.com,
        linux-arm-kernel@lists.infradead.org
References: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
 <1712842eb0767e51155a5396d282102c@kernel.org>
 <e15de351-63c1-2599-82bf-22c95e8a6a62@arm.com>
 <20201120101249.GA2328@C02TD0UTHF1T.local>
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
Message-ID: <8606d7f9-bd3d-c825-3f38-d48879be59f9@codeaurora.org>
Date:   Tue, 24 Nov 2020 10:52:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120101249.GA2328@C02TD0UTHF1T.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Marc, Vladimir, Mark, Sudeep for your inputs!


Thanks
Neeraj


On 11/20/2020 3:43 PM, Mark Rutland wrote:
> On Fri, Nov 20, 2020 at 09:09:00AM +0000, Vladimir Murzin wrote:
>> On 11/20/20 8:56 AM, Marc Zyngier wrote:
>>> On 2020-11-20 04:30, Neeraj Upadhyay wrote:
>>>> Hi,
>>>>
>>>> For ARM cortex A76, A77, A78 cores (which as per TRM, support AMU)
>>>> AA64PFR0[47:44] field is not set, and AMU does not get enabled for
>>>> them.
>>>> Can you please provide support for these CPUs in cpufeature.c?
>>>
>>> If that was the case, that'd be an erratum, and it would need to be
>>> documented as such. It could also be that this is an optional feature
>>> for these cores (though the TRM doesn't suggest that).
>>>
>>> Can someone at ARM confirm what is the expected behaviour of these CPUs?
>>
>> Not a confirmation, but IIRC, these are imp def features, while our cpufeatures
>> catches architected one.
> 
> We generally don't make use of IMP-DEF featurees because of all the pain
> it brings.
> 
> Looking at the Cortex-A76 TRM, the encoding for AMCNTENCLR is:
> 
>   Op0: 3  (0b11)
>   Op1: 3  (0b011)
>   CRn: 15 (0b1111)
>   CRm: 9  (0b1001)
>   Op2: 7  (0b111)
> 
> ... whereas the architected encoding (from our sysreg.h) is:
> 
>   Op0: 3
>   Op1: 3
>   CRn: 13
>   CRm: 2
>   Op2: 4
> 
> ... so that's a different register with the same name, which is
> confusing and unfortunate.
> 
> The encodings are different (and I haven't checked whether the fields /
> semantics are the same), so it's not just a matter of wiring up new
> detection code. There are also IMP-DEF traps in ACTLR_EL3 and ACTLR_EL2
> which we can't be certain of the configuration of, and as the registers
> are in the IMP-DEF encoding space they'll be trapped by HCR_EL2.TIDCP
> and emulated as UNDEFINED by a hypervisor. All of that means that going
> by the MIDR alone is not sufficient to know we can safely access the
> registers.
> 
> So as usual for IMP-DEF stuff I don't think we can or should make use of
> this.
> 
> Thanks,
> Mark.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of the Code Aurora Forum, hosted by The Linux Foundation
