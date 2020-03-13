Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248DF184886
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 14:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgCMNyI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 09:54:08 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:11037 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726642AbgCMNyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 09:54:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584107648; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r0kpkxMAplkgIWkkncsMJpp9/LkYkIEQT6DADZGppXU=;
 b=ouGycTc0VLmWZCPsMeSJaSrZLJI5AlINH4Uj5jIItnVYfGQ8Czx/45CsTXOjhY/Fa/oQu2RA
 bHCvKAsgDs5MWIhR4ijRyX0wAuelwpfhrHOAcngpQbhY0wQMgX3Ay6S1WsbX38GnP/pfxVvT
 4FdOtWs2j8hI4DuABEPNxSQnl+A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b9070.7f31a81b07d8-smtp-out-n02;
 Fri, 13 Mar 2020 13:53:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A60AC43636; Fri, 13 Mar 2020 13:53:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A30EBC433D2;
        Fri, 13 Mar 2020 13:53:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Mar 2020 19:23:50 +0530
From:   skakit@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 2/2] tty: serial: qcom_geni_serial: Fix RX cancel
 command failure
In-Reply-To: <20200312091041.GA198954@kroah.com>
References: <1583477228-32231-1-git-send-email-skakit@codeaurora.org>
 <1583477228-32231-3-git-send-email-skakit@codeaurora.org>
 <20200312091041.GA198954@kroah.com>
Message-ID: <436ae3cfb957b11b0d7aa3b1dbb0adf2@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-12 14:40, Greg KH wrote:
> On Fri, Mar 06, 2020 at 12:17:08PM +0530, satya priya wrote:
>> RX cancel command fails when BT is switched on and off multiple times.
>> 
>> To handle this, poll for the cancel bit in SE_GENI_S_IRQ_STATUS 
>> register
>> instead of SE_GENI_S_CMD_CTRL_REG.
>> 
>> As per the HPG update, handle the RX last bit after cancel command
>> and flush out the RX FIFO buffer.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>  drivers/tty/serial/qcom_geni_serial.c | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> This patch didn't apply :(

V1 of this patch is already picked in tty-next tree(commit id: 
679aac5ead2f18d223554a52b543e1195e181811). There is no change in this 
patch from V1 to V3[2/2].
There is a crash reported by Stephen with V1, to resolve that we posted 
next versions adding this patch 
https://patchwork.kernel.org/patch/11423231/, that is, V3[1/2]. So now 
only V3[1/2] needs to be picked.
