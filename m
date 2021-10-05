Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7394229C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 16:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhJEOBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 10:01:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38418 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235856AbhJEOAI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 10:00:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633442298; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LgxDMZbTLmbkmI3rWSDe8ZXB9Ho4b2bgxaujdRTL8SE=;
 b=jlSlIgK7FV1dFfWcyRnRyMwB9Oz0Bk8woVh6FKK80z2KJ73lhFPPPFT2HKHQHJiUPrijmNLr
 UATDZWA5jJtoFHvO96kA+0s6+/LN9fSVlfBSoAliOZkZ+R/+E4PIQF7W/4s+HFxjza6fZzVF
 nLzZeccNoX17n+zoN+LsX+09gRM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615c59e1ff0285fb0a91aa06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 13:57:53
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E091BC35A3B; Tue,  5 Oct 2021 13:57:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B80D0C35A3C;
        Tue,  5 Oct 2021 13:57:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 19:27:50 +0530
From:   schowdhu@codeaurora.org
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 4/7] usb: common: eud: Added the driver support for
 Embedded USB Debugger(EUD)
In-Reply-To: <73c1eb4f-6870-1c30-9b23-d991b8c8b35d@infradead.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
 <73c1eb4f-6870-1c30-9b23-d991b8c8b35d@infradead.org>
Message-ID: <edb2e8a9f293bb4d55650cec983c9ced@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-05 01:38, Randy Dunlap wrote:
> On 10/4/21 4:16 AM, Souradeep Chowdhury wrote:
>> Add support for control peripheral of EUD (Embedded USB Debugger) to
>> listen to events such as USB attach/detach, pet EUD to indicate 
>> software
> 
>   I don't quite understand: what pets the EUD? how does it do that?

Pet EUD is an interrupt that the EUD driver receives periodically to
indicate if the software is functional. On getting the interrupt the
EUD driver first does a detach pet and then followed by the an attach
pet.

> 
>> is functional.Reusing the platform device kobj, sysfs entry 'enable' 
>> is
> 
>      functional. Reusing

Ack

> 
>> created to enable or disable EUD.
>> 
>> To enable the eud the following needs to be done
>> echo 1 >/sys/bus/platform/.../enable
>> 
>> To disable eud, following is the command
>> echo 0 >/sys/bus/platform/.../enable
>> 
>> Signed-off-by: Souradeep Chowdhury<schowdhu@codeaurora.org>
>> ---
>>   Documentation/ABI/testing/sysfs-driver-eud |   7 +
>>   drivers/usb/common/Kconfig                 |   9 +
>>   drivers/usb/common/Makefile                |   1 +
>>   drivers/usb/common/qcom_eud.c              | 256 
>> +++++++++++++++++++++++++++++
>>   4 files changed, 273 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-eud
>>   create mode 100644 drivers/usb/common/qcom_eud.c
>> 
>> diff --git a/Documentation/ABI/testing/sysfs-driver-eud 
>> b/Documentation/ABI/testing/sysfs-driver-eud
>> new file mode 100644
>> index 0000000..14a02da
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-eud
>> @@ -0,0 +1,7 @@
>> +What:		/sys/bus/platform/.../enable
>> +Date:           October 2021
>> +Contact:        Souradeep Chowdhury<schowdhu@codeaurora.org>
>> +Description:
>> +		The Enable/Disable sysfs interface for Embedded
>> +		USB Debugger(EUD).This enables and disables the
> 
> 		    Debugger (EUD). This enables

Ack

> 
>> +		EUD based on a 1 or a 0 value.
