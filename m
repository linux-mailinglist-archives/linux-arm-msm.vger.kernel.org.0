Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7360D3518EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235812AbhDARsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:48:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57226 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234591AbhDARpl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:45:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617299142; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5F0p2SwBfvxYJuM5YokPniaLIv8Fsk+9QwSZB8XZ6cA=;
 b=YpNxScLth6+Yx2tPbKft4jXgsHhrbiRkj49tKERLcr5I8+KoVcBmfk1eW2jADbzM2u0BI43C
 lhxs4pw0mUzwaOcfwtJwa8KEibfCQv3NYWfVyPrRUhrye4vWU5nfg60ngxD/aBvXZTXrrQk2
 A7/EcybwIoDomst30N0IFogjfkM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6065e9fc8807bcde1dacb9c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 15:42:52
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE086C433ED; Thu,  1 Apr 2021 15:42:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D2EC2C433CA;
        Thu,  1 Apr 2021 15:42:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Apr 2021 21:12:50 +0530
From:   schowdhu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V2 3/5] DCC: Added the sysfs entries for DCC(Data Capture
 and Compare) driver
In-Reply-To: <161704857307.3012082.499264834486221320@swboyd.mtv.corp.google.com>
References: <cover.1616651305.git.schowdhu@codeaurora.org>
 <eeb3cfe92cba2c7981170f3c3ff96dd440b69f25.1616651305.git.schowdhu@codeaurora.org>
 <161704857307.3012082.499264834486221320@swboyd.mtv.corp.google.com>
Message-ID: <56a657ebc4b843575037e3ba9ec9cb9a@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-30 01:39, Stephen Boyd wrote:
> Quoting Souradeep Chowdhury (2021-03-25 01:02:34)
>> The DCC is a DMA engine designed to store register values either in
>> case of a system crash or in case of software triggers manually done
>> by the user.Using DCC hardware and the sysfs interface of the driver
>> the user can exploit various functionalities of DCC.The user can 
>> specify
>> the register addresses,the values of which is stored by DCC in it's
>> dedicated SRAM.The register addresses can be used either to read from,
>> write to,first read and store value and then write or to loop.All 
>> these
>> options can be exploited using the sysfs interface given to the user.
>> Following are the sysfs interfaces exposed in DCC driver which are
>> documented
>> 1)trigger
>> 2)config
>> 3)config_write
>> 4)config_reset
>> 5)enable
>> 6)rd_mod_wr
>> 7)loop
>> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  Documentation/ABI/testing/sysfs-driver-dcc | 114 
>> +++++++++++++++++++++++++++++
> 
> Please combine this with the driver patch.

Ack

> 
>>  1 file changed, 114 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc
> 
> Perhaps this should be an ioctl interface instead of a sysfs interface?

The reasons for choosing sysfs over ioctl is as follows


i) As can be seen from the sysfs attribute descriptions, most of it does 
basic hardware manipulations like dcc_enable, dcc_disable, config reset 
etc. As a result sysfs is preferred over ioctl as we just need to enter 
a 0 or 1
signal in such cases.

ii) Existing similar debug hardwares are there for which drivers have 
been written using sysfs interface. One such example is the 
coresight-etm-trace driver. Following is the link for reference

https://www.kernel.org/doc/html/latest/trace/coresight/coresight-etm4x-reference.html

> 
>> 
>> diff --git a/Documentation/ABI/testing/sysfs-driver-dcc 
>> b/Documentation/ABI/testing/sysfs-driver-dcc
>> new file mode 100644
>> index 0000000..05d24f0
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-dcc
>> @@ -0,0 +1,114 @@
>> +What:           /sys/bus/platform/devices/.../trigger
>> +Date:           March 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +               This is the sysfs interface for manual software
>> +               triggers.The user can simply enter a 1 against
>> +               the sysfs file and enable a manual trigger.
>> +               Example:
>> +               echo  1 > /sys/bus/platform/devices/.../trigger
>> +
>> +What:           /sys/bus/platform/devices/.../enable
>> +Date:           March 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +               This sysfs interface is used for enabling the
>> +               the dcc hardware.Without this being set to 1,
> 
> Space after period please.

Ack

> 
>> +               the dcc hardware ceases to function.
>> +               Example:
>> +               echo  0 > /sys/bus/platform/devices/.../enable
>> +               (disable interface)
>> +               echo  1 > /sys/bus/platform/devices/.../enable
>> +               (enable interface)
>> +
>> +What:           /sys/bus/platform/devices/.../config
>> +Date:           March 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +               This is the most commonly used sysfs interface
>> +               file and this basically stores the addresses of
>> +               the registers which needs to be read in case of
>> +               a hardware crash or manual software triggers.
>> +               Example:
>> +               echo  0x80000010 10 > 
>> /sys/bus/platform/devices/../config
>> +               This specifies that 10 words starting from address
>> +               0x80000010 is to be read.In case there are no words to 
>> be
>> +               specified we can simply enter the address.
>> +
>> +What:           /sys/bus/platform/devices/.../config_write
>> +Date:           March 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +               This file allows user to write a value to the register
>> +               address given as argument.The values are entered in 
>> the
>> +               form of <register_address> <value>.The reason for this
>> +               feature of dcc is that for accessing certain registers
>> +               it is necessary to set some bits of soe other 
>> register.
> 
> s/soe/some/?

Ack

> 
>> +               That is achievable by giving DCC this privelege.
> 
> s/privelege/privilege/

Ack

> 
>> +               Example:
>> +               echo 0x80000000 0xFF > 
>> /sys/bus/platform/devices/.../config_write
>> +
>> +What:           /sys/bus/platform/devices/.../config_reset
>> +Date:           March 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +               This file is used to reset the configuration of
>> +               a dcc driver to the default configuration.
>> +               Example:
>> +               echo  1 > /sys/bus/platform/devices/.../config_reset
>> +
