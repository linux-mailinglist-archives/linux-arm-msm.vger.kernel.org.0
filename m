Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B552337066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 11:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbhCKKpx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 05:45:53 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:19770 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232302AbhCKKpu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 05:45:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615459550; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AGtwfdMWnfuGN8UFZDfbkL93iyFVGww40mvtGM+zXQo=;
 b=tCysCOhzB2AwRrBwshDWyF1bdH/uPjnty3YyvEADW1qUWvNJpNejZeWRAZOEWrwbn0N3ssVh
 Cyx/6dLOUu7chFeT7H5CYzOjH731usbojHAGU9H1PNqyui1ZrICOuWPwz0KYD1k+KQyp46+P
 EOzfHwmGxo5uQ4/Wtz5D1MdyB58=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6049f4dcfa6ebd85e8c012d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 10:45:48
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E57C5C43464; Thu, 11 Mar 2021 10:45:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BBA70C433C6;
        Thu, 11 Mar 2021 10:45:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 16:15:47 +0530
From:   schowdhu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V1 4/6] DCC: Added the sysfs entries for DCC(Data Capture
 and Compare) driver
In-Reply-To: <YElWLqemavtXGlPd@builder.lan>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
 <332477ea39088fca5879af1a5278c289e1602f6d.1615393454.git.schowdhu@codeaurora.org>
 <YElWLqemavtXGlPd@builder.lan>
Message-ID: <25fa62cd3726c2389144c3b0f35cff7d@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-11 04:58, Bjorn Andersson wrote:
> On Wed 10 Mar 10:46 CST 2021, Souradeep Chowdhury wrote:
> 
>> The DCC is a DMA engine designed to store register values either in
>> case of a system crash or in case of software triggers manually done
>> by the user. Using DCC hardware and the sysfs interface of the driver
>> the user can exploit various functionalities of DCC. The user can 
>> specify
>> the register addresses, the values of which is stored by DCC in it's
>> dedicated SRAM. The register addresses can be used either to read 
>> from,
>> write to, first read and store value and then write or to loop. All 
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
>>  Documentation/ABI/testing/sysfs-driver-dcc | 74 
>> ++++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc
>> 
>> diff --git a/Documentation/ABI/testing/sysfs-driver-dcc 
>> b/Documentation/ABI/testing/sysfs-driver-dcc
>> new file mode 100644
>> index 0000000..7a855ca
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-dcc
>> @@ -0,0 +1,74 @@
>> +What:           /sys/bus/platform/devices/.../trigger
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file allows the software trigger to be enabled
>> +		by the user through the sysfs interface.Through this
>> +		interface the user can manually start a software trigger
>> +		in dcc where by the dcc driver stores the current status
>> +		of the specified registers in dcc sram.
>> +
>> +What:           /sys/bus/platform/devices/.../enable
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file allows the user to manually enable or
>> +		disable dcc driver. The dcc hardware needs to be
>> +		enabled before use.
>> +
>> +What:           /sys/bus/platform/devices/.../config
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file allows user to configure the register values
>> +		along with addresses to the dcc driver.This register
>> +		addresses are used to read from,write or loop through.
>> +		To enable all these options separate sysfs files have
>> +		are created.
> 
> Please describe the expected content of this file.

Ack

>> +
>> +What:           /sys/bus/platform/devices/.../config_write
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file allows user to write a value to the register
>> +		address given as argument.The values are entered in the
>> +		form of <register_address> <value>.
> 
> So it's just a generic 'write some user defined data to some user
> defined register'? This doesn't sound like the typical way things are
> exposed in sysfs.

In certain cases we need to write some values to a register to access
the rest of the values from some other registers. To handle such cases
DCC can also write to registers on system crash or software triggers if
necessary. The same is achieved through this sysfs interface in user 
space.


> 
>> +
>> +What:           /sys/bus/platform/devices/.../config_reset
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file is used to reset the configuration of
>> +		a dcc driver to the default configuration.
>> +
>> +What:           /sys/bus/platform/devices/.../loop
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file is used to enter the loop count as dcc
>> +		driver gives the option to loop multiple times on
>> +		the same register and store the values for each
>> +		loop.
>> +
>> +What:           /sys/bus/platform/devices/.../rd_mod_wr
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file is used to read the value of the register
>> +		and then write the value given as an argument to the
>> +		register address in config.The address argument should
>> +		be given of the form <mask> <value>.
>> +
>> +What:           /sys/bus/platform/devices/.../ready
>> +Date:           February 2021
>> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file is used to check the status of the dcc
>> +		hardware if it's ready to take the inputs.
>> +
>> +What:		/sys/bus/platform/devices/.../curr_list
>> +Date:		February 2021
>> +Contact:	Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +Description:
>> +		This file is used to configure the linkedlist data
>> +		to be used while configuring addresses.
> 
> Please describe the format of this attr. Is it read/write?

Ack. This attr is used to select the linked list to be used to configure 
the addresses.
The options given to the user is from 0-3.

> 
> Regards,
> Bjorn
> 
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
