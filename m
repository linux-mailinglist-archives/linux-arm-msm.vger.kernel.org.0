Return-Path: <linux-arm-msm+bounces-56787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9AAA9372
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 14:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 025107AB329
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 12:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AC124C092;
	Mon,  5 May 2025 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PNA6UtsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D33B1420DD;
	Mon,  5 May 2025 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448888; cv=none; b=NhGvqbkR4Zp+iCVp6KQfN5uqwSLGy4BY4x3Un4qvtijH8MU/XqSpZoUdkM6QTg5HR6E82AjoTco1QIDmQxnRNZZx8SKJg0y2zkyIAsECuGU6MqQX5ZtN/2u+37x2UN+x9xBPOLY7b3mHWO5AaFQEkWqjeVVjR2yj7REWJ1XbWIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448888; c=relaxed/simple;
	bh=K7/r93gMVtiQomrAP7Kf64AVeAYyV95x4wsHrc+xwns=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Xzh0Rlp1xwkWq8125Y8IRNwuZaUtpTmHXedeU44u8xvvQKzK9rI0Ih5w8OEKGgULtDYx9wWRkXUkOflGfjbaHJ2eZuAnf6i+eCV2U6eXyipM1dJE61891Ay11n+05AND/96/ud6CXUt/Zm64X9toBGNxRuP/IdQVhkMhC4TMmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PNA6UtsW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BO5X7027324;
	Mon, 5 May 2025 12:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhKaY2yVdE0YCztbUpXFgDca9yS1IyhlGgxz8hZXZRA=; b=PNA6UtsW26xyTZe8
	WeeVN5szmdYwUilKxMdBECAcH7ScVVG+mkL/GYVCJh00cac+jxjb8/BD+IwHyBko
	4puTsP2BnFtbuCWXBrCWE3kY3OM5VKTvQcIE/1nvpsexRY97ND9kUM6jiOPSqQQ9
	fXo8vPdTmY1yEl0UbzWVqKRiEyvCZ/lAVjdobixiVAriEWZgfJJ9opPChzhbeC5Z
	HupiCKeB2oGfo/4HKPmNsLZMWdP6dorPubne0qNpeWPsN7+jOPauJ2gS5xkPoTj3
	mGXiZvIvxzZbuSG3TuvaxBSnk+EbZ5xqV7JNxUWPiCliK1DsLLYebe2oaADWLQbH
	Bkizrg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep474x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:41:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 545CfJ5c001997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 12:41:19 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 05:41:16 -0700
Message-ID: <5add1d76-8f18-4d59-ae28-74885865c9dd@quicinc.com>
Date: Mon, 5 May 2025 18:11:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <dmitry.baryshkov@linaro.org>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-3-quic_srichara@quicinc.com>
 <848fd819-7e57-4340-a78a-37eaf779c6b2@oss.qualcomm.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <848fd819-7e57-4340-a78a-37eaf779c6b2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6818b1f0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=jOZ_KDUAQI6EowgXWJYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oTslHk-XMyuHtgAwZQU8qcC7e_DP3PcP
X-Proofpoint-GUID: oTslHk-XMyuHtgAwZQU8qcC7e_DP3PcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyMSBTYWx0ZWRfX+ZBVfkuibGRa
 BUk3/Dk9/sa3paTzS85TmgVo/nfSJyxTi3OMwPsqi7S+sugItS6uXjxcY/MtfkrkEAdGVd4LN62
 IbGPiD+PjHB/LVo1eJ5AZUV6BqHhgPZvhf14JI6R1lPcA6uXs4FbJD+A/qpQxCF7cWdXkOtn5yR
 2PtEjbeLXztjnDsU0j05ycQKW3KujprwHeyvBquTS9R5RnY1FbD7gSHG6cWCdhU7QTvyBA7Ygy9
 dKToQ+wgJuhbPFw3RhIgtCKWyDVfdcCIBfextcJeYcSgIyEpRMtTBIklw+kbflideESWqkiUS3e
 MgqZj1URPwTpxUMmCBfTLqJ+Malwo2ixFHUNiCawnKcShtyqClpOVJafJ5lbHF7WJwuVOKCO6rl
 NRbZmXugU/1uI1C4kDKmpMpkjyLNc+9C5EkxZcKkawl00miXk4Rl6e343gJmd30FEOpAgxvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050121



