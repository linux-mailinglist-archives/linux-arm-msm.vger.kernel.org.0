Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C26731FCD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 17:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhBSQLM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 11:11:12 -0500
Received: from z11.mailgun.us ([104.130.96.11]:14974 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229767AbhBSQLL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 11:11:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613751052; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7ZuDOC16WFXeHrlAiwdEtHp1HAj1cxOU733fDvCOiy8=; b=BrAHAGrmC4lp8+Rkrn/JhjFEP3ALfdavoTbPtgnKozpfiWJPA80WIDGQxOE70DR5d/pOrbDw
 nZfCD/+A0vJX7S8RBNoYtReLAVcJGLzJRHXNMNjzycPeT7f91u+cxafAd+g7uGim91paSGGs
 Ok/1F5mMlbA1bbDF7REaGd+R87Y=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 602fe2e6e87943df301bb8b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 16:10:14
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE4B9C43464; Fri, 19 Feb 2021 16:10:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94A14C433ED;
        Fri, 19 Feb 2021 16:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94A14C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v4 1/3] bus: mhi: core: Clear devices when moving
 execution environments
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
References: <1613701052-38885-1-git-send-email-bbhatt@codeaurora.org>
 <1613701052-38885-2-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <3b3476ff-3126-097a-5d1b-130ac570cce6@codeaurora.org>
Date:   Fri, 19 Feb 2021 09:10:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613701052-38885-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/18/2021 7:17 PM, Bhaumik Bhatt wrote:
> When moving from SBL to mission mode execution environment, there
> is no remove callback notification to MHI client drivers which
> operate on SBL mode only. Client driver devices are being created
> in SBL or AMSS(mission mode) and only destroyed after power down
> or SYS_ERROR. If there exist any SBL-specific channels, those are
> left open and client drivers are thus unaware of the new execution
> environment where those channels cannot operate. Close the gap and
> issue remove callbacks to SBL-specific client drivers once device
> enters mission mode.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

I like the idea, but I question where this is limited to the transition 
to mission mode.  Feels like something that should occur on all EE 
changes.  We might not have a current usecase that is outside what 
you've implemented here, but I don't think there is anything preventing 
that in future.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
