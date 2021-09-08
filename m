Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A83403A53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 15:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238087AbhIHNIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 09:08:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15746 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234109AbhIHNIF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 09:08:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631106417; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=quIrC/vD4ad/kwLVoQsLmnmsifC9vh2KS4eKsTsArGc=; b=gDL3rGz2usiOppDkCoUgJNBU5u8BmWxWwX8qJ82oSuz5B3P5XepSDEnKvrwOb49QrrJqVEGG
 01hqAHu9RK3qo6PYJG5zKTlw1FUEI0oYGTIFi92+yojdas3MwRg3GuYR2/oHfzJ2ASnScDrJ
 Rmzsz7c2XKMkKy3xkvkA8oaKd+w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6138b568c603a0154f8bc97b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 13:06:48
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 111CCC43619; Wed,  8 Sep 2021 13:06:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.137.170] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8769AC4338F;
        Wed,  8 Sep 2021 13:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8769AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53Zj3pp4EJ_f_kXhRm3EW=od83UO44qt91P37waEq-z4Q@mail.gmail.com>
 <755e99d3-4d72-3292-a5da-ad3d6045038e@codeaurora.org>
 <20210908102300.GA4112@sirena.org.uk>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <0f6aa59a-5350-684d-c90c-b250e6d2977a@codeaurora.org>
Date:   Wed, 8 Sep 2021 18:36:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210908102300.GA4112@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for Your Time Mark Brown!!!

On 9/8/2021 3:53 PM, Mark Brown wrote:
> On Wed, Sep 08, 2021 at 10:08:33AM +0530, Srinivasa Rao Mandadapu wrote:
>> On 9/8/2021 1:54 AM, Stephen Boyd wrote:
>>> Quoting Srinivasa Rao Mandadapu (2021-09-06 06:27:34)
>>>> +#define LPASS_CDC_DMA_VA0 8
>>>> +#define LPASS_MAX_PORTS 9
>>> Do we need LPASS_MAX_PORTS in the binding?
>> Yes.  based on this creating array of streams in machine driver. So to make
>> upper limit introduced this macro.
> That's saying it's useful to have it in the code, do we need it in the
> binding itself though?
Okay.  Got it. will remove it and share new patch.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

