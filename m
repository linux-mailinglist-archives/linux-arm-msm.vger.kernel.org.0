Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5058D49F278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 05:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbiA1EZK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 23:25:10 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:17775 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiA1EZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 23:25:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1643343909; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=sGRYfm9zjSs8NIE4YgHz6D1qO6Z0hrHxKVC1Yjok+H8=; b=u2/BdM5RS1dKSlStlHEfwyJS0zkwnyLuWr4VPOz0ZLJF+sCKDLVPwoGMek8eQ55WnLIy3FLB
 dejhz8VNrWgT9cCxsgTVLMBr5uo+J4TTw9283+w1SGmhEo9q6+H+RvNKcIHOQWIuibo1vJ+O
 BMn+puQPN5lr0uxg1miKITHP0Pc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61f37025d2de5dba98245d1f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 Jan 2022 04:25:09
 GMT
Sender: sricharan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 055A7C43635; Fri, 28 Jan 2022 04:25:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.104] (unknown [183.82.28.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E64C8C4338F;
        Fri, 28 Jan 2022 04:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E64C8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mdalam@codeaurora.org
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad> <20220126114200.4cc3c21b@xps13>
From:   Sricharan Ramabadhran <sricharan@codeaurora.org>
Message-ID: <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
Date:   Fri, 28 Jan 2022 09:55:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20220126114200.4cc3c21b@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Miquel,

On 1/26/2022 4:12 PM, Miquel Raynal wrote:
> Hi Mani,
>
> mani@kernel.org wrote on Wed, 26 Jan 2022 16:03:16 +0530:
>
>> On Wed, Jan 26, 2022 at 11:16:13AM +0100, Miquel Raynal wrote:
>>> Hello,
>>>
>>> miquel.raynal@bootlin.com wrote on Fri, 14 Jan 2022 08:27:18 +0100:
>>>    
>>>> Hi Konrad,
>>>>
>>>> konrad.dybcio@somainline.org wrote on Thu, 13 Jan 2022 19:44:26 +0100:
>>>>    
>>>>> While I have absolutely 0 idea why and how, running clear_bam_transaction
>>>>> when READID is issued makes the DMA totally clog up and refuse to function
>>>>> at all on mdm9607. In fact, it is so bad that all the data gets garbled
>>>>> and after a short while in the nand probe flow, the CPU decides that
>>>>> sepuku is the only option.
>>>>>
>>>>> Removing _READID from the if condition makes it work like a charm, I can
>>>>> read data and mount partitions without a problem.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>>>> ---
>>>>> This is totally just an observation which took me an inhumane amount of
>>>>> debug prints to find.. perhaps there's a better reason behind this, but
>>>>> I can't seem to find any answers.. Therefore, this is a BIG RFC!
>>>> I'm adding two people from codeaurora who worked a lot on this driver.
>>>> Hopefully they will have an idea :)
>>> Sadre, I've spent a significant amount of time reviewing your patches,
>>> now it's your turn to not take a month to answer to your peers
>>> proposals.
>>>
>>> Please help reviewing this patch.
>>>    
>> Sorry. I was hoping that Qcom folks would chime in as I don't have any idea
>> about the mdm9607 platform. It could be that the mail server migration from
>> codeaurora to quicinc put a barrier here.
>>
>> Let me ping them internally.
> Oh, ok, I didn't know. Thanks!

    Sorry Miquel, somehow we did not get this email in our inbox.
    Thanks to Mani for pinging us, we will test this up today and get back.

Regards,
    Sricharan

