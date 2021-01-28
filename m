Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228B8306F9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 08:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhA1Heh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 02:34:37 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:57755 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231878AbhA1Hc2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 02:32:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611819132; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tOwx9ySemA2pZ8ZeH5+WX2oWlYQS0p0fzZnS0NMhwKY=;
 b=Fw2kJ/yezY6VAtdRIUGlLKp3I7o9heQKPxf4kds0yFa5uoFau8tXOl3yKSs4FymfwQ6bFAh9
 tiMlxdzrZ2M8Xe1XEMFzfb5AwUy886ISwEbWTvzUggtvdWBlJy9nDqF1wrQMLeo4ZweY46aM
 QlHQIhP28ww69BaO+NkTLIZLA9c=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6012685e262adddd45401421 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 07:31:42
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 51072C433ED; Thu, 28 Jan 2021 07:31:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D967EC433C6;
        Thu, 28 Jan 2021 07:31:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 28 Jan 2021 13:01:41 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add basic devicetree support for
 SM8350 SoC
In-Reply-To: <20210127153307.GC2771@vkoul-mobl>
References: <20210127123054.263231-1-vkoul@kernel.org>
 <20210127123054.263231-6-vkoul@kernel.org>
 <194d2ebe26a9420f842c97738adb0443@codeaurora.org>
 <20210127153307.GC2771@vkoul-mobl>
Message-ID: <bd1b9a6eeec94577e14d5c89c23ce9df@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On 2021-01-27 21:03, Vinod Koul wrote:
> Hi Sai,
> 
> On 27-01-21, 18:37, Sai Prakash Ranjan wrote:
>> Hi Vinod,
>> 
>> On 2021-01-27 18:00, Vinod Koul wrote:
> 
>> > +	timer {
>> > +		compatible = "arm,armv8-timer";
>> > +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) |
>> > IRQ_TYPE_LEVEL_LOW)>,
>> > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> > +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>> 
>> The last interrupt should be hypervisor physical interrupt(10) not 
>> 12(hyp
>> virtual).
>> It works currently with android bootloaders because the host linux 
>> kernel
>> will run
>> at EL1 and will use EL1 physical timer interrupt(14), but if we ever 
>> have
>> the host
>> kernel run in EL2(for example, chrome) then we will not receive any 
>> timer
>> interrupts.
> 
> I got these values from downstream and used them as is. I will update
> and also check documentation. Thanks for pointing out

Yes looks like lot of SoC dtsi entries in downstream got it wrong.
I see upstream sm8250 also missed this. We learnt it the hard way
spending lot of time debugging why we are not able to reach the
console(because no timer interrupts) during bringup on a system
with kernel running in EL2(with VHE). I will try to reach out to
baseport guys to make sure they take care of it in future.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
