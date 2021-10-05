Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA890422C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 17:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235322AbhJEPP0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 11:15:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54063 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhJEPPZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 11:15:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633446815; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=s3Xb4IsSqsYB8Xe3c7qxyiGRJeLbjA3gkFSG8+CibCw=; b=YS0rkOpB4q9ONKPFZURacTfXywhYybXYkHHVFXVdRaPDVaLgQe1l/XXQKVujadzpj0wKs1zA
 Gdi0zJJxlmYuym+atDUGsmUkaM7n6ait2jX+8+TTSGVL0TTNL2bsuYjuzmFIHbm6ozqbcViZ
 2JPV2faBZnYY8gKkOJcOamYi+N4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 615c6b934ccc4cf2c7c421cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 15:13:23
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 42FD3C4361C; Tue,  5 Oct 2021 15:13:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [157.48.255.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7DCE6C4360C;
        Tue,  5 Oct 2021 15:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7DCE6C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
 <a2b6a9c7-2191-4bc9-b03b-3b22b495a4be@linux.intel.com>
 <2c18ff0c-cd24-356c-0104-086837ed7ff0@codeaurora.org>
 <d485af5f-4dfb-df08-9a22-901b7534ca3b@linux.intel.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <f7fbf5e2-2f09-1df5-475a-cfe04f33059a@codeaurora.org>
Date:   Tue, 5 Oct 2021 20:43:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d485af5f-4dfb-df08-9a22-901b7534ca3b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/5/2021 8:33 PM, Pierre-Louis Bossart wrote:
> Thanks for Your time Bossart!!!
>
>>>> +        ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev,
>>>> swrm_hctl_reg, 0x4);
>>> if (!ctrl->swrm_hctl_reg)
>>>       return -ENODEV;
>>>
>>> ?
>> I think here error check is not required, as this change is required
>> only for soundwire version 1.6 and above.
> My comment had nothing to do with versions, it's just that ioremap can
> fail and in general it's wise to test for errors...

Okay. My intention is if offset (swrm_hctl_reg) is zero, devm_ioremap 
may return error.

In that case we need to ignore error.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