On 4/26/2025 3:14 PM, Konrad Dybcio wrote:
> On 3/27/25 7:17 PM, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> This mailbox facilitates the communication between the TMEL server
>> subsystem (Trust Management Engine Lite) and the TMEL client
>> (APPSS/BTSS/AUDIOSS), used for secure services like secure image
>> authentication, enable/disable efuses, crypto services etc. Each client in
>> the SoC has its own block of message RAM and IRQ for communication with the
>> TMEL SS. The protocol used to communicate in the message RAM is known as
>> Qualcomm Messaging Protocol (QMP).
>>
>> Remote proc driver subscribes to this mailbox and uses the
>> mbox_send_message to use TMEL to securely authenticate/teardown the images.
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
> 
> [...]
> 
>> +/*
>> + * mbox data can be shared over mem or sram
>> + */
> 
> /* foo */
> 
ok.

> [...]
> 
>> +enum ipc_type {
>> +	IPC_MBOX_MEM,
>> +	IPC_MBOX_SRAM,
>> +};
>> +
>> +/*
>> + * mbox header indicates the type of payload and action required.
>> + */
>> +struct ipc_header {
>> +	u8 ipc_type:1;
>> +	u8 msg_len:7;
>> +	u8 msg_type;
>> +	u8 action_id;
>> +	s8 response;
>> +};
> 
> You said in the changelog that __packed is not required.. I suppose it's
> technically correct, but I think it's good practice to add it on anything
> that's bounced between blocks and is of fixed size
> 
ok.

> [...]
> 
>> +/**
>> + * tmel_qmp_send_irq() - send an irq to a remote entity as an event signal.
>> + * @mdev: Which remote entity that should receive the irq.
>> + */
>> +static inline void tmel_qmp_send_irq(struct qmp_device *mdev)
>> +{
>> +	writel(mdev->mcore.val, mdev->mcore_desc);
>> +	/* Ensure desc update is visible before IPC */
>> +	wmb();
> 
> writel (non _relaxed) already includes a write barrier, to ensure write
> observability at the other endpoint, you'd have to read back the register
> instead
> 
ok

>> +
>> +	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
>> +		mdev->mcore.val, mdev->ucore.val);
>> +
>> +	mbox_send_message(mdev->mbox_chan, NULL);
>> +	mbox_client_txdone(mdev->mbox_chan, 0);
>> +}
>> +  
>> +/**
>> + * tmel_qmp_send_data() - Send the data to remote and notify.
>> + * @mdev: qmp_device to send the data to.
>> + * @data: Data to be sent to remote processor, should be in the format of
>> + *	  a kvec.
>> + *
>> + * Copy the data to the channel's mailbox and notify remote subsystem of new
>> + * data. This function will return an error if the previous message sent has
>> + * not been read.
> 
> This is not valid kerneldoc, check make W=1, there are many cases in
> this file
> 
ok, but i ran kerneldoc check and did not get any error. Anyways let me
re-check with W=1 once.

> [...]
> 
>> +	/* read remote_desc from mailbox register */
> 
> All other comments start with an uppercase letter, please make it
> consistent
> 
ok.

