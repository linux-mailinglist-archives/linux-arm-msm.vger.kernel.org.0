Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F1731FF3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 20:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhBSTON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 14:14:13 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:37828 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229762AbhBSTOM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 14:14:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613762029; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lhn8TVO1gUI2MG+vp5dxOFczztpu4wvavm9jaFIgGO4=;
 b=mOl3voPGl6EMN/zSShUc5/iPm2w1FrB/4YVyzY5Lo0cGTO7PRS0CdFEzinOsuHJyDdOVFKip
 E0th7Nv3rd9wbvqw5qjlCfU+uAtHvX034Ye9zSTD+a0poB4fQF/hvIFnBX5mHM/NF+yOgO6s
 9a+Z9rbb1GJ5FGegohcKxFaiKjg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60300dcc37f02eb71442a756 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 19:13:16
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD4F8C43461; Fri, 19 Feb 2021 19:13:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DF40C433C6;
        Fri, 19 Feb 2021 19:13:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Feb 2021 11:13:16 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, jhugo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v4 1/3] bus: mhi: core: Clear devices when moving
 execution environments
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <3b3476ff-3126-097a-5d1b-130ac570cce6@codeaurora.org>
References: <1613701052-38885-1-git-send-email-bbhatt@codeaurora.org>
 <1613701052-38885-2-git-send-email-bbhatt@codeaurora.org>
 <3b3476ff-3126-097a-5d1b-130ac570cce6@codeaurora.org>
Message-ID: <f031ea65fa4eecb97d4b7a21ac7e52af@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-19 08:10 AM, Jeffrey Hugo wrote:
> On 2/18/2021 7:17 PM, Bhaumik Bhatt wrote:
>> When moving from SBL to mission mode execution environment, there
>> is no remove callback notification to MHI client drivers which
>> operate on SBL mode only. Client driver devices are being created
>> in SBL or AMSS(mission mode) and only destroyed after power down
>> or SYS_ERROR. If there exist any SBL-specific channels, those are
>> left open and client drivers are thus unaware of the new execution
>> environment where those channels cannot operate. Close the gap and
>> issue remove callbacks to SBL-specific client drivers once device
>> enters mission mode.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
> 
> I like the idea, but I question where this is limited to the
> transition to mission mode.  Feels like something that should occur on
> all EE changes.  We might not have a current usecase that is outside
> what you've implemented here, but I don't think there is anything
> preventing that in future.

You're right. It should not be limited to any single EE transition and 
that's
how the code is written. I see my commit message gives the impression 
that it's
only for SBL -> AMSS. I can correct that and mention it to be EE 
transition
agnostic with SBL to AMSS as the currently usable example.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
