Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7A1B181914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 14:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgCKNEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 09:04:53 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23438 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729354AbgCKNEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 09:04:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583931893; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=R1wvMR/Jqt8YD3P4HKT06qevOZu7Gqmc+SGfQdyIHaA=; b=VzibqRmhAq9i5MW2O1NDp/J6d5f+xU6Ecuq9GrhdjBlCGbHZFSq4tLjImfxCAAK2KAvwZXAh
 RGIjwp0tu+gvODkAf6bWjYstQh9XnXau/LYaKDFD6Z9wbofe5FNepOy/QmMbDoXdL1SJnxM6
 3YA+D38AVyIChNKQDbb8RMCWV8I=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e68e1e5.7fc8ff99cc70-smtp-out-n02;
 Wed, 11 Mar 2020 13:04:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D713CC433BA; Wed, 11 Mar 2020 13:04:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D773C433D2;
        Wed, 11 Mar 2020 13:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D773C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V4 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org>
 <1581932212-19469-4-git-send-email-akashast@codeaurora.org>
 <20200218190731.GC15781@google.com>
 <ec5de895-3e86-811e-7ffc-fb98e115f850@codeaurora.org>
 <20200310215746.GZ24720@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <9bf21899-ca81-8a84-7eb8-e4636440cc01@codeaurora.org>
Date:   Wed, 11 Mar 2020 18:34:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310215746.GZ24720@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/11/2020 3:27 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> The patch that implements the binding landed in tty/tty-next:
>
> 9fa3c4b1fa379 tty: serial: qcom_geni_serial: Fix GPIO swapping with workaround
>
> The binding needs a re-spin to match the implementation.
>
> Thanks
>
> Matthias
>
Hi Matthias,

I will re-spin this binding patches.

Regards,

Akash

>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
