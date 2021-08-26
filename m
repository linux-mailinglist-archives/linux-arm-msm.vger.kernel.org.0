Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD813F84B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 11:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbhHZJmg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 05:42:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26063 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbhHZJmg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 05:42:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629970909; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=J1eX9vP54tGp5BhTuwbE6QmoNUuLLi+lBb5jrhjvGnM=; b=Vcd6JxdKbacaMhzA7+x76sr9Ck2KZR2I8c1tinzEJHcgNCH3NdFha2XfL1RrtDS2ZBgnq6j8
 UxVi0mVbltUFNfF5W+VsyKoQv0mh47iev7dvysa+Pp5AWYXBIh5xixBJ+elTIburfxEEvbrH
 SATz85TC1kJ8xXUrflieT2r8Br0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 612761c7d6653df76799e4ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 09:41:27
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2C97C4360D; Thu, 26 Aug 2021 09:41:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.0.104] (unknown [49.206.49.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00F9CC43460;
        Thu, 26 Aug 2021 09:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 00F9CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: Regarding usb dwc3 core shutdown callback
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
References: <e34c8e16-6521-c6e4-f3ed-9d8520d4ece2@codeaurora.org>
 <87bl63yqq8.fsf@kernel.org>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <eb975a76-1482-f502-4dc1-7993cc3f30d0@codeaurora.org>
Date:   Thu, 26 Aug 2021 15:11:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87bl63yqq8.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/12/2021 2:37 PM, Felipe Balbi wrote:
> Hi,
>
> (why isn't this email plain/text? Content Type was set to multipart
> alternative, please configure your email client correctly :-)
>
> While at that, also make sure to break lines at 80-columns)
>
> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>> Hi,
>>
>> Earlier I have posted the patch for usb dwc3 core shutdown callback
>>
>> https://lore.kernel.org/linux-arm-msm/1618380209-20114-1-git-send-email-sanm@codeaurora.org/
>>
>> and it was reverted due to issues.
> Right, as should be expected when we find regressions
>
>> https://lore.kernel.org/linux-usb/20210603151742.298243-1-alexandru.elisei@arm.com/
>>
>> As we already have shutdown callback in xhci plat driver where we halt
>> the controller, so there will be no transactions with usb devices.
>>
>> https://lore.kernel.org/linux-usb/20200306092328.41253-1-ran.wang_1@nxp.com/
>>
>> So I think dwc3 core shutdown may not be required at least when we are
>> using host mode. Let me know your opinion about this.
> If that's the case, then sure. Please validate the condition, though,
> and kindly report back on your findings

I have enabled couple of logs in shutdown path and see no URBs enqueued 
after xhci shut down.

Hope this is enough for validation . Please suggest if anything more I 
could do.

[  312.862737] systemd-journald[650]: Received SIGTERM from PID 1 (init).
[  312.866332] xhci-hcd xhci-hcd.0.auto: xhci_urb_enqueue
[  312.875205] xhci-hcd xhci-hcd.0.auto: xhci_urb_enqueue
[  312.951045] Unsafe core_pattern used with fs.suid_dumpable=2.
[  312.951045] Pipe handler or fully qualified core dump path required.
[  312.951045] Set kernel.core_pattern before fs.suid_dumpable.
[  312.981364] ip_local_port_range: prefer different parity for 
start/end values.
[  313.086729] Bluetooth: qca_download_firmware() hci0: QCA Downloading 
qca/crnv32.bin
[  313.194059] init: console-ttyMSM0 main process (516) killed by TERM 
signal
[  313.317109] kvm: exiting hardware virtualization
[  313.338988] platform video-firmware.0: Removing from iommu group 14
[  313.345975] platform wifi-firmware.0: Removing from iommu group 12
[  313.372244] xhci-hcd xhci-hcd.0.auto: -->xhci_shutdown
[  313.377591] xhci-hcd xhci-hcd.0.auto: // Halt the HC
[  313.382811] xhci-hcd xhci-hcd.0.auto: xhci_shutdown completed - 
status = 1
[  313.398238] Bluetooth: qca_uart_setup() hci0: QCA setup on UART is 
completed
[  313.405583] debugfs: Directory 'ibs' with parent 'hci0' already present!
[  313.439006] Bluetooth: qca_hw_error() hci0: mem_dump_status: 0
[  313.445073] Bluetooth: qca_send_crashbuffer() hci0: crash the soc to 
collect controller dump
[  313.595791] arm-smmu 15000000.iommu: disabling translation
[  313.601831] arm-smmu 5040000.iommu: disabling translation
[  313.608559] reboot: Restarting system

Regards

Sandeep

