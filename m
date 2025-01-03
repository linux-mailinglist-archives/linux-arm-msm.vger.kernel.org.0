Return-Path: <linux-arm-msm+bounces-43879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D44A0093F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6B8D3A409F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB271F9F5A;
	Fri,  3 Jan 2025 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ha+z8R5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B91F9AA1;
	Fri,  3 Jan 2025 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907379; cv=none; b=GGiH1S/UNrEDmoKnk2xosppNYODitGvonArLGvOcfIZ/+GtpggY/q7jNs0asL+4Vb3GVIpfKzYYDxXq3XfJqEnyJgkJmuJzcAlTpEQai1vFyqFuaLYkAGgP4ovE1GZE388mzMM7AwFuJQhkcBwhOyhXdKD91ZUBfhKT9pqpjwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907379; c=relaxed/simple;
	bh=OR4AAS5WCeVRXq53EbXZ8sJ31Z4QySSwtZcQNgqrj1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tio9QLCLkapTDMl5M4Cjs9g761OpZAmJG5+LoJAX2KD6fGIvIrLXb99ixwEIN4gjIQeUgvvZW7dIuTjcHGdUHWimcCNBAsfbMn4K0XEDePjx0wEmYkX4d0Q5CRvAyUb7yUPCiOfVw/71HYuxGfroCZwvsVxWjqv+t9VWET2YJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ha+z8R5J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50375r0d031515;
	Fri, 3 Jan 2025 12:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdbDCRhSQ5aOXI3IjJscWe6cGN71+0Z9/X1PcgFrdsQ=; b=Ha+z8R5Jwsng42NA
	x1OKQMlE8k7BnEvGj1+l5C/QYTpv1lZChNzroVjytu1qofSl7LD8D676ULavM61P
	LAu994Hr09yElhAl735gcilDcMtprVqT/IJ6A3vyWK0R2e8AKJYEOr2I392VMWtq
	KENWGXRl08aLoc/mO9FRY9X1Ls7Q8+DA5H5caGMeXTNU2buDrHzMyw21JORCI9LI
	+TPBsMxWCyOdeddyIDJlHsHTEaKO1wCoovBWZjffD3k3Ehhn3DqHPAUKEY8oplk0
	ZeUItZoYw97B1zgWmnztApntGSbtsTRHwDq9rcZ1RgfE9tVsftqrAE9JWstRGOLC
	FNfiMw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xb700p0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 12:29:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503CTUTw031116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 12:29:30 GMT
Received: from [10.50.14.170] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 04:29:25 -0800
Message-ID: <5337a6fb-063d-4abe-9ab2-eb0f417dbc55@quicinc.com>
Date: Fri, 3 Jan 2025 17:59:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <dmitry.baryshkov@linaro.org>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-3-quic_srichara@quicinc.com>
 <f8981eda-5040-4288-8d7a-c699030ebe49@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <f8981eda-5040-4288-8d7a-c699030ebe49@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fThL69NO2FuKRUOAn8DwGeShY-nzQkHu
X-Proofpoint-GUID: fThL69NO2FuKRUOAn8DwGeShY-nzQkHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030110



On 12/31/2024 1:36 PM, Krzysztof Kozlowski wrote:
> On 31/12/2024 06:49, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> This mailbox facilitates the communication between the TME-L server based
>> subsystems (Q6) and the TME-L client (APPSS/BTSS/AUDIOSS), used for security
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Thank you.
> </form letter>
> 

ho, will recheck and fix missed comment.

> Still wrong wrapping.
> 
ok, will fix.

