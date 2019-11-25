Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11EC4108D86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 13:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfKYMDg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 07:03:36 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:37016
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725862AbfKYMDg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 07:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574683415;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=f0tNqJ+tpXJTD3tqUeDs5/VtS8SWjl8eSoD8rOe274s=;
        b=IAmYDIvdxdr/4FwCMbI/yBn0zWDPDdT633riiz6d52kbWvk9vovdSvxxi6dAXFJp
        MvSBbDK0yUb7FoplzeQKhPXWr1ujzHqDQlJ0jk/Pjj+enGS2cHvc/EWOhFcF/fgUds5
        TgoYpflsXoDOJ+xqKDAsBNMm7kxs6C1xRhSE2U7Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574683415;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=f0tNqJ+tpXJTD3tqUeDs5/VtS8SWjl8eSoD8rOe274s=;
        b=GqzTkp2xEe1G1oHUZBscqLbGfJi9jHBRsKaIyE7SkUOdHkoG4UQIQdWcE/ZgsJi6
        zjSOw9YTp2buRZzvY81VZR+A4uZdiy9jL4oF3deDHImHoq5kYD95pIur9XY9B6ifrmI
        dVGOt6MXvgjVrz+73Jw9nmT/F0VvDL18qguFfNTU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 39109C447B4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v6 0/5] Add wakeup support and move loopback to TIOCM_LOOP
To:     Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <0101016e937a0ef9-36754afa-105c-416f-b308-b5bed0cc0ccb-000000@us-west-2.amazonses.com>
 <5dd827b1.1c69fb81.a7ff0.5ab4@mx.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <0101016ea27214d1-5cb5b74e-ca7b-410c-a9e7-bb0da9f6b2d7-000000@us-west-2.amazonses.com>
Date:   Mon, 25 Nov 2019 12:03:35 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5dd827b1.1c69fb81.a7ff0.5ab4@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2019.11.25-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/22/2019 11:53 PM, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-11-22 06:18:00)
>> This series adds wakeup support over UART RX line and moves loopback
>> support to TIOCM_LOOP.
>> Patch 1 & 2 reverts the V2 changes for wakeup support on tty-next tip.
>> Patch 3 & 4 adds V6 changes for wakeup support.
>>
>> Akash Asthana (5):
>>    Revert "tty: serial: qcom_geni_serial: Wakeup over UART RX"
>>    Revert "tty: serial: qcom_geni_serial: IRQ cleanup"
>>    tty: serial: qcom_geni_serial: IRQ cleanup
>>    tty: serial: qcom_geni_serial: Wakeup over UART RX
>>    tty: serial: qcom_geni_serial: Move loopback support to TIOCM_LOOP
> Maybe the reverts aren't necessary? Is it possible to fix up the patches
> that are already merged in Greg's tree?
Ok, I will fix up already merged patches.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

