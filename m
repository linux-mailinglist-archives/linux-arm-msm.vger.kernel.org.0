Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DCE3949A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 02:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhE2Alr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 20:41:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43287 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhE2Alr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 20:41:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622248811; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QM6qgqrE3mDqgSSOgbJTDeIClx4AEk3FZTtQjZABXeE=; b=vkV7vvRbrBZDjl3LnK+VU+MsnpOvhunQwNXFL2oD/q5GnZZQYDKyQXClpps1/izcsyyPR8XM
 bSEY/QqwpdXtF8Uh5Yca+tWtiGWdwOB0rEGZ3xvNY3vVxkUHe6iWDCLRMIdv1rtuxm29WzzW
 xNYVLRHSL1cxbUUcmEh5jRoa2Xo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b18d6bea2aacd7298ee503 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 May 2021 00:40:11
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCEEBC4323A; Sat, 29 May 2021 00:40:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.54.185] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CA51C433F1;
        Sat, 29 May 2021 00:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CA51C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v8 0/5] Re-introduce TX FIFO resize for larger EP bursting
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
References: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <56005440-7b3c-1dd7-c0f9-d3d0d0703878@codeaurora.org>
Date:   Fri, 28 May 2021 17:40:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

Sorry for the ping, but was just wondering if you had any feedback on
the latest txfifo resize patch series?  I think I addressed the concerns
you had about making sure we had enough FIFO size for a composition
before allowing the configuration to bind with the check_config() API.
It would ensure at least enough room for 1 max packet size for each EP
in a configuration before allowing the bind to complete.

That way we'd avoid being enumerated w/ the host, and having
non-functioning endpoints.  We've been testing these changes internally,
and they are providing a pretty significant boost to our USB throughput
numbers.

Thanks
Wesley Cheng

On 5/19/2021 12:43 AM, Wesley Cheng wrote:
> Changes in V8:
>  - Rebased to usb-testing
>  - Using devm_kzalloc for adding txfifo property in dwc3-qcom
>  - Removed DWC3 QCOM ACPI property for enabling the txfifo resize
> 
> Changes in V7:
>  - Added a new property tx-fifo-max-num for limiting how much fifo space the
>    resizing logic can allocate for endpoints with large burst values.  This
>    can differ across platforms, and tie in closely with overall system latency.
>  - Added recommended checks for DWC32.
>  - Added changes to set the tx-fifo-resize property from dwc3-qcom by default
>    instead of modifying the current DTSI files.
>  - Added comments on all APIs/variables introduced.
>  - Updated the DWC3 YAML to include a better description of the tx-fifo-resize
>    property and added an entry for tx-fifo-max-num.
> 
> Changes in V6:
>  - Rebased patches to usb-testing.
>  - Renamed to PATCH series instead of RFC.
>  - Checking for fs_descriptors instead of ss_descriptors for determining the
>    endpoint count for a particular configuration.
>  - Re-ordered patch series to fix patch dependencies.
> 
> Changes in V5:
>  - Added check_config() logic, which is used to communicate the number of EPs
>    used in a particular configuration.  Based on this, the DWC3 gadget driver
>    has the ability to know the maximum number of eps utilized in all configs.
>    This helps reduce unnecessary allocation to unused eps, and will catch fifo
>    allocation issues at bind() time.
>  - Fixed variable declaration to single line per variable, and reverse xmas.
>  - Created a helper for fifo clearing, which is used by ep0.c
> 
> Changes in V4:
>  - Removed struct dwc3* as an argument for dwc3_gadget_resize_tx_fifos()
>  - Removed WARN_ON(1) in case we run out of fifo space
>  
> Changes in V3:
>  - Removed "Reviewed-by" tags
>  - Renamed series back to RFC
>  - Modified logic to ensure that fifo_size is reset if we pass the minimum
>    threshold.  Tested with binding multiple FDs requesting 6 FIFOs.
> 
> Changes in V2:
>  - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>    FIFO.
>  - Removed dev_dbg() prints and fixed typos from patches
>  - Added some more description on the dt-bindings commit message
> 
> Currently, there is no functionality to allow for resizing the TXFIFOs, and
> relying on the HW default setting for the TXFIFO depth.  In most cases, the
> HW default is probably sufficient, but for USB compositions that contain
> multiple functions that require EP bursting, the default settings
> might not be enough.  Also to note, the current SW will assign an EP to a
> function driver w/o checking to see if the TXFIFO size for that particular
> EP is large enough. (this is a problem if there are multiple HW defined
> values for the TXFIFO size)
> 
> It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
> is required for an EP that supports bursting.  Otherwise, there may be
> frequent occurences of bursts ending.  For high bandwidth functions,
> such as data tethering (protocols that support data aggregation), mass
> storage, and media transfer protocol (over FFS), the bMaxBurst value can be
> large, and a bigger TXFIFO depth may prove to be beneficial in terms of USB
> throughput. (which can be associated to system access latency, etc...)  It
> allows for a more consistent burst of traffic, w/o any interruptions, as
> data is readily available in the FIFO.
> 
> With testing done using the mass storage function driver, the results show
> that with a larger TXFIFO depth, the bandwidth increased significantly.
> 
> Test Parameters:
>  - Platform: Qualcomm SM8150
>  - bMaxBurst = 6
>  - USB req size = 256kB
>  - Num of USB reqs = 16
>  - USB Speed = Super-Speed
>  - Function Driver: Mass Storage (w/ ramdisk)
>  - Test Application: CrystalDiskMark
> 
> Results:
> 
> TXFIFO Depth = 3 max packets
> 
> Test Case | Data Size | AVG tput (in MB/s)
> -------------------------------------------
> Sequential|1 GB x     | 
> Read      |9 loops    | 193.60
> 	  |           | 195.86
>           |           | 184.77
>           |           | 193.60
> -------------------------------------------
> 
> TXFIFO Depth = 6 max packets
> 
> Test Case | Data Size | AVG tput (in MB/s)
> -------------------------------------------
> Sequential|1 GB x     | 
> Read      |9 loops    | 287.35
> 	  |           | 304.94
>           |           | 289.64
>           |           | 293.61
> -------------------------------------------
> 
> Wesley Cheng (5):
>   usb: gadget: udc: core: Introduce check_config to verify USB
>     configuration
>   usb: gadget: configfs: Check USB configuration before adding
>   usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
>   usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
>   arm64: boot: dts: qcom: sm8150: Enable dynamic TX FIFO resize logic
> 
>  arch/arm64/boot/dts/qcom/sm8150.dtsi |   1 +
>  drivers/usb/dwc3/core.c              |   9 ++
>  drivers/usb/dwc3/core.h              |  15 +++
>  drivers/usb/dwc3/dwc3-qcom.c         |   9 ++
>  drivers/usb/dwc3/ep0.c               |   2 +
>  drivers/usb/dwc3/gadget.c            | 212 +++++++++++++++++++++++++++++++++++
>  drivers/usb/gadget/configfs.c        |  22 ++++
>  drivers/usb/gadget/udc/core.c        |  25 +++++
>  include/linux/usb/gadget.h           |   5 +
>  9 files changed, 300 insertions(+)
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
