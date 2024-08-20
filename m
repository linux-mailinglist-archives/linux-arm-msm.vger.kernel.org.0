Return-Path: <linux-arm-msm+bounces-29140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E8958DE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 20:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F8EB21A14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 18:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EAA1C0DCE;
	Tue, 20 Aug 2024 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lqHXDsSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987D1990B5;
	Tue, 20 Aug 2024 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724177957; cv=none; b=XDEWzi6eZFBETDkh1X5CiHHevJUkD73qqKrzdpBbHWZY8hlAW5lzL0o+6lHoT3hXdpOEYj4N3pRtm1cvcirpfPaSMTl2wpKajGq+4v1cDjdViSkN06XiHtM6v2tTmtplC+P0xEU2lbN0QaEw3vplLpg7pZm2LT1Si4+dykaINa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724177957; c=relaxed/simple;
	bh=j39p8v3Kemq1L00i10J4aauTEUR68m7EeDEctPrI3WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ln8qCeCL5hfNChbEbMABnnqrRm+aIrkj5T2C7IXcQiZL8JdMrGRTRNgPfWmgjWsPNJ3/dFdWjILK3dNSsK6ZKW9ZFRqOgROpgyQK/6y+uSWolIPUNvMi2UrYe0iGTY+6WX9YLAlLARS15vVDmq5+pLnRDE4zYOOz0hG8mtoyKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lqHXDsSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KEhB2H022324;
	Tue, 20 Aug 2024 18:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j39p8v3Kemq1L00i10J4aauTEUR68m7EeDEctPrI3WU=; b=lqHXDsSjqyfYdNzw
	NYjBORsCyc/5LiAxJkqJp28M9V+iLKY9ZRIMCpjVnrqI2HmFWZ0lzoeDcBQnH/6+
	azU2SnDvGNZFNrxoC0mly4GJd2R4oGVrGHxOQuZ2SL5uMyQieT1Riab99VZnABbY
	l/Rwj3kVj22kx7kZWwIbFCmkjodVfEKTDK1yt1ZX+f+WMISpa+1/kMoOKuQ7RKri
	wGs6g2gLgEBZKx64ON+yYzZnPIuyaArNAJPQpFUAlbA7JG/eyXV18n/jHRC0FaSY
	H/kN4UD7sSElwIc68vS//hKhcN4Fan5M/8ey12GyTWOsHbLPxFFE55XI16+OzWFJ
	kzSPbA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdm9uqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:18:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KIIJR3018538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:18:19 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 11:18:18 -0700
Message-ID: <638d5561-4fa0-4e14-a852-9905956445e4@quicinc.com>
Date: Tue, 20 Aug 2024 11:18:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/34] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-6-quic_wcheng@quicinc.com>
 <b8e67410-49a0-4ee8-a0a5-4b7ba03483c8@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <b8e67410-49a0-4ee8-a0a5-4b7ba03483c8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UWkYDDgbhQPhqEUQs4fcxqcxFpTWYE2z
X-Proofpoint-ORIG-GUID: UWkYDDgbhQPhqEUQs4fcxqcxFpTWYE2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_14,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200136

Hi Amadeusz,

On 8/6/2024 7:50 AM, Amadeusz Sławiński wrote:
> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>> As part of xHCI bus suspend, the XHCI is halted.  However, if there are
>
> XHCI -> xHCI
>
Got it.
>> pending events in the secondary event ring, it is observed that the xHCI
>> controller stops responding to further commands upon host or device
>> initiated bus resume.  Iterate through all pending events and update the
>> dequeue pointer to the beginning of the event ring.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/host/xhci-mem.c  |  7 ++++++-
>>   drivers/usb/host/xhci-ring.c | 33 ++++++++++++++++++++++++++++++++-
>>   drivers/usb/host/xhci.c      |  2 +-
>>   drivers/usb/host/xhci.h      |  6 ++++++
>>   4 files changed, 45 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index 2ca5937b73f4..60dfc59260d8 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -1816,7 +1816,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>>           tmp &= ERST_SIZE_MASK;
>>           writel(tmp, &ir->ir_set->erst_size);
>>   -        xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
>> +        xhci_update_erst_dequeue(xhci, ir, true);
>>       }
>>   }
>>   @@ -1859,6 +1859,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
>>           return;
>>       }
>>   +    /*
>> +     * Cleanup secondary interrupter to ensure there are no pending events.
>> +     * This also updates event ring dequeue pointer back to the start.
>> +     */
>> +    xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
>>       intr_num = ir->intr_num;
>>         xhci_remove_interrupter(xhci, ir);
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 80dca780317a..a012ddf94fb5 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -3012,7 +3012,7 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
>>    * - When all events have finished
>>    * - To avoid "Event Ring Full Error" condition
>>    */
>> -static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>> +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>>                        struct xhci_interrupter *ir,
>>                        bool clear_ehb)
>>   {
>> @@ -3112,6 +3112,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
>>       return 0;
>>   }
>>   +/*
>> + * Move the event ring dequeue pointer to skip events kept in the secondary
>> + * event ring.  This is used to ensure that pending events in the ring are
>> + * acknowledged, so the XHCI HCD can properly enter suspend/resume.  The
>
> XHCI -> xHCI
>
Will fix.
>> + * secondary ring is typically maintained by an external component.
>> + */
>> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
>> +    struct xhci_ring *ring,    struct xhci_interrupter *ir)
>> +{
>> +    union xhci_trb *current_trb;
>> +    u64 erdp_reg;
>> +    dma_addr_t deq;
>> +
>> +    /* disable irq, ack pending interrupt and ack all pending events */
>> +    xhci_disable_interrupter(ir);
>
> That seems like a bit weird place to disable interrupter? Perhaps suspend and resume functions should be updated to handle more interrupters instead?
>
At least in the current implementation that we have, during cases where autosuspend is enabled, we obviously have to ensure that the audio offload path is fully stopped before we can have the HCD suspend the bus.  We don't want to run into a situation where the audio DSP is trying to execute audio transfers over the link while we're suspending.  So in short, the xhci_skip_sec_intr_events() is currently only used for cases where we are cleaning up the secondary interrupter. (due to the stopping of the audio offload session)  This will ensure that if the audio DSP didn't clean up the event ring properly, we'll just skip the pending events, since they will be stale once the audio stream is restarted at a later time.

Thanks

Wesley Cheng


