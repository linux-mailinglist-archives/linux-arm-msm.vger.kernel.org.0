Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B479AEFA38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 10:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730571AbfKEJ4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 04:56:54 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:35140 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfKEJ4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 04:56:53 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2676061013; Tue,  5 Nov 2019 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572947813;
        bh=NcLd2Rk71BMU372HX0VmNVk5C2EEg2yC9K68DL5K5nw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SFqRFPkYo3x4bKKxH4vitQ6UIV3/XEiMGSg7PoLAFRAspnow67VBX+P4q+iRPH9My
         VApRSEwSpYxU+XMRRINh/k99jovpv0mUm0ZgQds/XYUyOBEHlKS5hsOrfaw6sqZBUs
         3A7QCC24XItjYBn/+1QMjcYgfsFQ9h/tq21E0TbM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A28D607EF;
        Tue,  5 Nov 2019 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572947812;
        bh=NcLd2Rk71BMU372HX0VmNVk5C2EEg2yC9K68DL5K5nw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dVysDF0iYvrVqxaJTrTEZ1q82FBn1TdjGv7toSAlPIwG7h81Mm1yKSwUv/PXJIQHv
         gnwgue/m6Z271EcMkNjgUauFJI3/w0IPloxO039hvGK4tk0sTJFXdVHbYVxhAb3qsc
         /+dBG6iEPbfsIOGrAOA0vQZgtmyMgs3whnOsQfuc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A28D607EF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 2/2] tty: serial: qcom_geni_serial: Wakeup over UART RX
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org
References: <1570700803-17566-1-git-send-email-akashast@codeaurora.org>
 <5d9f3f4f.1c69fb81.5120f.b90e@mx.google.com>
 <a7dabb1d-b6af-acc5-ba4e-923ee5fc6ee3@codeaurora.org>
 <5da627aa.1c69fb81.e2d51.203d@mx.google.com>
 <c20319ce-77e2-a4ea-5d7a-a84b8858a938@codeaurora.org>
 <5db70280.1c69fb81.c9f08.a848@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <454445c2-635e-83fa-50d8-b5e2a24dd466@codeaurora.org>
Date:   Tue, 5 Nov 2019 15:26:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5db70280.1c69fb81.c9f08.a848@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/28/2019 8:30 PM, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-10-17 04:10:10)
>> On 10/16/2019 1:40 AM, Stephen Boyd wrote:
>>> Why can't we make this driver use runtime PM?
>> Currently there are no plans to use runtime PM as we are interested in
>> enabling wakeup irq as part of system suspend only.
>>
>>
> Does the wakeup irq code require runtime PM? I thought that any wake irq
> attached to a device is armed during system wide suspend and disabled on
> resume. See device_wakeup_arm_wake_irqs() called from
> dpm_suspend_noirq().
>
> So why can't we use the common code that manages wakeup irqs for
> devices?

After reading about device_wakeup_arm_wake_irqs() and 
dpm_suspend_noirq() APIs it's clear to me

that we don't require runtime PM feature. We have now aligned our driver 
to use common code that manages

wakeup irqs for devices.

Thanks for suggesting this changes!

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

