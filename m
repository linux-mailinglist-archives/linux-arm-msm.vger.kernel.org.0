Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824BD2DCD7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 09:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgLQIPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 03:15:50 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:56518 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgLQIPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 03:15:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608192926; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Vl15HlNa4mtXvZ1I16t5kCLv5QtQ8BV4wsxKyd1mo5E=; b=KAvF6knA0On4i/Soxdfwy1QVFs4PxgHH3PRkW9TWqdDGIonmCFYNHGKgrDR5K/qUhYjwuR1g
 9e6cvIN5wnv+TIauWZ2YknacqqH4rMLr+oW5SonJTbBqPD1u67qFo8nP8rbwzOjWxy2IGpwj
 tn8/oHeMv4qF02SB+pLg/p7VQac=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fdb1379944e4d244792fae4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 08:14:49
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A566BC43465; Thu, 17 Dec 2020 08:14:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.252.214.131] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF250C433C6;
        Thu, 17 Dec 2020 08:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF250C433C6
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
 <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
 <20201214175009.GD4880@sirena.org.uk>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <043ecf21-bf1c-8a32-f079-a526dfc90b6e@codeaurora.org>
Date:   Thu, 17 Dec 2020 13:44:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214175009.GD4880@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Mark for your Time!!!

On 12/14/2020 11:20 PM, Mark Brown wrote:
> On Mon, Dec 14, 2020 at 06:13:22PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 12/1/2020 11:21 PM, Mark Brown wrote:
>>>> Later from review comments by Srinivas kandagatla, I got to know
>>>>
>>>> about regcache sync APIs, which can be used  to sync cache after resume and
>>>>
>>>> HW registers can be updated with  original values. With that playback can be
>>>> continued.
>>>> So is the reason, I am reverting partial changes in the commit b1824968221c.
>>> I don't understand why a fix for the register cache not being in sync
>>> with the hardware doesn't involve syncing the register cache with the
>>> hardware.
>> I am sorry I couldn't understand your point. Could you please elaborate your
>> query?
> Your changelog talks about syncing the cache but neither the driver nor
> your change actually does that.

Yeah.. Now I posted v6 patch 
(https://lore.kernel.org/patchwork/patch/1354638/)

with subject lines explaining actual changes.

could you please check  the same.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

