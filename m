Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A4C22CCC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 20:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXSKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 14:10:51 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:15904 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726326AbgGXSKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 14:10:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595614250; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=18ADy8FXMKjPAI8BXtnc19U259xStKFHPHvurul4DLQ=;
 b=sjroT+6Q7QT0Vb4vnZLbcAC2ZWQV4K0ZtNcuIuvojR9m9XgLZ8/nO+q09u3woiBt9AME/TYS
 2IiwCShRsNTAvR2GkGsggllHaAMrVYfQ+YQLDUoMfNNL0nfl2NlZZDLIICQzq0oQRwvANlV/
 AOn0OOYw3kK9IKvxCdIVjMlGe+A=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f1b242a7186ea1ee1c9661b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 18:10:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3BF2C433C6; Fri, 24 Jul 2020 18:10:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 69641C433C9;
        Fri, 24 Jul 2020 18:10:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 Jul 2020 23:40:49 +0530
From:   bgodavar@codeaurora.org
To:     abhishekpandit@chromium.org
Cc:     mka@chromium.org, Hemantg <hemantg@codeaurora.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
        gubbaven@codeaurora.org
Subject: Re: QCA: Add correct bin file for WCN3991
In-Reply-To: <CA+5PVA7P6bK12ZEUJEQb2cFntJuNSu99rF3TDCWmeep_XbLMQw@mail.gmail.com>
References: <6abd991d5d7d5175f5b7c6b168af770b@codeaurora.org>
 <CA+5PVA7P6bK12ZEUJEQb2cFntJuNSu99rF3TDCWmeep_XbLMQw@mail.gmail.com>
Message-ID: <1624c61abae51d2cce446a3669316e0b@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

<internal to QCOM & Google>

Hi Abhishek,

can you pick this fw to chrome tip.

On 2020-07-21 17:01, Josh Boyer wrote:
> On Thu, Jul 16, 2020 at 12:25 PM <bgodavar@codeaurora.org> wrote:
>> 
>> The following changes since commit
>> 3d3a06f720856cb897a8541951edd0b8f6f54a98:
>> 
>>    linux-firmware: Update firmware file for Intel Bluetooth AX201
>> (2020-07-13 07:51:54 -0400)
>> 
>> are available in the git repository at:
>> 
>>    https://github.com/bgodavar/qca_bt_fw/tree/qca_0714
>> 
>> for you to fetch changes up to 
>> 3882702815e4b88bfd2f20b7eb66a3e85cbbb9b9:
>> 
>>    QCA: Add correct bin file for WCN3991 (2020-07-14 11:00:13 +0530)
>> 
>> ----------------------------------------------------------------
>> Balakrishna Godavarthi (1):
>>        QCA: Add correct bin file for WCN3991
>> 
>>   qca/crnv32.bin | Bin 5299 -> 5299 bytes
>>   1 file changed, 0 insertions(+), 0 deletions(-)
> 
> Pulled and pushed out.
> 
> josh