> [...]
> 
>> +	mdev->ucore.val = readl(mdev->ucore_desc);
>> +
>> +	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
>> +		mdev->mcore.val, mdev->ucore.val);
>> +
>> +	spin_lock_irqsave(&mdev->tx_lock, flags);
>> +
>> +	/* Check if remote link down */
>> +	if (mdev->local_state >= LINK_CONNECTED &&
>> +	    !(mdev->ucore.bits.link_state)) {
>> +		mdev->local_state = LINK_NEGOTIATION;
>> +		mdev->mcore.bits.link_state_ack = mdev->ucore.bits.link_state;
> 
> You dereference into local_state, mcore and ucore a lot - consider
> creating a variable to reduce the constant ->/.-age
> 
ok

> [...]
> 
>> +	if (sizeof(struct ipc_header) + msg_size <= QMP_MBOX_IPC_PACKET_SIZE) {
>> +		/* Mbox only */
>> +		msg_hdr->ipc_type = IPC_MBOX_MEM;
>> +		msg_hdr->msg_len = msg_size;
>> +		memcpy((void *)mbox_payload, msg_buf, msg_size);
>> +	} else if (msg_size <= QMP_SRAM_IPC_MAX_BUF_SIZE) {
> 
>> +		/* SRAM */
>> +		msg_hdr->ipc_type = IPC_MBOX_SRAM;
>> +		msg_hdr->msg_len = 8;
> 
> I think we should check for == and not <= to rule out some partially
> transacted messages
> 
ok, will fix.

> [...]
> 
>> +
>> +		tdev->sram_dma_addr = dma_map_single(tdev->dev, msg_buf,
>> +						     msg_size,
>> +						     DMA_BIDIRECTIONAL);
>> +		ret = dma_mapping_error(tdev->dev, tdev->sram_dma_addr);
>> +		if (ret) {
>> +			dev_err(tdev->dev, "SRAM DMA mapping error: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		sram_payload->payload_ptr = tdev->sram_dma_addr;
>> +		sram_payload->payload_len = msg_size;
>> +	} else {
>> +		dev_err(tdev->dev, "Invalid payload length: %zu\n", msg_size);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * tmel_unprepare_message() - Get the response data back for client
>> + * @tdev: the tmel device
>> + * @msg_buf: payload to be sent
>> + * @msg_size: size of the payload
>> + */
>> +static inline void tmel_unprepare_message(struct tmel *tdev, void *msg_buf, size_t msg_size)
>> +{
>> +	struct tmel_ipc_pkt *ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
>> +	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
>> +
>> +	if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_MEM) {
>> +		memcpy(msg_buf, mbox_payload, msg_size);
>> +	} else if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_SRAM) {
>> +		dma_unmap_single(tdev->dev, tdev->sram_dma_addr, msg_size, DMA_BIDIRECTIONAL);
>> +		tdev->sram_dma_addr = 0;
>> +	}
>> +}
>> +
>> +static inline bool tmel_rx_done(struct tmel *tdev)
>> +{
>> +	return tdev->rx_done;
>> +}
>> +
>> +/**
>> + * tmel_process_request() - process client msg and wait for response
>> + * @tdev: the tmel device
>> + * @msg_uid: msg_type/action_id combo
>> + * @msg_buf: payload to be sent
>> + * @msg_size: size of the payload
>> + */
>> +static inline int tmel_process_request(struct tmel *tdev, u32 msg_uid,
>> +				       void *msg_buf, size_t msg_size)
>> +{
>> +	struct qmp_device *mdev = tdev->mdev;
>> +	struct tmel_ipc_pkt *resp_ipc_pkt;
>> +	struct mbox_chan *chan;
>> +	unsigned long jiffies;
>> +	long time_left = 0;
>> +	int ret = 0;
>> +
>> +	chan = &tdev->ctrl.chans[0];
>> +
>> +	if (!msg_buf || !msg_size) {
>> +		dev_err(tdev->dev, "Invalid msg_buf or msg_size\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	tdev->rx_done = false;
>> +
>> +	ret = tmel_prepare_msg(tdev, msg_uid, msg_buf, msg_size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	tdev->pkt.iov_len = sizeof(struct tmel_ipc_pkt);
>> +	tdev->pkt.iov_base = (void *)tdev->ipc_pkt;
>> +
>> +	tmel_qmp_send_data(mdev, &tdev->pkt);
>> +	jiffies = msecs_to_jiffies(QMP_SEND_TIMEOUT);
>> +
>> +	time_left = wait_event_interruptible_timeout(tdev->waitq,
>> +						     tmel_rx_done(tdev),
>> +						     jiffies);
>> +
> 
> Unexpected \n
> 
ok.

> [...]
> 
>> +	if (ret) {
>> +		dev_err(dev, "Failed to send IPC: %d\n", ret);
>> +	} else if (smsg->msg.resp.status) {
>> +		dev_err(dev, "Failed with status: %d", smsg->msg.resp.status);
>> +		ret = smsg->msg.resp.status ? -EINVAL : 0;
> 
> Do the internal error numbers correspond to linux errnos?
> 
> E.g. is there an TMEL_ERROR_TIMEDOUT that could be mapped to
> ETIMEDOUT?
> 
There is no direct mapping, hence this sideband conversion.

> [...]
> 
>> +	/*
>> +	 * Kick start the SM from the negotiation phase
> 
> Please spell out state machine, it's not obvious
> 
ok.

> [...]
> 
>> +
>> +	ret = platform_get_irq(pdev, 0);
> 
> This return value is never checked
> 
ok, will fix.

Regards,
  Sricharan

