Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 026BA15026D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 09:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgBCIXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 03:23:09 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:38592 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbgBCIXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 03:23:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580718188; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RSjEiJ0ttdkS4GFK/NmrKRk8pctFGBmoDIg5s6bhlOg=;
 b=opXWPMPto1E6NrMBKIJrw5Axiw1BgUNbzi5qrBS3lz0tA56K9AJFw7J0q+9KFcOSy45sUfve
 HmYnTHsSeCUHoDLJfIsg6yyA01BeL7TCY1KMKlg5jEa/jagImR1tB8lB2pqcpD2p/AuY5Ebp
 k9SAGC6GQWwI1++4kme2Irzmisk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e37d86a.7fc837d1c3e8-smtp-out-n03;
 Mon, 03 Feb 2020 08:23:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C5B3FC447A0; Mon,  3 Feb 2020 08:23:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1FD62C43383;
        Mon,  3 Feb 2020 08:23:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 Feb 2020 13:53:05 +0530
From:   gubbaven@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip WCN3991
In-Reply-To: <20200131223626.GA237926@google.com>
References: <1580456335-7317-1-git-send-email-gubbaven@codeaurora.org>
 <1580456335-7317-2-git-send-email-gubbaven@codeaurora.org>
 <20200131223626.GA237926@google.com>
Message-ID: <3a9f33a4e8e6f2ac2ebd286e31e5836f@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2020-02-01 04:06, Matthias Kaehlcke wrote:
> + DT folks
> 
> On Fri, Jan 31, 2020 at 01:08:55PM +0530, Venkata Lakshmi Narayana 
> Gubba wrote:
>> Add compatible string for the Qualcomm WCN3991 Bluetooth controller
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt 
>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> index 68b67d9..e72045d 100644
>> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> @@ -11,6 +11,7 @@ Required properties:
>>   - compatible: should contain one of the following:
>>     * "qcom,qca6174-bt"
>>     * "qcom,wcn3990-bt"
>> +   * "qcom,wcn3991-bt"
>>     * "qcom,wcn3998-bt"
>> 
>>  Optional properties for compatible string qcom,qca6174-bt:
>> @@ -30,6 +31,7 @@ Optional properties for compatible string 
>> qcom,wcn399x-bt:
>> 
>>   - max-speed: see 
>> Documentation/devicetree/bindings/serial/slave-device.txt
>>   - firmware-name: specify the name of nvm firmware to load
>> + - clocks: clock provided to the controller
>> 
>>  Examples:
>> 
>> @@ -56,5 +58,6 @@ serial@898000 {
>>  		vddch0-supply = <&vreg_l25a_3p3>;
>>  		max-speed = <3200000>;
>>  		firmware-name = "crnv21.bin";
>> +		clocks = <&rpmhcc>;
> 
> That specifies a clock controller, not a clock.
> 
> For a device with the SC7180 SoC we use this:
> 
> 		clocks = <&rpmhcc RPMH_RF_CLK2>;

[Venkata] :

Sure, we will update in next patch set.
> 
>>  	};
>>  };

Regards,
Venkata.
