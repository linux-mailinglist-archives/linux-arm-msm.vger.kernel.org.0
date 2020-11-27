Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF332C6B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 19:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732609AbgK0SLI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 13:11:08 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:53420 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732842AbgK0SLH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 13:11:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606500667; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TRj2b3zaWIGpxbrpXmMlLZehi8nG8Ts5IWw/ya6tEM4=; b=eyf4OWR0eOH5CQGA2sVV3+G6LTBLmz9mAjpxbt13mUp9J8/uUi/eCUOrR1yFV7N7ko5roj9P
 dNdFRyOPRhQbWF4/C7+eYbHUINrA4/eDgE4wfYFsS/H1PYWoCMQ3Gdqzw5D5FwA/ShpmD56y
 XwawikYMzRmj8RJSQEFPGwEqUu4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fc14137a5c560669c1f4469 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 18:11:03
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FF3EC433C6; Fri, 27 Nov 2020 18:11:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [172.20.10.2] (unknown [27.59.128.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 90E95C433C6;
        Fri, 27 Nov 2020 18:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 90E95C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] Asoc: qcom: Fix for problem in resume with CRAS
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1606450323-21641-1-git-send-email-srivasam@codeaurora.org>
 <20201127123856.GA4845@sirena.org.uk>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <a3efee22-622f-438b-a10e-7896fbcd8c0f@codeaurora.org>
Date:   Fri, 27 Nov 2020 23:40:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127123856.GA4845@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Mark  for your time!!!

On 11/27/2020 6:08 PM, Mark Brown wrote:
> On Fri, Nov 27, 2020 at 09:42:03AM +0530, Srinivasa Rao Mandadapu wrote:
>> To support playback continuation after resume problem in chrome
>> audio server:
>> Prepare device in  platform trigger callback.
>> Make I2s and DMA control registers as non volatile.
> What is the actual issue this is fixing?
Please ignore this patch. Posted new version of patch( [PATCH v3] ASoC: 
qcom: Fix playback recover problem in suspend resume) instead of this.
>
> As I have previously said please submit patches using subject lines
> reflecting the style for the subsystem, this makes it easier for people
> to identify relevant patches.  Look at what existing commits in the area
> you're changing are doing and make sure your subject lines visually
> resemble what they're doing.  There's no need to resubmit to fix this
> alone.

Previously I could not understand what is the mistake in subject line. 
Now I understood

the mistake and will take care of it next time.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

