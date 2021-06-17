Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460393ABE5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 23:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhFQVuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 17:50:54 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11611 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhFQVuy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 17:50:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623966526; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=eATf/nMRgpGYmlXyMTtnhQYqD5pqdm6H+bv15GdGkHU=; b=CIpG3lcw4dTPIp8cu4NXcojQwJjHf4hA1D32uHzIIrGaoQibxSaRGzGdua1/7f2jjo4Sv7d9
 nAOZGq+SqHgLZr7BZ0Wh7GtjeKQJ3AwIfUMHJ0IgOiSRxgCOi8NpOu486WdHxzkLqUybNIAT
 /c2zpm93kFTA1hMbhx5xJqPmBdk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60cbc33af726fa4188fc5a62 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 21:48:42
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37DE0C4338A; Thu, 17 Jun 2021 21:48:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.94.190] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91D65C433F1;
        Thu, 17 Jun 2021 21:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91D65C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Ferry Toth <fntoth@gmail.com>, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, heikki.krogerus@linux.intel.com,
        andy.shevchenko@gmail.com
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <ec8050c5-c013-4af6-b39e-69779c009a9c@codeaurora.org>
Date:   Thu, 17 Jun 2021 14:48:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 6/17/2021 2:01 PM, Ferry Toth wrote:
> Hi
> 
> Op 17-06-2021 om 11:58 schreef Wesley Cheng:
>> Changes in V10:
>>   - Fixed compilation errors in config where OF is not used (error due to
>>     unknown symbol for of_add_property()).  Add of_add_property() stub.
>>   - Fixed compilation warning for incorrect argument being passed to
>> dwc3_mdwidth
> This fixes the OOPS I had in V9. I do not see any change in performance
> on Merrifield though.

I see...thanks Ferry! With your testing, are you writing to the device's
internal storage (ie UFS, eMMC, etc...), or did you use a ramdisk as well?

If not with a ramdisk, we might want to give that a try to avoid the
storage path being the bottleneck.  You can use "dd" to create an empty
file, and then just use that as the LUN's backing file.

echo ramdisk.img >
/sys/kernel/config/usb_gadget/g1/functions/mass_storage.0/lun.0/file

Thanks
Wesley Cheng

