Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27B633ED64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 10:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhCQJsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 05:48:54 -0400
Received: from m42-10.mailgun.net ([69.72.42.10]:24088 "EHLO
        m42-10.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhCQJsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 05:48:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615974515; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+0ByTtPZRneuh4QoUZHb/mtwfYGZc1tw0nEg0UI2GpI=; b=vPzi/35eB20seIQ0aMmIQw+d8tGhlA+leejuFN5h65m3ocat5xVzwfl5XFyVW3pO17QOqSLC
 Z9LvcGwNdAI1fzT6bm9thk0oYBcJrI+L/NHexAenYZDNfrSkDHlhUQUAMqfyyH2Lgk7hFPg5
 gVLV0RSxHUA4vXH99J3RkU3CLcI=
X-Mailgun-Sending-Ip: 69.72.42.10
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6051d0605d70193f88876df0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 09:48:16
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 114CFC433C6; Wed, 17 Mar 2021 09:48:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.69.12])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 310BFC433C6;
        Wed, 17 Mar 2021 09:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 310BFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8350: Remove second reg from pdc
To:     Marc Zyngier <maz@kernel.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        lsrao@codeaurora.org, devicetree@vger.kernel.org
References: <1615958996-31807-1-git-send-email-mkshah@codeaurora.org>
 <87k0q6i1g5.wl-maz@kernel.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <bce03166-e65b-198c-8b93-39e0c218aaed@codeaurora.org>
Date:   Wed, 17 Mar 2021 15:18:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87k0q6i1g5.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc,

On 3/17/2021 2:47 PM, Marc Zyngier wrote:
> On Wed, 17 Mar 2021 05:29:54 +0000,
> Maulik Shah <mkshah@codeaurora.org> wrote:
>> PDC interrupt controller driver do not use second reg. Remove it.
> This is a DT file, not a driver. What the driver does is irrelevant.
>
> The real question is: what does this range do?
>
> Thanks,
>
> 	M.

This is to set interrupt type in SPI config for which there was a change 
[1] but has not gone in for upstream PDC driver.

The second reg is not used in upstream PDC driver, probably when posting 
downstream DT changes for sm8350/sm8250 it was carried in device node as is.

As its not mentioned in bindigs as well, dtbs_check reports it as 
additional reg when converted to yaml.

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/1568411962-1022-8-git-send-email-ilina@codeaurora.org/

Thanks,
Maulik
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