>> services like secure image authentication, enable/disable efuses, crypto
>> services. Each client in the   SoC has its own block of message RAM and IRQ
>> for communication with the TME-L SS. The protocol used to communicate in the
>> message RAM is known as Qualcomm Messaging Protocol (QMP).
>>
>> Remote proc driver subscribes to this mailbox and uses the mbox_send_message
>> to use TME-L to securely authenticate/teardown the images.
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>    [v2] Added worker for mailbox tx processing, since some of the operations can sleep
>>         Fixed checkpatch warnings. Some [CHECK] like below still exist, but that looks
>>         like a false postive.
>>
>>         CHECK: Macro argument 'm' may be better as '(m)' to avoid precedence issues
>>          #1072: FILE: include/linux/mailbox/tmelcom-qmp.h:40:
>>          +#define TMEL_MSG_UID_CREATE(m, a)      ((u32)(((m & 0xff) << 8) | (a & 0xff)))
>>
>>   drivers/mailbox/Kconfig             |   7 +
>>   drivers/mailbox/Makefile            |   2 +
>>   drivers/mailbox/qcom-tmel-qmp.c     | 971 ++++++++++++++++++++++++++++
>>   include/linux/mailbox/tmelcom-qmp.h | 157 +++++
>>   4 files changed, 1137 insertions(+)
>>   create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
>>   create mode 100644 include/linux/mailbox/tmelcom-qmp.h
>>
>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>> index 8ecba7fb999e..8ad0b834d617 100644
>> --- a/drivers/mailbox/Kconfig
>> +++ b/drivers/mailbox/Kconfig
>> @@ -306,4 +306,11 @@ config THEAD_TH1520_MBOX
>>   	  kernel is running, and E902 core used for power management among other
>>   	  things.
>>   
>> +config QCOM_TMEL_QMP_MAILBOX
> 
> Did you just place it at the end instead of gropped or sorted?
> 
Ho, placed it in end, will fix it.

>> +	tristate "QCOM Mailbox Protocol(QMP) for TME-L SS"
>> +	help
>> +	  Say yes to add support for the QMP Mailbox Protocol driver for TME-L.
>> +	  QMP is a lightweight communication protocol for sending messages to
>> +	  TME-L. This protocol fits into the Generic Mailbox Framework.
>> +	  QMP uses a mailbox registers.
>>   endif
>> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
>> index 5f4f5b0ce2cc..4dba283a94ad 100644
>> --- a/drivers/mailbox/Makefile
>> +++ b/drivers/mailbox/Makefile
>> @@ -66,3 +66,5 @@ obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
>>   obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
>>   
>>   obj-$(CONFIG_THEAD_TH1520_MBOX)	+= mailbox-th1520.o
>> +
>> +obj-$(CONFIG_QCOM_TMEL_QMP_MAILBOX) += qcom-tmel-qmp.o
> 
> Same problem.
> 
ok, will fix.

>> diff --git a/drivers/mailbox/qcom-tmel-qmp.c b/drivers/mailbox/qcom-tmel-qmp.c
>> new file mode 100644
>> index 000000000000..6de0a418e0ae
>> --- /dev/null
>> +++ b/drivers/mailbox/qcom-tmel-qmp.c
>> @@ -0,0 +1,971 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/dma-direction.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/init.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/kthread.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mailbox_controller.h>
>> +#include <linux/mailbox/tmelcom-qmp.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
> 
> Not used
> 
ok, will remove.

>> +#include <linux/of_platform.h>
> 
> Looks also not used
>
will remove.

>> +#include <linux/platform_device.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/types.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/uio.h>
>> +#include <linux/workqueue.h>
> 
> 
> Several headers here look unused.
> 
ok, will check and fix.

