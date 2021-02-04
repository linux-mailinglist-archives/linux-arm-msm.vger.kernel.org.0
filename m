Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3EA30FE39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 21:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240138AbhBDU0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 15:26:13 -0500
Received: from so15.mailgun.net ([198.61.254.15]:15089 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240136AbhBDU0G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 15:26:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612470342; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aFOWeFi3IS08rxJKTo2W64G531wG+PZXsDN7FwtCiRI=;
 b=EP7jcQKxnw1nWV/0f3ql3llcDs8zai7f2iOho8iIn2RlAG2vST1qY54Bp0eUqBEuwvZGJj9c
 5gieIlQyRR83wGuQ+3ke8abOF8ZQ/g7J4zADk9Giw5d+6wFYDhD/uwp+Z5l0TB0tKTyVMyE5
 dtLzEZY2qyJBT7epd8zb4GQczdQ=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 601c5841e3df861f4b53ed79 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 20:25:37
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46F30C433ED; Thu,  4 Feb 2021 20:25:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07E47C433CA;
        Thu,  4 Feb 2021 20:25:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Feb 2021 12:25:35 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 5/9] bus: mhi: core: Add support to stop or start
 channel data transfers
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210121145018.GC5473@work>
References: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
 <1610139297-36435-6-git-send-email-bbhatt@codeaurora.org>
 <20210121145018.GC5473@work>
Message-ID: <2f162288373c22062b448630b4185774@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-21 06:50 AM, Manivannan Sadhasivam wrote:
> On Fri, Jan 08, 2021 at 12:54:53PM -0800, Bhaumik Bhatt wrote:
>> Some MHI client drivers may want to request a pause or halt of
>> data transfer activity on their channels. Support for this does
>> not exist and must be introduced, wherein the channel context is
>> not reset or cleared but only the STOP channel command is issued.
>> This would need to be paired with an API that allows resuming the
>> data transfer activity on channels by use of the START channel
>> command. This API assumes that the context information is already
>> setup. Enable this using two new APIs, mhi_start_transfer() and
>> mhi_stop_transfer().
>> 
> 
> Do you have any user for these APIs? If not then please post it when 
> one
> is available.
> 
> Thanks,
> Mani
I will be dropping this patch in upcoming v6 series.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
