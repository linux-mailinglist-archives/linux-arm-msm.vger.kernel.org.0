Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9526E1549FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 18:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbgBFRIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 12:08:05 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:54497 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726990AbgBFRIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 12:08:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581008885; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=IG8sscW63scxx0Id6zzYrwJOnoKRGNZHgeCJTEZRJWw=; b=Khkrjda4AanQuY9E67EEuHborX9H0kH/p8UCT7ZJNSIBrpD4QuA4/f2uoXDlopXYfbEveXGq
 iaOGeeIrO69MBI8LVs4MNkFHPgcSRpDMGLmmKolGJmG06aMiGSJGTcWMEWcrCSfRVIhBd0K/
 pmMXZb7Sn4XTBqfqU3grAMUOoJo=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3c47f3.7ff3de8f1298-smtp-out-n03;
 Thu, 06 Feb 2020 17:08:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3D14AC447A0; Thu,  6 Feb 2020 17:08:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 885B7C433CB;
        Thu,  6 Feb 2020 17:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 885B7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <073b09d4-51fe-f5fc-bbaf-1a168eac0881@codeaurora.org>
Date:   Thu, 6 Feb 2020 10:08:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/31/2020 6:49 AM, Manivannan Sadhasivam wrote:
> This commit adds support for registering MHI controller drivers with
> the MHI stack. MHI controller drivers manages the interaction with the
> MHI client devices such as the external modems and WiFi chipsets. They
> are also the MHI bus master in charge of managing the physical link
> between the host and client device.
> 
> This is based on the patch submitted by Sujeev Dias:
> https://lkml.org/lkml/2018/7/9/987
> 
> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> [jhugo: added static config for controllers and fixed several bugs]
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> [mani: removed DT dependency, splitted and cleaned up for upstream]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> +/**
> + * enum mhi_device_type - Device types
> + * @MHI_DEVICE_XFER: Handles data transfer
> + * @MHI_DEVICE_TIMESYNC: Use for timesync feature
> + * @MHI_DEVICE_CONTROLLER: Control device
> + */
> +enum mhi_device_type {
> +	MHI_DEVICE_XFER,
> +	MHI_DEVICE_TIMESYNC,
> +	MHI_DEVICE_CONTROLLER,
> +};

Time sync support was removed, no?  I don't see MHI_DEVICE_TIMESYNC used 
anywhere in the code.

> +/**
> + * enum mhi_er_data_type - Event ring data types
> + * @MHI_ER_DATA: Only client data over this ring
> + * @MHI_ER_CTRL: MHI control data and client data
> + * @MHI_ER_TSYNC: Time sync events
> + */
> +enum mhi_er_data_type {
> +	MHI_ER_DATA,
> +	MHI_ER_CTRL,
> +	MHI_ER_TSYNC,
> +};

Time sync support was removed, no?  I don't see MHI_ER_TSYNC used 
anywhere in the code.

> +/**
> + * struct mhi_controller - Master MHI controller structure
> + * @dev: Driver model device node for the controller (required)
> + * @mhi_dev: MHI device instance for the controller
> + * @regs: Base address of MHI MMIO register space (required)
> + * @iova_start: IOMMU starting address for data (required)
> + * @iova_stop: IOMMU stop address for data (required)
> + * @fw_image: Firmware image name for normal booting (required)
> + * @edl_image: Firmware image name for emergency download mode (optional)
> + * @sbl_size: SBL image size downloaded through BHIe (optional)
> + * @seg_len: BHIe vector size (optional)
> + * @mhi_chan: Points to the channel configuration table
> + * @lpm_chans: List of channels that require LPM notifications
> + * @irq: base irq # to request (required)
> + * @max_chan: Maximum number of channels the controller supports
> + * @total_ev_rings: Total # of event rings allocated
> + * @hw_ev_rings: Number of hardware event rings
> + * @sw_ev_rings: Number of software event rings
> + * @nr_irqs_req: Number of IRQs required to operate (optional)
> + * @nr_irqs: Number of IRQ allocated by bus master (required)
> + * @mhi_event: MHI event ring configurations table
> + * @mhi_cmd: MHI command ring configurations table
> + * @mhi_ctxt: MHI device context, shared memory between host and device
> + * @pm_mutex: Mutex for suspend/resume operation
> + * @pm_lock: Lock for protecting MHI power management state
> + * @timeout_ms: Timeout in ms for state transitions
> + * @pm_state: MHI power management state
> + * @db_access: DB access states
> + * @ee: MHI device execution environment
> + * @dev_wake: Device wakeup count
> + * @pending_pkts: Pending packets for the controller
> + * @transition_list: List of MHI state transitions
> + * @transition_lock: Lock for protecting MHI state transition list
> + * @wlock: Lock for protecting device wakeup
> + * @st_worker: State transition worker
> + * @fw_worker: Firmware download worker
> + * @syserr_worker: System error worker
> + * @state_event: State change event
> + * @status_cb: CB function to notify power states of the device (required)
> + * @link_status: CB function to query link status of the device (required)
> + * @wake_get: CB function to assert device wake (optional)
> + * @wake_put: CB function to de-assert device wake (optional)
> + * @wake_toggle: CB function to assert and de-assert device wake (optional)
> + * @runtime_get: CB function to controller runtime resume (required)
> + * @runtimet_put: CB function to decrement pm usage (required)
> + * @buffer_len: Bounce buffer length
> + * @bounce_buf: Use of bounce buffer
> + * @fbc_download: MHI host needs to do complete image transfer (optional)
> + * @pre_init: MHI host needs to do pre-initialization before power up
> + * @wake_set: Device wakeup set flag
> + */

I'm happy the optional/required is listed.  However if I look at this 
from the perspective of someone writing a controller for the first time, 
I'm not confident the required/optional annotations are clear enough. 
Perhaps a quick sentance explaining that those annotations indicate 
fields which must be populated prior to mhi_register_controller() ?

> +
> +/**
> + * struct mhi_device - Structure representing a MHI device which binds
> + *                     to channels
> + * @id: Pointer to MHI device ID struct
> + * @chan_name: Name of the channel to which the device binds
> + * @mhi_cntrl: Controller the device belongs to
> + * @ul_chan: UL channel for the device
> + * @dl_chan: DL channel for the device
> + * @dev: Driver model device node for the MHI device
> + * @dev_type: MHI device type
> + * @tiocm: Device current terminal settings
> + * @dev_wake: Device wakeup counter
> + */
> +struct mhi_device {
> +	const struct mhi_device_id *id;
> +	const char *chan_name;
> +	struct mhi_controller *mhi_cntrl;
> +	struct mhi_chan *ul_chan;
> +	struct mhi_chan *dl_chan;
> +	struct device dev;
> +	enum mhi_device_type dev_type;
> +	u32 tiocm;

This was for the old ioctl support, right?  I don't see it used anywhere.

> +	u32 dev_wake;
> +};


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