>> Changes in V9:
>>   - Fixed incorrect patch in series.  Removed changes in DTSI, as
>> dwc3-qcom will
>>     add the property by default from the kernel.
>>
>> Changes in V8:
>>   - Rebased to usb-testing
>>   - Using devm_kzalloc for adding txfifo property in dwc3-qcom
>>   - Removed DWC3 QCOM ACPI property for enabling the txfifo resize
>>
>> Changes in V7:
>>   - Added a new property tx-fifo-max-num for limiting how much fifo
>> space the
>>     resizing logic can allocate for endpoints with large burst
>> values.  This
>>     can differ across platforms, and tie in closely with overall
>> system latency.
>>   - Added recommended checks for DWC32.
>>   - Added changes to set the tx-fifo-resize property from dwc3-qcom by
>> default
>>     instead of modifying the current DTSI files.
>>   - Added comments on all APIs/variables introduced.
>>   - Updated the DWC3 YAML to include a better description of the
>> tx-fifo-resize
>>     property and added an entry for tx-fifo-max-num.
>>
>> Changes in V6:
>>   - Rebased patches to usb-testing.
>>   - Renamed to PATCH series instead of RFC.
>>   - Checking for fs_descriptors instead of ss_descriptors for
>> determining the
>>     endpoint count for a particular configuration.
>>   - Re-ordered patch series to fix patch dependencies.
>>
>> Changes in V5:
>>   - Added check_config() logic, which is used to communicate the
>> number of EPs
>>     used in a particular configuration.  Based on this, the DWC3
>> gadget driver
>>     has the ability to know the maximum number of eps utilized in all
>> configs.
>>     This helps reduce unnecessary allocation to unused eps, and will
>> catch fifo
>>     allocation issues at bind() time.
>>   - Fixed variable declaration to single line per variable, and
>> reverse xmas.
>>   - Created a helper for fifo clearing, which is used by ep0.c
>>
>> Changes in V4:
>>   - Removed struct dwc3* as an argument for dwc3_gadget_resize_tx_fifos()
>>   - Removed WARN_ON(1) in case we run out of fifo space
>>   Changes in V3:
>>   - Removed "Reviewed-by" tags
>>   - Renamed series back to RFC
>>   - Modified logic to ensure that fifo_size is reset if we pass the
>> minimum
>>     threshold.  Tested with binding multiple FDs requesting 6 FIFOs.
>>
>> Changes in V2:
>>   - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>>     FIFO.
>>   - Removed dev_dbg() prints and fixed typos from patches
>>   - Added some more description on the dt-bindings commit message
>>
>> Currently, there is no functionality to allow for resizing the
>> TXFIFOs, and
>> relying on the HW default setting for the TXFIFO depth.  In most
>> cases, the
>> HW default is probably sufficient, but for USB compositions that contain
>> multiple functions that require EP bursting, the default settings
>> might not be enough.  Also to note, the current SW will assign an EP to a
>> function driver w/o checking to see if the TXFIFO size for that
>> particular
>> EP is large enough. (this is a problem if there are multiple HW defined
>> values for the TXFIFO size)
>>
>> It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
>> is required for an EP that supports bursting.  Otherwise, there may be
>> frequent occurences of bursts ending.  For high bandwidth functions,
>> such as data tethering (protocols that support data aggregation), mass
>> storage, and media transfer protocol (over FFS), the bMaxBurst value
>> can be
>> large, and a bigger TXFIFO depth may prove to be beneficial in terms
>> of USB
>> throughput. (which can be associated to system access latency,
>> etc...)  It
>> allows for a more consistent burst of traffic, w/o any interruptions, as
>> data is readily available in the FIFO.
>>
>> With testing done using the mass storage function driver, the results
>> show
>> that with a larger TXFIFO depth, the bandwidth increased significantly.
>>
>> Test Parameters:
>>   - Platform: Qualcomm SM8150
>>   - bMaxBurst = 6
>>   - USB req size = 256kB
>>   - Num of USB reqs = 16
>>   - USB Speed = Super-Speed
>>   - Function Driver: Mass Storage (w/ ramdisk)
>>   - Test Application: CrystalDiskMark
>>
>> Results:
>>
>> TXFIFO Depth = 3 max packets
>>
>> Test Case | Data Size | AVG tput (in MB/s)
>> -------------------------------------------
>> Sequential|1 GB x     |
>> Read      |9 loops    | 193.60
>>       |           | 195.86
>>            |           | 184.77
>>            |           | 193.60
>> -------------------------------------------
>>
>> TXFIFO Depth = 6 max packets
>>
>> Test Case | Data Size | AVG tput (in MB/s)
>> -------------------------------------------
>> Sequential|1 GB x     |
>> Read      |9 loops    | 287.35
>>       |           | 304.94
>>            |           | 289.64
>>            |           | 293.61
>> -------------------------------------------
>>
>> Wesley Cheng (6):
>>    usb: gadget: udc: core: Introduce check_config to verify USB
>>      configuration
>>    usb: gadget: configfs: Check USB configuration before adding
>>    usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
>>    of: Add stub for of_add_property()
>>    usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
>>    dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
>>
>>   .../devicetree/bindings/usb/snps,dwc3.yaml         |  15 +-
>>   drivers/usb/dwc3/core.c                            |   9 +
>>   drivers/usb/dwc3/core.h                            |  15 ++
>>   drivers/usb/dwc3/dwc3-qcom.c                       |   9 +
>>   drivers/usb/dwc3/ep0.c                             |   2 +
>>   drivers/usb/dwc3/gadget.c                          | 212
>> +++++++++++++++++++++
>>   drivers/usb/gadget/configfs.c                      |  22 +++
>>   drivers/usb/gadget/udc/core.c                      |  25 +++
>>   include/linux/of.h                                 |   5 +
>>   include/linux/usb/gadget.h                         |   5 +
>>   10 files changed, 317 insertions(+), 2 deletions(-)
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
