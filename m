Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A9E18EDBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 02:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgCWBzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Mar 2020 21:55:50 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:41056 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726946AbgCWBzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Mar 2020 21:55:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584928549; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bagN2/+wg0A9eO3ZG+RE/kDWFHgrQicHiCL73HuqLuc=;
 b=xU3xVOXGsVenSBkprphYpAnvqpBRji2n1E/qEilxXD9SwFhdKja4qunmNAo06UcJxl6ts8Tz
 v0Umo1LNr33oCJU7XUCEBrVeQfMhFluIatBWteBng2O6gbwCbile4lQ6knEgr3IR6SdJroEI
 43ouudK5TsaDOCdXKq9ORW9mWzM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e781722.7fb50a346768-smtp-out-n05;
 Mon, 23 Mar 2020 01:55:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A69FC43636; Mon, 23 Mar 2020 01:55:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB04BC433CB;
        Mon, 23 Mar 2020 01:55:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 23 Mar 2020 09:55:44 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     bgodavar@codeaurora.org
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, c-hbandi@codeaurora.org,
        hemantg@codeaurora.org, mka@chromium.org
Subject: Re: [PATCH v1 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QCA chip QCA6390
In-Reply-To: <1ac67f48f34bc91e89a1b3a5d1c23453@codeaurora.org>
References: <20200314094328.3331-1-rjliao@codeaurora.org>
 <20200314094328.3331-2-rjliao@codeaurora.org>
 <1ac67f48f34bc91e89a1b3a5d1c23453@codeaurora.org>
Message-ID: <7bbd64e6901c066d6abb08fa552a2dec@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

在 2020-03-16 23:07，bgodavar@codeaurora.org 写道：
> On 2020-03-14 15:13, Rocky Liao wrote:
>> This patch adds compatible string for the QCA chip QCA6390.
>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> index beca6466d59a..badf597c0e58 100644
>> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> @@ -13,6 +13,7 @@ Required properties:
>>     * "qcom,wcn3990-bt"
>>     * "qcom,wcn3991-bt"
>>     * "qcom,wcn3998-bt"
>> +   * "qcom,qca6390-bt"
>> 
> 
> [Bala]: Can you add a example snippet of QCA6390 dts
> 
QCA6390 sample is same with qca6174.

>>  Optional properties for compatible string qcom,qca6174-bt:
