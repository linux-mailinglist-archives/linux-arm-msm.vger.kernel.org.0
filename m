Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22822D9833
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 13:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439070AbgLNMoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 07:44:32 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:41129 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439073AbgLNMo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 07:44:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607949846; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EtLiKOSmtdxM3lPu08opt0J1Uv63PkkfxPsuqDSZOg4=; b=rELoNDP+SZfNRBagkq/JpV9dhHcvFkwwHqTqANrFNNoBjcZgdm95Rytlatp4HFPcJC94dUiG
 56st+NjWA4ra/LgQLzn6L2rVlHMpXvN5cjxrBtU4bU+sH8BKutuKP/0cGX/uvREZh5jXr6OW
 cTuCtpTkILtYMlDVJbas/PR6QDA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fd75df489d385446809c847 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Dec 2020 12:43:32
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AFC0AC43465; Mon, 14 Dec 2020 12:43:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.242.141.31] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72E11C433C6;
        Mon, 14 Dec 2020 12:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72E11C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK and
 LRCLK in LPAIF invalid state
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
 <20201130124617.GC4756@sirena.org.uk>
 <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
 <20201201175135.GO5239@sirena.org.uk>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
Date:   Mon, 14 Dec 2020 18:13:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201175135.GO5239@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Mark for Your time!!!

On 12/1/2020 11:21 PM, Mark Brown wrote:
> On Tue, Dec 01, 2020 at 11:01:21PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 11/30/2020 6:16 PM, Mark Brown wrote:
>>> Part of this commit message says that the problem was making the registers
>>> non-volatile but both the change and the rest of the commit message say
>>> that the issue was that the registers were made volatile.  I'm also
>>> still unclear as to what the issue is either way - how does reading the
>>> state of the registers from the hardware instead of the cache affect
>>> things?
>> Initial problem was, during playback if device suspended, I2S and DMA
>> control registers
>> are getting reset and unable to recover playback after resume.
>> As these registers were non volatile registers, driver is not getting actual
>> register value
>> and unable to report error state to application. Due to this application
>> keeps on polling for HW current pointer state and not exited from PCM
>> running state.
>> Later from review comments by Srinivas kandagatla, I got to know
>>
>> about regcache sync APIs, which can be used  to sync cache after resume and
>>
>> HW registers can be updated with  original values. With that playback can be
>> continued.
>>
>> So is the reason, I am reverting partial changes in the commit b1824968221c.
> I don't understand why a fix for the register cache not being in sync
> with the hardware doesn't involve syncing the register cache with the
> hardware.

I am sorry I couldn't understand your point. Could you please elaborate 
your query?

Actually I posted V5 version based on review comments.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

