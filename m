Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46EAF1487D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 15:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389799AbgAXOYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 09:24:52 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59806 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387409AbgAXOYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 09:24:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579875889; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wf62vQMPmves3NyJozWscw8hAClcf+WUjRkPvg/Z15U=; b=BmSpX4JCGwqDuKfuH6v1dabwnFEuhWpHWs5suSD1N1k8uvL/ync523WFMcwM99jE68Cf7UK4
 GTxr5oCMNS1haeRe/Zfc0ahH8BdeUW4VvveY5qcPez7rn6Hj+8mx7F1U2+EpITpCT/Wy++bx
 JCsCxKU+gRUFBxKCGCYDR7fujLE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2afe31.7f93e91ea618-smtp-out-n02;
 Fri, 24 Jan 2020 14:24:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C0D4BC43383; Fri, 24 Jan 2020 14:24:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2FDADC43383;
        Fri, 24 Jan 2020 14:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2FDADC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
To:     Greg KH <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <20200124082939.GA2921617@kroah.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <42c79181-9d97-3542-c6b0-1e37f9b2ff39@codeaurora.org>
Date:   Fri, 24 Jan 2020 07:24:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200124082939.GA2921617@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/24/2020 1:29 AM, Greg KH wrote:
> On Thu, Jan 23, 2020 at 04:48:22PM +0530, Manivannan Sadhasivam wrote:
>> --- /dev/null
>> +++ b/include/linux/mhi.h
>> @@ -0,0 +1,438 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>> + *
>> + */
>> +#ifndef _MHI_H_
>> +#define _MHI_H_
>> +
>> +#include <linux/device.h>
>> +#include <linux/dma-direction.h>
>> +#include <linux/mutex.h>
>> +#include <linux/rwlock_types.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock_types.h>
>> +#include <linux/wait.h>
>> +#include <linux/workqueue.h>
>> +
>> +struct mhi_chan;
>> +struct mhi_event;
>> +struct mhi_ctxt;
>> +struct mhi_cmd;
>> +struct mhi_buf_info;
>> +
>> +/**
>> + * enum mhi_callback - MHI callback
>> + * @MHI_CB_IDLE: MHI entered idle state
>> + * @MHI_CB_PENDING_DATA: New data available for client to process
>> + * @MHI_CB_LPM_ENTER: MHI host entered low power mode
>> + * @MHI_CB_LPM_EXIT: MHI host about to exit low power mode
>> + * @MHI_CB_EE_RDDM: MHI device entered RDDM exec env
>> + * @MHI_CB_EE_MISSION_MODE: MHI device entered Mission Mode exec env
>> + * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
>> + * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
>> + */
>> +enum mhi_callback {
>> +	MHI_CB_IDLE,
>> +	MHI_CB_PENDING_DATA,
>> +	MHI_CB_LPM_ENTER,
>> +	MHI_CB_LPM_EXIT,
>> +	MHI_CB_EE_RDDM,
>> +	MHI_CB_EE_MISSION_MODE,
>> +	MHI_CB_SYS_ERROR,
>> +	MHI_CB_FATAL_ERROR,
>> +};
>> +
>> +/**
>> + * enum mhi_flags - Transfer flags
>> + * @MHI_EOB: End of buffer for bulk transfer
>> + * @MHI_EOT: End of transfer
>> + * @MHI_CHAIN: Linked transfer
>> + */
>> +enum mhi_flags {
>> +	MHI_EOB,
>> +	MHI_EOT,
>> +	MHI_CHAIN,
>> +};
>> +
>> +/**
>> + * enum mhi_device_type - Device types
>> + * @MHI_DEVICE_XFER: Handles data transfer
>> + * @MHI_DEVICE_TIMESYNC: Use for timesync feature
>> + * @MHI_DEVICE_CONTROLLER: Control device
>> + */
>> +enum mhi_device_type {
>> +	MHI_DEVICE_XFER,
>> +	MHI_DEVICE_TIMESYNC,
>> +	MHI_DEVICE_CONTROLLER,
>> +};
>> +
>> +/**
>> + * enum mhi_ch_type - Channel types
>> + * @MHI_CH_TYPE_INVALID: Invalid channel type
>> + * @MHI_CH_TYPE_OUTBOUND: Outbound channel to the device
>> + * @MHI_CH_TYPE_INBOUND: Inbound channel from the device
>> + * @MHI_CH_TYPE_INBOUND_COALESCED: Coalesced channel for the device to combine
>> + *				   multiple packets and send them as a single
>> + *				   large packet to reduce CPU consumption
>> + */
>> +enum mhi_ch_type {
>> +	MHI_CH_TYPE_INVALID = 0,
>> +	MHI_CH_TYPE_OUTBOUND = DMA_TO_DEVICE,
>> +	MHI_CH_TYPE_INBOUND = DMA_FROM_DEVICE,
>> +	MHI_CH_TYPE_INBOUND_COALESCED = 3,
>> +};
>> +
>> +/**
>> + * enum mhi_ee_type - Execution environment types
>> + * @MHI_EE_PBL: Primary Bootloader
>> + * @MHI_EE_SBL: Secondary Bootloader
>> + * @MHI_EE_AMSS: Modem, aka the primary runtime EE
>> + * @MHI_EE_RDDM: Ram dump download mode
>> + * @MHI_EE_WFW: WLAN firmware mode
>> + * @MHI_EE_PTHRU: Passthrough
>> + * @MHI_EE_EDL: Embedded downloader
>> + */
>> +enum mhi_ee_type {
>> +	MHI_EE_PBL,
>> +	MHI_EE_SBL,
>> +	MHI_EE_AMSS,
>> +	MHI_EE_RDDM,
>> +	MHI_EE_WFW,
>> +	MHI_EE_PTHRU,
>> +	MHI_EE_EDL,
>> +	MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
>> +	MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
>> +	MHI_EE_NOT_SUPPORTED,
>> +	MHI_EE_MAX,
>> +};
>> +
>> +/**
>> + * enum mhi_buf_type - Accepted buffer type for the channel
>> + * @MHI_BUF_RAW: Raw buffer
>> + * @MHI_BUF_SKB: SKB struct
>> + * @MHI_BUF_SCLIST: Scatter-gather list
>> + * @MHI_BUF_NOP: CPU offload channel, host does not accept transfer
>> + * @MHI_BUF_DMA: Receive DMA address mapped by client
>> + * @MHI_BUF_RSC_DMA: RSC type premapped buffer
>> + */
>> +enum mhi_buf_type {
>> +	MHI_BUF_RAW,
>> +	MHI_BUF_SKB,
>> +	MHI_BUF_SCLIST,
>> +	MHI_BUF_NOP,
>> +	MHI_BUF_DMA,
>> +	MHI_BUF_RSC_DMA,
>> +};
>> +
>> +/**
>> + * enum mhi_er_data_type - Event ring data types
>> + * @MHI_ER_DATA: Only client data over this ring
>> + * @MHI_ER_CTRL: MHI control data and client data
>> + * @MHI_ER_TSYNC: Time sync events
>> + */
>> +enum mhi_er_data_type {
>> +	MHI_ER_DATA,
>> +	MHI_ER_CTRL,
>> +	MHI_ER_TSYNC,
>> +};
>> +
>> +/**
>> + * enum mhi_db_brst_mode - Doorbell mode
>> + * @MHI_DB_BRST_DISABLE: Burst mode disable
>> + * @MHI_DB_BRST_ENABLE: Burst mode enable
>> + */
>> +enum mhi_db_brst_mode {
>> +	MHI_DB_BRST_DISABLE = 0x2,
>> +	MHI_DB_BRST_ENABLE = 0x3,
>> +};
>> +
>> +/**
>> + * struct mhi_channel_config - Channel configuration structure for controller
>> + * @num: The number assigned to this channel
>> + * @name: The name of this channel
>> + * @num_elements: The number of elements that can be queued to this channel
>> + * @local_elements: The local ring length of the channel
>> + * @event_ring: The event rung index that services this channel
>> + * @dir: Direction that data may flow on this channel
>> + * @type: Channel type
>> + * @ee_mask: Execution Environment mask for this channel
>> + * @pollcfg: Polling configuration for burst mode.  0 is default.  milliseconds
>> +	     for UL channels, multiple of 8 ring elements for DL channels
>> + * @data_type: Data type accepted by this channel
>> + * @doorbell: Doorbell mode
>> + * @lpm_notify: The channel master requires low power mode notifications
>> + * @offload_channel: The client manages the channel completely
>> + * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
>> + * @auto_queue: Framework will automatically queue buffers for DL traffic
>> + * @auto_start: Automatically start (open) this channel
>> + */
>> +struct mhi_channel_config {
>> +	u32 num;
>> +	char *name;
> 
> If you have a "name" for your configuration, shouldn't this be a struct
> device so you see that in sysfs?  If not, what is the name for?

The config struct is used to create the channel device, but is not the 
channel device.  Eventually a struct mhi_device is created from this 
information.

> 
>> +	u32 num_elements;
>> +	u32 local_elements;
>> +	u32 event_ring;
>> +	enum dma_data_direction dir;
>> +	enum mhi_ch_type type;
>> +	u32 ee_mask;
>> +	u32 pollcfg;
>> +	enum mhi_buf_type data_type;
>> +	enum mhi_db_brst_mode doorbell;
>> +	bool lpm_notify;
>> +	bool offload_channel;
>> +	bool doorbell_mode_switch;
>> +	bool auto_queue;
>> +	bool auto_start;
>> +};
>> +
>> +/**
>> + * struct mhi_event_config - Event ring configuration structure for controller
>> + * @num_elements: The number of elements that can be queued to this ring
>> + * @irq_moderation_ms: Delay irq for additional events to be aggregated
>> + * @irq: IRQ associated with this ring
>> + * @channel: Dedicated channel number. U32_MAX indicates a non-dedicated ring
>> + * @mode: Doorbell mode
>> + * @data_type: Type of data this ring will process
>> + * @hardware_event: This ring is associated with hardware channels
>> + * @client_managed: This ring is client managed
>> + * @offload_channel: This ring is associated with an offloaded channel
>> + * @priority: Priority of this ring. Use 1 for now
>> + */
>> +struct mhi_event_config {
>> +	u32 num_elements;
>> +	u32 irq_moderation_ms;
>> +	u32 irq;
>> +	u32 channel;
>> +	enum mhi_db_brst_mode mode;
>> +	enum mhi_er_data_type data_type;
>> +	bool hardware_event;
>> +	bool client_managed;
>> +	bool offload_channel;
>> +	u32 priority;
>> +};
>> +
>> +/**
>> + * struct mhi_controller_config - Root MHI controller configuration
>> + * @max_channels: Maximum number of channels supported
>> + * @timeout_ms: Timeout value for operations. 0 means use default
>> + * @use_bounce_buf: Use a bounce buffer pool due to limited DDR access
>> + * @m2_no_db: Host is not allowed to ring DB in M2 state
>> + * @buf_len: Size of automatically allocated buffers. 0 means use default
>> + * @num_channels: Number of channels defined in @ch_cfg
>> + * @ch_cfg: Array of defined channels
>> + * @num_events: Number of event rings defined in @event_cfg
>> + * @event_cfg: Array of defined event rings
>> + */
>> +struct mhi_controller_config {
>> +	u32 max_channels;
>> +	u32 timeout_ms;
>> +	bool use_bounce_buf;
>> +	bool m2_no_db;
>> +	u32 buf_len;
>> +	u32 num_channels;
>> +	struct mhi_channel_config *ch_cfg;
>> +	u32 num_events;
>> +	struct mhi_event_config *event_cfg;
> 
> You really should run pahole on this file to see how badly packed these
> structures are :(
> 
>> +};
>> +
>> +/**
>> + * struct mhi_controller - Master MHI controller structure
>> + * @name: Name of the controller
>> + * @dev: Driver model device node for the controller
>> + * @mhi_dev: MHI device instance for the controller
>> + * @dev_id: Device ID of the controller
>> + * @bus_id: Physical bus instance used by the controller
>> + * @regs: Base address of MHI MMIO register space
>> + * @iova_start: IOMMU starting address for data
>> + * @iova_stop: IOMMU stop address for data
>> + * @fw_image: Firmware image name for normal booting
>> + * @edl_image: Firmware image name for emergency download mode
>> + * @fbc_download: MHI host needs to do complete image transfer
>> + * @sbl_size: SBL image size
>> + * @seg_len: BHIe vector size
>> + * @max_chan: Maximum number of channels the controller supports
>> + * @mhi_chan: Points to the channel configuration table
>> + * @lpm_chans: List of channels that require LPM notifications
>> + * @total_ev_rings: Total # of event rings allocated
>> + * @hw_ev_rings: Number of hardware event rings
>> + * @sw_ev_rings: Number of software event rings
>> + * @nr_irqs_req: Number of IRQs required to operate
>> + * @nr_irqs: Number of IRQ allocated by bus master
>> + * @irq: base irq # to request
>> + * @mhi_event: MHI event ring configurations table
>> + * @mhi_cmd: MHI command ring configurations table
>> + * @mhi_ctxt: MHI device context, shared memory between host and device
>> + * @timeout_ms: Timeout in ms for state transitions
>> + * @pm_mutex: Mutex for suspend/resume operation
>> + * @pre_init: MHI host needs to do pre-initialization before power up
>> + * @pm_lock: Lock for protecting MHI power management state
>> + * @pm_state: MHI power management state
>> + * @db_access: DB access states
>> + * @ee: MHI device execution environment
>> + * @wake_set: Device wakeup set flag
>> + * @dev_wake: Device wakeup count
>> + * @alloc_size: Total memory allocations size of the controller
>> + * @pending_pkts: Pending packets for the controller
>> + * @transition_list: List of MHI state transitions
>> + * @wlock: Lock for protecting device wakeup
>> + * @M0: M0 state counter for debugging
>> + * @M2: M2 state counter for debugging
>> + * @M3: M3 state counter for debugging
>> + * @M3_FAST: M3 Fast state counter for debugging
>> + * @st_worker: State transition worker
>> + * @fw_worker: Firmware download worker
>> + * @syserr_worker: System error worker
>> + * @state_event: State change event
>> + * @status_cb: CB function to notify various power states to bus master
>> + * @link_status: CB function to query link status of the device
>> + * @wake_get: CB function to assert device wake
>> + * @wake_put: CB function to de-assert device wake
>> + * @wake_toggle: CB function to assert and deasset (toggle) device wake
>> + * @runtime_get: CB function to controller runtime resume
>> + * @runtimet_put: CB function to decrement pm usage
>> + * @lpm_disable: CB function to request disable link level low power modes
>> + * @lpm_enable: CB function to request enable link level low power modes again
>> + * @bounce_buf: Use of bounce buffer
>> + * @buffer_len: Bounce buffer length
>> + * @priv_data: Points to bus master's private data
>> + */
>> +struct mhi_controller {
>> +	const char *name;
>> +	struct device *dev;
> 
> Why isn't this a struct device directly?  Why a pointer?
> 
> And why don't you use the name in the struct device?
> 
>> +	struct mhi_device *mhi_dev;
>> +	u32 dev_id;
>> +	u32 bus_id;
> 
> Shouldn't the bus id come from the bus it is assigned to?  Why store it
> again?
> 
>> +	void __iomem *regs;
>> +	dma_addr_t iova_start;
>> +	dma_addr_t iova_stop;
>> +	const char *fw_image;
>> +	const char *edl_image;
>> +	bool fbc_download;
>> +	size_t sbl_size;
>> +	size_t seg_len;
>> +	u32 max_chan;
>> +	struct mhi_chan *mhi_chan;
>> +	struct list_head lpm_chans;
>> +	u32 total_ev_rings;
>> +	u32 hw_ev_rings;
>> +	u32 sw_ev_rings;
>> +	u32 nr_irqs_req;
>> +	u32 nr_irqs;
>> +	int *irq;
>> +
>> +	struct mhi_event *mhi_event;
>> +	struct mhi_cmd *mhi_cmd;
>> +	struct mhi_ctxt *mhi_ctxt;
>> +
>> +	u32 timeout_ms;
>> +	struct mutex pm_mutex;
>> +	bool pre_init;
>> +	rwlock_t pm_lock;
>> +	u32 pm_state;
>> +	u32 db_access;
>> +	enum mhi_ee_type ee;
>> +	bool wake_set;
>> +	atomic_t dev_wake;
>> +	atomic_t alloc_size;
>> +	atomic_t pending_pkts;
> 
> Why a bunch of atomic variables when you already have a lock?
> 
>> +	struct list_head transition_list;
>> +	spinlock_t transition_lock;
> 
> You don't document this lock.
> 
>> +	spinlock_t wlock;
> 
> Why have 2 locks?
> 
>> +	u32 M0, M2, M3, M3_FAST;
>> +	struct work_struct st_worker;
>> +	struct work_struct fw_worker;
>> +	struct work_struct syserr_worker;
>> +	wait_queue_head_t state_event;
>> +
>> +	void (*status_cb)(struct mhi_controller *mhi_cntrl, void *priv,
>> +			  enum mhi_callback cb);
>> +	int (*link_status)(struct mhi_controller *mhi_cntrl, void *priv);
>> +	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
>> +	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
>> +	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
>> +	int (*runtime_get)(struct mhi_controller *mhi_cntrl, void *priv);
>> +	void (*runtime_put)(struct mhi_controller *mhi_cntrl, void *priv);
>> +	void (*lpm_disable)(struct mhi_controller *mhi_cntrl, void *priv);
>> +	void (*lpm_enable)(struct mhi_controller *mhi_cntrl, void *priv);
> 
> Shouldn't all of these be part of the bus or driver assigned to this
> device and not in the device itself?  This feels odd as-is.
> 
>> +
>> +	bool bounce_buf;
>> +	size_t buffer_len;
>> +	void *priv_data;
> 
> Why can't you use the private pointer in struct device?
> 
>> +};
>> +
>> +/**
>> + * struct mhi_device - Structure representing a MHI device which binds
>> + *                     to channels
>> + * @dev: Driver model device node for the MHI device
>> + * @tiocm: Device current terminal settings
>> + * @id: Pointer to MHI device ID struct
>> + * @chan_name: Name of the channel to which the device binds
>> + * @mhi_cntrl: Controller the device belongs to
>> + * @ul_chan: UL channel for the device
>> + * @dl_chan: DL channel for the device
>> + * @dev_wake: Device wakeup counter
>> + * @dev_type: MHI device type
>> + */
>> +struct mhi_device {
>> +	struct device dev;
>> +	u32 tiocm;
>> +	const struct mhi_device_id *id;
>> +	const char *chan_name;
>> +	struct mhi_controller *mhi_cntrl;
>> +	struct mhi_chan *ul_chan;
>> +	struct mhi_chan *dl_chan;
>> +	atomic_t dev_wake;
> 
> Why does this have to be atomic?
> 
>> +	enum mhi_device_type dev_type;
>> +};
>> +
>> +/**
>> + * struct mhi_result - Completed buffer information
>> + * @buf_addr: Address of data buffer
>> + * @dir: Channel direction
>> + * @bytes_xfer: # of bytes transferred
>> + * @transaction_status: Status of last transaction
>> + */
>> +struct mhi_result {
>> +	void *buf_addr;
> 
> Why void *?

Because its not possible to resolve this more clearly.  The client 
provides the buffer and knows what the structure is.  The bus does not. 
Its just an opaque pointer (hence void *) to the bus, and the client 
needs to decode it.  This is the struct that is handed to the client to 
allow them to decode the activity (either a received buf, or a 
confirmation that a transmitted buf has been consumed).

> 
>> +	enum dma_data_direction dir;
>> +	size_t bytes_xferd;
>> +	int transaction_status;
>> +};
>> +
> 
> thanks,
> 
> greg k-h
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
