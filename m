Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEDE27427D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 14:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVMx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 08:53:26 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:24219 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgIVMxZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 08:53:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600779204; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hbKrx2SwcynLY6Cgk+5NmFAHVfb6P5BLBtwJdA9I6rQ=; b=qpmkncOGzCbk3IXoRprgxXPIEk51fJcNPOswwGWi6p+e3QAncHkIKcYpJ6cEPvJuWhctwrpZ
 HgxXeUBYLMhae09MVTCWaFnz9wYD8+mpq41IDgYDpwVRXEFI8Y9YC6cPWmq3L7BRdO0SsleI
 f+WyR7dMkqiEcwDI2ym8C0PowBQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f69f3b7d9a2f87c84633268 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 12:53:11
 GMT
Sender: rohitkr=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FA62C43387; Tue, 22 Sep 2020 12:53:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.129] (unknown [183.83.141.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 553B1C433C8;
        Tue, 22 Sep 2020 12:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 553B1C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
To:     Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
 <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
 <20200922110825.GN4792@sirena.org.uk>
 <3866ce69-b7d0-5eb5-e0aa-874d150cd47a@linaro.org>
 <20200922114319.GR4792@sirena.org.uk>
From:   Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <7f682cf9-0f2a-0227-d5d8-8bedf1f06b00@codeaurora.org>
Date:   Tue, 22 Sep 2020 18:23:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922114319.GR4792@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/22/2020 5:13 PM, Mark Brown wrote:
> On Tue, Sep 22, 2020 at 12:22:38PM +0100, Srinivas Kandagatla wrote:
>> On 22/09/2020 12:08, Mark Brown wrote:
>> I agree with you on this and I see the point, but Rob had a very different
>> opinion about the reg-names bindings to start with.
>> This topic been discussed in the past with Rob in many instances ex: https://lore.kernel.org/linux-devicetree/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/
>> According to him, reg-names seems to be highly discouraged as it came along
>> for the OMAP folks and was related to the hwmods stuff.
> That's very much specific to reg, it's not true of the use of names in
> general - Rob mentions cases like interrupts for example.

I see that patch to support hdmi adds another reg-name along with 
"lpass-lpaif".

So, platform_get_resource_byname() is better option.

+       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, 
"lpass-hdmiif");

Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

