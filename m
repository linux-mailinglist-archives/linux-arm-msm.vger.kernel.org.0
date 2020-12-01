Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E54C2CA9BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 18:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391226AbgLARb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 12:31:57 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:35714 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391170AbgLARb5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 12:31:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606843891; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=K1x8lx2ayye4/N0xNELnpa6CNM0J4yfcDBWhh1G+S30=; b=HU4NMe6GdV6EjCdkTpBQF4JRT/lgGkFQTEh+joUSqPwlWRvVl42YJ5juQv/71DqpLzWxS0NI
 jp+Hh0LglLgUUDt20XcZBKcNyI/YFUaBmXdaBySiYPqcCe0O5NMoTItRcvSDoim5PIWHn9YR
 v3xc8mxZ265gNixlEtpDA3vScEM=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fc67df3edac2724d86d40e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 17:31:31
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0547DC43462; Tue,  1 Dec 2020 17:31:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [172.20.10.2] (unknown [27.59.188.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47E31C43460;
        Tue,  1 Dec 2020 17:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47E31C43460
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
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
Date:   Tue, 1 Dec 2020 23:01:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130124617.GC4756@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Mark for your time!!!

On 11/30/2020 6:16 PM, Mark Brown wrote:
> On Sat, Nov 28, 2020 at 10:29:18AM +0530, Srinivasa Rao Mandadapu wrote:
>> This reverts part of commit b1824968221c
>> ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")
>>
>> To identify LPAIF invalid state after device suspend and resume,
>> made I2S and DMA control registers not volatile, which is not necessary.
>> Instead invalid reg state can be handled with regcache APIs.
>> The BCLK ref count is necessary to enable clock only it's in disable state.
> Part of this commit message says that the problem was making the registers
> non-volatile but both the change and the rest of the commit message say
> that the issue was that the registers were made volatile.  I'm also
> still unclear as to what the issue is either way - how does reading the
> state of the registers from the hardware instead of the cache affect
> things?

Initial problem was, during playback if device suspended, I2S and DMA 
control registers

are getting reset and unable to recover playback after resume.

As these registers were non volatile registers, driver is not getting 
actual register value

and unable to report error state to application. Due to this application

keeps on polling for HW current pointer state and not exited from PCM 
running state.

To handle this scenario I made registers volatile and if they are in 
reset state, reported error

to application(commit b1824968221c).

Later from review comments by Srinivas kandagatla, I got to know

about regcache sync APIs, which can be used  to sync cache after resume and

HW registers can be updated with  original values. With that playback 
can be continued.

So is the reason, I am reverting partial changes in the commit b1824968221c.


> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

