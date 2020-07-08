Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD2E218555
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 12:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgGHK55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 06:57:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19709 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728349AbgGHK55 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 06:57:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594205876; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=XH6S1HvL7E7qoaCSA4Oa2h+z4LdFnJsuWn/J2aZDrbY=; b=iYtUxZGoH8wFbVFRKZCE46dpz2TmrATa8EA02mQPemff78bZZGgdNgcwlVoK0yWu/sAxbg1g
 R5BoJAyOxY9xvzhn1YuAfw1vNtJ5qGgEIE2o40NRGS84pU9kqSInzLNW6slmhTXsnW04nQqH
 fuk22RqtUih+5IzwleR36qnRqAQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f05a6b355886724ffb1047d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 10:57:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 605EFC43391; Wed,  8 Jul 2020 10:57:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.129] (unknown [183.83.142.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C084C433C8;
        Wed,  8 Jul 2020 10:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7C084C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [RESEND][PATCH v3 7/8] ASoC: qcom: lpass-sc7180: Add platform
 driver for lpass audio
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org,
        plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
        robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        srinivas.kandagatla@linaro.org, Ajit Pandey <ajitp@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <1594185286-11323-1-git-send-email-rohitkr@codeaurora.org>
 <20200708103301.GG4655@sirena.org.uk>
From:   Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <e7986896-3ffd-f565-7590-0638eb6f7641@codeaurora.org>
Date:   Wed, 8 Jul 2020 16:27:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708103301.GG4655@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/8/2020 4:03 PM, Mark Brown wrote:
> On Wed, Jul 08, 2020 at 10:44:46AM +0530, Rohit kumar wrote:
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> Add platform driver for configuring sc7180 lpass core I2S and
>> DMA configuration to support playback & capture to external codecs
>> connected over primary & secondary MI2S interfaces.
> I only have patch 7 here, no other patches or cover letter.  What is
> going on?

Hello Mark,

Sorry for the confusion. I posted complete patchset and resend only 7th 
patch as

it had invalid mail id in Signed-off. I should have probably updated it 
in Patch v4.

Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

