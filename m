Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DE7343DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 11:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCVK0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 06:26:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47161 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230187AbhCVK0e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 06:26:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616408794; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZyBltUAvGA9G5U2YS3mWpoc3+y7bJqF5DsIwIuzHFjA=; b=timZPYUkwaq62R4/i0R6o8+F8EFI8LRB0TYFQ1mP/zcNsOfpUQra+0eRuLgXK5TSmWIcNYim
 +QtXInU8cqMG1H7h+F9O7djEadYeg8MAMcNPrWcw5wNOOqGs9m8kT0pvMg0kQ3+xBth2otsF
 s7gAZWwERnYRwOq5VUK4vi/JFCw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 605870d921031618f6aae806 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Mar 2021 10:26:33
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90AC8C433ED; Mon, 22 Mar 2021 10:26:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.130] (unknown [49.36.69.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E434C433C6;
        Mon, 22 Mar 2021 10:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E434C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8350: Remove second reg from pdc
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
References: <1615958996-31807-1-git-send-email-mkshah@codeaurora.org>
 <87k0q6i1g5.wl-maz@kernel.org>
 <bce03166-e65b-198c-8b93-39e0c218aaed@codeaurora.org>
 <87czvxj2t9.wl-maz@kernel.org> <YFJFgvLQfr49EvWE@builder.lan>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <c7c801a1-701b-7c3a-43b0-9031076e2984@codeaurora.org>
Date:   Mon, 22 Mar 2021 15:56:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFJFgvLQfr49EvWE@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/17/2021 11:38 PM, Bjorn Andersson wrote:
> On Wed 17 Mar 09:02 CDT 2021, Marc Zyngier wrote:
>
>> On Wed, 17 Mar 2021 09:48:09 +0000,
>> Maulik Shah <mkshah@codeaurora.org> wrote:
>>> Hi Marc,
>>>
>>> On 3/17/2021 2:47 PM, Marc Zyngier wrote:
>>>> On Wed, 17 Mar 2021 05:29:54 +0000,
>>>> Maulik Shah <mkshah@codeaurora.org> wrote:
>>>>> PDC interrupt controller driver do not use second reg. Remove it.
>>>> This is a DT file, not a driver. What the driver does is irrelevant.
>>>>
>>>> The real question is: what does this range do?
>>>>
>>>> Thanks,
>>>>
>>>> 	M.
>>> This is to set interrupt type in SPI config for which there was a
>>> change [1] but has not gone in for upstream PDC driver.
>>>
>>> The second reg is not used in upstream PDC driver, probably when
>>> posting downstream DT changes for sm8350/sm8250 it was carried in
>>> device node as is.
>>>
>>> As its not mentioned in bindigs as well, dtbs_check reports it as
>>> additional reg when converted to yaml.
>> Then I'd rather you provide accurate documentation in the binding
>> rather than changing the DT files. Other operating systems may use it,
>> and it isn't unlikely that Linux could use the feature at some point.
>>
> I agree. Maulik, please update the DT binding to document this region as
> well.
sure. updated in v2.
>
>
> It also seems relevant to pursue getting [1] into the upstream Linux
> kernel. Is this something that you use downstream Maulik?

Yes its used in downstream. We can pursue to get [1] in.

Thanks,
Maulik

>
> Regards,
> Bjorn

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

