Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F100F24E8B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Aug 2020 18:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbgHVQXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Aug 2020 12:23:18 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:42525 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728414AbgHVQXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Aug 2020 12:23:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598113395; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FYhJMKEBU4SFBiKHH2BxM4N53QqRKVAxSvII5SnSWsw=; b=rp7htvJhkhD/DOuIR7aglPK1+faJy8FTzbvMPNrCNrYQ5IaN4SngmeL6OVQYVrvxabBgelRO
 3AcIOMV944RJemBdCBroCNq8uLpTq0Fi14vB8NixqbJezI4vPZQvLI3ey4/17PseyMkeWLu4
 B5jTlyyn/maL1JhORgSwfLPjkW0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f414671c1ce10a051518a43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Aug 2020 16:23:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 314FEC43391; Sat, 22 Aug 2020 16:23:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.0.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 29B4DC433C6;
        Sat, 22 Aug 2020 16:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29B4DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 2/2] Revert "Revert "soc: qcom: rpmh: Allow RPMH driver to
 be loaded as a module""
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>
References: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org>
 <1597831670-17401-3-git-send-email-mkshah@codeaurora.org>
 <159796512284.334488.2457174259443414342@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <739fd1bd-ebf0-8a1e-f737-5b11342ad72f@codeaurora.org>
Date:   Sat, 22 Aug 2020 21:53:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159796512284.334488.2457174259443414342@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/21/2020 4:42 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-08-19 03:07:50)
>> The _rcuidle tracepoints are removed from RPMH driver which prevented
>> to compile it as module. Bring back the change to make it module.
>>
>> This reverts commit 1f7a3eb785e4a4e196729cd3d5ec97bd5f9f2940.
>>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Todd Kjos <tkjos@google.com>
>> Cc: Saravana Kannan <saravanak@google.com>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
> Please send the original patch and add your SoB to it. Reverting a patch
> out of the history works, but doesn't do justice to the authorship of
> the patch.
Sure, i will re-send the original patch in v2 instead of doing revert's 
revert.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