>> +
>> +#define QMP_NUM_CHANS	0x1
>> +#define QMP_TOUT_MS	1000
>> +#define MBOX_ALIGN_BYTES	3
>> +#define QMP_CTRL_DATA_SIZE	4
>> +#define QMP_MAX_PKT_SIZE	0x18
>> +#define QMP_UCORE_DESC_OFFSET	0x1000
>> +
>> +#define QMP_CH_VAR_GET(mdev, desc, var) ((mdev)->desc.bits.var)
>> +#define QMP_CH_VAR_SET(mdev, desc, var) (mdev)->desc.bits.var = 1
>> +#define QMP_CH_VAR_CLR(mdev, desc, var) (mdev)->desc.bits.var = 0
>> +
>> +#define QMP_MCORE_CH_VAR_GET(mdev, var)	QMP_CH_VAR_GET(mdev, mcore, var)
>> +#define QMP_MCORE_CH_VAR_SET(mdev, var)	QMP_CH_VAR_SET(mdev, mcore, var)
>> +#define QMP_MCORE_CH_VAR_CLR(mdev, var)	QMP_CH_VAR_CLR(mdev, mcore, var)
>> +
>> +#define QMP_MCORE_CH_VAR_TOGGLE(mdev, var) \
>> +	(mdev)->mcore.bits.var = !((mdev)->mcore.bits.var)
>> +#define QMP_MCORE_CH_ACKED_CHECK(mdev, var) \
>> +	((mdev)->ucore.bits.var == (mdev)->mcore.bits.var##_ack)
>> +#define QMP_MCORE_CH_ACK_UPDATE(mdev, var) \
>> +	(mdev)->mcore.bits.var##_ack = (mdev)->ucore.bits.var
>> +#define QMP_MCORE_CH_VAR_ACK_CLR(mdev, var) \
>> +	(mdev)->mcore.bits.var##_ack = 0
>> +
>> +#define QMP_UCORE_CH_VAR_GET(mdev, var)	QMP_CH_VAR_GET(mdev, ucore, var)
>> +#define QMP_UCORE_CH_ACKED_CHECK(mdev, var) \
>> +	((mdev)->mcore.bits.var == (mdev)->ucore.bits.var##_ack)
>> +#define QMP_UCORE_CH_VAR_TOGGLED_CHECK(mdev, var) \
>> +	((mdev)->ucore.bits.var != (mdev)->mcore.bits.var##_ack)
>> +
>> +/**
>> + * enum qmp_local_state -	definition of the local state machine
>> + * @LINK_DISCONNECTED:		Init state, waiting for ucore to start
>> + * @LINK_NEGOTIATION:		Set local link state to up, wait for ucore ack
>> + * @LINK_CONNECTED:		Link state up, channel not connected
>> + * @LOCAL_CONNECTING:		Channel opening locally, wait for ucore ack
>> + * @CHANNEL_CONNECTED:		Channel fully opened
>> + * @LOCAL_DISCONNECTING:	Channel closing locally, wait for ucore ack
>> + */
>> +enum qmp_local_state {
>> +	LINK_DISCONNECTED,
>> +	LINK_NEGOTIATION,
>> +	LINK_CONNECTED,
>> +	LOCAL_CONNECTING,
>> +	CHANNEL_CONNECTED,
>> +	LOCAL_DISCONNECTING,
>> +};
>> +
>> +union channel_desc {
>> +	struct {
>> +		u32 link_state:1;
>> +		u32 link_state_ack:1;
>> +		u32 ch_state:1;
>> +		u32 ch_state_ack:1;
>> +		u32 tx:1;
>> +		u32 tx_ack:1;
>> +		u32 rx_done:1;
>> +		u32 rx_done_ack:1;
>> +		u32 read_int:1;
>> +		u32 read_int_ack:1;
>> +		u32 reserved:6;
>> +		u32 frag_size:8;
>> +		u32 rem_frag_count:8;
>> +	} bits;
>> +	unsigned int val;
>> +};
>> +
>> +struct qmp_work {
>> +	struct work_struct work;
>> +	void *data;
>> +};
>> +
>> +/**
>> + * struct qmp_device - local information for managing a single mailbox
>> + * @dev:	    The device that corresponds to this mailbox
>> + * @ctrl:	    The mbox controller for this mailbox
>> + * @mcore_desc:	    Local core (APSS) mailbox descriptor
>> + * @ucore_desc:	    Remote core (TME-L) mailbox descriptor
>> + * @mcore:	    Local core (APSS) channel descriptor
>> + * @ucore:	    Remote core (TME-L) channel descriptor
>> + * @rx_pkt:	    Buffer to pass to client, holds received data from mailbox
>> + * @tx_pkt:	    Buffer from client, holds data to send on mailbox
>> + * @mbox_client:    Mailbox client for the IPC interrupt
>> + * @mbox_chan:	    Mailbox client chan for the IPC interrupt
>> + * @local_state:    Current state of mailbox protocol
>> + * @state_lock:	    Serialize mailbox state changes
>> + * @tx_lock:	    Serialize access for writes to mailbox
>> + * @link_complete:  Use to block until link negotiation with remote proc
>> + * @ch_complete:    Use to block until the channel is fully opened
>> + * @dwork:	    Delayed work to detect timed out tx
>> + * @tx_sent:	    True if tx is sent and remote proc has not sent ack
>> + */
>> +struct qmp_device {
>> +	struct device *dev;
>> +	struct mbox_controller ctrl;
>> +	struct qmp_work qwork;
>> +
>> +	void __iomem *mcore_desc;
>> +	void __iomem *ucore_desc;
>> +	union channel_desc mcore;
>> +	union channel_desc ucore;
>> +
>> +	struct kvec rx_pkt;
>> +	struct kvec tx_pkt;
>> +
>> +	struct mbox_client mbox_client;
>> +	struct mbox_chan *mbox_chan;
>> +
>> +	enum qmp_local_state local_state;
>> +
>> +	/* Lock for QMP link state changes */
> 
> Vague
ok, whole of the locking needs some fixing. Infact, with little
more changes, no need to have the 2 mutexes. will remove them and
just have the spinlock for updates to m/u core registers and
state machine tracking.

> 
>> +	struct mutex state_lock;
>> +	/* Lock to serialize access to mailbox */
> 
> No, I don't see serialized access to mailbox. I see some parts of access
> being protected. Write descriptive lock descriptions.
> 
 >
Yes, wrong comment. spinlock was to protect access to m/u core and
state machine updates. will fix it in next version.

>> +	spinlock_t tx_lock;
>> +
>> +	struct completion link_complete;
>> +	struct completion ch_complete;
>> +	struct delayed_work dwork;
>> +	void *data;
>> +
>> +	bool tx_sent;
>> +	bool ch_in_use;
>> +};
>> +
>> +struct tmel_msg_param_type_buf_in {
>> +	u32 buf;
>> +	u32 buf_len;
>> +};
>> +
>> +struct tmel_secboot_sec_auth_req {
>> +	u32 sw_id;
>> +	struct tmel_msg_param_type_buf_in elf_buf;
>> +	struct tmel_msg_param_type_buf_in region_list;
>> +	u32 relocate;
>> +} __packed;
>> +
>> +struct tmel_secboot_sec_auth_resp {
>> +	u32 first_seg_addr;
>> +	u32 first_seg_len;
>> +	u32 entry_addr;
>> +	u32 extended_error;
>> +	u32 status;
>> +} __packed;
>> +
>> +struct tmel_secboot_sec_auth {
>> +	struct tmel_secboot_sec_auth_req req;
>> +	struct tmel_secboot_sec_auth_resp resp;
>> +} __packed;
>> +
>> +struct tmel_secboot_teardown_req {
>> +	u32 sw_id;
>> +	u32 secondary_sw_id;
>> +} __packed;
>> +
>> +struct tmel_secboot_teardown_resp {
>> +	u32 status;
>> +} __packed;
>> +
>> +struct tmel_secboot_teardown {
>> +	struct tmel_secboot_teardown_req req;
>> +	struct tmel_secboot_teardown_resp resp;
>> +} __packed;
>> +
>> +struct tmel {
>> +	struct device *dev;
>> +	struct qmp_device *mdev;
>> +	struct kvec pkt;
>> +	/* To serialize incoming tmel request */
> 
> No, explain what is exactly protected. We all know that mutex serializes...
> 
ok, will remove this mutex in next version.

>> +	struct mutex lock;
>> +	struct tmel_ipc_pkt *ipc_pkt;
>> +	dma_addr_t sram_dma_addr;
>> +	wait_queue_head_t waitq;
>> +	bool rx_done;
>> +};
>> +
>> +static struct tmel *tmeldev;
> 
> NAK, First: it is not needed, second: even if it in this spaghetti code
> it was needed, answer would be drop it and fix your code not to create
> fake singletons.
> 
ok, no need to have this global. with updated design will remove this
in next spin. Will have it instance specific.

>> +
>> +/**
>> + * qmp_send_irq() - send an irq to a remote entity as an event signal.
>> + * @mdev:       Which remote entity that should receive the irq.
>> + */
>> +static void qmp_send_irq(struct qmp_device *mdev)
>> +{
>> +	/* Update the mcore val to mcore register */
>> +	iowrite32(mdev->mcore.val, mdev->mcore_desc);
>> +	/* Ensure desc update is visible before IPC */
>> +	wmb();
>> +
>> +	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
>> +		mdev->mcore.val, mdev->ucore.val);
>> +
>> +	mbox_send_message(mdev->mbox_chan, NULL);
>> +	mbox_client_txdone(mdev->mbox_chan, 0);
>> +}
>> +
> 
> ...
> 
>> +static irqreturn_t qmp_irq_handler(int irq, void *priv)
>> +{
>> +	struct qmp_device *mdev = (struct qmp_device *)priv;
>> +
>> +	qmp_rx(mdev);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int tmel_qmp_parse_devicetree(struct platform_device *pdev,
>> +				     struct qmp_device *mdev)
> 
> 
> Probe functions are always next to each other, not in other part of unit.
> 
ok, will fix it.

>> +{
>> +	struct device *dev = &pdev->dev;
>> +
>> +	mdev->mcore_desc = devm_platform_ioremap_resource(pdev, 0);
>> +	if (!mdev->mcore_desc) {
>> +		dev_err(dev, "ioremap failed for mcore reg\n");
>> +		return -EIO;
>> +	}
>> +
>> +	mdev->ucore_desc = mdev->mcore_desc + QMP_UCORE_DESC_OFFSET;
>> +
>> +	mdev->mbox_client.dev = dev;
>> +	mdev->mbox_client.knows_txdone = false;
>> +	mdev->mbox_chan = mbox_request_channel(&mdev->mbox_client, 0);
>> +	if (IS_ERR(mdev->mbox_chan)) {
>> +		dev_err(dev, "mbox chan for IPC is missing\n");
> 
> Syntax is: return dev_err_probe().
> 
ok, will fix it.

>> +		return PTR_ERR(mdev->mbox_chan);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void tmel_qmp_remove(struct platform_device *pdev)
> 
> Again, why remove call is not next to probe?
> 
ok, will fix it.

>> +{
>> +	struct qmp_device *mdev = platform_get_drvdata(pdev);
>> +
>> +	mbox_controller_unregister(&mdev->ctrl);
>> +	kfree(mdev->rx_pkt.iov_base);
> 
> I don't see this being allocated in probe.
> 
Ho  wrong place. Will fix and update with right kfree's.

>> +}
>> +
>> +static struct device *tmel_get_device(void)
>> +{
>> +	struct tmel *tdev = tmeldev;
> 
> Nope. Do not create singletons.
> 
ok, yeah, will be removed in next version.

>> +
>> +	if (!tdev)
>> +		return NULL;
>> +
>> +	return tdev->dev;
>> +}
>> +
>> +static int tmel_prepare_msg(struct tmel *tdev, u32 msg_uid,
>> +			    void *msg_buf, size_t msg_size)
>> +{
>> +	struct tmel_ipc_pkt *ipc_pkt = tdev->ipc_pkt;
>> +	struct ipc_header *msg_hdr = &ipc_pkt->msg_hdr;
>> +	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
>> +	struct sram_payload *sram_payload = &ipc_pkt->payload.sram_payload;
>> +	int ret;
>> +
>> +	memset(ipc_pkt, 0, sizeof(struct tmel_ipc_pkt));
>> +
>> +	msg_hdr->msg_type = TMEL_MSG_UID_MSG_TYPE(msg_uid);
>> +	msg_hdr->action_id = TMEL_MSG_UID_ACTION_ID(msg_uid);
>> +
>> +	pr_debug("uid: %d, msg_size: %zu msg_type:%d, action_id:%d\n",
>> +		 msg_uid, msg_size, msg_hdr->msg_type, msg_hdr->action_id);
> 
> dev_dbg, stop using pr_ everywhere
> 
ok.

>> +
>> +	if (sizeof(struct ipc_header) + msg_size <= MBOX_IPC_PACKET_SIZE) {
>> +		/* Mbox only */
>> +		msg_hdr->ipc_type = IPC_MBOX_ONLY;
>> +		msg_hdr->msg_len = msg_size;
>> +		memcpy((void *)mbox_payload, msg_buf, msg_size);
>> +	} else if (msg_size <= SRAM_IPC_MAX_BUF_SIZE) {
>> +		/* SRAM */
>> +		msg_hdr->ipc_type = IPC_MBOX_SRAM;
>> +		msg_hdr->msg_len = 8;
>> +
>> +		tdev->sram_dma_addr = dma_map_single(tdev->dev, msg_buf,
>> +						     msg_size,
>> +						     DMA_BIDIRECTIONAL);
>> +		ret = dma_mapping_error(tdev->dev, tdev->sram_dma_addr);
>> +		if (ret != 0) {
>> +			pr_err("SRAM DMA mapping error: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		sram_payload->payload_ptr = tdev->sram_dma_addr;
>> +		sram_payload->payload_len = msg_size;
>> +	} else {
>> +		pr_err("Invalid payload length: %zu\n", msg_size);
> 
> No, dev_err
> 
ok.

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void tmel_unprepare_message(struct tmel *tdev,
>> +				   void *msg_buf, size_t msg_size)
>> +{
>> +	struct tmel_ipc_pkt *ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
>> +	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
>> +
>> +	if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_ONLY) {
>> +		memcpy(msg_buf, (void *)mbox_payload, msg_size);
>> +	} else if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_SRAM) {
>> +		dma_unmap_single(tdev->dev, tdev->sram_dma_addr, msg_size,
>> +				 DMA_BIDIRECTIONAL);
>> +		tdev->sram_dma_addr = 0;
>> +	}
>> +}
>> +
>> +static bool tmel_rx_done(struct tmel *tdev)
>> +{
>> +	return tdev->rx_done;
>> +}
>> +
>> +static int tmel_process_request(u32 msg_uid, void *msg_buf,
>> +				size_t msg_size)
>> +{
>> +	struct tmel *tdev = tmeldev;
>> +	unsigned long jiffies;
>> +	struct tmel_ipc_pkt *resp_ipc_pkt;
>> +	long time_left = 0;
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * Check to handle if probe is not successful or not completed yet
>> +	 */
> 
> No, it is impossible condition. This code cannot be called before probe.
> 
> Clean up your driver from such spaghetti prevention code and unspaghetti
> it, so you will understand the code flow.
> 
ok sure. wrong condition/comment because of initial debug. will remove.

> 
>> +	if (!tdev) {
>> +		pr_err("tmel dev is NULL\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (!msg_buf || !msg_size) {
>> +		pr_err("Invalid msg_buf or msg_size\n");
> 
> No, use dev_err. This applies everywhere.
> 
ok.

>> +		return -EINVAL;
>> +	}
>> +
>> +	mutex_lock(&tdev->lock);
>> +	tdev->rx_done = false;
>> +
>> +	ret = tmel_prepare_msg(tdev, msg_uid, msg_buf, msg_size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	tdev->pkt.iov_len = sizeof(struct tmel_ipc_pkt);
>> +	tdev->pkt.iov_base = (void *)tdev->ipc_pkt;
>> +
>> +	qmp_send_data(tdev->mdev, &tdev->pkt);
>> +	jiffies = msecs_to_jiffies(30000);
>> +
>> +	time_left = wait_event_interruptible_timeout(tdev->waitq,
>> +						     tmel_rx_done(tdev),
>> +						     jiffies);
>> +
>> +	if (!time_left) {
>> +		pr_err("Request timed out\n");
>> +		ret = -ETIMEDOUT;
>> +		goto err_exit;
>> +	}
>> +
>> +	if (tdev->pkt.iov_len != sizeof(struct tmel_ipc_pkt)) {
>> +		pr_err("Invalid pkt.size received size: %lu, expected: %zu\n",
>> +		       tdev->pkt.iov_len, sizeof(struct tmel_ipc_pkt));
>> +		ret = -EPROTO;
>> +		goto err_exit;
>> +	}
>> +
>> +	resp_ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
>> +	tmel_unprepare_message(tdev, msg_buf, msg_size);
>> +	tdev->rx_done = false;
>> +	ret = resp_ipc_pkt->msg_hdr.response;
>> +
>> +err_exit:
>> +	mutex_unlock(&tdev->lock);
>> +	return ret;
>> +}
>> +
>> +static int tmel_secboot_sec_auth(u32 sw_id, void *metadata, size_t size)
>> +{
>> +	struct device *dev = tmel_get_device();
>> +	struct tmel_secboot_sec_auth *msg;
>> +	dma_addr_t elf_buf_phys;
>> +	void *elf_buf;
>> +	int ret;
>> +
>> +	if (!dev || !metadata)
>> +		return -EINVAL;
>> +
>> +	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
>> +
>> +	elf_buf = dma_alloc_coherent(dev, size, &elf_buf_phys, GFP_KERNEL);
>> +	if (!elf_buf)
>> +		return -ENOMEM;
>> +
>> +	memcpy(elf_buf, metadata, size);
>> +
>> +	msg->req.sw_id = sw_id;
>> +	msg->req.elf_buf.buf = (u32)elf_buf_phys;
>> +	msg->req.elf_buf.buf_len = (u32)size;
>> +
>> +	ret = tmel_process_request(TMEL_MSG_UID_SECBOOT_SEC_AUTH, msg,
>> +				   sizeof(struct tmel_secboot_sec_auth));
>> +	if (ret) {
>> +		pr_err("Failed to send IPC: %d\n", ret);
>> +	} else if (msg->resp.status || msg->resp.extended_error) {
>> +		pr_err("Failed with status: %d error: %d\n",
>> +		       msg->resp.status, msg->resp.extended_error);
>> +		ret = msg->resp.status;
>> +	}
>> +
>> +	kfree(msg);
>> +	dma_free_coherent(dev, size, elf_buf, elf_buf_phys);
>> +
>> +	return ret;
>> +}
>> +
>> +static int tmel_secboot_teardown(u32 sw_id, u32 secondary_sw_id)
>> +{
>> +	struct device *dev = tmel_get_device();
>> +	struct tmel_secboot_teardown msg = {0};
>> +	int ret;
>> +
>> +	if (!dev)
>> +		return -EINVAL;
>> +
>> +	msg.req.sw_id = sw_id;
>> +	msg.req.secondary_sw_id = secondary_sw_id;
>> +	msg.resp.status = TMEL_ERROR_GENERIC;
>> +
>> +	ret = tmel_process_request(TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN, &msg,
>> +				   sizeof(msg));
>> +	if (ret) {
>> +		pr_err("Failed to send IPC: %d\n", ret);
>> +	} else if (msg.resp.status) {
>> +		pr_err("Failed with status: %d\n", msg.resp.status);
>> +		ret = msg.resp.status;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int tmel_init(struct qmp_device *mdev)
>> +{
>> +	struct tmel *tdev;
>> +
>> +	tdev = devm_kzalloc(mdev->dev, sizeof(*tdev), GFP_KERNEL);
>> +	if (!tdev)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&tdev->lock);
>> +
>> +	tdev->ipc_pkt = devm_kzalloc(mdev->dev, sizeof(struct tmel_ipc_pkt),
>> +				     GFP_KERNEL);
>> +	if (!tdev->ipc_pkt)
>> +		return -ENOMEM;
>> +
>> +	init_waitqueue_head(&tdev->waitq);
>> +
>> +	tdev->rx_done = false;
>> +	tdev->dev = mdev->dev;
>> +
>> +	tmeldev = tdev;
>> +	tmeldev->mdev = mdev;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tmel_qmp_send(struct mbox_chan *chan, void *data)
>> +{
>> +	struct qmp_device *mdev = chan->con_priv;
>> +
>> +	mdev->qwork.data =  data;
>> +
>> +	queue_work(system_wq, &mdev->qwork.work);
>> +
>> +	return 0;
>> +}
>> +
>> +static void tmel_qmp_send_work(struct work_struct *work)
>> +{
>> +	struct qmp_work *qwork = container_of(work, struct qmp_work, work);
>> +	struct qmp_device *mdev = tmeldev->mdev;
>> +	struct mbox_chan *chan = &mdev->ctrl.chans[0];
>> +
>> +	struct tmel_qmp_msg *tmsg = qwork->data;
>> +	struct tmel_sec_auth *smsg = tmsg->msg;
>> +	int ret;
>> +
>> +	switch (tmsg->msg_id) {
>> +	case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
>> +		ret = tmel_secboot_sec_auth(smsg->pas_id,
>> +					    smsg->data,
>> +					    smsg->size);
>> +		break;
>> +	case TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN:
>> +		ret = tmel_secboot_teardown(smsg->pas_id, 0);
>> +		break;
>> +	}
>> +
>> +	mbox_chan_txdone(chan, 0);
>> +}
>> +
>> +/**
>> + * tmel_qmp_mbox_of_xlate() - Returns a mailbox channel to be used for this mailbox
>> + *		      device. Make sure the channel is not already in use.
>> + * @mbox:       Mailbox device controlls the requested channel.
>> + * @spec:       Device tree arguments to specify which channel is requested.
>> + */
>> +static struct mbox_chan *tmel_qmp_mbox_of_xlate(struct mbox_controller *mbox,
>> +						const struct of_phandle_args *spec)
>> +{
>> +	struct qmp_device *mdev = dev_get_drvdata(mbox->dev);
>> +	unsigned int channel = spec->args[0];
>> +
>> +	if (!mdev)
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +
>> +	if (channel >= mbox->num_chans)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	mutex_lock(&mdev->state_lock);
>> +	if (mdev->ch_in_use) {
>> +		dev_err(mdev->dev, "mbox channel already in use\n");
>> +		mutex_unlock(&mdev->state_lock);
>> +		return ERR_PTR(-EBUSY);
> 
> 
> Why one cannot call xlate twice for the same argument? This looks wrong.
> Xlate does not mean that mailbox is being used.
> 
yeah, same channel could be used for different services. This condition
needs to be removed. Will fix it.

> 
>> +	}
>> +	mdev->ch_in_use = true;
>> +	mutex_unlock(&mdev->state_lock);
>> +
>> +	return &mbox->chans[0];
>> +}
>> +
>> +static struct mbox_chan_ops tmel_qmp_ops = {
>> +	.startup = tmel_qmp_startup,
>> +	.shutdown = tmel_qmp_shutdown,
>> +	.send_data = tmel_qmp_send,
>> +};
>> +
>> +static int tmel_qmp_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *node = pdev->dev.of_node;
>> +	struct mbox_chan *chans;
>> +	struct qmp_device *mdev;
>> +	int ret = 0;
>> +
>> +	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
>> +	if (!mdev)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, mdev);
>> +
>> +	ret = tmel_qmp_parse_devicetree(pdev, mdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mdev->dev = &pdev->dev;
>> +
>> +	chans = devm_kzalloc(mdev->dev,
> 
> 
> devm_kcalloc
> 
ok.

>> +			     sizeof(*chans) * QMP_NUM_CHANS, GFP_KERNEL);
>> +	if (!chans)
>> +		return -ENOMEM;
>> +
>> +	INIT_WORK(&mdev->qwork.work, tmel_qmp_send_work);
>> +
>> +	mdev->ctrl.dev = &pdev->dev;
>> +	mdev->ctrl.ops = &tmel_qmp_ops;
>> +	mdev->ctrl.chans = chans;
>> +	chans[0].con_priv = mdev;
>> +	mdev->ctrl.num_chans = QMP_NUM_CHANS;
>> +	mdev->ctrl.txdone_irq = true;
>> +	mdev->ctrl.of_xlate = tmel_qmp_mbox_of_xlate;
>> +
>> +	ret = mbox_controller_register(&mdev->ctrl);
>> +	if (ret) {
>> +		dev_err(mdev->dev, "failed to register mbox controller\n");
>> +		return ret;
>> +	}
>> +
>> +	spin_lock_init(&mdev->tx_lock);
>> +	mutex_init(&mdev->state_lock);
>> +	mdev->local_state = LINK_DISCONNECTED;
>> +	init_completion(&mdev->link_complete);
>> +	init_completion(&mdev->ch_complete);
>> +
>> +	INIT_DELAYED_WORK(&mdev->dwork, qmp_notify_timeout);
>> +
>> +	ret = platform_get_irq(pdev, 0);
>> +
>> +	ret = devm_request_threaded_irq(mdev->dev, ret,
>> +					NULL, qmp_irq_handler,
>> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					node->name, (void *)mdev);
>> +	if (ret < 0) {
>> +		dev_err(mdev->dev, "request threaded irq failed, ret %d\n",
>> +			ret);
> 
> dev_err_probe
> 
ok.

>> +
> 
> 
> 
> 
>> +
>> +static const struct of_device_id tmel_qmp_dt_match[] = {
>> +	{ .compatible = "qcom,ipq5424-tmel-qmp" },
>> +	{},
>> +};
>> +
>> +static struct platform_driver tmel_qmp_driver = {
>> +	.driver = {
>> +		.name = "tmel_qmp_mbox",
>> +		.of_match_table = tmel_qmp_dt_match,
>> +	},
>> +	.probe = tmel_qmp_probe,
>> +	.remove = tmel_qmp_remove,
>> +};
>> +module_platform_driver(tmel_qmp_driver);
>> +
>> +MODULE_DESCRIPTION("QCOM TMEL QMP DRIVER");
> 
> "driver", this is not an acronym.
> 
ok.

Regards,
  Sricharan

